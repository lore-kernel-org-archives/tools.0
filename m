Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C5A81EBA08
	for <tools@linux.kernel.org>; Thu, 10 Apr 2025 20:51:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744318320; cv=none; b=VAo4CzUaa3ni/4WWXNedKugsPvdUFVnwk48ELnM/utIrHUoZCKf4XQVkoxilf24X2CIPfEe2XZWJku3cRo/grCGWBbQHwS1BHNtovLFSmcnJE1olz3Jul8SHdJR7lYIGAzSWauoC/7RlLxhP7UtuMJsUBpjBIEZQM1k6ROBHnhU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744318320; c=relaxed/simple;
	bh=4FsdOAhPU6Z2BNa9vh8VmBnAPHjhMueZesAF0lN5gXo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=rqvkAFeS1A1mu1EPFfeOFmxXZTQmRSrcUMtb0RP0FFg3pqFJjkQyjEi0T9XRghKJPRjnezU347jvFcdkFvpKuw8kcPKDFP1V/IZwHg9VAQ18LA46Bcpd8BSq6o1TUD/AOeHmlniqoGNBhVzZK91hsRC+0PGwjAsCT1HHK/3TPIg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=GOvB3h0S; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="GOvB3h0S"
Received: by smtp.kernel.org (Postfix)
	id AEEFCC4CEE7; Thu, 10 Apr 2025 20:51:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 55CA3C4CEDD;
	Thu, 10 Apr 2025 20:51:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1744318318;
	bh=4FsdOAhPU6Z2BNa9vh8VmBnAPHjhMueZesAF0lN5gXo=;
	h=From:Date:Subject:To:Cc:From;
	b=GOvB3h0SGy8jda+YUjUTb7Ak5JN4+GNzb128pjFEKLD1GeeLpatdvaqdpP7o8hHhX
	 Rg5PcB9K9adOnsk4b/WZIqEPfqUzlQLAXv4kKHmrHn368Y873hkd3/bNIbE6DvzE90
	 0g3XJ2LVV4AW+IxHIuuQ4ntXp0Yrw4Q+TtUfeEeQ=
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Date: Thu, 10 Apr 2025 16:51:36 -0400
Subject: [PATCH wotmate v2] Write the text graph into a separate file in
 graphs/
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250410-trust-paths-improvements-v2-1-adfd17e41b3c@linuxfoundation.org>
X-B4-Tracking: v=1; b=H4sIAFcv+GcC/4WQzW6DMBCEXwX5XCPbgPlRVeU9qhxsWMMqYFPbo
 EQR716H9N7Talba+Wb2SQJ4hEC67Ek87BjQ2STER0b6SdkRKA5JE8FExQohafRbiHRVcQoUl9W
 7HRawMdBWVrpta641lCSdrx4M3k/r7+tbe/jZEiG+l2SBENRJ6LLPP0AlGOOC5VymUXMq6JbfZ
 kAL9ObA4njR6jGj9pD3bvl6gbQKQJNYMHaZKaUoZckGw/uC8wJqLoRpTPLTtWpkr7VqmG7JK9K
 EITr/OMvv/Mz0f8+d0xSL93LQZaNEay4z2u1u3GYHFdP7cudHcj2O4xch+wVYXQEAAA==
X-Change-ID: 20250326-trust-paths-improvements-965b9971bbe4
To: tools@kernel.org
Cc: =?utf-8?q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>, 
 Konstantin Ryabitsev <konstantin@linuxfoundation.org>
X-Mailer: b4 0.15-dev-c25d1
X-Developer-Signature: v=1; a=openpgp-sha256; l=8754;
 i=konstantin@linuxfoundation.org; h=from:subject:message-id;
 bh=4FsdOAhPU6Z2BNa9vh8VmBnAPHjhMueZesAF0lN5gXo=;
 b=owGbwMvMwCW27YjM47CUmTmMp9WSGNJ/6OcKdp/0P2D7bEb1vD+zfKJ/Pv4mplNr3rXDSMFb6
 aOsaMyMjlIWBjEuBlkxRZayfbGbggofesil95jCzGFlAhnCwMUpABNZ9p3hn3FBsOa72/xn85ru
 x0d/X+gjNfm1Ovu6VPVNzed1C1bvnsDwT7s1pKdB9uqfEtdjDM2KQfKq8h/67Q8dEbgnM5nrd9N
 sbgA=
X-Developer-Key: i=konstantin@linuxfoundation.org; a=openpgp;
 fpr=DE0E66E32F1FDD0902666B96E63EDCA9329DD07E

Write the text graph representation of the trust relationships into a
separate file in graphs/, with the following formatting changes:

- Show the depth of the signature
- Don't use '.' to represent the target (I'm the one who suggested it,
  but it doesn't make sense with these formatting changes)

Co-developed-by: Uwe Kleine-König <u.kleine-koenig@baylibre.com>
Signed-off-by: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
---
Changes in v2:
- Based on mailing list discussions, write the graph out into a separate
  file under graphs/, which still gives us what we want and makes it
  cleaner than writing it inside the key file itself.
- Link to v1: https://lore.kernel.org/r/20250326-trust-paths-improvements-v1-1-21c6db48a29f@linuxfoundation.org
---
 export-keyring.py | 123 ++++++++++++++++++++++++++++++++++--------------------
 1 file changed, 78 insertions(+), 45 deletions(-)

diff --git a/export-keyring.py b/export-keyring.py
index 3e455f9..318a125 100755
--- a/export-keyring.py
+++ b/export-keyring.py
@@ -110,59 +110,86 @@ if __name__ == '__main__':
             logger.debug('Skipping %s due to invalid WoT', kid)
             continue
 
-        key_paths_repr = '\n'.join('\n `-> '.join(wotmate.get_uiddata_by_pubrow(c, rowid) if rowid != to_rowid else "." for rowid in kp) for kp in key_paths).encode('utf-8')
-
-        # Do we already have a file in place?
+        kpblock = ''
+        for kp in key_paths:
+            for lvl, rowid in enumerate(kp):
+                kpuid = wotmate.get_uiddata_by_pubrow(c, rowid)
+                kpblock += f'   {lvl}  {kpuid}' if lvl > 0 else f'from  {kpuid}'
+                kpblock += '\n'
+            kpblock += '\n'
+        key_paths_repr = kpblock.encode()
+
+        # Is there already a key file in place?
+        key_changed = False
         if os.path.exists(keyout):
             # Load it up and see if it's different
             with open(keyout, 'rb') as fin:
                 old_keyexport = fin.read()
-                if old_keyexport.find(keydata) > 0 and old_keyexport.find(key_paths_repr) > 0:
-                    logger.debug('No changes for %s', kid)
-                    continue
-
-        # Now, export the header
-        args = ['--list-options', 'show-notations', '--list-options',
-                'no-show-uid-validity', '--with-subkey-fingerprints', '--list-key', kid]
-        header = wotmate.gpg_run_command(args, with_colons=False)
-        keyexport = header + b'\n\n' + key_paths_repr + b'\n\n' + keydata + b'\n'
-
-        if not wotmate.lint(keydata):
-            logger.debug('Skipping %s due to bad linter results', kid)
+                if keydata not in old_keyexport:
+                    key_changed = True
+                    logger.debug('Key changes detected for %s', kid)
+
+        txtgraphout = os.path.join(graphdir, "%s.txt" % kid)
+        trust_changed = key_changed
+        if not os.path.exists(txtgraphout):
+            logger.debug('Forcing generation of the text graph for %s', kid)
+            trust_changed = True
+        elif not key_changed:
+            # Load it up and see if trust relationships changed
+            with open(txtgraphout, 'rb') as fin:
+                old_key_paths_repr = fin.read()
+                if key_paths_repr not in old_key_paths_repr:
+                    trust_changed = True
+                    logger.debug('Trust changes detected for %s', kid)
+
+        if not (key_changed or trust_changed):
+            logger.debug('No changes detected for %s', kid)
             continue
 
-        with open(keyout, 'wb') as fout:
-            fout.write(keyexport)
-            logger.info('Wrote %s', keyout)
-
-        if cmdargs.gen_b4_keyring:
-            # Grab all uid lines from the header
-            for line in header.split(b'\n'):
-                if not line.startswith(b'uid'):
-                    continue
-                line = line[3:].decode('utf-8', 'ignore').strip()
-                if line:
-                    parts = parseaddr(line)
-                    if not len(parts[1]) or parts[1].count('@') != 1:
+        if key_changed:
+            # Now, export the header
+            args = ['--list-options', 'show-notations', '--list-options',
+                    'no-show-uid-validity', '--with-subkey-fingerprints', '--list-key', kid]
+            header = wotmate.gpg_run_command(args, with_colons=False)
+            keyexport = header + b"\n\n" + keydata + b"\n"
+
+            if not wotmate.lint(keydata):
+                logger.debug('Skipping %s due to bad linter results', kid)
+                continue
+
+            with open(keyout, 'wb') as fout:
+                fout.write(keyexport)
+                logger.info('Wrote %s', keyout)
+
+            if cmdargs.gen_b4_keyring:
+                # Grab all uid lines from the header
+                for line in header.split(b'\n'):
+                    if not line.startswith(b'uid'):
                         continue
-                    local, domain = parts[1].split('@', 1)
-                    kpath = os.path.join(cmdargs.outdir, '.keyring', 'openpgp', quote_plus(domain), quote_plus(local))
-                    pathlib.Path(kpath).mkdir(parents=True, exist_ok=True)
-                    spath = os.path.join(kpath, 'default')
-                    tpath = os.path.relpath(keyout, kpath)
-                    if os.path.islink(spath):
-                        if os.readlink(spath) == tpath:
-                            continue
-                        if spath in my_symlinks:
-                            # There's multiple keys with the same identity. First one wins, for the lack of a
-                            # better solution that is also sane.
-                            logger.info('Notice: multiple keys with the same UID %s', parts[1])
+                    line = line[3:].decode('utf-8', 'ignore').strip()
+                    if line:
+                        parts = parseaddr(line)
+                        if not len(parts[1]) or parts[1].count('@') != 1:
                             continue
-                        os.unlink(spath)
-                        logger.info('Notice: fixing symlink for %s', parts[1])
-                    os.symlink(tpath, spath)
-                    my_symlinks.add(spath)
-                    logger.info('Symlinked %s to %s', kid, spath)
+                        local, domain = parts[1].split('@', 1)
+                        kpath = os.path.join(cmdargs.outdir, '.keyring', 'openpgp', quote_plus(domain),
+                                             quote_plus(local))
+                        pathlib.Path(kpath).mkdir(parents=True, exist_ok=True)
+                        spath = os.path.join(kpath, 'default')
+                        tpath = os.path.relpath(keyout, kpath)
+                        if os.path.islink(spath):
+                            if os.readlink(spath) == tpath:
+                                continue
+                            if spath in my_symlinks:
+                                # There's multiple keys with the same identity. First one wins, for the lack of a
+                                # better solution that is also sane.
+                                logger.info('Notice: multiple keys with the same UID %s', parts[1])
+                                continue
+                            os.unlink(spath)
+                            logger.info('Notice: fixing symlink for %s', parts[1])
+                        os.symlink(tpath, spath)
+                        my_symlinks.add(spath)
+                        logger.info('Symlinked %s to %s', kid, spath)
 
         graph = pd.Dot(
             graph_type='digraph',
@@ -176,6 +203,12 @@ if __name__ == '__main__':
         graphout = os.path.join(graphdir, '%s.%s' % (kid, cmdargs.graph_out_format))
         graph.write(graphout, format=cmdargs.graph_out_format)
         logger.info('Wrote %s', graphout)
+
+        logger.debug('Writing out the text graph')
+        with open(txtgraphout, 'wb') as fout:
+            fout.write(key_paths_repr)
+            logger.info('Wrote %s', txtgraphout)
+
         wcount += 1
 
     logger.info('Processed %s keys, made %s changes', kcount, wcount)

---
base-commit: f4624640df1c3113e7122f8f160b7a86cbba80b9
change-id: 20250326-trust-paths-improvements-965b9971bbe4
prerequisite-message-id: <20250325200120.1601271-2-u.kleine-koenig@baylibre.com>
prerequisite-patch-id: 7868b2463a94c294b1406727343bd405fadbacd1

Best regards,
-- 
Konstantin Ryabitsev <konstantin@linuxfoundation.org>

