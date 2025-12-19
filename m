Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AADFA36D50F
	for <tools@linux.kernel.org>; Fri, 19 Dec 2025 18:16:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766168199; cv=none; b=s+90FHYoLwV3IXDoyZvaPHL0SEfm/uaHlGzAw43Sgh4KvQrDDoiq5iCHb2e+7/OZnD5Y8qCzzCRCKr9SElMzzFoPwATuiLIJN2ELdbgU+jrAWe1ZKHjC18vX14o7WYuVDIPiiNg7ObjvRsP0yRFQO71rrPO2aSRbboXLv2CRypI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766168199; c=relaxed/simple;
	bh=dABhBs3dlbEFE//IBJcIrzNJ3GkGdZ/MIprGDkWl7UY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=IL5S2nrkRGHD9ESGQPTI4FAbIqpsLmNQyS2pwolpFsRoFc8VrWVJ8ArYgLyjpS4ukOD4arZdtPfZJOCWgkI505NM6Q0MwBbrUk7mzUmFuaiWOhzoK5V4lnVmKf2UVZQ02etKAbVgSFJWYpTZYqeZbEkFE7XdxaANk9S4MuZ8lRw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Go/tMDqw; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Go/tMDqw"
Received: by smtp.kernel.org (Postfix)
	id 6E989C19422; Fri, 19 Dec 2025 18:16:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C2663C16AAE;
	Fri, 19 Dec 2025 18:16:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1766168199;
	bh=dABhBs3dlbEFE//IBJcIrzNJ3GkGdZ/MIprGDkWl7UY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Go/tMDqw/rs3ShikchclrwxVWuz9rcl5+op9PKHqS4dmQJDRCGBaf95GGrvLi1HIc
	 vyFvodx9wK8rgcFgc5IADFVuzBxr3M8bUXyCaOqJTWs/OVk5Ucya7VceAjb0sWESmM
	 qpa3HuocohsE/1ncZZcy7aNZO4r3yvmrMGw5gL4WZsWOya1jsVL9dDvvrNrqgtsK9L
	 Rs6e0HuZR7rOUMjY0Oq0DMHMeFFqzM4lfhSqPP2OPmOOtraqFdUiE86GEyY8KCYgG9
	 D3kKHxC1gFbYfqmY1iQbMLHp+cWLYEFKAp/PaB29DpoagEYeppobW1kTYNiSpgr050
	 8Bevcnj84ZUtw==
From: Sasha Levin <sashal@kernel.org>
To: tools@kernel.org
Cc: linux-kernel@vger.kernel.org,
	torvalds@linux-foundation.org,
	broonie@kernel.org,
	Sasha Levin <sashal@kernel.org>
Subject: [RFC 3/5] LLMinus: Add find command for similarity search
Date: Fri, 19 Dec 2025 13:16:27 -0500
Message-ID: <20251219181629.1123823-4-sashal@kernel.org>
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

Add the 'find' command that searches for historical conflict resolutions
similar to the current merge conflicts using vector similarity.

Key features:
- Detects current conflicts via git diff --diff-filter=U
- Parses conflict markers including diff3 style (with base content)
- Generates embeddings for current conflicts
- Computes cosine similarity against stored resolutions
- Displays top N most similar historical resolutions

New functionality:
- ConflictFile struct for representing active conflicts
- State machine parser for conflict markers (<<<<<<<, =======, >>>>>>>)
- Support for diff3 style markers (||||||| for base content)
- find_similar_resolutions() for core search logic
- Configurable number of results via positional argument

This enables developers to quickly find relevant examples of how
similar conflicts were resolved in the past.

Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 tools/llminus/src/main.rs | 327 ++++++++++++++++++++++++++++++++++++++
 1 file changed, 327 insertions(+)

diff --git a/tools/llminus/src/main.rs b/tools/llminus/src/main.rs
index 32a578030b0e3..1a045fa3174ea 100644
--- a/tools/llminus/src/main.rs
+++ b/tools/llminus/src/main.rs
@@ -33,6 +33,12 @@ enum Commands {
         #[arg(short, long, default_value = "64")]
         batch_size: usize,
     },
+    /// Find similar historical conflict resolutions for current conflicts
+    Find {
+        /// Number of similar resolutions to show (default: 1)
+        #[arg(default_value = "1")]
+        n: usize,
+    },
 }
 
 /// A single diff hunk representing a change region
@@ -596,12 +602,244 @@ fn vectorize(batch_size: usize) -> Result<()> {
     Ok(())
 }
 
+/// A file with active conflict markers
+#[derive(Debug)]
+struct ConflictFile {
+    path: String,
+    ours_content: String,
+    theirs_content: String,
+    base_content: Option<String>,
+}
+
+impl ConflictFile {
+    /// Generate embedding text for this conflict
+    fn to_embedding_text(&self) -> String {
+        let mut text = format!("File: {}\n\n", self.path);
+
+        text.push_str("=== OURS ===\n");
+        text.push_str(&self.ours_content);
+        text.push_str("\n\n");
+
+        text.push_str("=== THEIRS ===\n");
+        text.push_str(&self.theirs_content);
+        text.push('\n');
+
+        if let Some(ref base) = self.base_content {
+            text.push_str("\n=== BASE ===\n");
+            text.push_str(base);
+            text.push('\n');
+        }
+
+        text
+    }
+}
+
+/// Get list of files with unmerged conflicts
+fn get_conflicted_files() -> Result<Vec<String>> {
+    // git diff --name-only --diff-filter=U shows unmerged files
+    let output = git(&["diff", "--name-only", "--diff-filter=U"])?;
+    Ok(output.lines().map(|s| s.to_string()).filter(|s| !s.is_empty()).collect())
+}
+
+/// State machine for parsing conflict markers
+enum ConflictParseState {
+    Outside,
+    InOurs,
+    InBase,
+    InTheirs,
+}
+
+/// Append a line to a string, adding newline separator if non-empty
+fn append_line(s: &mut String, line: &str) {
+    if !s.is_empty() {
+        s.push('\n');
+    }
+    s.push_str(line);
+}
+
+/// Parse conflict markers from a file and extract ours/theirs/base content
+fn parse_conflict_file(path: &str) -> Result<Vec<ConflictFile>> {
+    let content = std::fs::read_to_string(path)
+        .with_context(|| format!("Failed to read {}", path))?;
+
+    let mut conflicts = Vec::new();
+    let mut state = ConflictParseState::Outside;
+    let mut current_ours = String::new();
+    let mut current_theirs = String::new();
+    let mut current_base: Option<String> = None;
+
+    for line in content.lines() {
+        if line.starts_with("<<<<<<<") {
+            state = ConflictParseState::InOurs;
+            current_ours.clear();
+            current_theirs.clear();
+            current_base = None;
+        } else if line.starts_with("|||||||") {
+            // diff3 style - base content follows
+            state = ConflictParseState::InBase;
+            current_base = Some(String::new());
+        } else if line.starts_with("=======") {
+            state = ConflictParseState::InTheirs;
+        } else if line.starts_with(">>>>>>>") {
+            // End of conflict block - save it
+            conflicts.push(ConflictFile {
+                path: path.to_string(),
+                ours_content: std::mem::take(&mut current_ours),
+                theirs_content: std::mem::take(&mut current_theirs),
+                base_content: current_base.take(),
+            });
+            state = ConflictParseState::Outside;
+        } else {
+            match state {
+                ConflictParseState::InOurs => append_line(&mut current_ours, line),
+                ConflictParseState::InBase => {
+                    if let Some(ref mut base) = current_base {
+                        append_line(base, line);
+                    }
+                }
+                ConflictParseState::InTheirs => append_line(&mut current_theirs, line),
+                ConflictParseState::Outside => {}
+            }
+        }
+    }
+
+    Ok(conflicts)
+}
+
+/// Result of a similarity search
+struct SimilarResolution {
+    resolution: MergeResolution,
+    similarity: f32,
+}
+
+/// Find similar resolutions (shared logic for find and resolve)
+fn find_similar_resolutions(n: usize) -> Result<(Vec<ConflictFile>, Vec<SimilarResolution>)> {
+    check_repo()?;
+
+    let store_path = Path::new(STORE_PATH);
+    if !store_path.exists() {
+        bail!("No resolutions database found. Run 'llminus learn' first.");
+    }
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
+    // Load the resolution store
+    let store = ResolutionStore::load(store_path)?;
+    let with_embeddings: Vec<_> = store.resolutions.iter()
+        .filter(|r| r.embedding.is_some())
+        .collect();
+
+    if with_embeddings.is_empty() {
+        bail!("No embeddings in database. Run 'llminus vectorize' first.");
+    }
+
+    // Initialize embedding model
+    let mut model = init_embedding_model()?;
+
+    // Generate embedding for current conflicts
+    let conflict_text: String = all_conflicts.iter()
+        .map(|c| c.to_embedding_text())
+        .collect::<Vec<_>>()
+        .join("\n---\n\n");
+
+    let query_embeddings = model
+        .embed(vec![conflict_text], None)
+        .context("Failed to generate embedding for current conflict")?;
+    let query_embedding = &query_embeddings[0];
+
+    // Compute similarities and take top N (clone resolutions to own them)
+    let mut similarities: Vec<_> = with_embeddings.iter()
+        .map(|r| {
+            let sim = cosine_similarity(query_embedding, r.embedding.as_ref().unwrap());
+            (r, sim)
+        })
+        .collect();
+
+    similarities.sort_by(|a, b| b.1.partial_cmp(&a.1).unwrap_or(std::cmp::Ordering::Equal));
+
+    let top_n: Vec<SimilarResolution> = similarities.into_iter()
+        .take(n)
+        .map(|(r, sim)| SimilarResolution {
+            resolution: (*r).clone(),
+            similarity: sim,
+        })
+        .collect();
+
+    Ok((all_conflicts, top_n))
+}
+
+fn find(n: usize) -> Result<()> {
+    // Use find_similar_resolutions for core search logic
+    let (_conflicts, top_n) = find_similar_resolutions(n)?;
+
+    // Display results
+    println!("\n{}", "=".repeat(80));
+    println!("Top {} similar historical conflict resolution(s):", top_n.len());
+    println!("{}", "=".repeat(80));
+
+    for (i, result) in top_n.iter().enumerate() {
+        let r = &result.resolution;
+        println!("\n{}. [similarity: {:.4}]", i + 1, result.similarity);
+        println!("   Commit: {}", r.commit_hash);
+        println!("   Summary: {}", r.commit_summary);
+        println!("   Author: {}", r.author);
+        println!("   Date: {}", r.commit_date);
+        println!("   Files ({}):", r.files.len());
+        for file in &r.files {
+            println!("     - {} ({})", file.file_path, file.subsystem);
+        }
+
+        // Show the resolution diffs for each file
+        println!("\n   Resolution details:");
+        for file in &r.files {
+            println!("   --- {} ---", file.file_path);
+            if !file.resolution_diff.is_empty() {
+                for hunk in &file.resolution_diff {
+                    // Indent and print the diff
+                    for line in hunk.content.lines() {
+                        println!("   {}", line);
+                    }
+                }
+            } else {
+                println!("   (no diff hunks recorded)");
+            }
+        }
+        println!();
+    }
+
+    // Provide git show command for easy access
+    if let Some(top) = top_n.first() {
+        println!("{}", "-".repeat(80));
+        println!("To see the full commit:");
+        println!("  git show {}", top.resolution.commit_hash);
+    }
+
+    Ok(())
+}
+
 fn main() -> Result<()> {
     let cli = Cli::parse();
 
     match cli.command {
         Commands::Learn { range } => learn(range.as_deref()),
         Commands::Vectorize { batch_size } => vectorize(batch_size),
+        Commands::Find { n } => find(n),
     }
 }
 
@@ -653,6 +891,24 @@ fn test_vectorize_command_with_batch_size() {
         }
     }
 
+    #[test]
+    fn test_find_command_parses() {
+        let cli = Cli::try_parse_from(["llminus", "find"]).unwrap();
+        match cli.command {
+            Commands::Find { n } => assert_eq!(n, 1),
+            _ => panic!("Expected Find command"),
+        }
+    }
+
+    #[test]
+    fn test_find_command_with_n() {
+        let cli = Cli::try_parse_from(["llminus", "find", "5"]).unwrap();
+        match cli.command {
+            Commands::Find { n } => assert_eq!(n, 5),
+            _ => panic!("Expected Find command"),
+        }
+    }
+
     #[test]
     fn test_cosine_similarity() {
         // Identical vectors should have similarity 1.0
@@ -847,4 +1103,75 @@ fn test_get_merge_commits() {
         let merges = get_merge_commits(None).unwrap();
         assert_eq!(merges.len(), 1);
     }
+
+    #[test]
+    fn test_parse_conflict_markers() {
+        let dir = TempDir::new().unwrap();
+        let conflict_file = dir.path().join("conflict.c");
+        let content = r#"int main() {
+<<<<<<< HEAD
+    printf("ours");
+=======
+    printf("theirs");
+>>>>>>> feature
+    return 0;
+}
+"#;
+        fs::write(&conflict_file, content).unwrap();
+
+        let conflicts = parse_conflict_file(conflict_file.to_str().unwrap()).unwrap();
+        assert_eq!(conflicts.len(), 1);
+        assert!(conflicts[0].ours_content.contains("ours"));
+        assert!(conflicts[0].theirs_content.contains("theirs"));
+        assert!(conflicts[0].base_content.is_none());
+    }
+
+    #[test]
+    fn test_parse_conflict_markers_diff3() {
+        let dir = TempDir::new().unwrap();
+        let conflict_file = dir.path().join("conflict.c");
+        // diff3 style with base content
+        let content = r#"int main() {
+<<<<<<< HEAD
+    printf("ours");
+||||||| base
+    printf("base");
+=======
+    printf("theirs");
+>>>>>>> feature
+    return 0;
+}
+"#;
+        fs::write(&conflict_file, content).unwrap();
+
+        let conflicts = parse_conflict_file(conflict_file.to_str().unwrap()).unwrap();
+        assert_eq!(conflicts.len(), 1);
+        assert!(conflicts[0].ours_content.contains("ours"));
+        assert!(conflicts[0].theirs_content.contains("theirs"));
+        assert!(conflicts[0].base_content.as_ref().unwrap().contains("base"));
+    }
+
+    #[test]
+    fn test_parse_multiple_conflicts() {
+        let dir = TempDir::new().unwrap();
+        let conflict_file = dir.path().join("conflict.c");
+        let content = r#"<<<<<<< HEAD
+first ours
+=======
+first theirs
+>>>>>>> feature
+middle
+<<<<<<< HEAD
+second ours
+=======
+second theirs
+>>>>>>> feature
+"#;
+        fs::write(&conflict_file, content).unwrap();
+
+        let conflicts = parse_conflict_file(conflict_file.to_str().unwrap()).unwrap();
+        assert_eq!(conflicts.len(), 2);
+        assert!(conflicts[0].ours_content.contains("first ours"));
+        assert!(conflicts[1].ours_content.contains("second ours"));
+    }
 }
-- 
2.51.0

