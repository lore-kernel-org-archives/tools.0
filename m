Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92551370AFD
	for <tools@linux.kernel.org>; Fri, 31 Jul 2026 21:59:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785535142; cv=none; b=lVdKmjl/pQHfm5eQh9wh1wESr1nASYOGMe8jSz85H3mz/5rhkvm/7Kfj+Rxh4bvo4+s5qRL/E18bguvAnozFvitnKkjcweyODOYV2TNXRIo77eD6OdvAvzw2Zz7zLsCNR97UWoAzAWLUoCBlOEZoBZR9B3wJ906gCzghlKA6faw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785535142; c=relaxed/simple;
	bh=1EWDu/6CD0pbRb+b8JI5E2aC4MJSitvRJgtl/sz7bgM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=uRTK43xfWqTLbiT96fhRzwvVlW7Ao7Y7TMjjjLTl8FrdJh0iGUXyHjh4tiyPtD8daqBPIUPXmVirEozjFA/UPxo9UMo3jhYIO0i2TxXdBAdbrNAgSr9ekvFYkSClgBxeZ1a/jJ3BeO6o256W8TmZ4LtRVjTB0kY9t6G20pvJg2k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZH3bd51f; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZH3bd51f"
Received: by smtp.kernel.org (Postfix)
	id 910951F00ACF; Fri, 31 Jul 2026 21:59:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C0D761F00AC4;
	Fri, 31 Jul 2026 21:59:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785535141;
	bh=JvjR4N/hono8EdBo6C5bVD0HbFNvv0Gh3R9viobWEU0=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=ZH3bd51fLuropLSG8cwM4iMM9kwDDGKpHCjTKBh4FmwdfcA+Is3b6Rc4ouQzm7Jcd
	 OUBx6m13auUhnyj7bIrSs1PLGh7dUbs/Q7YSYWBkavveQuMrA9tIR2ccRL5/AAdXBx
	 NqH6OfmpjmxPHSlzLZRJUpJ+iBBDBAu4iWAkMhgIyL4+2X7YPNiZo/aXq+bhGqErak
	 /wuYXA7nCTJwgJRs6dW4+O5xOIV0oWiz1tgJQ7ItfU6PI+hDMLFxCKCIuug5vs6T7Z
	 vSR2+3Cy8ukvL+SBOAJGHQzvxI2PYLO5EySbvGe6FMyK25nDOjSNC4wn0BvQ/K1WX5
	 Vu2FW4rywIO0g==
From: Christian Brauner <brauner@kernel.org>
Date: Fri, 31 Jul 2026 23:58:47 +0200
Subject: [PATCH b4 v2 06/44] review: don't let archiving a series raise
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260731-work-b4-editor-branch-guard-v2-6-243fd19d322d@kernel.org>
References: <20260731-work-b4-editor-branch-guard-v2-0-243fd19d322d@kernel.org>
In-Reply-To: <20260731-work-b4-editor-branch-guard-v2-0-243fd19d322d@kernel.org>
To: "Kernel.org Tools" <tools@kernel.org>
Cc: "Christian Brauner (Amutable)" <brauner@kernel.org>, 
 Konstantin Ryabitsev <konstantin@linuxfoundation.org>
X-Mailer: b4 0.16-dev-af865
X-Developer-Signature: v=1; a=openpgp-sha256; l=5097; i=brauner@kernel.org;
 h=from:subject:message-id; bh=1EWDu/6CD0pbRb+b8JI5E2aC4MJSitvRJgtl/sz7bgM=;
 b=owGbwMvMwCU28Zj0gdSKO4sYT6slMWTlSs2qnv3tQkNTe0TaDemqNf2z+eWnnJjq17kwXrzhl
 5jXq9mPOkpZGMS4GGTFFFkc2k3C5ZbzVGw2ytSAmcPKBDKEgYtTACay7Scjw8vovaLdIYuuzfP4
 ncA336fMpXb986PKdnJ159jvTOUy6WD4K9g2TX7dppUFQnp/NBYliLBXZdif3rXo1LTnoUd1tqo
 p8gMA
X-Developer-Key: i=brauner@kernel.org; a=openpgp;
 fpr=4880B8C9BD0E5106FC070F4F7B3C391EFEA93624

archive_series() writes the tarball unguarded, so a write failure
raises into the send path after the mail is already out. Return
(False, detail) like the other failures here; nothing is destroyed at
that point, so the archive can be retried. A Patchwork failure after
the archive is written is a warning, not a failed archive.

Signed-off-by: Christian Brauner (Amutable) <brauner@kernel.org>
---
 src/b4/review/_review.py | 70 ++++++++++++++++++++++++++++--------------------
 1 file changed, 41 insertions(+), 29 deletions(-)

diff --git a/src/b4/review/_review.py b/src/b4/review/_review.py
index da20fc4..4c67387 100644
--- a/src/b4/review/_review.py
+++ b/src/b4/review/_review.py
@@ -809,6 +809,8 @@ def archive_series(
 
     Returns (success, detail): detail is the archive tarball path on
     success (empty for a database-only archive), or an error message.
+    Never raises: callers archive *after* a thank-you has gone out, and a
+    failure here must not be mistaken for a failure to deliver it.
     """
     # Imported here: the tarball machinery is only needed when archiving.
     # b4.review.tracking is re-imported alongside b4.ez because a local
@@ -833,36 +835,40 @@ def archive_series(
         if not first_patch:
             return False, 'No patch commits found in tracking data'
 
-        tio = io.BytesIO()
-        mnow = int(time.time())
-        with tarfile.open(fileobj=tio, mode='w:gz') as tfh:
-            # Add cover letter
-            ifh = io.BytesIO()
-            ifh.write(cover_text.encode())
-            b4.ez.write_to_tar(tfh, f'{change_id}/cover.txt', mnow, ifh)
-            ifh.close()
-            # Add tracking metadata
-            ifh = io.BytesIO()
-            ifh.write(make_review_magic_json(tracking).encode())
-            b4.ez.write_to_tar(tfh, f'{change_id}/tracking.js', mnow, ifh)
-            ifh.close()
-            # Add patches as mbox
-            patches = b4.git_range_to_patches(
-                topdir, f'{first_patch}~1', f'{review_branch}~1'
-            )
-            if patches:
+        try:
+            tio = io.BytesIO()
+            mnow = int(time.time())
+            with tarfile.open(fileobj=tio, mode='w:gz') as tfh:
+                # Add cover letter
                 ifh = io.BytesIO()
-                b4.save_git_am_mbox([patch[1] for patch in patches], ifh)
-                b4.ez.write_to_tar(tfh, f'{change_id}/patches.mbx', mnow, ifh)
+                ifh.write(cover_text.encode())
+                b4.ez.write_to_tar(tfh, f'{change_id}/cover.txt', mnow, ifh)
                 ifh.close()
+                # Add tracking metadata
+                ifh = io.BytesIO()
+                ifh.write(make_review_magic_json(tracking).encode())
+                b4.ez.write_to_tar(tfh, f'{change_id}/tracking.js', mnow, ifh)
+                ifh.close()
+                # Add patches as mbox
+                patches = b4.git_range_to_patches(
+                    topdir, f'{first_patch}~1', f'{review_branch}~1'
+                )
+                if patches:
+                    ifh = io.BytesIO()
+                    b4.save_git_am_mbox([patch[1] for patch in patches], ifh)
+                    b4.ez.write_to_tar(tfh, f'{change_id}/patches.mbx', mnow, ifh)
+                    ifh.close()
 
-        # Write archive to data directory
-        datadir = b4.get_data_dir()
-        archpath = os.path.join(datadir, 'review-archived')
-        os.makedirs(archpath, exist_ok=True)
-        tarpath = os.path.join(archpath, f'{change_id}.tar.gz')
-        with open(tarpath, mode='wb') as tout:
-            tout.write(tio.getvalue())
+            # Write archive to data directory
+            datadir = b4.get_data_dir()
+            archpath = os.path.join(datadir, 'review-archived')
+            os.makedirs(archpath, exist_ok=True)
+            tarpath = os.path.join(archpath, f'{change_id}.tar.gz')
+            with open(tarpath, mode='wb') as tout:
+                tout.write(tio.getvalue())
+        except Exception as ex:
+            # The branch is still intact, so this is safe to retry
+            return False, f'Could not write archive for {change_id}: {ex}'
 
         ok, err = delete_review_branch(topdir, review_branch, allow_switch=allow_switch)
         if not ok:
@@ -878,9 +884,15 @@ def archive_series(
     except Exception as ex:
         return False, f'DB error: {ex}'
 
-    # Mark as archived in Patchwork
+    # Mark as archived in Patchwork.  The local archive is already done and
+    # cannot be retried, so a Patchwork hiccup is a warning, not a failure.
     if pw_series_id:
-        pw_update_series_state(pw_series_id, 'accepted', archived=True)
+        try:
+            pw_update_series_state(pw_series_id, 'accepted', archived=True)
+        except Exception as ex:
+            logger.warning(
+                'Could not archive series %s in Patchwork: %s', change_id, ex
+            )
 
     return True, tarpath
 

-- 
2.53.0

