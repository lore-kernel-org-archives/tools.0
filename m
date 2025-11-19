Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DD0D31196D
	for <tools@linux.kernel.org>; Wed, 19 Nov 2025 19:52:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763581976; cv=none; b=EUjMYP6l5zNQeQCfyWU3xdbpQcIRfTwig5UQJVYIM1VigmD2wIxtxsMv6Xu4UEH3oAGI1P2fskEbHSEDnEE/11xZROEJQuz/2lIaIiEsAntOmpsAly20QVQW9/R9fPk97EQn/ltD879y+LOf1OUKq7go5v2XVfEM7b6Q0guATcw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763581976; c=relaxed/simple;
	bh=IQd701RpvC52COk/Y/hVhcOjs4TXa2HA7nbs3w8hDLg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=JEUQLOvARhWAT79eXbiBt23h5dRtA1oHbFjoKM2c4Vy9y0C8gLX/Lk1iL2WuUHLATbh0EJtUlmoTnm6PRd6ArgktzYyyj7n+29Ys/DUqBrTgDcY3Shkeo3Nn96U0Oex7WUByBExwllRVVm0zHYvFNZ5041rqJRA3UCvUANNQlEI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fSEiklVT; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fSEiklVT"
Received: by smtp.kernel.org (Postfix)
	id E9118C116D0; Wed, 19 Nov 2025 19:52:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id D2F42C4CEF5;
	Wed, 19 Nov 2025 19:52:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763581975;
	bh=IQd701RpvC52COk/Y/hVhcOjs4TXa2HA7nbs3w8hDLg=;
	h=From:Date:Subject:To:Cc:Reply-To:From;
	b=fSEiklVTgEGzhccQSBrWuI6YfXkepP/7tY9UMnzd9YJy4WmRml3qMi1Bfizj+gBWk
	 xjfYzPHCt1dkmZgwpz0Iaik5YNL/7aHoDYRReHJcPG/Mf/wcW7tklI5Wk7t/g9mYp8
	 Kdq9E8x69pV5X1z9388BEz4KO5V/dsH46vgHq49SelYKB5DDVDMH2RjtbA8XCuJzAH
	 Io5xLC4zsjDstX3iei9/Fsfy6eTxM5s56SzGBEJSxNupxPf6WcCTdqwKwWYFImAnKB
	 uw+LCY0I4B+KGVCuvc/ZXOawTrz3XwZxhN+hgnd3eqakg8Mne210hfUMxfB8JX6lzB
	 PvWHC72AtrSpQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BFCB4CF34C5;
	Wed, 19 Nov 2025 19:52:55 +0000 (UTC)
From: Dave Marquardt via B4 Relay <devnull+davemarq.linux.ibm.com@kernel.org>
Date: Wed, 19 Nov 2025 13:52:50 -0600
Subject: [PATCH b4 v3] b4: Create temporary directory in git top level if
 available
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251119-edit-in-toplevel-v3-1-64d5e721cb68@linux.ibm.com>
X-B4-Tracking: v=1; b=H4sIABEgHmkC/03Myw6CMBCF4Vchs3ZIS5GLK9/DuKB0KpMAbUpFE
 sK7W3Xj8j/J+XZYKDAtcMl2CLTywm5OoU4Z9EM3PwjZpIZCFGcpZYtkOCLPGJ0faaURZSVUY3W
 tW1FAuvlAlrcveQNdwj1tNrgJ4xCo+8eaH/biOGCcPFoe6UMH8g7XAiUKXSmly1oao68jz88tZ
 z3lvZvgON61nfoOvAAAAA==
X-Change-ID: 20251119-edit-in-toplevel-16038fb7b902
To: "Kernel.org Tools" <tools@kernel.org>
Cc: Konstantin Ryabitsev <konstantin@linuxfoundation.org>, 
 Dave Marquardt <davemarq@linux.ibm.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1763581975; l=1951;
 i=davemarq@linux.ibm.com; s=20250630; h=from:subject:message-id;
 bh=bSTxcT4B+aPnrs65Y4+8q6nKNnftTzdPl09UGhq/1nA=;
 b=vADLNV2CmUhwsr6JZQdoGV5Jk0hM1Azs/5vPSxuJSGbcNHGfzD3gIueDhtTpNijFQQD7eQWOC
 cxcMRnI3EOoB7QQnNAy8XfAvXWDWpL98g65diQ6UwJAdrz3eRCyVpNy
X-Developer-Key: i=davemarq@linux.ibm.com; a=ed25519;
 pk=eCwwhqOykPrqNNTH1uSGAhXUfNQI0Zlz7hb8uGTjPVU=
X-Endpoint-Received: by B4 Relay for davemarq@linux.ibm.com/20250630 with
 auth_id=447
X-Original-From: Dave Marquardt <davemarq@linux.ibm.com>
Reply-To: davemarq@linux.ibm.com

From: Dave Marquardt <davemarq@linux.ibm.com>

In edit_with_editor, prefer to use the git top level if it exists when
creating the temporary directory. Otherwise let
tempfile.TemporaryDirectory use its default directory. This avoids
issues with Emacs and Magit, which insists COMMIT_EDITMSG must be in
the repo's directory tree.

---
In edit_with_editor, create temporary directory in toplevel if git top
level exists. Otherwise let tempfile.TemporaryDirectory use its
default directory. This avoids issues with Emacs and Magit, which
insists COMMIT_EDITMSG must be in the repo's directory tree.

Changes in v3:
- Create temporary directory in git top level to avoid problems when
  using a git worktree, where <toplevel>/.git is a regular file.

Signed-off-by: Dave Marquardt <davemarq@linux.ibm.com>
---
 src/b4/__init__.py | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/src/b4/__init__.py b/src/b4/__init__.py
index ba76e83..3d774f7 100644
--- a/src/b4/__init__.py
+++ b/src/b4/__init__.py
@@ -4588,8 +4588,14 @@ def edit_in_editor(bdata: bytes, filehint: str = 'COMMIT_EDITMSG') -> bytes:
     corecfg = get_config_from_git(r'core\..*', {'editor': os.environ.get('EDITOR', 'vi')})
     editor = corecfg.get('editor')
     logger.debug('editor=%s', editor)
+
+    topdir = git_get_toplevel()
+    if topdir is not None:
+        p = Path(topdir)
+    else:
+        p = None
     # Use filehint name in hopes that editors autoload necessary highlight rules
-    with tempfile.TemporaryDirectory(prefix='b4-editor') as temp_dir:
+    with tempfile.TemporaryDirectory(prefix='.b4-editor', dir=p) as temp_dir:
         temp_fpath = os.path.join(temp_dir, filehint)
         with open(temp_fpath, 'xb') as edit_file:
             edit_file.write(bdata)

---
base-commit: a3fc8d38721c9278819fd3b61f96de53d6eb823a
change-id: 20251119-edit-in-toplevel-16038fb7b902

Best regards,
--  
Dave Marquardt <davemarq@linux.ibm.com>


