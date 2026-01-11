Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15C4F28980F
	for <tools@linux.kernel.org>; Sun, 11 Jan 2026 21:29:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768166960; cv=none; b=mjaZ7h7q59f/cYFE2i549iAZLwz0weyVoOiZFvAgPtaGgBgTe0SfzlkP2HaQBwxg7mTBegxUaPXQrbLtwE0RPUrxug+AbOueQ02hwggw+cAyQRV3n+tpl//MlnRmHcLu9tCnGlqrb9omqjFqSnP1FtBKfscQhbtGB+5SGAmF3w4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768166960; c=relaxed/simple;
	bh=rB9ge6/sTvQ0rqdXrCN2IZzyFDW2qz+HFsSCmyubcyY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=iV0vSPqudY5zwqc/IZiegYFNsqMinHu3vvsbb0nXBj9tNt/O7XIO11fmyUfr8wtc1TNdmpKoq575OrZTp7tIEV35SXm8VyjdmWeUE4Jk46SN2xY8Pf6oyBqLwR+NG/w0riEu/M/7slPbe7jv1dbdqV8eKmRsygdpWiTHrbpufWc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=riE0PQip; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="riE0PQip"
Received: by smtp.kernel.org (Postfix)
	id 069C7C19423; Sun, 11 Jan 2026 21:29:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 590CDC4CEF7;
	Sun, 11 Jan 2026 21:29:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768166959;
	bh=rB9ge6/sTvQ0rqdXrCN2IZzyFDW2qz+HFsSCmyubcyY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=riE0PQipZiuNr8AlQf1TUzhdp4I3+eRp7RDtAKQ4SYyUSKiZtw3zcT/WJ2oUHbYTG
	 3Xw2BZwT445HPXsW5eNLutXFaPmTYWBDcc6Mxk8wv1Q+PaonnBpMjv4OorrxWsdbWl
	 rU5dZx3E85/vFlbNKcUsY+UvQogaqR3WfB5zK/o7AT6ER4T3Q2QdswuD+/BzC+E2m5
	 oVCv1CfKXy2kWGVuM/b44DlD46CewMEH6BEdS29hK2BtYqKwdhNOPtyqwGCf/BLQkq
	 kugruM7zI+TYibidw82w+qw9eLE/BAUQHUhpVvyVO38pjauhQfk2+j1HpP8Um2Coo9
	 meqjNs9duguPg==
From: Sasha Levin <sashal@kernel.org>
To: tools@kernel.org
Cc: linux-kernel@vger.kernel.org,
	torvalds@linux-foundation.org,
	broonie@kernel.org,
	Sasha Levin <sashal@kernel.org>
Subject: [RFC v2 2/7] LLMinus: Add vectorize command with fastembed
Date: Sun, 11 Jan 2026 16:29:10 -0500
Message-ID: <20260111212915.195056-3-sashal@kernel.org>
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

Add the vectorize command that generates embeddings for stored conflict
resolutions using the BGE-small-en-v1.5 model via fastembed. The model
produces 384-dimensional vectors. Processing is batched with incremental
saves after each batch for crash recovery. Resolutions with existing
embeddings are skipped.

This enables RAG-based similarity search for finding historical conflict
resolutions similar to current merge conflicts. Also adds cosine_similarity()
and init_embedding_model() helpers with corresponding tests.

Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 tools/llminus/Cargo.toml  |   1 +
 tools/llminus/src/main.rs | 157 ++++++++++++++++++++++++++++++++++++++
 2 files changed, 158 insertions(+)

diff --git a/tools/llminus/Cargo.toml b/tools/llminus/Cargo.toml
index bdb42561a056..86740174de59 100644
--- a/tools/llminus/Cargo.toml
+++ b/tools/llminus/Cargo.toml
@@ -10,6 +10,7 @@ repository = "https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
 [dependencies]
 anyhow = "1"
 clap = { version = "4", features = ["derive"] }
+fastembed = "5"
 rayon = "1"
 serde = { version = "1", features = ["derive"] }
 serde_json = "1"
diff --git a/tools/llminus/src/main.rs b/tools/llminus/src/main.rs
index 508bdc085173..b97505d0cd99 100644
--- a/tools/llminus/src/main.rs
+++ b/tools/llminus/src/main.rs
@@ -2,6 +2,7 @@
 
 use anyhow::{bail, Context, Result};
 use clap::{Parser, Subcommand};
+use fastembed::{EmbeddingModel, InitOptions, TextEmbedding};
 use rayon::prelude::*;
 use serde::{Deserialize, Serialize};
 use std::collections::HashSet;
@@ -28,6 +29,12 @@ enum Commands {
         /// Git revision range (e.g., "v6.0..v6.1"). If not specified, learns from entire history.
         range: Option<String>,
     },
+    /// Generate embeddings for stored resolutions (for RAG similarity search)
+    Vectorize {
+        /// Batch size for embedding generation (default: 64)
+        #[arg(short, long, default_value = "64")]
+        batch_size: usize,
+    },
 }
 
 /// A single diff hunk representing a change region
@@ -588,11 +595,118 @@ fn learn(range: Option<&str>) -> Result<()> {
     Ok(())
 }
 
+/// Compute cosine similarity between two vectors
+fn cosine_similarity(a: &[f32], b: &[f32]) -> f32 {
+    if a.len() != b.len() || a.is_empty() {
+        return 0.0;
+    }
+
+    let dot: f32 = a.iter().zip(b.iter()).map(|(x, y)| x * y).sum();
+    let norm_a: f32 = a.iter().map(|x| x * x).sum::<f32>().sqrt();
+    let norm_b: f32 = b.iter().map(|x| x * x).sum::<f32>().sqrt();
+
+    if norm_a == 0.0 || norm_b == 0.0 {
+        return 0.0;
+    }
+
+    dot / (norm_a * norm_b)
+}
+
+/// Initialize the BGE-small embedding model
+fn init_embedding_model() -> Result<TextEmbedding> {
+    TextEmbedding::try_new(
+        InitOptions::new(EmbeddingModel::BGESmallENV15)
+            .with_show_download_progress(true),
+    ).context("Failed to initialize embedding model")
+}
+
+fn vectorize(batch_size: usize) -> Result<()> {
+    let store_path = Path::new(STORE_PATH);
+
+    if !store_path.exists() {
+        bail!("No resolutions found. Run 'llminus learn' first.");
+    }
+
+    let mut store = ResolutionStore::load(store_path)?;
+
+    // Count how many need embeddings
+    let need_embedding: Vec<usize> = store
+        .resolutions
+        .iter()
+        .enumerate()
+        .filter(|(_, r)| r.embedding.is_none())
+        .map(|(i, _)| i)
+        .collect();
+
+    if need_embedding.is_empty() {
+        println!("All {} resolutions already have embeddings.", store.resolutions.len());
+        return Ok(());
+    }
+
+    println!("Found {} resolutions needing embeddings", need_embedding.len());
+    println!("Initializing embedding model (BGE-small-en, ~33MB download on first run)...");
+
+    // Initialize the embedding model
+    let mut model = init_embedding_model()?;
+
+    println!("Model loaded. Generating embeddings...\n");
+
+    // Process in batches
+    let total_batches = need_embedding.len().div_ceil(batch_size);
+
+    for (batch_num, chunk) in need_embedding.chunks(batch_size).enumerate() {
+        // Collect texts for this batch
+        let texts: Vec<String> = chunk
+            .iter()
+            .map(|&i| store.resolutions[i].to_embedding_text())
+            .collect();
+
+        // Generate embeddings
+        let embeddings = model
+            .embed(texts, None)
+            .context("Failed to generate embeddings")?;
+
+        // Assign embeddings back to resolutions
+        for (j, &idx) in chunk.iter().enumerate() {
+            store.resolutions[idx].embedding = Some(embeddings[j].clone());
+        }
+
+        // Progress report
+        let done = (batch_num + 1) * batch_size.min(chunk.len());
+        let pct = (done as f64 / need_embedding.len() as f64 * 100.0).min(100.0);
+        println!(
+            "  Batch {}/{}: {:.1}% ({}/{})",
+            batch_num + 1,
+            total_batches,
+            pct,
+            done.min(need_embedding.len()),
+            need_embedding.len()
+        );
+
+        // Save after each batch (incremental progress)
+        store.save(store_path)?;
+    }
+
+    // Final stats
+    let json_size = std::fs::metadata(store_path).map(|m| m.len()).unwrap_or(0);
+    let with_embeddings = store.resolutions.iter().filter(|r| r.embedding.is_some()).count();
+
+    println!("\nResults:");
+    println!("  Total resolutions: {}", store.resolutions.len());
+    println!("  With embeddings: {}", with_embeddings);
+    println!("  Embedding dimensions: 384");
+    println!("  Output size: {:.2} MB", json_size as f64 / 1024.0 / 1024.0);
+    println!("\nEmbeddings saved to: {}", store_path.display());
+
+    Ok(())
+}
+
 fn main() -> Result<()> {
     let cli = Cli::parse();
 
     match cli.command {
         Commands::Learn { range } => learn(range.as_deref()),
+        Commands::Vectorize { batch_size } => vectorize(batch_size),
     }
 }
 
@@ -613,6 +727,7 @@ fn test_learn_command_parses() {
         let cli = Cli::try_parse_from(["llminus", "learn"]).unwrap();
         match cli.command {
             Commands::Learn { range } => assert!(range.is_none()),
+            _ => panic!("Expected Learn command"),
         }
     }
 
@@ -621,9 +736,51 @@ fn test_learn_command_with_range() {
         let cli = Cli::try_parse_from(["llminus", "learn", "v6.0..v6.1"]).unwrap();
         match cli.command {
             Commands::Learn { range } => assert_eq!(range, Some("v6.0..v6.1".to_string())),
+            _ => panic!("Expected Learn command"),
         }
     }
 
+    #[test]
+    fn test_vectorize_command_parses() {
+        let cli = Cli::try_parse_from(["llminus", "vectorize"]).unwrap();
+        match cli.command {
+            Commands::Vectorize { batch_size } => assert_eq!(batch_size, 64),
+            _ => panic!("Expected Vectorize command"),
+        }
+    }
+
+    #[test]
+    fn test_vectorize_command_with_batch_size() {
+        let cli = Cli::try_parse_from(["llminus", "vectorize", "-b", "128"]).unwrap();
+        match cli.command {
+            Commands::Vectorize { batch_size } => assert_eq!(batch_size, 128),
+            _ => panic!("Expected Vectorize command"),
+        }
+    }
+
+    #[test]
+    fn test_cosine_similarity() {
+        // Identical vectors should have similarity 1.0
+        let a = vec![1.0, 0.0, 0.0];
+        let b = vec![1.0, 0.0, 0.0];
+        assert!((cosine_similarity(&a, &b) - 1.0).abs() < 0.0001);
+
+        // Orthogonal vectors should have similarity 0.0
+        let a = vec![1.0, 0.0, 0.0];
+        let b = vec![0.0, 1.0, 0.0];
+        assert!((cosine_similarity(&a, &b) - 0.0).abs() < 0.0001);
+
+        // Opposite vectors should have similarity -1.0
+        let a = vec![1.0, 0.0, 0.0];
+        let b = vec![-1.0, 0.0, 0.0];
+        assert!((cosine_similarity(&a, &b) - (-1.0)).abs() < 0.0001);
+
+        // Different length vectors return 0
+        let a = vec![1.0, 0.0];
+        let b = vec![1.0, 0.0, 0.0];
+        assert_eq!(cosine_similarity(&a, &b), 0.0);
+    }
+
     #[test]
     fn test_get_file_type() {
         assert_eq!(get_file_type("foo/bar.c"), "c");
-- 
2.51.0

