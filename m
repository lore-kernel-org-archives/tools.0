Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D73BA1FDE3D
	for <tools@linux.kernel.org>; Wed, 26 Mar 2025 15:37:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743003470; cv=none; b=MmX/X1oZ38MJl5uHzUOkd0SGap3jDp7RhLqWdS6uAReXSYdX4y4w0m2o0gEDgyxtEn4B7s2kEO+JJdESLigeW0YHwj/Ip2eLuocjCbQPgmhuVEIxSaeW+z0GJK26vtXhRfRyv96GXnYEUFH/WUKUwaY3zeax8mm0DadP/0kvvDU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743003470; c=relaxed/simple;
	bh=82hEfrTs/xOAm1aq9qDATHRFqpLUnT/G9RdTZg2jeVY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=Eg2TsJrPxkHnmXF0Ucwlr5gTN8os0HHNvKM/T9/6Pi0KNYA6hakQHAAiYTwXxwnapBYFYV/sa8odDiix6HPLVDF+alRLzSGAkz8uenEDxUf38E1iazHrToLIj1PqlOqztNqdusJsRNlLDJDkNueOKo5WClFTAyuGfg2nxFjIMFI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=mUby91Zz; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="mUby91Zz"
Received: by smtp.kernel.org (Postfix)
	id 629F5C4CEE8; Wed, 26 Mar 2025 15:37:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1D67EC4CEE9;
	Wed, 26 Mar 2025 15:37:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1743003469;
	bh=82hEfrTs/xOAm1aq9qDATHRFqpLUnT/G9RdTZg2jeVY=;
	h=From:Date:Subject:To:Cc:From;
	b=mUby91ZztDCHlwWGSK6ye3Peqm/9MmwIgZxL2rQZ8xDRTOORwbvGdkXV5N+n/LuW/
	 +6PY+w8/qLiR9hQ9iPI80gMUAHnXcXGEOPbDGFh7fS3UpHWaCm1gTf/yV3Tr5HeUXR
	 uOtAYKLiP7NIeqtExEGHYXpzjWFmw8A/Bczh/xCc=
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Date: Wed, 26 Mar 2025 11:37:15 -0400
Subject: [PATCH wotmate] Tweak trust path formatting for readability
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250326-trust-paths-improvements-v1-1-21c6db48a29f@linuxfoundation.org>
X-B4-Tracking: v=1; b=H4sIACof5GcC/y2N227CMBBEfyXyczeyncS5CFX8B+LBG9awAjup7
 aBWiH+vC30anZFmzkMkikxJTNVDRLpz4iUUUB+VmC82nAn4VFhoqTvZaAM5binDavMlAfs1Lnf
 yFHKC0XQ4jr1CpFaU+RrJ8ffr+nB8c6SvrRjyuxSeUrIvw1Tt/gWdllJpWStTolegYauvN+JAc
 F0o8HmP9ufGGKmeF//5J0KbCAp4zlPlWqNb08qTU3OjVEO90toNrvxhbwczI9pB4iiOz+cv4zN
 rbv0AAAA=
X-Change-ID: 20250326-trust-paths-improvements-965b9971bbe4
To: tools@kernel.org
Cc: =?utf-8?q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
X-Mailer: b4 0.15-dev-c25d1
X-Developer-Signature: v=1; a=openpgp-sha256; l=3229;
 i=konstantin@linuxfoundation.org; h=from:subject:message-id;
 bh=82hEfrTs/xOAm1aq9qDATHRFqpLUnT/G9RdTZg2jeVY=;
 b=owGbwMvMwCW27YjM47CUmTmMp9WSGNKfyPuIei/yn3/vmVLKvaK6ozm7uT3WVnoc5L4luog9s
 fOkEPPVjlIWBjEuBlkxRZayfbGbggofesil95jCzGFlAhnCwMUpABMxE2f4K30zeurMCVu2H7IV
 lzdv3dlyNXQhl9JsP2v7VefWa+9r2MTI0PXrjP4mHed1kzu2eWwKl56yWWHqHLfZVcIKyt4l6oI
 POAE=
X-Developer-Key: i=konstantin@linuxfoundation.org; a=openpgp;
 fpr=DE0E66E32F1FDD0902666B96E63EDCA9329DD07E

Tweak the trust paths output:

- Add a '# Trust paths' header to the paths section
- Show the depth of the signature
- Don't use '.' to represent the target (I'm the one who suggested it,
  but it doesn't make sense with these formatting changes)
- Only modify the key for trust path changes if it already has trust
  path info in it, to avoid having all keys change at once.

Signed-off-by: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
---
Cc: Uwe Kleine-König <u.kleine-koenig@baylibre.com>
---
 export-keyring.py | 22 +++++++++++++++++-----
 1 file changed, 17 insertions(+), 5 deletions(-)

diff --git a/export-keyring.py b/export-keyring.py
index 3e455f9..967e1ef 100755
--- a/export-keyring.py
+++ b/export-keyring.py
@@ -110,22 +110,34 @@ if __name__ == '__main__':
             logger.debug('Skipping %s due to invalid WoT', kid)
             continue
 
-        key_paths_repr = '\n'.join('\n `-> '.join(wotmate.get_uiddata_by_pubrow(c, rowid) if rowid != to_rowid else "." for rowid in kp) for kp in key_paths).encode('utf-8')
+        kpblock = ''
+        for kp in key_paths:
+            for lvl, rowid in enumerate(kp):
+                kpuid = wotmate.get_uiddata_by_pubrow(c, rowid)
+                kpblock += f'   {lvl}  {kpuid}' if lvl > 0 else f'from  {kpuid}'
+                kpblock += '\n'
+            kpblock += '\n'
+        key_paths_repr = kpblock.encode()
 
         # Do we already have a file in place?
         if os.path.exists(keyout):
             # Load it up and see if it's different
             with open(keyout, 'rb') as fin:
                 old_keyexport = fin.read()
-                if old_keyexport.find(keydata) > 0 and old_keyexport.find(key_paths_repr) > 0:
-                    logger.debug('No changes for %s', kid)
-                    continue
+                if keydata in old_keyexport:
+                    logger.debug('No key changes for %s', kid)
+                    if b'\n# Trust paths\n' not in old_keyexport:
+                        logger.debug('Old key does not include trust paths, skipping')
+                        continue
+                    if key_paths_repr in old_keyexport:
+                        logger.debug('No trust path changes for %s', kid)
+                        continue
 
         # Now, export the header
         args = ['--list-options', 'show-notations', '--list-options',
                 'no-show-uid-validity', '--with-subkey-fingerprints', '--list-key', kid]
         header = wotmate.gpg_run_command(args, with_colons=False)
-        keyexport = header + b'\n\n' + key_paths_repr + b'\n\n' + keydata + b'\n'
+        keyexport = header + b'\n\n# Trust paths\n\n' + key_paths_repr + keydata + b'\n'
 
         if not wotmate.lint(keydata):
             logger.debug('Skipping %s due to bad linter results', kid)

---
base-commit: f4624640df1c3113e7122f8f160b7a86cbba80b9
change-id: 20250326-trust-paths-improvements-965b9971bbe4
prerequisite-message-id: <20250325200120.1601271-2-u.kleine-koenig@baylibre.com>
prerequisite-patch-id: 7868b2463a94c294b1406727343bd405fadbacd1

Best regards,
-- 
Konstantin Ryabitsev <konstantin@linuxfoundation.org>

