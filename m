Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2D6C1E9B16
	for <tools@linux.kernel.org>; Wed,  8 Jan 2025 23:12:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736377924; cv=none; b=dgV6D1UVK+VKfevbZgomxDHDXXarCmSBS7bMRySfYa69jomO4770Kv20hmRAIhz7LSb+EAGRe7SH55NTq9TgIRBmV5aGsWDvNNI7Rs3W6xH65BAM7dgoUf6QMVRaC7RT31sQwPkqpzpa9bt+PcP2Gqj1hSzVcPQ4F22Jd3qrdRA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736377924; c=relaxed/simple;
	bh=NHFC+9BXLK7LTaWYwCNRiqt5Ydf/pUKtBXo30EFaJqE=;
	h=From:To:Subject:Date:Message-ID:MIME-Version; b=g9+LkxllFpssU75mgzCcYFkUQLwQ7Z031PioTyZHzK63vlmBzyq/EcqnjWjUuKVfngSa/c57O98f6siaQ27HKXxXORtXPCs6IBxo5dUGlf44hc9O6igiE9aqglt9hM8bcKZPs7zhOxyO0Yg1WbcKtBSAvEGus2v7h8GAoq7dG5E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=oSWl/9Bo; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="oSWl/9Bo"
Received: by smtp.kernel.org (Postfix)
	id 83118C4CED3; Wed,  8 Jan 2025 23:12:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 427F9C4CEDF;
	Wed,  8 Jan 2025 23:12:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736377924;
	bh=NHFC+9BXLK7LTaWYwCNRiqt5Ydf/pUKtBXo30EFaJqE=;
	h=From:To:Subject:Date:From;
	b=oSWl/9Bo7LNzRknD4We6xpYUQRUvar3LhDoNwJz4huSb2CzHEi3VbF+57eiR8k9Wo
	 QTTVFBobs8EjyZRvq/ColoUR7eW1njFvDzY5FDwQdhqgww6EuCO/dRasmXBAevqb4J
	 HlS0qysqMFChYkwZAitjlpbU58sz6lV1HkgGkRtmY9XgTsiDb06XqEqDcuM6zrmU9c
	 xJdKHZDRlCzfLXjBx5073aRa9Su6bbcenKIj5T1TMBP+vHa4g3gELo050aesKLOQnq
	 K97t4MPxvxpw66MuaH8Tzk7wO0sp7q8K+q7H4Jz66T6z70KLxewyPncSrZu393/O9V
	 PQvmS5ZkpLw/A==
From: "Rob Herring (Arm)" <robh@kernel.org>
To: tools@kernel.org
Subject: [PATCH 1/2] Limit --guess-branch argument to 1 branch
Date: Wed,  8 Jan 2025 17:12:02 -0600
Message-ID: <20250108231203.1209721-1-robh@kernel.org>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

More than 1 branch argument doesn't work correctly, so restrict it to 1
arg. The help text already implies it is a single branch.

Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
---
 src/b4/command.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/src/b4/command.py b/src/b4/command.py
index 5d90b4f52b4f..e31ee052c9cd 100644
--- a/src/b4/command.py
+++ b/src/b4/command.py
@@ -184,7 +184,7 @@ def setup_parser() -> argparse.ArgumentParser:
                        help='Save patches in a quilt-ready folder')
     sp_am.add_argument('-g', '--guess-base', dest='guessbase', action='store_true', default=False,
                        help='Try to guess the base of the series (if not specified)')
-    sp_am.add_argument('-b', '--guess-branch', dest='guessbranch', nargs='+', action='extend', type=str, default=None,
+    sp_am.add_argument('-b', '--guess-branch', dest='guessbranch', nargs=1, action='extend', type=str, default=None,
                        help='When guessing base, restrict to this branch (use with -g)')
     sp_am.add_argument('--guess-lookback', dest='guessdays', type=int, default=21,
                        help='When guessing base, go back this many days from the patch date (default: 2 weeks)')
-- 
2.45.2

