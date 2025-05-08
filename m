Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 413B61E5215
	for <tools@linux.kernel.org>; Thu,  8 May 2025 09:45:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746697515; cv=none; b=l9JmiWCqyMg/YvXm9SgptugAPgZXqsmZXsUBi9y2IeAawfxuRkAPAVIhFgWLEsN6y0uGJOX+7bgh8Mynq6ELBUKIVlldVnXZs5xmWyzH793//+HiVRvE0xDeL5Flb8I2r8tOEmKOVqCUBXTdmT1DAVGpAB33nL8FW1AsL+nRRIU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746697515; c=relaxed/simple;
	bh=NxADkbr1BNNiUBEhJnXyXFBVCVTLRV7pY6QZad23msM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=o1iuUW9Tr19fb7As7RDP87p2pXJYTWFgk4nd+VZgWHaGsskHo2ZIN1olvgUx9vuQEd0xJ5/xmpiD6r40vyojVaCo9K2jGCVonexyjE4/V6jTnovOABvVjUDbPVnyrHBSy5A3v5asqXfqbe4XR4G5f40po0/YLOY1S17ba/E43+E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=Qghj6Eiy; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="Qghj6Eiy"
Received: by smtp.kernel.org (Postfix)
	id C5723C4CEEF; Thu,  8 May 2025 09:45:13 +0000 (UTC)
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id EB65CC4CEED
	for <tools@kernel.org>; Thu,  8 May 2025 09:45:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org EB65CC4CEED
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-3a0b9af89f2so431814f8f.3
        for <tools@kernel.org>; Thu, 08 May 2025 02:45:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1746697510; x=1747302310; darn=kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qUg1a93OGAwFYM27WkVfHIf/m4PMRp9Ecsnr+eKI47M=;
        b=Qghj6EiylZVpdizrkewpvVXiYdB+LxsNfpFgRnd9NTpynWSMiESrNkU0Bi6iRJSNOw
         WW6YhVPws6x3+gzETY2MiZKOItTA/VLwpc9aH4wmMWHY3inIfit3bXbxLK1yvd+wkenB
         lbl9EysUQQFJOCMfL6As3dpQm/BnOx09PvdMESqcMYzVt3q5vCidIAtnwWA/++m/oRgn
         jfi1k3IXDpEDVZ5gH8UxvaKNJAJK3DwoWtBNF5Nk862FJBgNl40UjZ2YV/jZ7cKfhbGw
         Jp8ww7Ud5OOt50nGGxTLpFJwpUoIdm1ebH1FaUzkLFKhONFFDT8c5jObfYvuL3TnGCWd
         z20Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746697510; x=1747302310;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qUg1a93OGAwFYM27WkVfHIf/m4PMRp9Ecsnr+eKI47M=;
        b=rRZOACt01Nv8D4iKX43heN+cNW//iDKrkq8fKrWV35JyPXWXlqy7hNz4/Nlgm9dhSG
         TawX29onGLRmLDD9EXIUWvcdfqcUaV87RJ5JFr0RAqC3mvSIjqyQoCQlrSXSXapRId9V
         zjAKo+J6HjZNrtZCaarazX+cLU4lP+ESE+jmL9DIho9eXIUDqda4JIQjrhdWJ1kRRYIT
         WnIVnsCY8d1o7bvIQxySVH2rHSYBSxPuBg97S5YMCVpnghE3ED/b27d/C/0fPUBpg/fg
         pkqd78CqEwp4kCu8pKlT8yf9CUmbJ/Yzi2IKjtbqFNW9tTyMLODt6Hk9NGBxoncglpfP
         Q2Tg==
X-Gm-Message-State: AOJu0Ywc941GVzYUOEdUhvhspo05OXAQlukbFr8M5Wj5h4zt8C1r6wlX
	2YPsiznsrIxkt7x1pkH0tcd4nJydGAXInrbL0ySjXuObACGOfYZbuMZjd4G06RE=
X-Gm-Gg: ASbGncsKN+U4fPVNQkCtLvXU2QK52WPyio7G/qDpglXUuGTkeucSMnyfEDL4xZVyidM
	0DkSubU1JOTezbMxIkacKtBxnX69n+JHwLLMD4nRiasF/p3EYWTHBv+gNFmBe9xfUTrfzKypHay
	s8M2YDQmgm5B6epcDLZFFG1nQ+43gF/UaCliWkNhR8tu5FGEfa3U3U57ed7PyeJGsJ/Mbh0yH1l
	FqnO7QMP4YbbmdqrzKVSrXL/9Ho9T7fejjyKSffsUt3SAAb1m1M6OF5glyvUo6+pxRz2LqUbP+K
	Sl3kGKKIjVrXzvTHUzDlP1gmB57gvD0L+kycDhsnHUMmOZNCSGp7Q/OnwO852ItkW3VeZzyCnfX
	Ecc/5nlY=
X-Google-Smtp-Source: AGHT+IHAaEYefRLWcufr6Ciu4/4l907s6xImGm5bqahwdIdfIa3mqClbqRK0dRpud1FZQ3xbBysBNw==
X-Received: by 2002:a05:6000:18a9:b0:3a0:b84d:60cc with SMTP id ffacd0b85a97d-3a0b84d613amr2777150f8f.2.1746697510115;
        Thu, 08 May 2025 02:45:10 -0700 (PDT)
Received: from localhost (p200300f65f00780800000000000001b9.dip0.t-ipconnect.de. [2003:f6:5f00:7808::1b9])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-442cd351315sm31047425e9.19.2025.05.08.02.45.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 May 2025 02:45:09 -0700 (PDT)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc: tools@kernel.org
Subject: [PATCH wotmate 1/3] Put a representation of the trust path in a txt file
Date: Thu,  8 May 2025 11:44:53 +0200
Message-ID: <20250508094451.762484-6-u.kleine-koenig@baylibre.com>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250508094451.762484-5-u.kleine-koenig@baylibre.com>
References: <20250508094451.762484-5-u.kleine-koenig@baylibre.com>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=9925; i=u.kleine-koenig@baylibre.com; h=from:subject; bh=NxADkbr1BNNiUBEhJnXyXFBVCVTLRV7pY6QZad23msM=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBoHH0WTUUjvq/B9bmkg/+JbdaJ2b/nkKHZN6d/W 57g3Y+c0JeJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCaBx9FgAKCRCPgPtYfRL+ Tn1WB/4zBCqn5pBVidoKPppEqquxHCuJq3OzRZMR34lMuwe8gV1XLmr15EtIznnFMi0RYMxSaWv T/mXe8oufPbtHKlPtSDFzBIdU/dSBZKPZVXhE56FnCVI4Z9fl5RIZvswgqGBc92ZZPqaZJugQ/A 0LH29EZfqucrTnv9n7oULK5QI27++BJNpGnj5BXTJlNeF8rmEoT2uBoe8qowULST28FSqmDrUQo esQtsDsjdputAmo+4a9pdwCsYmfL2/97avwOPmc0rLkfgf3pxBsZ6jsM51Skx19iOk4h98+yKbV Bb/IpApaFEo5bbWLKFNjbG42sOiEn82pz26mfhhRLVScrv77
X-Developer-Key: i=u.kleine-koenig@baylibre.com; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit

Up to now changes to the trust paths are hardly reviewable when looking
at the git history because they only have an effect on the generated
.svg. However these also change when the installed graphviz changes and
the diffs are hardly understandable.

For that reason put a text representation of the graph into the key
files.

A nice side effect of this change is that for a trust path

	Linus -> A -> B -> C

the graph for C is regenerated if B's trust path was shortend to

	Linus -> B

Co-developed-by: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
---
 export-keyring.py | 155 +++++++++++++++++++++++++++++-----------------
 make-sqlitedb.py  |   5 ++
 2 files changed, 102 insertions(+), 58 deletions(-)

diff --git a/export-keyring.py b/export-keyring.py
index 6cf95f99738d..5531b096a6aa 100755
--- a/export-keyring.py
+++ b/export-keyring.py
@@ -104,75 +104,114 @@ if __name__ == '__main__':
         args = ['-a', '--export', '--export-options', cmdargs.key_export_options, kid]
         keydata = wotmate.gpg_run_command(args, with_colons=False)
         keyout = os.path.join(keydir, '%s.asc' % kid)
-        # Do we already have a file in place?
-        if os.path.exists(keyout):
-            # Load it up and see if it's different
-            with open(keyout, 'rb') as fin:
-                old_keyexport = fin.read()
-                if old_keyexport.find(keydata) > 0:
-                    logger.debug('No changes for %s', kid)
-                    continue
-
-        # Now, export the header
-        args = ['--list-options', 'show-notations', '--list-options',
-                'no-show-uid-validity', '--with-subkey-fingerprints', '--list-key', kid]
-        header = wotmate.gpg_run_command(args, with_colons=False)
-        keyexport = header + b'\n\n' + keydata + b'\n'
-
-        if not wotmate.lint(keydata):
-            logger.debug('Skipping %s due to bad linter results', kid)
-            continue
 
         key_paths = wotmate.get_key_paths(c, from_rowid, to_rowid, cmdargs.maxdepth, cmdargs.maxpaths)
         if not len(key_paths):
             logger.debug('Skipping %s due to invalid WoT', kid)
             continue
 
-        with open(keyout, 'wb') as fout:
-            fout.write(keyexport)
-            logger.info('Wrote %s', keyout)
+        kpblock = ''
+        for kp in key_paths:
+            for lvl, rowid in enumerate(kp):
+                kpuid = wotmate.get_uiddata_by_pubrow(c, rowid)
+                kpblock += f'   {lvl}  {kpuid}' if lvl > 0 else f'from  {kpuid}'
+                kpblock += '\n'
+            kpblock += '\n'
+        key_paths_repr = kpblock.encode()
 
-        if cmdargs.gen_b4_keyring:
-            # Grab all uid lines from the header
-            for line in header.split(b'\n'):
-                if not line.startswith(b'uid'):
-                    continue
-                line = line[3:].decode('utf-8', 'ignore').strip()
-                if line:
-                    parts = parseaddr(line)
-                    if not len(parts[1]) or parts[1].count('@') != 1:
+        # Is there already a key file in place?
+        key_changed = False
+        if os.path.exists(keyout):
+            # Load it up and see if it's different
+            with open(keyout, 'rb') as fin:
+                old_keyexport = fin.read()
+                if keydata not in old_keyexport:
+                    key_changed = True
+                    logger.debug('Key changes detected for %s', kid)
+        else:
+            key_changed = True
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
+            continue
+
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
+                    line = line[3:].decode('utf-8', 'ignore').strip()
+                    if line:
+                        parts = parseaddr(line)
+                        if not len(parts[1]) or parts[1].count('@') != 1:
                             continue
-                        if spath in my_symlinks:
-                            # There's multiple keys with the same identity. First one wins, for the lack of a
-                            # better solution that is also sane.
-                            logger.info('Notice: multiple keys with the same UID %s', parts[1])
-                            continue
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
 
-        graph = pd.Dot(
-            graph_type='digraph',
-        )
-        graph.set_node_defaults(
-            fontname=cmdargs.font,
-            fontsize=cmdargs.fontsize,
-        )
+        if trust_changed:
+            graph = pd.Dot(
+                graph_type='digraph',
+            )
+            graph.set_node_defaults(
+                fontname=cmdargs.font,
+                fontsize=cmdargs.fontsize,
+            )
+
+            wotmate.draw_key_paths(c, key_paths, graph, cmdargs.show_trust)
+            graphout = os.path.join(graphdir, '%s.%s' % (kid, cmdargs.graph_out_format))
+            graph.write(graphout, format=cmdargs.graph_out_format)
+            logger.info('Wrote %s', graphout)
+
+            logger.debug('Writing out the text graph')
+            with open(txtgraphout, 'wb') as fout:
+                fout.write(key_paths_repr)
+                logger.info('Wrote %s', txtgraphout)
 
-        wotmate.draw_key_paths(c, key_paths, graph, cmdargs.show_trust)
-        graphout = os.path.join(graphdir, '%s.%s' % (kid, cmdargs.graph_out_format))
-        graph.write(graphout, format=cmdargs.graph_out_format)
-        logger.info('Wrote %s', graphout)
         wcount += 1
 
     logger.info('Processed %s keys, made %s changes', kcount, wcount)
diff --git a/make-sqlitedb.py b/make-sqlitedb.py
index fec199def51d..e8c5969f4d50 100755
--- a/make-sqlitedb.py
+++ b/make-sqlitedb.py
@@ -163,6 +163,11 @@ def keyring_load_sig_data(c, pub_keyid_rowid_map, uid_hash_rowid_map):
                 ignored_sigs += 1
                 continue
 
+            # skip SHA-1 based signatures
+            if fields[15] == "2":
+                ignored_sigs += 1
+                continue
+
             # do we have the key that signed it?
             if sigkeyid in pub_keyid_rowid_map.keys():
                 uidsigs[sigkeyid] = (
-- 
2.47.2

