Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 384D6F9CB
	for <tools@linux.kernel.org>; Mon, 12 May 2025 08:39:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747039170; cv=none; b=JQuayooEEiq7cSdzLY4hzyBbhBDN89PZmFe0zZS2ZDje0wL0HhIEP9luiKgTpTXGpGmgV0I1vYzl+VWoOJdEIXCr8cYJaeZdfiSN3PTwvms2Vf73OYWyeia+J8OEshjYaPmWyFRNekvbuP3CedMZUtiD2vUwbGbyk8LWU4pADO8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747039170; c=relaxed/simple;
	bh=FIuRTKpCw9lDeh4oW7ZBtwAecvtYO+57jaDYZMWo3yk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=CSasvs4YYF4SV6tWAWXtlUngRPTN4zm015+d77PrWc+XJ71bVXqiJCOGn6UofJuQmFyFqB3+2CvRQqFPXLu89ijXEjXCJsVW4haQTqZYLeFLv3WcaDpL8KV+gtpycJs96lWpFKp8IoBapfBMNnhuWDiaZPpdwDsbLC5+dvCsZOA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=dETfpLsU; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="dETfpLsU"
Received: by smtp.kernel.org (Postfix)
	id C45C4C4CEF1; Mon, 12 May 2025 08:39:29 +0000 (UTC)
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 0BF4AC4CEE7
	for <tools@kernel.org>; Mon, 12 May 2025 08:39:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 0BF4AC4CEE7
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-441d1ed82faso28807735e9.0
        for <tools@kernel.org>; Mon, 12 May 2025 01:39:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1747039166; x=1747643966; darn=kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=APjsisJQ9CBhcSLRI4KfChC+oANeP2crliVWue30dac=;
        b=dETfpLsUzEfxFSCmKfO4O6LjaZ6TPK3C0coUHpJ1OMBg37KdxBaf5N3TdC4b/2+9FV
         gyv7Y7LqO8ft8S9+cobftW4hFJzYzUaiS1dP+c/yvPPgAD2/AII8TQQzTFEuG3kzV/3O
         Mkm4AGGaXdPXm3Lbkn8Ge8netAkoHX1zshmxlk0V+FlFlcG/i9FIjbN6OlteYCv1M0tt
         c8EmIidlltTAeu3NNd9gpPNk+LGq1cdpo3jLdohhXT9qP4CubrG1ZDyD4FnoDiS8ye85
         g3CLt9TkQ/De343LenPaK0cBx4SPSI1I6SxYSMeoNiwsx/iIvCt6IE0/L0dNO/H39pEm
         fU9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747039166; x=1747643966;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=APjsisJQ9CBhcSLRI4KfChC+oANeP2crliVWue30dac=;
        b=J5blaaMxE1k66vHXBbh4l79UKbgqkTZvjUZu+iETz1JShOiFtGHRwdIeI37fZ4ueO7
         53Z1xOdgRbDUKOBYo0tw4XYbjN+RMZMviY3dYN2JkNW9kmJmXQBkpczRIUoUyzH0h0PA
         sA/EpkD8uYZLXUOnQvMWAVCX9ZUsS5HPrh0vO58fqRJvLuuzmdCkOWHwEYSd/BZ+Ie9L
         I/U+cWQviRgUOiPhQgEkYu+aAj/AIRH7OfXQdDWxvaImJhuR2dCkeN+EoVGEuMmNIR35
         rFLos2MySlMR/I/2/DrvbYy4gkzE1Jzs2PSu2aMo+2PuRGZSSe792dVUaRn/dmJU+6FO
         27Cg==
X-Gm-Message-State: AOJu0YxnipAExfmnF9mbL6bktI1eFd3qsHizh52VT5pqrVHveA0fxHcr
	lf7PnSryiSpsKeNoDdXRbuOUzzjFLKfVRMk2WZeaNveDhRpPdPjU8iWEP81yF9g=
X-Gm-Gg: ASbGncu0JederAHmzGddT7k0qL51tPQ/5xNj5rOm3degtFydmHgh00lm8oOFZQ4WqtD
	ol3UcFyNcELyUyewdZUjqiJ/WPZLfPpZ3POwbUBjAjfJax0wAcgCLpWFvy6HyqQbscUsyllS8yA
	1lMgc5tlkfXrrWSQVYpiXyUIPDC9Xl33S0/HV2SXlZ96KOIYWpaAkmBaLjyxms1noh2a83L4weS
	/+tpD0uNRHY68+tzyxXdrGh/rmnD2nhapEV33hS9yN6CjNpPNqHFqfjRfJJpzNQKIhpLMLWch92
	kUroFSM7Q5blZXmZQ5xEUGhP/KNjZ8/LLaBcRYIyFFvONPgIyzt6hsVwo1XMYigubwyZH1yRpU4
	C8mrxXEFbij6/vIZnAg==
X-Google-Smtp-Source: AGHT+IFsx+jo7N4Y1nYDUvn3/nuio3KPuQpxs9gqruJMXE0p5w/tgMCd/CrgKtxPVQheL6JOSK0LYQ==
X-Received: by 2002:a05:600c:c0d1:10b0:43d:9d5:474d with SMTP id 5b1f17b1804b1-442d77d10e5mr67713055e9.0.1747039166236;
        Mon, 12 May 2025 01:39:26 -0700 (PDT)
Received: from localhost (p200300f65f00780800000000000001b9.dip0.t-ipconnect.de. [2003:f6:5f00:7808::1b9])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-442d67df5ecsm116921355e9.9.2025.05.12.01.39.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 May 2025 01:39:25 -0700 (PDT)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc: tools@kernel.org
Subject: [PATCH wotmate v3 1/4] Put a representation of the trust path in a txt file
Date: Mon, 12 May 2025 10:39:04 +0200
Message-ID: <ecb2a7fe4650163f0d0a933d726cff9a0ca5878b.1747038870.git.u.kleine-koenig@baylibre.com>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <cover.1747038870.git.u.kleine-koenig@baylibre.com>
References: <cover.1747038870.git.u.kleine-koenig@baylibre.com>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=9298; i=u.kleine-koenig@baylibre.com; h=from:subject:message-id; bh=FIuRTKpCw9lDeh4oW7ZBtwAecvtYO+57jaDYZMWo3yk=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBoIbOqGj48ye3dAGbK5uw2nRxugpP2V/F0gk1GT gIwjIFjZpuJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCaCGzqgAKCRCPgPtYfRL+ TiASB/45pUHXSS5hrc7yK1kZBO2G4rROaboa9Ngmzwwx2xioOm0+unaupSQV8wGzPFwMok2wNYU 2lbtypocU0GZpj1B1Ucrm6joEH3mm5YJCmArvpU0d9HRtDeDfU7k8Xguz7OKvK35XhnND2rOHg6 4bd3tLdotMMkTdIun/qtbFFQBmcLAVh5XdcS6zv22YGbgUjRLoy6rcsgRh+yq9/iPWdMxGznGS2 1f+9CZ8KzKWMQpBNH4jjLz26hN0r28v1RG1VZA0snqUtUm/6NMXRuCvtfRlyM7E8hhlwPC+eSL+ kWrPUT1g+tNW5CsfaYukLqICNd28fH6eDfd5izeRIvbV1gK3
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
 1 file changed, 97 insertions(+), 58 deletions(-)

diff --git a/export-keyring.py b/export-keyring.py
index 6cf95f99738d..e5e6d3787774 100755
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
+                if key_paths_repr != old_key_paths_repr:
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
-- 
2.47.2

