Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6A7028B4FE
	for <tools@linux.kernel.org>; Sun, 11 Jan 2026 21:29:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768166962; cv=none; b=GSkHr51Khsk6+D1mUDO6GO8gaNLOtjkuwoYu8QgSCygHXlZPkJMg9RS/23HctVk0pQ/AjzcT8D1QmB0S7UJpXBLhYcvr00hr/aO7GkAWzRc9InecrtHh3dMCnrcEyLyrvWYezI/QUk+Qky6Y72Dzp+q2tZ6ifXtP6JSB9qQCmNc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768166962; c=relaxed/simple;
	bh=AsfelDmn7x1VH+bQd85aXGTCvHa6ix78xjw+eaWqLoc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=dBVYY8xOXSZRADYHbP+jKc/stJQNjexppEDxKnElRWoeURXmGojxILrc+L1d4FHghjqVmNkOmR/peFQI/gjGiFxlhnYIGC7pAdpMDpQKC8/wubkp8WBtrxwA5Htpl4uN8gLxy/jI4jqmiQBP5Io2JFyY0PDMxjEN8i11FxrIg0Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=eku6zbIz; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="eku6zbIz"
Received: by smtp.kernel.org (Postfix)
	id AC1F2C19423; Sun, 11 Jan 2026 21:29:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0C6B0C4AF09;
	Sun, 11 Jan 2026 21:29:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768166961;
	bh=AsfelDmn7x1VH+bQd85aXGTCvHa6ix78xjw+eaWqLoc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=eku6zbIzpCNmLRmtDcqnl7walvN5CAH6Fi75CjgSecMSQyIbXUEXv30nW1YqxVtIB
	 RCXYUGnz439Nv6Et7e+ncbS+wW7AGp1wJOzpm6JWbhPBRwdDnY8KjxMW6uT+oqu0PP
	 jeB6hHqNj0Z19WniI84C42XrE7xYeOix5xjWo7v7YwSjK244LhHFjOTqGnByHdRDf5
	 beSf5XZQ4A4hzLxh+IDSPAZUJf/GyLiz2DGSPBjF3Cd2zDrzlYG2iBMDIlMQ0eEMO3
	 YCNyReuzrf1KfILJh1YoqDt+xh2DX/6ZYU2QQYKKExuy4jaqov5tvDhYrqa2artS6U
	 VSdlUTkSN21OQ==
From: Sasha Levin <sashal@kernel.org>
To: tools@kernel.org
Cc: linux-kernel@vger.kernel.org,
	torvalds@linux-foundation.org,
	broonie@kernel.org,
	Sasha Levin <sashal@kernel.org>
Subject: [RFC v2 4/7] LLMinus: Add resolve command for LLM-assisted conflict resolution
Date: Sun, 11 Jan 2026 16:29:12 -0500
Message-ID: <20260111212915.195056-5-sashal@kernel.org>
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

Add the resolve command that invokes an external LLM to assist with
merge conflicts. It parses .git/MERGE_MSG for merge context, gathers
conflict information from all files with markers, and finds similar
historical resolutions from the database when available.

The generated prompt includes current conflict content, similar historical
resolutions with diffs, and instructions emphasizing understanding before
acting. The LLM is directed to search lore.kernel.org for maintainer
guidance, trace git history to understand both sides, and flag uncertainty
rather than guessing. Output streams directly to the terminal.

Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 tools/llminus/src/main.rs | 476 ++++++++++++++++++++++++++++++++++++++
 1 file changed, 476 insertions(+)

diff --git a/tools/llminus/src/main.rs b/tools/llminus/src/main.rs
index df7262bd6a91..0388a881e413 100644
--- a/tools/llminus/src/main.rs
+++ b/tools/llminus/src/main.rs
@@ -41,6 +41,11 @@ enum Commands {
         #[arg(default_value = "1")]
         n: usize,
     },
+    /// Resolve current conflicts using an LLM
+    Resolve {
+        /// Command to invoke. The prompt will be passed via stdin.
+        command: String,
+    },
 }
 
 /// A single diff hunk representing a change region
@@ -938,6 +943,422 @@ fn find(n: usize) -> Result<()> {
     Ok(())
 }
 
+/// Context about the current merge operation
+#[derive(Debug, Default)]
+struct MergeContext {
+    /// The branch/tag/ref being merged (from MERGE_HEAD or MERGE_MSG)
+    merge_source: Option<String>,
+    /// The target branch (HEAD)
+    head_branch: Option<String>,
+    /// The merge message (from .git/MERGE_MSG)
+    merge_message: Option<String>,
+}
+
+/// Extract context about the current merge operation
+fn get_merge_context() -> MergeContext {
+    let mut ctx = MergeContext {
+        head_branch: git_allow_fail(&["rev-parse", "--abbrev-ref", "HEAD"])
+            .map(|s| s.trim().to_string())
+            .filter(|s| !s.is_empty() && s != "HEAD"),
+        ..Default::default()
+    };
+
+    // Try to read MERGE_MSG for merge context
+    if let Ok(merge_msg) = std::fs::read_to_string(".git/MERGE_MSG") {
+        ctx.merge_message = Some(merge_msg.clone());
+
+        // Parse merge source from MERGE_MSG
+        // Common formats:
+        // "Merge branch 'feature-branch'"
+        // "Merge tag 'v6.1'"
+        // "Merge remote-tracking branch 'origin/main'"
+        // "Merge commit 'abc123'"
+        let first_line = merge_msg.lines().next().unwrap_or("");
+        if let Some(source) = parse_merge_source(first_line) {
+            ctx.merge_source = Some(source);
+        }
+    }
+
+    // If no merge source found from MERGE_MSG, try to describe MERGE_HEAD
+    if ctx.merge_source.is_none() {
+        // Try to get a tag name for MERGE_HEAD
+        if let Some(tag) = git_allow_fail(&["describe", "--tags", "--exact-match", "MERGE_HEAD"]) {
+            ctx.merge_source = Some(tag.trim().to_string());
+        } else if let Some(branch) = git_allow_fail(&["name-rev", "--name-only", "MERGE_HEAD"]) {
+            let branch = branch.trim();
+            if !branch.is_empty() && branch != "undefined" {
+                ctx.merge_source = Some(branch.to_string());
+            }
+        }
+    }
+
+    ctx
+}
+
+/// Parse merge source from a merge message first line
+fn parse_merge_source(line: &str) -> Option<String> {
+    // "Merge branch 'feature'" -> "feature"
+    // "Merge tag 'v6.1'" -> "v6.1"
+    // "Merge remote-tracking branch 'origin/main'" -> "origin/main"
+    // "Merge commit 'abc123'" -> "abc123"
+
+    let line = line.trim();
+
+    // Look for quoted source
+    if let Some(start) = line.find('\'') {
+        if let Some(end) = line[start + 1..].find('\'') {
+            return Some(line[start + 1..start + 1 + end].to_string());
+        }
+    }
+
+    // Look for "Merge X into Y" pattern without quotes
+    if let Some(rest) = line.strip_prefix("Merge ") {
+        // Skip "branch ", "tag ", "commit ", "remote-tracking branch "
+        let rest = rest
+            .strip_prefix("remote-tracking branch ")
+            .or_else(|| rest.strip_prefix("branch "))
+            .or_else(|| rest.strip_prefix("tag "))
+            .or_else(|| rest.strip_prefix("commit "))
+            .unwrap_or(rest);
+
+        // Take until " into " or end of line
+        if let Some(into_pos) = rest.find(" into ") {
+            return Some(rest[..into_pos].trim().to_string());
+        }
+        let word = rest.split_whitespace().next()?;
+        if !word.is_empty() {
+            return Some(word.to_string());
+        }
+    }
+
+    None
+}
+
+/// Get current conflicts from the working directory
+fn get_current_conflicts() -> Result<Vec<ConflictFile>> {
+    check_repo()?;
+
+    // Find current conflicts
+    let conflict_paths = get_conflicted_files()?;
+    if conflict_paths.is_empty() {
+        bail!("No conflicts detected. Run this command when you have active merge conflicts.");
+    }
+
+    // Parse all conflict regions
+    let mut all_conflicts = Vec::new();
+    for path in &conflict_paths {
+        if let Ok(conflicts) = parse_conflict_file(path) {
+            all_conflicts.extend(conflicts);
+        }
+    }
+
+    if all_conflicts.is_empty() {
+        bail!("Could not parse any conflict markers from the conflicted files.");
+    }
+
+    Ok(all_conflicts)
+}
+
+/// Try to find similar resolutions, returns empty vec if no database or embeddings
+fn try_find_similar_resolutions(n: usize, conflicts: &[ConflictFile]) -> Vec<SimilarResolution> {
+    let store_path = Path::new(STORE_PATH);
+    if !store_path.exists() {
+        return Vec::new();
+    }
+
+    let store = match ResolutionStore::load(store_path) {
+        Ok(s) => s,
+        Err(_) => return Vec::new(),
+    };
+
+    let with_embeddings: Vec<_> = store.resolutions.iter()
+        .filter(|r| r.embedding.is_some())
+        .collect();
+
+    if with_embeddings.is_empty() {
+        return Vec::new();
+    }
+
+    // Initialize embedding model
+    let mut model = match init_embedding_model() {
+        Ok(m) => m,
+        Err(_) => return Vec::new(),
+    };
+
+    // Generate embedding for current conflicts
+    let conflict_text: String = conflicts.iter()
+        .map(|c| c.to_embedding_text())
+        .collect::<Vec<_>>()
+        .join("\n---\n\n");
+
+    let query_embeddings = match model.embed(vec![conflict_text], None) {
+        Ok(e) => e,
+        Err(_) => return Vec::new(),
+    };
+    let query_embedding = &query_embeddings[0];
+
+    // Compute similarities and take top N
+    let mut similarities: Vec<_> = with_embeddings.iter()
+        .map(|r| {
+            let sim = cosine_similarity(query_embedding, r.embedding.as_ref().unwrap());
+            (r, sim)
+        })
+        .collect();
+
+    similarities.sort_by(|a, b| b.1.partial_cmp(&a.1).unwrap_or(std::cmp::Ordering::Equal));
+
+    similarities.into_iter()
+        .take(n)
+        .map(|(r, sim)| SimilarResolution {
+            resolution: (*r).clone(),
+            similarity: sim,
+        })
+        .collect()
+}
+
+/// Build the LLM prompt for conflict resolution
+fn build_resolve_prompt(
+    conflicts: &[ConflictFile],
+    similar: &[SimilarResolution],
+    merge_ctx: &MergeContext,
+) -> String {
+    let mut prompt = String::new();
+
+    // Header with high-stakes framing
+    prompt.push_str("# Linux Kernel Merge Conflict Resolution\n\n");
+    prompt.push_str("You are acting as an experienced kernel maintainer resolving a merge conflict.\n\n");
+    prompt.push_str("**Important:** Incorrect merge resolutions have historically introduced subtle bugs ");
+    prompt.push_str("that affected millions of users and took months to diagnose. A resolution that ");
+    prompt.push_str("compiles but has semantic errors is worse than no resolution at all.\n\n");
+    prompt.push_str("Take the time to fully understand both sides of the conflict before attempting ");
+    prompt.push_str("any resolution. If after investigation you're not confident, say so - it's ");
+    prompt.push_str("better to escalate to a human than to introduce a subtle bug.\n\n");
+
+    // Merge context
+    prompt.push_str("## Merge Context\n\n");
+    if let Some(ref source) = merge_ctx.merge_source {
+        prompt.push_str(&format!("**Merging:** `{}`\n", source));
+    }
+    if let Some(ref head) = merge_ctx.head_branch {
+        prompt.push_str(&format!("**Into:** `{}`\n", head));
+    }
+    if let Some(ref msg) = merge_ctx.merge_message {
+        let first_line = msg.lines().next().unwrap_or("");
+        prompt.push_str(&format!("**Merge message:** {}\n", first_line));
+    }
+    prompt.push('\n');
+
+    // Current conflicts
+    prompt.push_str("## Current Conflicts\n\n");
+
+    for conflict in conflicts {
+        prompt.push_str(&format!("### File: {}\n\n", conflict.path));
+        prompt.push_str("**Our version (HEAD):**\n```\n");
+        prompt.push_str(&conflict.ours_content);
+        prompt.push_str("\n```\n\n");
+        prompt.push_str("**Their version (being merged):**\n```\n");
+        prompt.push_str(&conflict.theirs_content);
+        prompt.push_str("\n```\n\n");
+        if let Some(ref base) = conflict.base_content {
+            prompt.push_str("**Base version (common ancestor):**\n```\n");
+            prompt.push_str(base);
+            prompt.push_str("\n```\n\n");
+        }
+    }
+
+    // Similar historical resolutions (only if available)
+    if !similar.is_empty() {
+        prompt.push_str("## Similar Historical Resolutions\n\n");
+        prompt.push_str("These conflicts were previously resolved in the Linux kernel. Use `git show <hash>` ");
+        prompt.push_str("to examine the full commit message and context - maintainers often explain ");
+        prompt.push_str("their resolution rationale there.\n\n");
+
+        for (i, result) in similar.iter().enumerate() {
+            let r = &result.resolution;
+            prompt.push_str(&format!("### Historical Resolution {} (similarity: {:.1}%)\n\n", i + 1, result.similarity * 100.0));
+            prompt.push_str(&format!("- **Commit:** `{}`\n", r.commit_hash));
+            prompt.push_str(&format!("- **Summary:** {}\n", r.commit_summary));
+            prompt.push_str(&format!("- **Author:** {}\n", r.author));
+            prompt.push_str(&format!("- **Date:** {}\n", r.commit_date));
+            prompt.push_str(&format!("- **Files:** {}\n\n", r.files.iter().map(|f| f.file_path.as_str()).collect::<Vec<_>>().join(", ")));
+
+            for file in &r.files {
+                prompt.push_str(&format!("#### {}\n\n", file.file_path));
+
+                if !file.ours_diff.is_empty() {
+                    prompt.push_str("**Ours changed:**\n```diff\n");
+                    for hunk in &file.ours_diff {
+                        prompt.push_str(&hunk.content);
+                        prompt.push('\n');
+                    }
+                    prompt.push_str("```\n\n");
+                }
+
+                if !file.theirs_diff.is_empty() {
+                    prompt.push_str("**Theirs changed:**\n```diff\n");
+                    for hunk in &file.theirs_diff {
+                        prompt.push_str(&hunk.content);
+                        prompt.push('\n');
+                    }
+                    prompt.push_str("```\n\n");
+                }
+
+                if !file.resolution_diff.is_empty() {
+                    prompt.push_str("**Final resolution:**\n```diff\n");
+                    for hunk in &file.resolution_diff {
+                        prompt.push_str(&hunk.content);
+                        prompt.push('\n');
+                    }
+                    prompt.push_str("```\n\n");
+                }
+            }
+        }
+    }
+
+    // Investigation requirement
+    prompt.push_str("## Investigation Required\n\n");
+    prompt.push_str("Before attempting any resolution, you must conduct thorough research. ");
+    prompt.push_str("Rushing to resolve without understanding is how subtle bugs get introduced. ");
+    prompt.push_str("Work through each phase below IN ORDER and document your findings.\n\n");
+
+    // Phase 1: Search lore.kernel.org
+    prompt.push_str("### Phase 1: Search lore.kernel.org for Maintainer Guidance (DO THIS FIRST)\n\n");
+    prompt.push_str("**CRITICAL:** Before doing ANY other research, search lore.kernel.org for existing guidance.\n");
+    prompt.push_str("Maintainers often post merge resolution instructions when they know conflicts will occur.\n\n");
+
+    if let Some(ref source) = merge_ctx.merge_source {
+        prompt.push_str(&format!("1. **Search for the merge itself:** `{}`\n", source));
+        prompt.push_str(&format!("   - URL: `https://lore.kernel.org/all/?q={}`\n", source.replace('/', "%2F")));
+    }
+    prompt.push_str("2. **Search for conflict discussions:**\n");
+    prompt.push_str("   - `\"merge conflict\"` + subsystem name\n");
+    prompt.push_str("   - `\"conflicts with\"` + branch/tag name\n\n");
+
+    // Phase 2: Context
+    prompt.push_str("### Phase 2: Understand the Context\n\n");
+    prompt.push_str("- **What subsystem is this?** Read the file and nearby files to understand its purpose.\n");
+    prompt.push_str("- **Who maintains it?** Check `git log --oneline -20` for recent authors.\n");
+    prompt.push_str("- **What's the file's role?** Is it a driver, core subsystem, header, config?\n\n");
+
+    // Phase 3: Trace history
+    prompt.push_str("### Phase 3: Trace Each Side's History\n\n");
+    prompt.push_str("**For 'ours' (HEAD):**\n");
+    prompt.push_str("- Run `git log --oneline HEAD -- <file>` to see recent changes\n");
+    prompt.push_str("- Find the commit that introduced our version of the conflicted code\n");
+    prompt.push_str("- Run `git show <commit>` to read the full commit message\n\n");
+    prompt.push_str("**For 'theirs' (MERGE_HEAD):**\n");
+    prompt.push_str("- Run `git log --oneline MERGE_HEAD -- <file>` to see their changes\n");
+    prompt.push_str("- Find the commit that introduced their version\n");
+    prompt.push_str("- Run `git show <commit>` to read the full commit message\n\n");
+
+    // Resolution
+    prompt.push_str("## Resolution\n\n");
+    prompt.push_str("Once you understand the conflict:\n\n");
+    prompt.push_str("1. Edit the conflicted files to produce the correct merged result\n");
+    prompt.push_str("2. Remove all conflict markers (`<<<<<<<`, `=======`, `>>>>>>>`)\n");
+    prompt.push_str("3. Stage the resolved files with `git add`\n");
+    prompt.push_str("4. Commit with a detailed message explaining your analysis and resolution\n\n");
+
+    // If uncertain
+    prompt.push_str("## If Uncertain\n\n");
+    prompt.push_str("If after investigation you're still uncertain about the correct resolution:\n\n");
+    prompt.push_str("- Explain what you've learned and what remains unclear\n");
+    prompt.push_str("- Describe the possible resolutions you see and their tradeoffs\n");
+    prompt.push_str("- Recommend whether a human maintainer should review\n\n");
+    prompt.push_str("It's better to flag uncertainty than to silently introduce a bug.\n\n");
+
+    // Tools available
+    prompt.push_str("## Tools Available\n\n");
+    prompt.push_str("You can use these to investigate:\n\n");
+    prompt.push_str("```bash\n");
+    if !similar.is_empty() {
+        prompt.push_str("# Examine historical resolution commits\n");
+        for result in similar {
+            prompt.push_str(&format!("git show {}\n", result.resolution.commit_hash));
+        }
+        prompt.push('\n');
+    }
+    prompt.push_str("# Understand merge parents\n");
+    prompt.push_str("git show <hash>^1  # ours\n");
+    prompt.push_str("git show <hash>^2  # theirs\n");
+    prompt.push_str("```\n");
+
+    prompt
+}
+
+fn resolve(command: &str) -> Result<()> {
+    use std::io::Write;
+    use std::process::Stdio;
+
+    // Get merge context (what branch/tag is being merged)
+    let merge_ctx = get_merge_context();
+    if let Some(ref source) = merge_ctx.merge_source {
+        println!("Merging: {}", source);
+    }
+    if let Some(ref head) = merge_ctx.head_branch {
+        println!("Into: {}", head);
+    }
+
+    // Get current conflicts first
+    let conflicts = get_current_conflicts()?;
+
+    println!("Found {} conflict(s)", conflicts.len());
+
+    // Try to find similar historical resolutions (gracefully handles missing database)
+    println!("Looking for similar historical conflicts...");
+    let similar = try_find_similar_resolutions(3, &conflicts);
+
+    if similar.is_empty() {
+        println!("No historical resolution database found (run 'llminus learn' and 'llminus vectorize' to build one)");
+        println!("Proceeding without historical examples...");
+    } else {
+        println!("Found {} similar historical resolutions", similar.len());
+    }
+
+    // Build the prompt
+    println!("Building resolution prompt...");
+    let prompt = build_resolve_prompt(&conflicts, &similar, &merge_ctx);
+
+    println!("Prompt size: {} bytes", prompt.len());
+    println!("\nInvoking: {}", command);
+    println!("{}", "=".repeat(80));
+
+    // Parse command (handle arguments)
+    let parts: Vec<&str> = command.split_whitespace().collect();
+    if parts.is_empty() {
+        bail!("Empty command specified");
+    }
+
+    let cmd = parts[0];
+    let args = &parts[1..];
+
+    // Spawn the command
+    let mut child = Command::new(cmd)
+        .args(args)
+        .stdin(Stdio::piped())
+        .spawn()
+        .with_context(|| format!("Failed to spawn command: {}", command))?;
+
+    // Write prompt to stdin
+    if let Some(mut stdin) = child.stdin.take() {
+        stdin.write_all(prompt.as_bytes())
+            .context("Failed to write prompt to command stdin")?;
+    }
+
+    // Wait for completion
+    let status = child.wait().context("Failed to wait for command")?;
+
+    println!("{}", "=".repeat(80));
+
+    if status.success() {
+        println!("\nCommand completed successfully.");
+    } else {
+        eprintln!("\nCommand exited with status: {}", status);
+    }
+
+    Ok(())
+}
+
 fn main() -> Result<()> {
     let cli = Cli::parse();
 
@@ -945,6 +1366,7 @@ fn main() -> Result<()> {
         Commands::Learn { range } => learn(range.as_deref()),
         Commands::Vectorize { batch_size } => vectorize(batch_size),
         Commands::Find { n } => find(n),
+        Commands::Resolve { command } => resolve(&command),
     }
 }
 
@@ -1014,6 +1436,60 @@ fn test_find_command_with_n() {
         }
     }
 
+    #[test]
+    fn test_resolve_command_parses() {
+        let cli = Cli::try_parse_from(["llminus", "resolve", "my-llm"]).unwrap();
+        match cli.command {
+            Commands::Resolve { command } => assert_eq!(command, "my-llm"),
+            _ => panic!("Expected Resolve command"),
+        }
+    }
+
+    #[test]
+    fn test_resolve_command_with_args() {
+        let cli = Cli::try_parse_from(["llminus", "resolve", "my-llm --model fancy"]).unwrap();
+        match cli.command {
+            Commands::Resolve { command } => assert_eq!(command, "my-llm --model fancy"),
+            _ => panic!("Expected Resolve command"),
+        }
+    }
+
+    #[test]
+    fn test_parse_merge_source() {
+        // Standard branch merge
+        assert_eq!(
+            parse_merge_source("Merge branch 'feature-branch'"),
+            Some("feature-branch".to_string())
+        );
+
+        // Tag merge
+        assert_eq!(
+            parse_merge_source("Merge tag 'v6.1'"),
+            Some("v6.1".to_string())
+        );
+
+        // Remote tracking branch
+        assert_eq!(
+            parse_merge_source("Merge remote-tracking branch 'origin/main'"),
+            Some("origin/main".to_string())
+        );
+
+        // Commit merge
+        assert_eq!(
+            parse_merge_source("Merge commit 'abc123def'"),
+            Some("abc123def".to_string())
+        );
+
+        // Branch with "into" target
+        assert_eq!(
+            parse_merge_source("Merge branch 'feature' into master"),
+            Some("feature".to_string())
+        );
+
+        // Non-merge line
+        assert_eq!(parse_merge_source("Fix bug in foo"), None);
+    }
+
     #[test]
     fn test_cosine_similarity() {
         // Identical vectors should have similarity 1.0
-- 
2.51.0

