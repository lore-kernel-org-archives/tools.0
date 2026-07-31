Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DC243ACA45
	for <tools@linux.kernel.org>; Fri, 31 Jul 2026 09:21:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785489696; cv=none; b=koh4h+KfDpwA/b5Ec1wOrnsqAT5IQpzN5Ya8O+IqWFhSIBIa3kdnlJVx0xobC4wf79xqkavuNF8S05kI71G3J3u+t5y5Q69PMg7E48/E0cH6pYKaHgIpOBN5uFHlvZedJG5uoz57khT4/30O8JXWLCSK3LjnUNyBh1ORRy79aL0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785489696; c=relaxed/simple;
	bh=oeULdeKXCkUu4/JYqyizzTImVp1UcjtLltFBGJj8950=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Ik0sk4vsVYgliEXvOcIeHSFB2esngDEOIB7dfXBGg7D+Hq1G5TGiRsTdZLqisEUPcKJQDSpsgmdJtG3tVAJmbLxFXOxV3HyTq2Umf6x/J5bkC6KGd828Jlk6+E8WeLqaj2N/+ffESB++8SFDv6pZSfQC0YfX9dAw/IMFbgr5gDg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gHE8qVgp; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gHE8qVgp"
Received: by smtp.kernel.org (Postfix)
	id E9B9F1F00A3D; Fri, 31 Jul 2026 09:21:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 24D851F000E9;
	Fri, 31 Jul 2026 09:21:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785489694;
	bh=zq5Kt/c0rt9Snfj93uGYS4xa2aEvyBfoXpYWQPuZPYA=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=gHE8qVgpDxfvLDPZ1k1/3+av6AmZ3EynVSwTd/5xZTGw5gj6JN/kkQPTEgeJzofVV
	 IvFfZz3DTXIJs1tJYhdB2Dcz3upwMWU6y3xqyaKaw3k7gGfsv8ydB0HLCJ/u7fPigT
	 5ecqoPwaJhLBaWYTmJ0QG+eZTooEZGvn5AOOntnjfexEKH9QBiU8B+Ts/t+zdY9oGs
	 l3RjeHohWOn461aBNPI2G65+4/PwFLw1PL86C0Ek3dOvrDL58bv+3AJyogE7jGeUiW
	 ekGO48h4NwEyZtUg3IpdfQ+jNuR6fJD2FaN9xXD2VfBJBf2ZleUFW/6Jmn8IHCTIUR
	 r5R9Y5zNCBr9w==
From: Christian Brauner <brauner@kernel.org>
Date: Fri, 31 Jul 2026 11:21:05 +0200
Subject: [PATCH b4 06/27] review: don't let archiving a series raise
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260731-work-b4-editor-branch-guard-v1-6-de68a7c8e4cb@kernel.org>
References: <20260731-work-b4-editor-branch-guard-v1-0-de68a7c8e4cb@kernel.org>
In-Reply-To: <20260731-work-b4-editor-branch-guard-v1-0-de68a7c8e4cb@kernel.org>
To: "Kernel.org Tools" <tools@kernel.org>
Cc: "Christian Brauner (Amutable)" <brauner@kernel.org>, 
 Konstantin Ryabitsev <konstantin@linuxfoundation.org>
X-Mailer: b4 0.16-dev-af865
X-Developer-Signature: v=1; a=openpgp-sha256; l=5710; i=brauner@kernel.org;
 h=from:subject:message-id; bh=oeULdeKXCkUu4/JYqyizzTImVp1UcjtLltFBGJj8950=;
 b=owGbwMvMwCU28Zj0gdSKO4sYT6slMWTlZIoytu921vs/RTaPWfAtx07Vn3/fzuqSa/7LUHlQx
 Zv7rC9bRykLgxgXg6yYIotDu0m43HKeis1GmRowc1iZQIYwcHEKwEQ6SxgZdst0TdGY1DT56oH3
 yz7Ofy16dIm4Rx1Ta19Pc5T0Qc8zDxj+xy3vs20pvMMpeaQ1ye/hh2TNaw+mWzUYSy5lm7E2M3w
 PCwA=
X-Developer-Key: i=brauner@kernel.org; a=openpgp;
 fpr=4880B8C9BD0E5106FC070F4F7B3C391EFEA93624

archive_series() builds a tarball and writes it into the data directory
without guarding any of it, so ENOSPC, a permission problem or a missing
object comes back to the caller as an exception.

Both callers archive a series that has just been thanked, the tracking
UI right after the SMTP handoff and queue delivery right after the
message goes out. The mail is gone by then. An exception unwinding
through the send path is reported as a failure to send, which tells the
maintainer to send a note that is already on the list, or it escapes the
screen callback and takes the rest of the TUI session with it.

Report the write failure as (False, detail) like every other failure
here. Nothing has been destroyed at that point so the archive can be
retried. Do the same for the Patchwork update, except that it comes
last. The local archive is done and can't be retried, so a Patchwork
hiccup is a warning and not a failed archive.

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

