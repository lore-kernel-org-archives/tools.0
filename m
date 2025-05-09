Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6184E270EB5
	for <tools@linux.kernel.org>; Fri,  9 May 2025 08:11:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746778290; cv=none; b=Mul9q/wTtm5RNkpa2+KKli7C8yOoh0i9BbVLpPf5vLzgBDeO1ryMsPN6l79HmceMVYe+raY4q46b/jDxnYJYHb92ulhIgNO0W7zjuBc002wz94h59Ejht6xxzgn/PF6ApeKfEmItWaBuh5a421heg1RQG7ylzrrWeIvNNTIkolw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746778290; c=relaxed/simple;
	bh=eErjGbHXoi28n4CT0U+pNi3d2eLSnrP7VG5NUVsTYsw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=q01NzYWNjXfTOs6zcVzcE99RO4v2DI8x7P11H5U8PQ5m62n6p5Sobre306RbJKMmuIEcv9Iuhexx9g3LX9ZxHW+kln+z1nJDoE/BKuxLh7DeqkHvHaLh1JgXfzMKRYrm979dG0tHMEHt1RKBNQutqAa4Y4ZD2dnzB/Zr4iwRlLE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=jBY48vXJ; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="jBY48vXJ"
Received: by smtp.kernel.org (Postfix)
	id E9463C4CEF0; Fri,  9 May 2025 08:11:29 +0000 (UTC)
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id F0A43C4CEE9
	for <tools@kernel.org>; Fri,  9 May 2025 08:11:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org F0A43C4CEE9
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-3a1fa0d8884so167362f8f.3
        for <tools@kernel.org>; Fri, 09 May 2025 01:11:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1746778286; x=1747383086; darn=kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=65t33UfWZ1/h3fv1hrbecWd0V6Yx2oNfHazSls02uhM=;
        b=jBY48vXJz9cn+utWVw+2A9T8nOyVfhbfRAXu4Bx8QH7/DJN3W8BwSRWpL4/FMZ5rWN
         QMkz2T6c+frlZR9QqGJ+1SvoG8TF6xADeJz4gKmZ8XWfn5BOf4LPe3GVYsbJgPWpaNc3
         xUTIhlwosc0hxumrJ+MqnI6jknVy6rGQEmuUxqiiS0gUBx4TTotHHh4Xiel4rzWSsaPW
         E5MJ/WNLtWPTXC1q36dJhdS5TMsOeeMzXloTyXUrO8Kz3wRt4/lE9DGluHnH1uAZ2quc
         VluZZEsIKnaBVFF3VEbCYI9Y0yvNzoG+fub0l1f4jQ2hUaD94g7jQR25p5X0vXRcVRt4
         DdJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746778286; x=1747383086;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=65t33UfWZ1/h3fv1hrbecWd0V6Yx2oNfHazSls02uhM=;
        b=rM0kE4yZvSXd6IkbwlMwk1znUyPvrvxwOI6xudvoIsqJjJpN/gMkltn2nNMieBItmK
         b0Ei5cUzHvgowEAEFN7PEFu/Tf4pMMLwcRprMBUIIo4cVHT14ykvlsQaVzPgKbOvbv8Z
         YaSC+bWxflN39HS52YjtT5Va7PA0vlp9lIPwKRMmYlmgY1gJqlK2C1GVIwox+1lMlgco
         NZhkbMxhasOz0QSiHK2Ek8fxdqr0WONlh9YiRIoYCfXcnOdmIQ7yN2/m8ORYaXd3j+de
         DJ5BFdYYkI+R9ruW8ObT3mjgYR6j3OwF5mtwApC9CkIswOfjNwWtzeGHbEi0ro21VPQd
         GMpQ==
X-Gm-Message-State: AOJu0YzEiSDncMrPbzj7RTAnv3TxX1qUgsNUQE+bmaEknveX6ZeYPiBt
	MjCIujLaWp2hQvqKNCtuOjBSfQEY59+f4tXsLNEvS1P2OMA72rGlONinZ19Ce/k=
X-Gm-Gg: ASbGncss4nkRY+CXdFZeKcSAA07NkvkU8GOo6RyCmSjsROOfFyJOuuGoQUAKExGKk9q
	GGgZCq9msDZys3h4rNn3UBKd8OU9VF5bbqbJRdffZON40r49j7Y7hPcaW/H+AH2V+9QMKL/71EQ
	Yhh2l7+6pE+Wd/dFdR5nO1Bj/d7AHQqCHIYVSISav8rhi+Rp08JNCHpxVBNdXtL1iBZS8GqrDo1
	dDBa8+2yPve3+gVOfyzShb+o0mo+XgE5mKZPkppnI+0YKwCKKa8ANdtmvaSwo+4v3JrETflIjvO
	2tdEdRvZ3shmVuLDAFnrDsFqqFdcUYAW9B40twskKqL7YaMDuI4QcFh58XOgFXxqOWnd//lJXRA
	ooAeitXzsOuVrCtz32g==
X-Google-Smtp-Source: AGHT+IGaTqIrIcFnVQCZY3aZMP9OMXE940d+KJVQX2ThTJ0F7UthDpoD47VeZyQjnMRULqagf0L5pA==
X-Received: by 2002:a5d:5391:0:b0:3a1:f937:6e70 with SMTP id ffacd0b85a97d-3a1f9376edcmr790445f8f.30.1746778286177;
        Fri, 09 May 2025 01:11:26 -0700 (PDT)
Received: from localhost (p200300f65f00780800000000000001b9.dip0.t-ipconnect.de. [2003:f6:5f00:7808::1b9])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-442cd34bc2esm63114135e9.20.2025.05.09.01.11.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 May 2025 01:11:25 -0700 (PDT)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc: tools@kernel.org
Subject: [PATCH wotmate v2 1/4] Put a representation of the trust path in a txt file
Date: Fri,  9 May 2025 10:10:59 +0200
Message-ID:  <3e2fe37f34b94fc37fb773797d86978c67b3b418.1746774817.git.u.kleine-koenig@baylibre.com>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <cover.1746774817.git.u.kleine-koenig@baylibre.com>
References: <cover.1746774817.git.u.kleine-koenig@baylibre.com>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=9302; i=u.kleine-koenig@baylibre.com; h=from:subject:message-id; bh=eErjGbHXoi28n4CT0U+pNi3d2eLSnrP7VG5NUVsTYsw=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBoHbiWZaElOChE+oqUZhNo2C7ELhdD6sBkeCVA2 N5lSX8YE1yJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCaB24lgAKCRCPgPtYfRL+ TpWoB/4gzjOf2zftL1cxv8Qrt6msO7HGH2LjyG2mrfO5xMKmxbemvuzUfj5Mm4JYhilLb8hIFV5 T6fBIUWGLb4Bv3ZOvOFtlv+Pq1rMFdB/GA/4IwLDbtrbdPbMHs/pZdsHGdKZmKcDxg2ODPpqknC LF42vy+E7/lSAwMRZvUVxJJzj/u9MzO/LmRAX1RGOKxbkZJPs449ZmOe9aoyXkqPd7CoRSA/BaQ 90EkAoj7e7fbYh93tixQmJvG8d1kncgRZAw2FusxIqm++5U4UdXlnhDCmxBzan+q0KOoy8vrJ0b qoiR6t/1a/QjXq7hcH6KeOUlo46fiTgDjwqIC3HxvP3XoYPd
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
-- 
2.47.2

