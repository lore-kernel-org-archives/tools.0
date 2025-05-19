Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AA9E1FF61E
	for <tools@linux.kernel.org>; Mon, 19 May 2025 10:17:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747649848; cv=none; b=JW1PXi41viYICTstwUCC2gXwGC3PIx4cTbjUJ74JJfR2IROt1zlalH2m9ufnQvHvXaxzeb1f2XjmMLOpGF2MoJwGwuVrmpxYJWWFCoo61CIjVbBQKaIwy/N5v92uJCucGs6c6evoCoRWGcal06U3if/cJVtJ838vKYk0vTNr+KU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747649848; c=relaxed/simple;
	bh=UMLOpuNyjGPlIWNmrj3czxlnrBtEw4bfyVAijJw+rbc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=mihWHtzIyVj2PHI4r5ax/NjmdH3gpE1MbHqJvuhF/O/EZZ9MsWU27vqTenenpJG/DLDzPy94gaRqpfWo94XUZAwts0oQzWMrQu1vhIxHIF6wYv0I4Aul1I2IBgG01edQp5UPtjGPvj8uM9065kwp2KpWLlJPFTe7nvwRfUcUKmw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=Ilph5bKZ; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="Ilph5bKZ"
Received: by smtp.kernel.org (Postfix)
	id CF536C4CEEB; Mon, 19 May 2025 10:17:27 +0000 (UTC)
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 844A7C4CEE4
	for <tools@kernel.org>; Mon, 19 May 2025 10:17:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 844A7C4CEE4
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-3a0ac853894so3656425f8f.3
        for <tools@kernel.org>; Mon, 19 May 2025 03:17:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1747649845; x=1748254645; darn=kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nuj7HwUA+0yEnz5jeXOZFFRMrqlSvamUtq2ybu6hRHc=;
        b=Ilph5bKZZHaXw0WjY8dVKNb4k6DVlktylSqu2kzxlCgrOAUWRbrzse7VtodtAYt0Y2
         K+jThN4Q5cb7byJIsgbUiFtDXnLMiGz6puEyaeCr7l10v5Au9GQd3hk9vw/ZrOZu/QJg
         Wd2mrkJT+vJNS2yXyh/HVoCLfURHk57PdmBmS+YJ4J+nGeGORASJcJL/BZ6GriFcGRX+
         irSfFcZctk8nkW9DfRSnZWW1T7bmRkKerm2vfEltOZE4MSup6zvgria9Rg++kPdvYLlF
         Yc81wUizV2tQ86JEz9x2Wt4MFxzYLOkWojE5RHgIJlLJkQqCkPLJseszwmS80mbS+BeN
         FyKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747649845; x=1748254645;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nuj7HwUA+0yEnz5jeXOZFFRMrqlSvamUtq2ybu6hRHc=;
        b=asfg3f/bqjpIeWomrdk7vwAgaru+TfXKLm9RE16SJvvl8RWpfgJAS3mpNaRtWoPeXv
         A6oIuPrrvEi8lUKrKq+sB1VJTAzeTQFs6jSpN4/bh1Bx3bOBBWBOHDq0ZspaIrIW8LeV
         vQTqD4iI2VtdRr3eGAjtTRcPgh5nafqz60IJ6xajunNy2FcjbbJCc4T08MA/o88pHh8Q
         0sUSt9/j+E19hZl7fBrStmM2WiqLcYKjCbhqFi6NNlfZGqHqsWlPvR9jbesRraFYg+Pw
         yM5y/1/QOg9DvDVJ3BfB1gbtxthslLHCIzQcooLCArqvp2e9e4gXhjNqY/srITPdIfVb
         1ZLg==
X-Gm-Message-State: AOJu0Yz6rRajMjLfnXzJCx10GKraX4mFhG6LBxoObhjzjwpqOFsZAGEY
	CE40WXgawnr5tJ9Yh1sC5kYaB/dq+Re3g9Oz0kxV4vRI2EcgL56ta3uqLW0xJuvZ5hZHyJwQPKw
	gpcyA
X-Gm-Gg: ASbGncsUihyWiF3UfTJu7uh+JqKYs/L1A0bx6+0FgZgbfAZrdk+M15CcE2BlX+pigI2
	76C+fghAbWr/yFzgOzstZvJssw8EEUhCqE0dYQfLermCeYDQmyA1oy+P5fLqgbf6BIYTmhvw9mN
	Felk+t92/KEQ7SL5MLuww+I4N+PElOmEvkWInRUce5ZNzx39q3Wx1hZkzIpcJirj7CqBtw9bVvG
	k1sthwJ/8RzehXwXY7gbHKP8zG7OMULWC1wCruQbkg7QNGo2GBu9Cun1dUTzW85KxOZPUq+IlXB
	Z4UYW43WsgjMwltySikZ7yTjHPxmRyTMuckwWO7Dr1tn+hZhsFR6MIyGQsBe/Cn5mSw2ja5N8X7
	lt5zG/kui2Xg59+iqZg==
X-Google-Smtp-Source: AGHT+IHQ4yPMmM7z3MQtcJppkbkXNZZt66EHDQQAxlQZGjJD+ipH2Ylv105oEWSeoVTW3OuZcveoaQ==
X-Received: by 2002:a5d:558b:0:b0:3a1:f8d1:6340 with SMTP id ffacd0b85a97d-3a35c83aca4mr8208423f8f.34.1747649844781;
        Mon, 19 May 2025 03:17:24 -0700 (PDT)
Received: from localhost (p200300f65f00780800000000000001b9.dip0.t-ipconnect.de. [2003:f6:5f00:7808::1b9])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-3a35ca4d1easm12104638f8f.5.2025.05.19.03.17.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 May 2025 03:17:24 -0700 (PDT)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc: tools@kernel.org
Subject: [PATCH wotmate v4 1/6] Put a representation of the trust path in a txt file
Date: Mon, 19 May 2025 12:14:31 +0200
Message-ID: <20250519101429.1558947-9-u.kleine-koenig@baylibre.com>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250519101429.1558947-8-u.kleine-koenig@baylibre.com>
References: <20250519101429.1558947-8-u.kleine-koenig@baylibre.com>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=10417; i=u.kleine-koenig@baylibre.com; h=from:subject; bh=UMLOpuNyjGPlIWNmrj3czxlnrBtEw4bfyVAijJw+rbc=; b=owEBbAGT/pANAwAKAY+A+1h9Ev5OAcsmYgBoKwSI4ikt7L0hoitX8Gw4v/ZdKjEQiGt/8BdDO 3JyiBR8XpCJATIEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCaCsEiAAKCRCPgPtYfRL+ TsD7B/iazz+SlJFHZMtRrna0Pzq2XVOeOCJGvmPCw+0srWY4RwLMLN7a9ognR5Mw4N3J+PzR3rW vuiZI6Zj9jyGkQJtJ07+YEvWaX/8uDJ9Z3+gpFrFX0BdK58/d3wXhxQScG6M+YqQVC6/ja0ZLq2 QegOMeOlzDdzDJSrD0LCW4Ko4bUdVDT5GZO9v5lQqEOYjIwqwEjZ7joyFOMz8FPQD5IkMKljwnK ZAlgCQJ7pVyulByPypC8Es8zfGmDnfYyOC4JCwPdFgMx2M5iz4lmkDMBIMVEjjlgDRUR17M0cu2 WI869T47eBfHLtQEMO0lsmmPRmNTrP1ONx7hBOanvkTPCgw=
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
 export-keyring.py   | 155 +++++++++++++++++++++++++++-----------------
 wotmate/__init__.py |  14 ++--
 2 files changed, 106 insertions(+), 63 deletions(-)

diff --git a/export-keyring.py b/export-keyring.py
index 6cf95f99738d..5fa272bdc578 100755
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
+                kid, kpuid = wotmate.get_pub_uid_by_pubrow(c, rowid)
+                kpblock += f'   {lvl}' if lvl > 0 else f'from'
+                kpblock += f'  {kid}  {kpuid}\n'
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
diff --git a/wotmate/__init__.py b/wotmate/__init__.py
index 32f91cf2a75b..7806859f039c 100644
--- a/wotmate/__init__.py
+++ b/wotmate/__init__.py
@@ -31,15 +31,19 @@ logger = logging.getLogger(__name__)
 # convenience caching to avoid redundant look-ups
 _all_signed_by_cache = dict()
 _all_sigs_cache = dict()
-_all_uiddata_cache = dict()
+_all_pub_uiddata_cache = dict()
 _seenkeys = set()
 
 
+def get_pub_uid_by_pubrow(c, p_rowid):
+    if p_rowid not in _all_pub_uiddata_cache:
+        c.execute('SELECT pub.keyid, uid.uiddata FROM uid JOIN pub ON uid.pubrowid = pub.rowid WHERE pubrowid=?', (p_rowid,))
+        _all_pub_uiddata_cache[p_rowid] = c.fetchone()
+    return _all_pub_uiddata_cache[p_rowid]
+
+
 def get_uiddata_by_pubrow(c, p_rowid):
-    if p_rowid not in _all_uiddata_cache:
-        c.execute('SELECT uiddata FROM uid WHERE pubrowid=?', (p_rowid,))
-        _all_uiddata_cache[p_rowid] = c.fetchone()[0]
-    return _all_uiddata_cache[p_rowid]
+    return get_pub_uid_by_pubrow(c, p_rowid)[1]
 
 
 def get_logger(quiet=False):
-- 
2.47.2

