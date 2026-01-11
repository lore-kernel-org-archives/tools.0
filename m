Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 844F32853EE
	for <tools@linux.kernel.org>; Sun, 11 Jan 2026 21:29:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768166958; cv=none; b=X0TedNbH2UCRnrDrSbqToIQE1WTO5nSOHI58E8zBdrOQGmwRQqOzjBqzZJFlKPHbQbQshKjJpXqzTqH99ki7Yzi7s4298luw1edwcQHhhMpq1/gCs03ioNNx0x1KWct6tYCO0+MmDEU01LfFH/lgGfEe/GpKNNuMh8pClLEBkJo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768166958; c=relaxed/simple;
	bh=fQiMoT1P+yStlb6BHASaIIwXrtSAY1ByzM1qxGf6AoE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=HScKQTDYkeiDxVxeSrW/HwNxdHNnZkX9V7mLpJkpAo5mMhtvY0SaR1BAifsTw767Qe/7ZPE7nd7z1zuQvHReopLUdDmrriQct1DtYj63XlDxiG9tgB0/IxbmPurgqcFmaGgV42HwjRx8bFiFrnSk2pKKvAKiKqOdvaJiA1w8Qbw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mRaqk7pH; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mRaqk7pH"
Received: by smtp.kernel.org (Postfix)
	id 4B1D9C19422; Sun, 11 Jan 2026 21:29:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 92510C4CEF7;
	Sun, 11 Jan 2026 21:29:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768166958;
	bh=fQiMoT1P+yStlb6BHASaIIwXrtSAY1ByzM1qxGf6AoE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=mRaqk7pHtQtsV4zaGPGfQYuOznlusEITijgt3x6NXvdADOqjR1VuHfPwbDDknKMLX
	 klaA1jocpJxGleTuTF7NlePmTbjvHv+EU4RaI+FeVPIcJoVKSduX4h1FeryfkVEtee
	 nRvs207lZVy0Loi36/1sCHQr8E2B+ZPqvyBSfCTuKIAwVy6vSod8X5Hkx8OgjNiKq2
	 k6w4NuKzZ/tNYfYiPbcut1FSL+F+hxsSORqB30wAlxDnkIMqvxnHTa15XwKNYorjQR
	 VKeLUsy3NRABLWkCobXFqJsmaV2+ubVIwrH/FtN2r6PIp2e9inCeCBZiqWwaLfVIKF
	 8njC7VqfZFRYA==
From: Sasha Levin <sashal@kernel.org>
To: tools@kernel.org
Cc: linux-kernel@vger.kernel.org,
	torvalds@linux-foundation.org,
	broonie@kernel.org,
	Sasha Levin <sashal@kernel.org>
Subject: [RFC v2 0/7] LLMinus: LLM-Assisted Merge Conflict Resolution
Date: Sun, 11 Jan 2026 16:29:08 -0500
Message-ID: <20260111212915.195056-1-sashal@kernel.org>
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

This series introduces LLMinus, an LLM-powered tool for assisting with
git merge conflict resolution in the Linux kernel.

The tool builds a searchable database of historical conflict resolutions
from the kernel's git history, uses semantic embeddings to find similar
past conflicts, and constructs rich prompts for LLMs to resolve current
conflicts with appropriate context.

Commands:
  learn     - Extract historical conflict resolution cases from git history
  vectorize - Create semantic embeddings using fastembed (BGE-small model)
  find      - Perform similarity search on historical resolutions
  resolve   - LLM-assisted conflict resolution with contextual guidance
  pull      - Fetch pull requests from lore.kernel.org and auto-resolve

The tool works with any LLM that accepts stdin input, performing best
with models that support tool use for dynamic investigation.

Changes since RFC v1:
====================
- Add --max-tokens option (default: 100K) with adaptive RAG reduction
  to prevent prompt overflow errors across different LLM providers.
  When prompts exceed the token limit, historical examples are
  progressively removed until the prompt fits.

- Add semantic conflict detection via build test integration. When
  no textual conflicts exist but the merge may have introduced build
  failures, LLMinus runs the build and generates specialized prompts
  for the LLM to investigate and fix compile errors caused by
  incompatible changes from different branches.

- Update ureq HTTP client from v2 to v3.

Real-World Testing:
==================
LLMinus is being actively tested through automated subsystem integration
branches. These are available for anyone who wants to follow along or
help identify edge cases:

  https://git.kernel.org/pub/scm/linux/kernel/git/sashal/linux-next.git/

The repository contains ~40 subsystem-specific integration branches
(drivers-next, fs-next, net-next, etc.) that are merged into an all-next
integration branch. This exercises LLMinus on actual kernel merges from
maintainer trees.

Note that these branches are experimental and primarily serve to shake
out LLMinus itself. They are not intended to replace or compete with
existing integration workflows - rather, they provide a testing ground
for the tool. Build testing is performed after merges complete, and
trees are only recreated when upstream maintainers rebase.

Build:
  cd tools/llminus && cargo build --release

RFC v1: https://lore.kernel.org/all/20251219181629.1123823-1-sashal@kernel.org/

Sasha Levin (7):
  LLMinus: Add skeleton project with learn command
  LLMinus: Add vectorize command with fastembed
  LLMinus: Add find command for similarity search
  LLMinus: Add resolve command for LLM-assisted conflict resolution
  LLMinus: Add pull command for LLM-assisted kernel pull request merging
  LLMinus: Add prompt token limit enforcement
  LLMinus: Add build test integration for semantic conflicts

 tools/llminus/.gitignore  |    1 +
 tools/llminus/Cargo.toml  |   20 +
 tools/llminus/src/main.rs | 2678 +++++++++++++++++++++++++++++++++++++
 3 files changed, 2699 insertions(+)
 create mode 100644 tools/llminus/.gitignore
 create mode 100644 tools/llminus/Cargo.toml
 create mode 100644 tools/llminus/src/main.rs

-- 
2.51.0

