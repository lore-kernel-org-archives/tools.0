Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8638428CF5E
	for <tools@linux.kernel.org>; Sun, 11 Jan 2026 21:29:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768166963; cv=none; b=JVumGh/kiRspVWNBPzVpHhj0WSaNzYd85vAYiFBb7P2omUL41RhIDQyoiPFWXRnNz28YzTeuVrec4HikCTY3GeWGoFJIqrrWQJZu360wKWhHZbtV+mMkGzxGFzvY2TLCMh+Pi1LZNDd/0WTrz1zrKcMEZ5f57eW2tqKuXM7gSY8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768166963; c=relaxed/simple;
	bh=mAvsryD46w5Cimgnn+GzWEn7fLSvnQP+2ct0WhzfIX8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=TMyfWbFYsiAXk0aoM5f5sSNaKIMtyQz/zx/aLXMSRP7NO650RMnG3s/Fmrk2AJJfJANfr4d4ES6iUKiLDXAH4FpX6DZt7YQ6HVfIFVE2GeaL7rdZHNO006pWcRS20oRFq7TH1GAk4YJzrnpy9LydULlQ0jrk0dGIWMI6fByxbxc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=k7+9vCdH; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="k7+9vCdH"
Received: by smtp.kernel.org (Postfix)
	id 6FABDC2BC9E; Sun, 11 Jan 2026 21:29:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C2447C4CEF7;
	Sun, 11 Jan 2026 21:29:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768166963;
	bh=mAvsryD46w5Cimgnn+GzWEn7fLSvnQP+2ct0WhzfIX8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=k7+9vCdHFNvnQgliWuzugu71/ueuxfvDTHHh33v2ON0HNkfyOJkgb28x+PHlgX5OG
	 TE721Q8KHSKIrpA8WiicD5VtCQhMqVffnSQqb/kutkg+8ARrW86oSIXQTatseyLnq6
	 tPqwFVJyuwHO7WVBUI1Gy0Xh/BRn/X+gkXJtKDBHzAi0B6kcYOMWoCqpvBppbjMIlF
	 ndCa1z02EyRSxfy4JsYWPNDsUkd8lumHLNYYFdv6S3Up/+tiOuNiBJj7il/m7fN9Ef
	 ka26cJ9Uj0/KowgdDbjkesin6l48JfzFaGVqWe1RmXQwsg6fwhJZresE1TKbsekU3G
	 JODadhPxTmSWg==
From: Sasha Levin <sashal@kernel.org>
To: tools@kernel.org
Cc: linux-kernel@vger.kernel.org,
	torvalds@linux-foundation.org,
	broonie@kernel.org,
	Sasha Levin <sashal@kernel.org>
Subject: [RFC v2 6/7] LLMinus: Add prompt token limit enforcement
Date: Sun, 11 Jan 2026 16:29:14 -0500
Message-ID: <20260111212915.195056-7-sashal@kernel.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260111212915.195056-1-sashal@kernel.org>
References: <20251219181629.1123823-1-sashal@kernel.org>
 <20260111212915.195056-1-sashal@kernel.org>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add the max-tokens option with a 100K default to prevent prompt overflow
errors with various LLM providers. Token count is estimated at roughly
4 characters per token. When prompts exceed the limit, RAG examples are
progressively removed until the prompt fits. The token count is displayed
in invoke output.

Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 tools/llminus/src/main.rs | 114 +++++++++++++++++++++++++++++++-------
 1 file changed, 95 insertions(+), 19 deletions(-)

diff --git a/tools/llminus/src/main.rs b/tools/llminus/src/main.rs
index ff668244688f..5c469e23f09a 100644
--- a/tools/llminus/src/main.rs
+++ b/tools/llminus/src/main.rs
@@ -14,6 +14,18 @@
 
 const STORE_PATH: &str = ".llminus-resolutions.json";
 
+/// Default maximum tokens for prompt (conservative for broad provider compatibility)
+/// Most providers support at least 128K; we use 100K as a safe default.
+const DEFAULT_MAX_TOKENS: usize = 100_000;
+
+/// Approximate characters per token (for English text)
+const CHARS_PER_TOKEN: usize = 4;
+
+/// Estimate the number of tokens in a text string
+fn estimate_tokens(text: &str) -> usize {
+    text.len() / CHARS_PER_TOKEN
+}
+
 #[derive(Parser)]
 #[command(name = "llminus")]
 #[command(about = "LLM-powered git conflict resolution tool")]
@@ -45,6 +57,9 @@ enum Commands {
     Resolve {
         /// Command to invoke. The prompt will be passed via stdin.
         command: String,
+        /// Maximum tokens for prompt (reduces RAG examples if exceeded)
+        #[arg(short, long, default_value_t = DEFAULT_MAX_TOKENS)]
+        max_tokens: usize,
     },
     /// Pull a kernel patch/pull request from lore.kernel.org and merge it
     Pull {
@@ -53,6 +68,9 @@ enum Commands {
         /// Command to invoke for LLM assistance
         #[arg(short, long, default_value = "llm")]
         command: String,
+        /// Maximum tokens for prompt (reduces RAG examples if exceeded)
+        #[arg(long, default_value_t = DEFAULT_MAX_TOKENS)]
+        max_tokens: usize,
     },
 }
 
@@ -825,6 +843,7 @@ fn parse_conflict_file(path: &str) -> Result<Vec<ConflictFile>> {
 }
 
 /// Result of a similarity search
+#[derive(Clone)]
 struct SimilarResolution {
     resolution: MergeResolution,
     similarity: f32,
@@ -1632,7 +1651,7 @@ fn build_resolve_prompt(
     prompt
 }
 
-fn resolve(command: &str) -> Result<()> {
+fn resolve(command: &str, max_tokens: usize) -> Result<()> {
     // Get merge context (what branch/tag is being merged)
     let merge_ctx = get_merge_context();
     if let Some(ref source) = merge_ctx.merge_source {
@@ -1649,17 +1668,45 @@ fn resolve(command: &str) -> Result<()> {
 
     // Try to find similar historical resolutions (gracefully handles missing database)
     println!("Looking for similar historical conflicts...");
-    let similar = try_find_similar_resolutions(3, &conflicts);
+    let all_similar = try_find_similar_resolutions(3, &conflicts);
 
-    if similar.is_empty() {
+    if all_similar.is_empty() {
         println!("No historical resolution database found (run 'llminus learn' and 'llminus vectorize' to build one)");
         println!("Proceeding without historical examples...");
     } else {
-        println!("Found {} similar historical resolutions", similar.len());
+        println!("Found {} similar historical resolutions", all_similar.len());
+    }
+
+    // Build the prompt with adaptive RAG example reduction
+    let mut similar = all_similar.clone();
+    let mut prompt = build_resolve_prompt(&conflicts, &similar, &merge_ctx, None);
+    let mut tokens = estimate_tokens(&prompt);
+
+    // Reduce RAG examples until we're under the token limit
+    while tokens > max_tokens && !similar.is_empty() {
+        let original_count = all_similar.len();
+        similar.pop(); // Remove the least similar (last) example
+        prompt = build_resolve_prompt(&conflicts, &similar, &merge_ctx, None);
+        tokens = estimate_tokens(&prompt);
+
+        if similar.len() < original_count {
+            println!(
+                "Reduced RAG examples from {} to {} to fit token limit (~{} tokens, limit: {})",
+                original_count,
+                similar.len(),
+                tokens,
+                max_tokens
+            );
+        }
+    }
+
+    if tokens > max_tokens {
+        println!(
+            "Warning: Prompt still exceeds token limit (~{} tokens, limit: {}) even without RAG examples",
+            tokens, max_tokens
+        );
     }
 
-    // Build the prompt and invoke LLM
-    let prompt = build_resolve_prompt(&conflicts, &similar, &merge_ctx, None);
     invoke_llm(command, &prompt)
 }
 
@@ -1668,7 +1715,8 @@ fn invoke_llm(command: &str, prompt: &str) -> Result<()> {
     use std::io::Write;
     use std::process::Stdio;
 
-    println!("Invoking: {} (prompt: {} bytes)", command, prompt.len());
+    let tokens = estimate_tokens(prompt);
+    println!("Invoking: {} (prompt: {} bytes, ~{} tokens)", command, prompt.len(), tokens);
     println!("{}", "=".repeat(80));
 
     // Parse command (handle arguments)
@@ -1708,7 +1756,7 @@ fn invoke_llm(command: &str, prompt: &str) -> Result<()> {
 }
 
 /// Pull a kernel pull request from lore.kernel.org
-fn pull(message_id: &str, command: &str) -> Result<()> {
+fn pull(message_id: &str, command: &str, max_tokens: usize) -> Result<()> {
     check_repo()?;
 
     // Step 1: Fetch and parse the pull request email
@@ -1744,16 +1792,44 @@ fn pull(message_id: &str, command: &str) -> Result<()> {
 
     // Try to find similar historical resolutions
     println!("Looking for similar historical conflicts...");
-    let similar = try_find_similar_resolutions(3, &conflicts);
+    let all_similar = try_find_similar_resolutions(3, &conflicts);
 
-    if similar.is_empty() {
+    if all_similar.is_empty() {
         println!("No historical resolution database found (this is optional)");
     } else {
-        println!("Found {} similar historical resolutions", similar.len());
+        println!("Found {} similar historical resolutions", all_similar.len());
+    }
+
+    // Build the prompt with adaptive RAG example reduction
+    let mut similar = all_similar.clone();
+    let mut prompt = build_resolve_prompt(&conflicts, &similar, &merge_ctx, Some(&pull_req));
+    let mut tokens = estimate_tokens(&prompt);
+
+    // Reduce RAG examples until we're under the token limit
+    while tokens > max_tokens && !similar.is_empty() {
+        let original_count = all_similar.len();
+        similar.pop(); // Remove the least similar (last) example
+        prompt = build_resolve_prompt(&conflicts, &similar, &merge_ctx, Some(&pull_req));
+        tokens = estimate_tokens(&prompt);
+
+        if similar.len() < original_count {
+            println!(
+                "Reduced RAG examples from {} to {} to fit token limit (~{} tokens, limit: {})",
+                original_count,
+                similar.len(),
+                tokens,
+                max_tokens
+            );
+        }
+    }
+
+    if tokens > max_tokens {
+        println!(
+            "Warning: Prompt still exceeds token limit (~{} tokens, limit: {}) even without RAG examples",
+            tokens, max_tokens
+        );
     }
 
-    // Build the prompt with pull request context and invoke LLM
-    let prompt = build_resolve_prompt(&conflicts, &similar, &merge_ctx, Some(&pull_req));
     println!("\n=== Invoking LLM for Conflict Resolution ===");
     invoke_llm(command, &prompt)?;
 
@@ -1815,8 +1891,8 @@ fn main() -> Result<()> {
         Commands::Learn { range } => learn(range.as_deref()),
         Commands::Vectorize { batch_size } => vectorize(batch_size),
         Commands::Find { n } => find(n),
-        Commands::Resolve { command } => resolve(&command),
-        Commands::Pull { message_id, command } => pull(&message_id, &command),
+        Commands::Resolve { command, max_tokens } => resolve(&command, max_tokens),
+        Commands::Pull { message_id, command, max_tokens } => pull(&message_id, &command, max_tokens),
     }
 }
 
@@ -1890,7 +1966,7 @@ fn test_find_command_with_n() {
     fn test_resolve_command_parses() {
         let cli = Cli::try_parse_from(["llminus", "resolve", "my-llm"]).unwrap();
         match cli.command {
-            Commands::Resolve { command } => assert_eq!(command, "my-llm"),
+            Commands::Resolve { command, .. } => assert_eq!(command, "my-llm"),
             _ => panic!("Expected Resolve command"),
         }
     }
@@ -1899,7 +1975,7 @@ fn test_resolve_command_parses() {
     fn test_resolve_command_with_args() {
         let cli = Cli::try_parse_from(["llminus", "resolve", "my-llm --model fancy"]).unwrap();
         match cli.command {
-            Commands::Resolve { command } => assert_eq!(command, "my-llm --model fancy"),
+            Commands::Resolve { command, .. } => assert_eq!(command, "my-llm --model fancy"),
             _ => panic!("Expected Resolve command"),
         }
     }
@@ -2210,7 +2286,7 @@ fn test_parse_multiple_conflicts() {
     fn test_pull_command_parses() {
         let cli = Cli::try_parse_from(["llminus", "pull", "test@kernel.org"]).unwrap();
         match cli.command {
-            Commands::Pull { message_id, command } => {
+            Commands::Pull { message_id, command, .. } => {
                 assert_eq!(message_id, "test@kernel.org");
                 assert_eq!(command, "llm"); // default
             }
@@ -2224,7 +2300,7 @@ fn test_pull_command_with_custom_command() {
             "llminus", "pull", "test@kernel.org", "-c", "my-llm --model fancy"
         ]).unwrap();
         match cli.command {
-            Commands::Pull { message_id, command } => {
+            Commands::Pull { message_id, command, .. } => {
                 assert_eq!(message_id, "test@kernel.org");
                 assert_eq!(command, "my-llm --model fancy");
             }
-- 
2.51.0

