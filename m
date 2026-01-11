Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A92D2853EE
	for <tools@linux.kernel.org>; Sun, 11 Jan 2026 21:29:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768166968; cv=none; b=nha505BLeQNCooXR0yXqj2yI80iKKUEPeUT8PvjUL1h8ONVJ29kuak97K0TwlUJ3J6EogjAMboh57+j+Rj6joZaBgd/Y0rA6Cv0jRXYm5VvGQ6jlHaC5/yKRZ6vSFYG/pr0Ef5+IkDDyKFC905XbrlIuLD53fwmCdDmPwVO/Qoc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768166968; c=relaxed/simple;
	bh=5z/km3cPIT+wVNjJehk/MJfggkGIzoou+eaipgS4gpM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=asXZo9K36dqMSEasyXK/7UDgS47xqtMtbGIY8Xn3lqO8oTsxtVNcDpeQrX3d2KFf8S73TzvakJ8b0siIQ7itAU0AnKCzyFXd4dxNPRtPhhjNtrZ82+xS+VFcIpJUvzlsK2/Wca7lR4nbM/N4m+lZ9akxxhZSDFNitQDLwTUgPTo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DxfaygYe; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DxfaygYe"
Received: by smtp.kernel.org (Postfix)
	id 4C3DCC4CEF7; Sun, 11 Jan 2026 21:29:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9B2A6C2BC86;
	Sun, 11 Jan 2026 21:29:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768166964;
	bh=5z/km3cPIT+wVNjJehk/MJfggkGIzoou+eaipgS4gpM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=DxfaygYeqKkpMfapP18tCs3jReRweeukjJbcmbHyFPQD706kvpc8PcuHHTMfxCcla
	 UOkVwWEfRjpZFQz1sLF0KiLHrVUoVmAZiYF9dn9hMfAjaWoORJ0H6JUEswnxizY1gB
	 bmA9FJZGRVRHmqGUQr1/s6uC8hyqSmPORgQDLnJ54roNRYhagOk87bmg1bYtafALJi
	 GdBWRGgV/72uuqvZ7beVvppKs8PkeqZvPMHspY1CsMFy2F5yph9+Z13qOU0LvJiPLm
	 s2YEuKggx2xUwApn2cEL8VlSsw+TGbqbJlD/5asjXYRBhmoBh0y+jK+Qn+E2CgVv2J
	 3lZ6UsOczaoRw==
From: Sasha Levin <sashal@kernel.org>
To: tools@kernel.org
Cc: linux-kernel@vger.kernel.org,
	torvalds@linux-foundation.org,
	broonie@kernel.org,
	Sasha Levin <sashal@kernel.org>
Subject: [RFC v2 7/7] LLMinus: Add build test integration for semantic conflicts
Date: Sun, 11 Jan 2026 16:29:15 -0500
Message-ID: <20260111212915.195056-8-sashal@kernel.org>
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

Detect and resolve build failures that occur after merges complete without
textual conflicts. These semantic conflicts happen when changes from
different branches are incompatible at build time.

When no textual conflicts exist, llminus runs the build to check for
issues. If the build fails, it generates a specialized prompt for the
LLM to investigate and fix the errors. The resolve prompt now requires
build verification before considering resolution complete.

Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 tools/llminus/src/main.rs | 236 ++++++++++++++++++++++++++++++++++++--
 1 file changed, 224 insertions(+), 12 deletions(-)

diff --git a/tools/llminus/src/main.rs b/tools/llminus/src/main.rs
index 5c469e23f09a..40aa25e83b3d 100644
--- a/tools/llminus/src/main.rs
+++ b/tools/llminus/src/main.rs
@@ -1355,13 +1355,15 @@ fn build_merge_commit_message(pull_req: &PullRequest, summary: &str, resolution:
 }
 
 /// Get current conflicts from the working directory
+/// Returns an empty Vec if there are no conflicts (for build-only issues)
 fn get_current_conflicts() -> Result<Vec<ConflictFile>> {
     check_repo()?;
 
     // Find current conflicts
     let conflict_paths = get_conflicted_files()?;
     if conflict_paths.is_empty() {
-        bail!("No conflicts detected. Run this command when you have active merge conflicts.");
+        // No conflicts - this is fine, might be a build-only issue
+        return Ok(Vec::new());
     }
 
     // Parse all conflict regions
@@ -1372,10 +1374,6 @@ fn get_current_conflicts() -> Result<Vec<ConflictFile>> {
         }
     }
 
-    if all_conflicts.is_empty() {
-        bail!("Could not parse any conflict markers from the conflicted files.");
-    }
-
     Ok(all_conflicts)
 }
 
@@ -1436,6 +1434,184 @@ fn try_find_similar_resolutions(n: usize, conflicts: &[ConflictFile]) -> Vec<Sim
         .collect()
 }
 
+/// Represents the result of a build test
+struct BuildTestResult {
+    success: bool,
+    output: String,
+}
+
+/// Run a build test and capture any warnings/errors
+/// Returns the build output (stderr from `stable build log`)
+///
+/// NOTE: The build system requires all changes to be committed.
+/// The LLM prompts instruct the model to commit before running build tests.
+/// We don't enforce this in code because the shell script may legitimately
+/// pass staged changes to llminus for the LLM to handle.
+fn run_build_test() -> BuildTestResult {
+    use std::process::Stdio;
+
+    println!("Running build test: stable build log");
+
+    let result = Command::new("stable")
+        .args(["build", "log"])
+        .stdout(Stdio::piped())
+        .stderr(Stdio::piped())
+        .output();
+
+    match result {
+        Ok(output) => {
+            let stderr = String::from_utf8_lossy(&output.stderr).to_string();
+            let stdout = String::from_utf8_lossy(&output.stdout).to_string();
+
+            // Combine stderr (warnings/errors) with any stdout for full picture
+            let combined = if stderr.is_empty() {
+                stdout
+            } else if stdout.is_empty() {
+                stderr
+            } else {
+                format!("{}\n{}", stderr, stdout)
+            };
+
+            // Check for actual build issues - look for warning/error patterns
+            let has_issues = combined.lines().any(|line| {
+                let lower = line.to_lowercase();
+                lower.contains("error:") || lower.contains("warning:")
+                    || lower.contains("error[") || lower.contains("undefined reference")
+                    || lower.contains("fatal error") || lower.contains("make[")
+            });
+
+            BuildTestResult {
+                success: output.status.success() && !has_issues,
+                output: combined.trim().to_string(),
+            }
+        }
+        Err(e) => BuildTestResult {
+            success: false,
+            output: format!("Failed to run build test: {}", e),
+        },
+    }
+}
+
+/// Build an LLM prompt for fixing build errors (when no merge conflicts exist)
+fn build_fix_prompt(build_output: &str, merge_ctx: &MergeContext) -> String {
+    let mut prompt = String::new();
+
+    // Header with high-stakes framing (matching the existing style)
+    prompt.push_str("# Linux Kernel Build Issue Resolution\n\n");
+    prompt.push_str("You are acting as an experienced kernel maintainer. A merge completed without ");
+    prompt.push_str("textual conflicts, but the build test revealed warnings or errors that need to be fixed.\n\n");
+
+    prompt.push_str("**Important:** Incorrect fixes have historically introduced subtle bugs ");
+    prompt.push_str("that affected millions of users and took months to diagnose. A fix that ");
+    prompt.push_str("silences a warning but has semantic errors is worse than no fix at all.\n\n");
+
+    prompt.push_str("Take the time to fully understand the build failure before attempting ");
+    prompt.push_str("any fix. If after investigation you're not confident, say so - it's ");
+    prompt.push_str("better to escalate to a human than to introduce a subtle bug.\n\n");
+
+    // Merge context
+    prompt.push_str("## Merge Context\n\n");
+    if let Some(ref source) = merge_ctx.merge_source {
+        prompt.push_str(&format!("**Merged:** `{}`\n", source));
+    }
+    if let Some(ref head) = merge_ctx.head_branch {
+        prompt.push_str(&format!("**Into:** `{}`\n", head));
+    }
+    prompt.push_str("\nThe merge itself completed without textual conflicts, but the build has issues.\n\n");
+
+    // Build output
+    prompt.push_str("## Build Output\n\n");
+    prompt.push_str("The following warnings/errors were produced by `stable build log` (allmodconfig build):\n\n");
+    prompt.push_str("```\n");
+    prompt.push_str(build_output);
+    prompt.push_str("\n```\n\n");
+
+    // Investigation requirement (matching existing style)
+    prompt.push_str("## Investigation Required\n\n");
+    prompt.push_str("Before attempting any fix, you must conduct thorough research. ");
+    prompt.push_str("Rushing to fix without understanding is how subtle bugs get introduced. ");
+    prompt.push_str("Work through each phase below IN ORDER and document your findings.\n\n");
+
+    // Phase 1: Search lore.kernel.org
+    prompt.push_str("### Phase 1: Search lore.kernel.org for Guidance (DO THIS FIRST)\n\n");
+    prompt.push_str("**CRITICAL:** Before doing ANY other research, search lore.kernel.org for existing guidance.\n");
+    prompt.push_str("Maintainers often discuss build issues when they know they will occur after merges.\n\n");
+
+    if let Some(ref source) = merge_ctx.merge_source {
+        prompt.push_str(&format!("1. **Search for the merge itself:** `{}`\n", source));
+        prompt.push_str(&format!("   - URL: `https://lore.kernel.org/all/?q={}`\n", source.replace('/', "%2F")));
+    }
+    prompt.push_str("2. **Search for similar build issues:**\n");
+    prompt.push_str("   - Search for the specific error message or warning text\n");
+    prompt.push_str("   - `\"build error\"` + subsystem name\n\n");
+
+    // Phase 2: Understand the context
+    prompt.push_str("### Phase 2: Understand the Context\n\n");
+    prompt.push_str("- **Identify the affected files** from the error/warning messages\n");
+    prompt.push_str("- **What subsystem is this?** Read the file and nearby files to understand its purpose.\n");
+    prompt.push_str("- **Who maintains it?** Check `git log --oneline -20` for recent authors.\n\n");
+
+    // Phase 3: Trace history
+    prompt.push_str("### Phase 3: Trace the History\n\n");
+    prompt.push_str("**Understand what changed:**\n");
+    prompt.push_str("- Run `git log --oneline HEAD~5..HEAD -- <file>` to see recent changes\n");
+    prompt.push_str("- Use `git show <commit>` to read the full commit messages\n");
+    prompt.push_str("- Check both sides of the merge: `git diff HEAD^1..HEAD^2 -- <file>`\n\n");
+
+    prompt.push_str("**Common causes of post-merge build issues:**\n");
+    prompt.push_str("- Missing includes when code from one branch uses types/functions defined in another\n");
+    prompt.push_str("- Renamed or removed functions/macros that the merged code references\n");
+    prompt.push_str("- Conflicting definitions (same symbol defined differently in merged branches)\n");
+    prompt.push_str("- Changes to function signatures that weren't propagated to all callers\n");
+    prompt.push_str("- Linker script or section changes that affect symbol placement\n\n");
+
+    // Resolution
+    prompt.push_str("## Resolution\n\n");
+    prompt.push_str("Once you understand the issue:\n\n");
+    prompt.push_str("1. Fix the build issues in the affected files\n");
+    prompt.push_str("2. Stage your changes with `git add`\n");
+    prompt.push_str("3. **COMMIT BEFORE BUILD TEST:** Create a temporary commit to test the build:\n");
+    prompt.push_str("   ```bash\n");
+    prompt.push_str("   git commit -m \"WIP: testing build fix\"\n");
+    prompt.push_str("   ```\n");
+    prompt.push_str("   The build system requires all changes to be committed to test them.\n");
+    prompt.push_str("4. **MANDATORY BUILD TEST:** Run `stable build log` to verify the fix\n");
+    prompt.push_str("5. If the build fails, try to fix the issues, amend the commit, and re-run the build test\n");
+    prompt.push_str("6. **ALWAYS UNDO TEMPORARY COMMIT:** Whether build succeeded or failed, you MUST undo the temporary commit:\n");
+    prompt.push_str("   ```bash\n");
+    prompt.push_str("   git reset --soft HEAD~1\n");
+    prompt.push_str("   ```\n");
+    prompt.push_str("   This is MANDATORY - the calling script expects staged changes, not a committed state.\n");
+    prompt.push_str("   If the build still fails after your best effort, report the failure but STILL do the soft reset.\n\n");
+
+    // If uncertain
+    prompt.push_str("## If Uncertain\n\n");
+    prompt.push_str("If after investigation you're still uncertain about the correct fix:\n\n");
+    prompt.push_str("- Explain what you've learned and what remains unclear\n");
+    prompt.push_str("- Describe the possible fixes you see and their tradeoffs\n");
+    prompt.push_str("- Recommend whether a human maintainer should review\n\n");
+    prompt.push_str("It's better to flag uncertainty than to silently introduce a bug.\n\n");
+
+    // Tools available
+    prompt.push_str("## Tools Available\n\n");
+    prompt.push_str("You can use these to investigate:\n\n");
+    prompt.push_str("```bash\n");
+    prompt.push_str("# View recent changes to the affected file\n");
+    prompt.push_str("git log --oneline HEAD~10..HEAD -- <file>\n");
+    prompt.push('\n');
+    prompt.push_str("# Compare the merge parents\n");
+    prompt.push_str("git diff HEAD^1..HEAD^2 -- <file>\n");
+    prompt.push('\n');
+    prompt.push_str("# Understand a specific commit\n");
+    prompt.push_str("git show <hash>\n");
+    prompt.push('\n');
+    prompt.push_str("# Re-run the build test\n");
+    prompt.push_str("stable build log\n");
+    prompt.push_str("```\n");
+
+    prompt
+}
+
 /// Build the LLM prompt for conflict resolution
 fn build_resolve_prompt(
     conflicts: &[ConflictFile],
@@ -1612,16 +1788,31 @@ fn build_resolve_prompt(
     prompt.push_str("1. Edit the conflicted files to produce the correct merged result\n");
     prompt.push_str("2. Remove all conflict markers (`<<<<<<<`, `=======`, `>>>>>>>`)\n");
     prompt.push_str("3. Stage the resolved files with `git add`\n");
+    prompt.push_str("4. **COMMIT BEFORE BUILD TEST:** Create a temporary commit to test the build:\n");
+    prompt.push_str("   ```bash\n");
+    prompt.push_str("   git commit -m \"WIP: testing merge resolution\"\n");
+    prompt.push_str("   ```\n");
+    prompt.push_str("   The build system requires all changes to be committed to test them.\n");
+    prompt.push_str("5. **MANDATORY BUILD TEST:** Verify the build succeeds with no warnings or errors:\n");
+    prompt.push_str("   ```bash\n");
+    prompt.push_str("   stable build log\n");
+    prompt.push_str("   ```\n");
+    prompt.push_str("   This runs an allmodconfig build and outputs only warnings/errors to stderr.\n");
+    prompt.push_str("   Review the output for ANY warnings or errors. If the build fails or produces warnings,\n");
+    prompt.push_str("   you MUST try to fix them, amend the commit, and re-run the build test.\n");
+    prompt.push_str("6. **ALWAYS UNDO TEMPORARY COMMIT:** Whether build succeeded or failed, you MUST undo the temporary commit:\n");
+    prompt.push_str("   ```bash\n");
+    prompt.push_str("   git reset --soft HEAD~1\n");
+    prompt.push_str("   ```\n");
+    prompt.push_str("   This is MANDATORY - the calling script expects staged changes, not a committed state.\n");
+    prompt.push_str("   If the build still fails after your best effort, report the failure but STILL do the soft reset.\n");
     if pull_req.is_some() {
-        prompt.push_str("4. **Do NOT commit** - The tool will handle the commit\n");
-        prompt.push_str("5. **IMPORTANT:** Write a detailed explanation of your resolution to `.git/LLMINUS_RESOLUTION`\n");
+        prompt.push_str("7. **IMPORTANT:** Write a detailed explanation of your resolution to `.git/LLMINUS_RESOLUTION`\n");
         prompt.push_str("   This file should contain:\n");
         prompt.push_str("   - A summary of each conflict and how you resolved it\n");
         prompt.push_str("   - The reasoning behind your choices\n");
         prompt.push_str("   - Any improvements you made over suggested resolutions\n");
         prompt.push_str("   This will be included in the merge commit message.\n\n");
-    } else {
-        prompt.push_str("4. Commit with a detailed message explaining your analysis and resolution\n\n");
     }
 
     // If uncertain
@@ -1664,6 +1855,24 @@ fn resolve(command: &str, max_tokens: usize) -> Result<()> {
     // Get current conflicts first
     let conflicts = get_current_conflicts()?;
 
+    if conflicts.is_empty() {
+        // No textual conflicts - check for build issues instead
+        println!("No textual conflicts detected.");
+        println!("Running build test to check for merge-related build issues...\n");
+
+        let build_result = run_build_test();
+
+        if build_result.success {
+            println!("Build test passed. No issues to resolve.");
+            return Ok(());
+        }
+
+        // Build failed - invoke LLM to fix the issues
+        println!("\nBuild test failed! Invoking LLM to resolve build issues...\n");
+        let prompt = build_fix_prompt(&build_result.output, &merge_ctx);
+        return invoke_llm(command, &prompt);
+    }
+
     println!("Found {} conflict(s)", conflicts.len());
 
     // Try to find similar historical resolutions (gracefully handles missing database)
@@ -2145,7 +2354,7 @@ fn test_resolution_store_roundtrip() {
         let dir = TempDir::new().unwrap();
         let store_path = dir.path().join("resolutions.json");
 
-        let mut store = ResolutionStore { version: 3, resolutions: Vec::new() };
+        let mut store = ResolutionStore { version: 3, resolutions: Vec::new(), processed_commits: Vec::new() };
         store.resolutions.push(MergeResolution {
             commit_hash: "abc123".to_string(),
             commit_summary: "Test merge".to_string(),
@@ -2197,6 +2406,7 @@ fn test_git_in_repo() {
 
     #[test]
     fn test_get_merge_commits() {
+        let original_dir = std::env::current_dir().unwrap();
         let dir = init_test_repo();
         std::env::set_current_dir(dir.path()).unwrap();
 
@@ -2209,6 +2419,8 @@ fn test_get_merge_commits() {
 
         let merges = get_merge_commits(None).unwrap();
         assert_eq!(merges.len(), 1);
+
+        std::env::set_current_dir(original_dir).unwrap();
     }
 
     #[test]
@@ -2436,7 +2648,7 @@ fn test_build_resolve_prompt_with_pull_request() {
         assert!(prompt.contains("test.c")); // conflict file
         assert!(prompt.contains("int ours;")); // ours content
         assert!(prompt.contains("int theirs;")); // theirs content
-        assert!(prompt.contains("Do NOT commit")); // pull request specific
+        assert!(prompt.contains("Write a detailed explanation")); // pull request specific
     }
 
     #[test]
@@ -2461,6 +2673,6 @@ fn test_build_resolve_prompt_without_pull_request() {
         assert!(!prompt.contains("Pull Request Information"));
         assert!(prompt.contains("test.c"));
         assert!(prompt.contains("int ours;"));
-        assert!(prompt.contains("Commit with a detailed message")); // not "Do NOT commit"
+        assert!(!prompt.contains("Write a detailed explanation")); // PR-specific, not in standard prompt
     }
 }
-- 
2.51.0

