Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C393376BDC
	for <tools@linux.kernel.org>; Fri, 19 Dec 2025 18:16:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766168201; cv=none; b=UkoN9ENllOrJJBOPqKvUvqq2wiyChiGbkb5idjVvtDVgyrnDYurKamYvdnP6pVCfMmTltX2h8FGItGjechG1nGJRQmCRX5Rv8ENNX5frpW2tt5pPB/j5b1EF6SREmykJrcdJ2q1t0UtajDf8C/8T4h46PduhigyNJHlq/62SfD4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766168201; c=relaxed/simple;
	bh=44kbhUIpomoSQfjsADINxq93SBDe/3k1t2bLTPw43Cs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=QMYmTsz0T1hE1zRT20pyqgPhz/PwfXdU+MH9qzMPxrGnX3oIDzYwY2ecci5+xQnNjcHSt2pcfTKu0VOOCASxZuz2gcScHkxNJ+im0W7nb7HqwhHxIEmOh25ZMNW/j0VNoY3TS1hpKBYyveHJqLWkA+h1T9jLnbot3uqA3C2nT3Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FhHBVvlI; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FhHBVvlI"
Received: by smtp.kernel.org (Postfix)
	id 2FA10C19425; Fri, 19 Dec 2025 18:16:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6C3BEC4CEF1;
	Fri, 19 Dec 2025 18:16:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1766168201;
	bh=44kbhUIpomoSQfjsADINxq93SBDe/3k1t2bLTPw43Cs=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=FhHBVvlIjq7mWk44hsTef/ZXrKM0RgaQ/4lV/INN0vX38QyYcgbScjNxGTxNTS5FH
	 CVO1Vrao0yUILoLcbfbLqMbswe4dpd9jxWjDHb++nommuMfwnz9dGv8FPRyFeOxRgM
	 2PW3u6eavB/gtcnB93xft7o8RkcIF0LESo9u8lXt5A0vpiqIz2295AWZamjwO4kJhk
	 CfC7nSioGUykakSm5W0nI2wLNW4y63tUNZ6vKcXM/a0xuUDHVOyP+ae5ClEL17fodz
	 3Iv+cVO1REY+nVdr+9SEQLxXSHs8p27zBVFbFBmbUk/8h+U1ZzeU0L6kGdKlzvzLjp
	 YG3jXbv3HVQ2A==
From: Sasha Levin <sashal@kernel.org>
To: tools@kernel.org
Cc: linux-kernel@vger.kernel.org,
	torvalds@linux-foundation.org,
	broonie@kernel.org,
	Sasha Levin <sashal@kernel.org>
Subject: [RFC 5/5] LLMinus: Add pull command for LLM-assisted kernel pull request merging
Date: Fri, 19 Dec 2025 13:16:29 -0500
Message-ID: <20251219181629.1123823-6-sashal@kernel.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251219181629.1123823-1-sashal@kernel.org>
References: <20251219181629.1123823-1-sashal@kernel.org>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add a new 'llminus pull' command that automates merging kernel pull
requests from lore.kernel.org with LLM-assisted conflict resolution.

Usage: llminus pull <message-id> [-c <command>]

The command:
- Fetches the pull request email from lore.kernel.org
- Parses the email to extract the git repository URL and ref
- Executes 'git pull' to fetch and merge
- If conflicts occur, invokes the LLM with full context including:
  - The complete pull request email (so the LLM understands both the
    summary and any conflict resolution instructions from the maintainer)
  - Current conflict markers with ours/theirs/base content
  - Similar historical resolutions from the RAG database (if available)
- The LLM resolves conflicts and writes its reasoning to
  .git/LLMINUS_RESOLUTION
- Commits with a message containing the PR summary, resolution
  explanation, and a link to the original email

The prompt instructs the LLM to critically evaluate any conflict
resolution suggestions from the maintainer, looking for opportunities
to produce cleaner or more efficient code.

Adds ureq dependency for HTTP fetching from lore.kernel.org.

Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 tools/llminus/Cargo.toml  |   1 +
 tools/llminus/src/main.rs | 663 +++++++++++++++++++++++++++++++++++++-
 2 files changed, 650 insertions(+), 14 deletions(-)

diff --git a/tools/llminus/Cargo.toml b/tools/llminus/Cargo.toml
index 86740174de598..af7af112a20d7 100644
--- a/tools/llminus/Cargo.toml
+++ b/tools/llminus/Cargo.toml
@@ -14,6 +14,7 @@ fastembed = "5"
 rayon = "1"
 serde = { version = "1", features = ["derive"] }
 serde_json = "1"
+ureq = "2"
 
 [dev-dependencies]
 tempfile = "3"
diff --git a/tools/llminus/src/main.rs b/tools/llminus/src/main.rs
index c00f958a238f8..e65f6d0f836ec 100644
--- a/tools/llminus/src/main.rs
+++ b/tools/llminus/src/main.rs
@@ -44,6 +44,14 @@ enum Commands {
         /// Command to invoke. The prompt will be passed via stdin.
         command: String,
     },
+    /// Pull a kernel patch/pull request from lore.kernel.org and merge it
+    Pull {
+        /// Message ID from lore.kernel.org (e.g., "98b74397-05bc-dbee-cab4-3f40d643eaac@kernel.org")
+        message_id: String,
+        /// Command to invoke for LLM assistance
+        #[arg(short, long, default_value = "llm")]
+        command: String,
+    },
 }
 
 /// A single diff hunk representing a change region
@@ -930,6 +938,302 @@ fn parse_merge_source(line: &str) -> Option<String> {
     None
 }
 
+/// Information parsed from a lore.kernel.org pull request email
+#[derive(Debug, Default)]
+#[allow(dead_code)]
+struct PullRequest {
+    /// Message ID
+    message_id: String,
+    /// Subject line of the email
+    subject: String,
+    /// Author name and email
+    from: String,
+    /// Date of the email
+    date: String,
+    /// Git repository URL to pull from
+    git_url: String,
+    /// Git ref (tag or branch) to pull
+    git_ref: String,
+    /// The full raw email body (LLM extracts summary and conflict instructions from this)
+    body: String,
+}
+
+/// Fetch raw email from lore.kernel.org
+fn fetch_lore_email(message_id: &str) -> Result<String> {
+    // Clean up message ID (remove < > if present)
+    let clean_id = message_id
+        .trim_start_matches('<')
+        .trim_end_matches('>')
+        .trim();
+
+    let url = format!("https://lore.kernel.org/all/{}/raw", clean_id);
+    println!("Fetching: {}", url);
+
+    let response = ureq::get(&url)
+        .call()
+        .with_context(|| format!("Failed to fetch {}", url))?;
+
+    if response.status() != 200 {
+        bail!("HTTP error {}: {}", response.status(), response.status_text());
+    }
+
+    response.into_string()
+        .context("Failed to read response body")
+}
+
+/// Parse email headers from raw email text
+fn parse_email_headers(raw: &str) -> (String, String, String, String, &str) {
+    let mut from = String::new();
+    let mut subject = String::new();
+    let mut date = String::new();
+    let mut message_id = String::new();
+
+    // Find the blank line separating headers from body
+    let (headers_section, body) = raw.split_once("\n\n")
+        .unwrap_or((raw, ""));
+
+    // Parse headers (handle multi-line headers)
+    let mut current_header = String::new();
+    let mut current_value = String::new();
+
+    for line in headers_section.lines() {
+        if line.starts_with(' ') || line.starts_with('\t') {
+            // Continuation of previous header
+            current_value.push(' ');
+            current_value.push_str(line.trim());
+        } else if let Some((name, value)) = line.split_once(':') {
+            // New header - save previous if any
+            if !current_header.is_empty() {
+                match current_header.to_lowercase().as_str() {
+                    "from" => from = current_value.clone(),
+                    "subject" => subject = current_value.clone(),
+                    "date" => date = current_value.clone(),
+                    "message-id" => message_id = current_value.clone(),
+                    _ => {}
+                }
+            }
+            current_header = name.to_string();
+            current_value = value.trim().to_string();
+        }
+    }
+
+    // Don't forget last header
+    if !current_header.is_empty() {
+        match current_header.to_lowercase().as_str() {
+            "from" => from = current_value,
+            "subject" => subject = current_value,
+            "date" => date = current_value,
+            "message-id" => message_id = current_value,
+            _ => {}
+        }
+    }
+
+    (from, subject, date, message_id, body)
+}
+
+/// Extract git pull URL and ref from email body
+fn extract_git_info(body: &str) -> Option<(String, String)> {
+    // Look for patterns like:
+    // "git://git.kernel.org/pub/scm/linux/kernel/git/riscv/linux tags/riscv-for-linus-6.19-mw2"
+    // "https://git.kernel.org/pub/scm/linux/kernel/git/foo/bar.git branch-name"
+
+    for line in body.lines() {
+        let line = line.trim();
+
+        // Skip empty lines and common non-URL prefixes
+        if line.is_empty() {
+            continue;
+        }
+
+        // Check for git:// or https:// URLs
+        let url_start = if let Some(pos) = line.find("git://") {
+            pos
+        } else if let Some(pos) = line.find("https://git.") {
+            pos
+        } else {
+            continue;
+        };
+
+        let url_part = &line[url_start..];
+
+        // Split into URL and ref
+        let parts: Vec<&str> = url_part.split_whitespace().collect();
+        if parts.len() >= 2 {
+            let url = parts[0].to_string();
+            let git_ref = parts[1].to_string();
+
+            // Validate it looks like a kernel git URL
+            if url.contains("kernel.org") || url.contains("git.") {
+                return Some((url, git_ref));
+            }
+        }
+    }
+
+    None
+}
+
+/// Use LLM to extract the maintainer's summary from the email body
+/// Returns None if extraction fails (caller can fall back to other methods)
+fn extract_summary_with_llm(body: &str, command: &str) -> Option<String> {
+    use std::io::Write;
+    use std::process::Stdio;
+
+    let prompt = format!(r#"Extract ONLY the technical summary from this kernel pull request email.
+The summary describes what changes are included (usually as bullet points).
+Do NOT include:
+- Personal messages to Linus
+- Git URLs or repository information
+- Merge/conflict resolution instructions
+- Diffstat or file change listings
+- Sign-offs or signatures
+
+Output ONLY the summary text, nothing else. No preamble, no explanation.
+
+Email body:
+{}
+"#, body);
+
+    let parts: Vec<&str> = command.split_whitespace().collect();
+    if parts.is_empty() {
+        return None;
+    }
+
+    println!("Extracting summary from pull request...");
+
+    let mut child = match Command::new(parts[0])
+        .args(&parts[1..])
+        .stdin(Stdio::piped())
+        .stdout(Stdio::piped())
+        .stderr(Stdio::piped())
+        .spawn() {
+            Ok(c) => c,
+            Err(_) => return None,
+        };
+
+    if let Some(mut stdin) = child.stdin.take() {
+        if stdin.write_all(prompt.as_bytes()).is_err() {
+            return None;
+        }
+    }
+
+    let output = match child.wait_with_output() {
+        Ok(o) => o,
+        Err(_) => return None,
+    };
+
+    if !output.status.success() {
+        return None;
+    }
+
+    let summary = String::from_utf8_lossy(&output.stdout).trim().to_string();
+    if summary.is_empty() {
+        None
+    } else {
+        Some(summary)
+    }
+}
+
+/// Parse a pull request email from lore.kernel.org
+fn parse_pull_request(message_id: &str, raw: &str) -> Result<PullRequest> {
+    let (from, subject, date, parsed_id, body) = parse_email_headers(raw);
+
+    let (git_url, git_ref) = extract_git_info(body)
+        .ok_or_else(|| anyhow::anyhow!("Could not find git repository URL in email"))?;
+
+    Ok(PullRequest {
+        message_id: if parsed_id.is_empty() { message_id.to_string() } else { parsed_id },
+        subject,
+        from,
+        date,
+        git_url,
+        git_ref,
+        body: body.to_string(),
+    })
+}
+
+/// Execute git pull and return whether there are conflicts
+fn git_pull(url: &str, git_ref: &str) -> Result<bool> {
+    println!("Executing: git pull {} {}", url, git_ref);
+
+    let output = Command::new("git")
+        .args(["pull", url, git_ref])
+        .output()
+        .context("Failed to run git pull")?;
+
+    let stdout = String::from_utf8_lossy(&output.stdout);
+    let stderr = String::from_utf8_lossy(&output.stderr);
+
+    if !stdout.is_empty() {
+        println!("{}", stdout);
+    }
+    if !stderr.is_empty() {
+        eprintln!("{}", stderr);
+    }
+
+    // Check if there are conflicts
+    if output.status.success() {
+        return Ok(false); // No conflicts
+    }
+
+    // Check for merge conflicts specifically
+    let conflict_markers = ["CONFLICT", "Automatic merge failed", "fix conflicts"];
+    let output_text = format!("{}{}", stdout, stderr);
+
+    for marker in conflict_markers {
+        if output_text.contains(marker) {
+            return Ok(true); // Has conflicts
+        }
+    }
+
+    // Some other error
+    bail!("git pull failed: {}", stderr);
+}
+
+/// Check if there are unmerged files (active merge conflicts)
+fn has_merge_conflicts() -> bool {
+    get_conflicted_files()
+        .map(|files| !files.is_empty())
+        .unwrap_or(false)
+}
+
+/// Build a merge commit message using the pull request information, summary, and resolution
+fn build_merge_commit_message(pull_req: &PullRequest, summary: &str, resolution: &str) -> String {
+    let mut msg = String::new();
+
+    // Use the subject line as the merge message header
+    if !pull_req.subject.is_empty() {
+        // Clean up subject - remove [GIT PULL] prefix if present
+        let subject = pull_req.subject
+            .replace("[GIT PULL]", "")
+            .replace("[git pull]", "")
+            .trim()
+            .to_string();
+        msg.push_str(&format!("Merge {} {}\n", pull_req.git_ref, &subject));
+    } else {
+        msg.push_str(&format!("Merge {}\n", pull_req.git_ref));
+    }
+    msg.push('\n');
+
+    // Add maintainer's summary (extracted by LLM)
+    if !summary.is_empty() {
+        msg.push_str(summary);
+        msg.push_str("\n\n");
+    }
+
+    // Add resolution explanation (written by LLM during conflict resolution)
+    if !resolution.is_empty() {
+        msg.push_str("Merge conflict resolution:\n\n");
+        msg.push_str(resolution);
+        msg.push_str("\n\n");
+    }
+
+    // Add link to lore
+    msg.push_str(&format!("Link: https://lore.kernel.org/all/{}/\n",
+        pull_req.message_id.trim_start_matches('<').trim_end_matches('>')));
+
+    msg
+}
+
 /// Get current conflicts from the working directory
 fn get_current_conflicts() -> Result<Vec<ConflictFile>> {
     check_repo()?;
@@ -1017,18 +1321,53 @@ fn build_resolve_prompt(
     conflicts: &[ConflictFile],
     similar: &[SimilarResolution],
     merge_ctx: &MergeContext,
+    pull_req: Option<&PullRequest>,
 ) -> String {
     let mut prompt = String::new();
 
     // Header with high-stakes framing
-    prompt.push_str("# Linux Kernel Merge Conflict Resolution\n\n");
-    prompt.push_str("You are acting as an experienced kernel maintainer resolving a merge conflict.\n\n");
+    if pull_req.is_some() {
+        prompt.push_str("# Linux Kernel Pull Request Merge with Conflict Resolution\n\n");
+        prompt.push_str("You are acting as an experienced kernel maintainer resolving conflicts ");
+        prompt.push_str("from a pull request submission on lore.kernel.org.\n\n");
+    } else {
+        prompt.push_str("# Linux Kernel Merge Conflict Resolution\n\n");
+        prompt.push_str("You are acting as an experienced kernel maintainer resolving a merge conflict.\n\n");
+    }
     prompt.push_str("**Important:** Incorrect merge resolutions have historically introduced subtle bugs ");
     prompt.push_str("that affected millions of users and took months to diagnose. A resolution that ");
     prompt.push_str("compiles but has semantic errors is worse than no resolution at all.\n\n");
-    prompt.push_str("Take the time to fully understand both sides of the conflict before attempting ");
-    prompt.push_str("any resolution. If after investigation you're not confident, say so - it's ");
-    prompt.push_str("better to escalate to a human than to introduce a subtle bug.\n\n");
+
+    // Pull request specific: critical evaluation note
+    if pull_req.is_some() {
+        prompt.push_str("**CRITICAL:** You have access to the pull request email which may contain ");
+        prompt.push_str("conflict resolution instructions from the maintainer. Use these as guidance, ");
+        prompt.push_str("but ALWAYS evaluate them critically - there may be better, cleaner, or more ");
+        prompt.push_str("efficient solutions than what was suggested.\n\n");
+    } else {
+        prompt.push_str("Take the time to fully understand both sides of the conflict before attempting ");
+        prompt.push_str("any resolution. If after investigation you're not confident, say so - it's ");
+        prompt.push_str("better to escalate to a human than to introduce a subtle bug.\n\n");
+    }
+
+    // Pull request information (if present)
+    if let Some(pr) = pull_req {
+        prompt.push_str("## Pull Request Information\n\n");
+        prompt.push_str(&format!("- **Subject:** {}\n", pr.subject));
+        prompt.push_str(&format!("- **From:** {}\n", pr.from));
+        prompt.push_str(&format!("- **Date:** {}\n", pr.date));
+        prompt.push_str(&format!("- **Git URL:** {} {}\n", pr.git_url, pr.git_ref));
+        prompt.push_str(&format!("- **Message ID:** {}\n\n", pr.message_id));
+
+        // Full email body - LLM will understand summary and conflict instructions from this
+        prompt.push_str("### Pull Request Email\n\n");
+        prompt.push_str("Read this email carefully. It contains the maintainer's description of the changes ");
+        prompt.push_str("and may include conflict resolution instructions. Evaluate any suggested ");
+        prompt.push_str("resolutions critically - there may be cleaner or more efficient solutions.\n\n");
+        prompt.push_str("```\n");
+        prompt.push_str(&pr.body);
+        prompt.push_str("\n```\n\n");
+    }
 
     // Merge context
     prompt.push_str("## Merge Context\n\n");
@@ -1153,7 +1492,17 @@ fn build_resolve_prompt(
     prompt.push_str("1. Edit the conflicted files to produce the correct merged result\n");
     prompt.push_str("2. Remove all conflict markers (`<<<<<<<`, `=======`, `>>>>>>>`)\n");
     prompt.push_str("3. Stage the resolved files with `git add`\n");
-    prompt.push_str("4. Commit with a detailed message explaining your analysis and resolution\n\n");
+    if pull_req.is_some() {
+        prompt.push_str("4. **Do NOT commit** - The tool will handle the commit\n");
+        prompt.push_str("5. **IMPORTANT:** Write a detailed explanation of your resolution to `.git/LLMINUS_RESOLUTION`\n");
+        prompt.push_str("   This file should contain:\n");
+        prompt.push_str("   - A summary of each conflict and how you resolved it\n");
+        prompt.push_str("   - The reasoning behind your choices\n");
+        prompt.push_str("   - Any improvements you made over suggested resolutions\n");
+        prompt.push_str("   This will be included in the merge commit message.\n\n");
+    } else {
+        prompt.push_str("4. Commit with a detailed message explaining your analysis and resolution\n\n");
+    }
 
     // If uncertain
     prompt.push_str("## If Uncertain\n\n");
@@ -1183,9 +1532,6 @@ fn build_resolve_prompt(
 }
 
 fn resolve(command: &str) -> Result<()> {
-    use std::io::Write;
-    use std::process::Stdio;
-
     // Get merge context (what branch/tag is being merged)
     let merge_ctx = get_merge_context();
     if let Some(ref source) = merge_ctx.merge_source {
@@ -1211,12 +1557,17 @@ fn resolve(command: &str) -> Result<()> {
         println!("Found {} similar historical resolutions", similar.len());
     }
 
-    // Build the prompt
-    println!("Building resolution prompt...");
-    let prompt = build_resolve_prompt(&conflicts, &similar, &merge_ctx);
+    // Build the prompt and invoke LLM
+    let prompt = build_resolve_prompt(&conflicts, &similar, &merge_ctx, None);
+    invoke_llm(command, &prompt)
+}
+
+/// Invoke an LLM command with a prompt via stdin
+fn invoke_llm(command: &str, prompt: &str) -> Result<()> {
+    use std::io::Write;
+    use std::process::Stdio;
 
-    println!("Prompt size: {} bytes", prompt.len());
-    println!("\nInvoking: {}", command);
+    println!("Invoking: {} (prompt: {} bytes)", command, prompt.len());
     println!("{}", "=".repeat(80));
 
     // Parse command (handle arguments)
@@ -1255,6 +1606,107 @@ fn resolve(command: &str) -> Result<()> {
     Ok(())
 }
 
+/// Pull a kernel pull request from lore.kernel.org
+fn pull(message_id: &str, command: &str) -> Result<()> {
+    check_repo()?;
+
+    // Step 1: Fetch and parse the pull request email
+    println!("=== Fetching Pull Request ===\n");
+    let raw_email = fetch_lore_email(message_id)?;
+    let pull_req = parse_pull_request(message_id, &raw_email)?;
+
+    println!("Subject: {}", pull_req.subject);
+    println!("From: {}", pull_req.from);
+    println!("Date: {}", pull_req.date);
+    println!("Git URL: {} {}", pull_req.git_url, pull_req.git_ref);
+
+    // Step 2: Execute git pull
+    println!("\n=== Executing Git Pull ===\n");
+    let has_conflicts = git_pull(&pull_req.git_url, &pull_req.git_ref)?;
+
+    if !has_conflicts {
+        // No conflicts - merge succeeded automatically
+        println!("\n=== Merge Completed Successfully ===");
+        println!("No conflicts detected. The merge was completed automatically.");
+        return Ok(());
+    }
+
+    // Step 3: Handle conflicts
+    println!("\n=== Merge Conflicts Detected ===\n");
+
+    // Get merge context
+    let merge_ctx = get_merge_context();
+
+    // Parse the conflicts
+    let conflicts = get_current_conflicts()?;
+    println!("Found {} conflict region(s) to resolve", conflicts.len());
+
+    // Try to find similar historical resolutions
+    println!("Looking for similar historical conflicts...");
+    let similar = try_find_similar_resolutions(3, &conflicts);
+
+    if similar.is_empty() {
+        println!("No historical resolution database found (this is optional)");
+    } else {
+        println!("Found {} similar historical resolutions", similar.len());
+    }
+
+    // Build the prompt with pull request context and invoke LLM
+    let prompt = build_resolve_prompt(&conflicts, &similar, &merge_ctx, Some(&pull_req));
+    println!("\n=== Invoking LLM for Conflict Resolution ===");
+    invoke_llm(command, &prompt)?;
+
+    // Step 5: Check if conflicts are resolved
+    if has_merge_conflicts() {
+        println!("\nWarning: Conflicts still remain in the working directory.");
+        println!("Please resolve any remaining conflicts manually and commit.");
+        return Ok(());
+    }
+
+    // Step 6: Commit the merge with pull request information
+    println!("\n=== Committing Merge ===\n");
+
+    // Extract summary using LLM (falls back to empty if it fails)
+    let summary = extract_summary_with_llm(&pull_req.body, command)
+        .unwrap_or_else(|| {
+            println!("Note: Could not extract summary automatically");
+            String::new()
+        });
+
+    // Read resolution explanation written by LLM
+    let resolution = std::fs::read_to_string(".git/LLMINUS_RESOLUTION")
+        .unwrap_or_else(|_| {
+            println!("Note: No resolution explanation found in .git/LLMINUS_RESOLUTION");
+            String::new()
+        });
+
+    // Clean up the resolution file
+    let _ = std::fs::remove_file(".git/LLMINUS_RESOLUTION");
+
+    let commit_msg = build_merge_commit_message(&pull_req, &summary, &resolution);
+    println!("Commit message:\n{}", commit_msg);
+
+    // Create a temporary file for the commit message (to handle multi-line)
+    let commit_result = Command::new("git")
+        .args(["commit", "-m", &commit_msg])
+        .output()
+        .context("Failed to run git commit")?;
+
+    if commit_result.status.success() {
+        println!("\n=== Merge Committed Successfully ===");
+        let stdout = String::from_utf8_lossy(&commit_result.stdout);
+        if !stdout.is_empty() {
+            println!("{}", stdout);
+        }
+    } else {
+        let stderr = String::from_utf8_lossy(&commit_result.stderr);
+        eprintln!("Commit failed: {}", stderr);
+        bail!("Failed to commit merge");
+    }
+
+    Ok(())
+}
+
 fn main() -> Result<()> {
     let cli = Cli::parse();
 
@@ -1263,6 +1715,7 @@ fn main() -> Result<()> {
         Commands::Vectorize { batch_size } => vectorize(batch_size),
         Commands::Find { n } => find(n),
         Commands::Resolve { command } => resolve(&command),
+        Commands::Pull { message_id, command } => pull(&message_id, &command),
     }
 }
 
@@ -1651,4 +2104,186 @@ fn test_parse_multiple_conflicts() {
         assert!(conflicts[0].ours_content.contains("first ours"));
         assert!(conflicts[1].ours_content.contains("second ours"));
     }
+
+    #[test]
+    fn test_pull_command_parses() {
+        let cli = Cli::try_parse_from(["llminus", "pull", "test@kernel.org"]).unwrap();
+        match cli.command {
+            Commands::Pull { message_id, command } => {
+                assert_eq!(message_id, "test@kernel.org");
+                assert_eq!(command, "llm"); // default
+            }
+            _ => panic!("Expected Pull command"),
+        }
+    }
+
+    #[test]
+    fn test_pull_command_with_custom_command() {
+        let cli = Cli::try_parse_from([
+            "llminus", "pull", "test@kernel.org", "-c", "my-llm --model fancy"
+        ]).unwrap();
+        match cli.command {
+            Commands::Pull { message_id, command } => {
+                assert_eq!(message_id, "test@kernel.org");
+                assert_eq!(command, "my-llm --model fancy");
+            }
+            _ => panic!("Expected Pull command"),
+        }
+    }
+
+    #[test]
+    fn test_parse_email_headers() {
+        let raw = r#"From: Paul Walmsley <paul@kernel.org>
+Subject: [GIT PULL] RISC-V updates for v6.19
+Date: Thu, 11 Dec 2025 19:36:00 -0700
+Message-ID: <test123@kernel.org>
+
+This is the body of the email.
+"#;
+        let (from, subject, date, msg_id, body) = parse_email_headers(raw);
+        assert_eq!(from, "Paul Walmsley <paul@kernel.org>");
+        assert_eq!(subject, "[GIT PULL] RISC-V updates for v6.19");
+        assert_eq!(date, "Thu, 11 Dec 2025 19:36:00 -0700");
+        assert_eq!(msg_id, "<test123@kernel.org>");
+        assert!(body.contains("This is the body"));
+    }
+
+    #[test]
+    fn test_parse_email_headers_multiline() {
+        let raw = r#"From: Paul Walmsley <paul@kernel.org>
+Subject: [GIT PULL] RISC-V updates
+ for v6.19 merge window
+Date: Thu, 11 Dec 2025 19:36:00 -0700
+
+Body here.
+"#;
+        let (_, subject, _, _, _) = parse_email_headers(raw);
+        assert!(subject.contains("RISC-V updates"));
+        assert!(subject.contains("for v6.19 merge window"));
+    }
+
+    #[test]
+    fn test_extract_git_info() {
+        let body = r#"Please pull this set of changes.
+
+The following changes are available in the Git repository at:
+
+  git://git.kernel.org/pub/scm/linux/kernel/git/riscv/linux tags/riscv-for-linus-6.19
+
+for you to fetch changes up to abc123.
+"#;
+        let result = extract_git_info(body);
+        assert!(result.is_some());
+        let (url, git_ref) = result.unwrap();
+        assert_eq!(url, "git://git.kernel.org/pub/scm/linux/kernel/git/riscv/linux");
+        assert_eq!(git_ref, "tags/riscv-for-linus-6.19");
+    }
+
+    #[test]
+    fn test_extract_git_info_https() {
+        let body = r#"Available at:
+
+  https://git.kernel.org/pub/scm/linux/kernel/git/foo/bar.git feature-branch
+
+Thanks!
+"#;
+        let result = extract_git_info(body);
+        assert!(result.is_some());
+        let (url, git_ref) = result.unwrap();
+        assert!(url.starts_with("https://git.kernel.org"));
+        assert_eq!(git_ref, "feature-branch");
+    }
+
+    #[test]
+    fn test_extract_git_info_none() {
+        let body = "This email has no git URL in it.";
+        let result = extract_git_info(body);
+        assert!(result.is_none());
+    }
+
+    #[test]
+    fn test_build_merge_commit_message() {
+        let pull_req = PullRequest {
+            message_id: "test123@kernel.org".to_string(),
+            subject: "[GIT PULL] Important updates for v6.19".to_string(),
+            from: "Maintainer <maintainer@kernel.org>".to_string(),
+            date: "2025-12-11".to_string(),
+            git_url: "git://git.kernel.org/pub/scm/foo".to_string(),
+            git_ref: "tags/foo-for-v6.19".to_string(),
+            body: String::new(),
+        };
+
+        let summary = "This is the maintainer's summary of changes.";
+        let resolution = "Resolved by keeping both changes.";
+        let msg = build_merge_commit_message(&pull_req, summary, resolution);
+        assert!(msg.contains("Merge tags/foo-for-v6.19"));
+        assert!(msg.contains("Important updates")); // subject without [GIT PULL]
+        assert!(msg.contains("maintainer's summary"));
+        assert!(msg.contains("conflict resolution"));
+        assert!(msg.contains("keeping both changes"));
+        assert!(msg.contains("https://lore.kernel.org/all/test123@kernel.org/"));
+    }
+
+    #[test]
+    fn test_build_resolve_prompt_with_pull_request() {
+        let conflicts = vec![ConflictFile {
+            path: "test.c".to_string(),
+            ours_content: "int ours;".to_string(),
+            theirs_content: "int theirs;".to_string(),
+            base_content: Some("int base;".to_string()),
+        }];
+
+        let pull_req = PullRequest {
+            message_id: "test@kernel.org".to_string(),
+            subject: "Test PR".to_string(),
+            from: "Author <author@kernel.org>".to_string(),
+            date: "2025-12-11".to_string(),
+            git_url: "git://test".to_string(),
+            git_ref: "tags/test".to_string(),
+            body: "Test summary\n\nResolve by keeping both.".to_string(),
+        };
+
+        let merge_ctx = MergeContext {
+            merge_source: Some("tags/test".to_string()),
+            head_branch: Some("master".to_string()),
+            merge_message: Some("Merge tags/test".to_string()),
+        };
+
+        let prompt = build_resolve_prompt(&conflicts, &[], &merge_ctx, Some(&pull_req));
+
+        // Check that key sections are present
+        assert!(prompt.contains("Pull Request Information"));
+        assert!(prompt.contains("Test PR")); // subject
+        assert!(prompt.contains("Test summary")); // body includes summary
+        assert!(prompt.contains("Resolve by keeping both")); // body includes this
+        assert!(prompt.contains("test.c")); // conflict file
+        assert!(prompt.contains("int ours;")); // ours content
+        assert!(prompt.contains("int theirs;")); // theirs content
+        assert!(prompt.contains("Do NOT commit")); // pull request specific
+    }
+
+    #[test]
+    fn test_build_resolve_prompt_without_pull_request() {
+        let conflicts = vec![ConflictFile {
+            path: "test.c".to_string(),
+            ours_content: "int ours;".to_string(),
+            theirs_content: "int theirs;".to_string(),
+            base_content: None,
+        }];
+
+        let merge_ctx = MergeContext {
+            merge_source: Some("feature-branch".to_string()),
+            head_branch: Some("master".to_string()),
+            merge_message: None,
+        };
+
+        let prompt = build_resolve_prompt(&conflicts, &[], &merge_ctx, None);
+
+        // Check standard resolve sections
+        assert!(prompt.contains("Linux Kernel Merge Conflict Resolution"));
+        assert!(!prompt.contains("Pull Request Information"));
+        assert!(prompt.contains("test.c"));
+        assert!(prompt.contains("int ours;"));
+        assert!(prompt.contains("Commit with a detailed message")); // not "Do NOT commit"
+    }
 }
-- 
2.51.0

