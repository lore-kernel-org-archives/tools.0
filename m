Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D754436D4FC
	for <tools@linux.kernel.org>; Fri, 19 Dec 2025 18:16:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766168198; cv=none; b=L5doluooj0SkwcP+nb8tlS/Bi6M8NeWhSb99FhjKqBAq3AIRqZlP8ocmI/ePigiLi1qFOfsatMB1N5stkQWoVa8FHOmWBDTYvIZXh1W9HseeV4z/+MWtnFoYOY+TSi93Knba1HMqPPFHYNeXnTf6gQruSW9c410ZFubXe11MUt0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766168198; c=relaxed/simple;
	bh=hcNhg0u25/EPduVe+yXKj4bUmFVkwgt0UcSPBFb2SOI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=e/XaUFI1QqpWhJD5I/Iqhptz3pGzJhOZwLjktJA/lkXQcJ+fdgCVuvuTuCscJ63jHeV62ZhBLkcTxedmYiqURqs/IQRHNxUbNb2Amfh2rPs2p9Zgu1ogfz9AKXO2h9VH0iitMW0ons7wK/+wOvdf/bFLtSsTaP+qPKXWnm1u6PA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LSyt1bJt; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LSyt1bJt"
Received: by smtp.kernel.org (Postfix)
	id 98278C4AF0B; Fri, 19 Dec 2025 18:16:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EB518C19421;
	Fri, 19 Dec 2025 18:16:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1766168198;
	bh=hcNhg0u25/EPduVe+yXKj4bUmFVkwgt0UcSPBFb2SOI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=LSyt1bJtJK3ewDK4J55Rbc9ekK2Um4MZngwPsbkA18qPR3v+EVBtrSk1/wTDBd6ro
	 OeIPte5PHTviWGBqiMycaat/Gr0vYLM6sUgEvgS/nRN4VJuKaDJjmjtFktGI50VRT5
	 CVzoH+D9RlhhA2lbvXTssQnnzEC3ZweH7gHqyipnzbOjrQegpaZQQCWJJqW9e6MELE
	 1oLp6xuaDPSTgW3jl1Dn+88qv84cYGCC0yIaUvEcnRtrM/aBfEgXMgiJ0cjILXZclx
	 69IOEqco/BBlhLeKWk5ufBqcKbaeV6irro4IzUuh69BWihJQIIJeTizujpO38cSH56
	 hpzH01B6dwU0g==
From: Sasha Levin <sashal@kernel.org>
To: tools@kernel.org
Cc: linux-kernel@vger.kernel.org,
	torvalds@linux-foundation.org,
	broonie@kernel.org,
	Sasha Levin <sashal@kernel.org>
Subject: [RFC 2/5] LLMinus: Add vectorize command with fastembed
Date: Fri, 19 Dec 2025 13:16:26 -0500
Message-ID: <20251219181629.1123823-3-sashal@kernel.org>
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

Add the 'vectorize' command that generates embeddings for stored
conflict resolutions using the BGE-small-en-v1.5 model via fastembed.

Key features:
- Uses fastembed v5 for local embedding generation
- BGE-small model produces 384-dimensional vectors
- Batch processing with configurable batch size (-b flag)
- Incremental saves after each batch for crash recovery
- Skips resolutions that already have embeddings
- Progress reporting during vectorization

This enables RAG-based similarity search for finding historical
conflict resolutions that are similar to current merge conflicts.

Also adds:
- cosine_similarity() function for vector comparison
- init_embedding_model() helper for model initialization
- Tests for vectorize command parsing and cosine_similarity

Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 tools/llminus/Cargo.toml  |   1 +
 tools/llminus/src/main.rs | 157 ++++++++++++++++++++++++++++++++++++++
 2 files changed, 158 insertions(+)

diff --git a/tools/llminus/Cargo.toml b/tools/llminus/Cargo.toml
index bdb42561a0565..86740174de598 100644
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
index 1c61836cc93f7..32a578030b0e3 100644
--- a/tools/llminus/src/main.rs
+++ b/tools/llminus/src/main.rs
@@ -2,6 +2,7 @@
 
 use anyhow::{bail, Context, Result};
 use clap::{Parser, Subcommand};
+use fastembed::{EmbeddingModel, InitOptions, TextEmbedding};
 use rayon::prelude::*;
 use serde::{Deserialize, Serialize};
 use std::collections::HashSet;
@@ -26,6 +27,12 @@ enum Commands {
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
@@ -483,11 +490,118 @@ fn learn(range: Option<&str>) -> Result<()> {
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
+    let total_batches = (need_embedding.len() + batch_size - 1) / batch_size;
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
 
@@ -508,6 +622,7 @@ fn test_learn_command_parses() {
         let cli = Cli::try_parse_from(["llminus", "learn"]).unwrap();
         match cli.command {
             Commands::Learn { range } => assert!(range.is_none()),
+            _ => panic!("Expected Learn command"),
         }
     }
 
@@ -516,9 +631,51 @@ fn test_learn_command_with_range() {
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

