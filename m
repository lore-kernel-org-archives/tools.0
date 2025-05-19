Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 094041FF61E
	for <tools@linux.kernel.org>; Mon, 19 May 2025 10:17:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747649851; cv=none; b=rSNITor+Lj95hNDKu+OEmHemS+jWhEk8jxa3kYbqieDKSb1i5E157BRrBikR9TP5MvmQCsMNDQ28/yr6KsuZYVwY3F3lH3HhloTMihsH1TYuRNI0OXVnhnfguZ1DLOv59cm6JeqkXBo6XuESyFCOBHs15ZNz/Sea8uoSI1sYu6o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747649851; c=relaxed/simple;
	bh=CwgMIv7VUiDNx5gNVVddki5aQcwDxTqZYQcnrw9wTxI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=XK/nBCHSZVGlGwNxH5iq3mmlJCjQjLNhxAdr7pxHvyxeXwddrxcwzItA3EV+X9iN125T5WOlyKc/5qjyWrnZ4ZQgRmHeLCOEsmN3+qS7dRmIwIafDPFooRLLxKi2B/3tVStQG539cxeXZj7SU2eiF15lpSgJ2y4763xewk1Rv7E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=nLGlNZ5f; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="nLGlNZ5f"
Received: by smtp.kernel.org (Postfix)
	id 93817C4CEEB; Mon, 19 May 2025 10:17:30 +0000 (UTC)
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 4F2B6C4CEE4
	for <tools@kernel.org>; Mon, 19 May 2025 10:17:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 4F2B6C4CEE4
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-442ccf0e1b3so52056265e9.3
        for <tools@kernel.org>; Mon, 19 May 2025 03:17:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1747649848; x=1748254648; darn=kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8Ns9o+ilexQnGQmi/9na+kHOdXd3HHF1LP0gXIKI5Gc=;
        b=nLGlNZ5fhyj9xNV7sRjcCf4OebfEJOoz7sxlIy34Y0I/4PaszHWp8FlN+jKCQa2EQ6
         OuWe7YpFzUVY1bEzPZxGSp6dDCvt85czBPg/zPuEAW9IYQkGSUfx9JyHGt1O+VQMQlgb
         2UrHMaJlBPJnPckPKxYBek1Z2hrtkrb1WyIS7BgRChLdndsSqJ0TPelLb5AXOhAh4YbK
         XFmYOx+1iUcisXEKUnGPOjAjrGMydSxGZgaJoGRQAVsKCOyBqvb1IHgMxGD5EoLrxeyI
         yuFw/yueTOSdExWm4zP8pzJdyKMtaFS1enKy0rzj/iTm2LQcNGIlNbT69n45sU46QSnU
         Trmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747649848; x=1748254648;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8Ns9o+ilexQnGQmi/9na+kHOdXd3HHF1LP0gXIKI5Gc=;
        b=e5aGJKG5Go2m6ZQE2eBHptEL87eKtFIfFoKC694BdYuHM8DgKT+1HTlO2Br3Tilmhk
         x95z0sSDUQMrBPcH82lOjyjxLAVaMpO0A1lWaHwSAL+WXXLTVdY1WWZQZXC1gVwid7sv
         Xmorn81ceNzHAQ00/tkbCidjtohEIfYZT+atjmRXYG41nToJQGvCvS9OEZVkTc9u6epq
         5qRgj67ZTCF3aY+JDTyVxJrECzGxbwTuc+iNXLsyk9oJeutbHiihCndayQ8COZIdvpLh
         poSB/ZiSkrBVdY5NyIHYLiI1jAGoTaUMj01yFfFopepOiQh8r3Hucg180YEuN9UJdlvf
         tbJg==
X-Gm-Message-State: AOJu0YwlOa0acdGwojnhTkQtAgjUO1Wg+1CTL2YCQwpgYDJLotX8dGYb
	IKIsi/O8YgCPbbqbja4zHjfwZR0KmMq4Yf4oNafDNfNtoE1db0l+ShKzyO3QRl6uKrE=
X-Gm-Gg: ASbGnctf4jnRJK+wPiMXpmJTScCKzye5Qz6vT7+F+6akqY0R2TcNKEzYmbeapsZEFk5
	3INu+faidRjClPw8bfTEoiGkGs1KQDuAjTmPlYy1nXeQfuoaRNb1tivkuOyKJNMN2k9OGtQ4XAZ
	D9ly8wQtVZelvG0Tz71IWFX2UtpUfwi5ycA7dKqDtiJLACrzK3KC60zGui4D7brkp19kZ6OdZFf
	yD62n6KaYn5jtlyukIc/dNcbnw5YVWc1fG0MRlebilzPCr/k2Lrsk0eJeB3ykX1JTZWmsUiQ4/W
	qa/0GeWULu+YXwROdOpgWxzIZqegUFumF/PQesK1xz5BMPZVEdbQqjrc/GfeC1MnqQCWv9hQsCC
	ov8yMLeflZoh+oS4S6g==
X-Google-Smtp-Source: AGHT+IH/FXuVogBMgCJh+FTWjx8mfjggEPSDo4RAIJK0gfEKGMCsvE3zFyryYsmfMFBUhhX1tJXjUA==
X-Received: by 2002:a05:6000:400f:b0:3a0:b1f7:c1da with SMTP id ffacd0b85a97d-3a35c848d6amr10808755f8f.46.1747649847663;
        Mon, 19 May 2025 03:17:27 -0700 (PDT)
Received: from localhost (p200300f65f00780800000000000001b9.dip0.t-ipconnect.de. [2003:f6:5f00:7808::1b9])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-3a35ca8cb2dsm12083202f8f.84.2025.05.19.03.17.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 May 2025 03:17:27 -0700 (PDT)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc: tools@kernel.org
Subject: [PATCH wotmate v4 3/6] get_key_paths: Fix path searching with an easier algorithm
Date: Mon, 19 May 2025 12:14:33 +0200
Message-ID: <20250519101429.1558947-11-u.kleine-koenig@baylibre.com>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250519101429.1558947-8-u.kleine-koenig@baylibre.com>
References: <20250519101429.1558947-8-u.kleine-koenig@baylibre.com>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=7149; i=u.kleine-koenig@baylibre.com; h=from:subject; bh=CwgMIv7VUiDNx5gNVVddki5aQcwDxTqZYQcnrw9wTxI=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBoKwSOyQeDLU/F+sqvagO5hm9nPYzmJcrxhhEFv +Z/6Tt6naeJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCaCsEjgAKCRCPgPtYfRL+ Tll1B/oDG4v+b3gwZIjYvUU641FYeCZ2jtY2qg9f8nqJY8nSA5yc6zqkqP/Mh6cwHvXUSaTyJnT L8pGjkmoCcd1MZXnhhskAWTerjvvQKOj/9f8Jpe27Wc2gSYU2CrLFVuxroRljIWJZf7N+72wayM Sy3p49sZ2zbr4LtmTj22V4zVy5h2vMlI0Q0scTO7CGwwmIk2dhlZbcHcB5t2tNtPgedDyfe4r4p KaqZVVqIIxw5x+3YKIWUGVYwA1L0eXT70b+RBA98MMCL3EcLfN+O4HjXWpXApDwartWILgAav3P HeS7RttFv4PO2UllVgNTZCzFVcXM/To1DN64TrGav1Y0BxSe
X-Developer-Key: i=u.kleine-koenig@baylibre.com; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit

I didn't debug the old algorithm, but the new one finds more and shorter
paths that are valid, so the path pruning was too aggressive it seems.

For example for Andreas Larsson it finds

	from  Linus Torvalds <torvalds@kernel.org>
	   1  Junio C Hamano <gitster@pobox.com>
	   2  Geoff Levand <geoff@infradead.org>
	   3  Geert Uytterhoeven (Signing key) <geert@linux-m68k.org>
	   4  Andreas Larsson <andreas@gaisler.com>

in the kernel keyring that the old algorithm didn't find.

The new algorithm is also more deterministic as it emits the paths in
sort order (by certificate id). (Actually it's sorted by rowid of the
public keys, but both gnupg and sqlite don't shuffle during import in
practise.)

The new algorithm is also considerably simpler using
https://en.wikipedia.org/wiki/Dijkstra%27s_algorithm

Runtime is comparable to the algorithm before.

One side effect is also that the graph for the root key is corrected, it
was

	from  79BE3E4300411886  Linus Torvalds <torvalds@kernel.org>
	   1  79BE3E4300411886  Linus Torvalds <torvalds@kernel.org>

before.
---
 wotmate/__init__.py | 135 +++++++++++++++-----------------------------
 1 file changed, 45 insertions(+), 90 deletions(-)

diff --git a/wotmate/__init__.py b/wotmate/__init__.py
index eb55105a590a..f9162229c402 100644
--- a/wotmate/__init__.py
+++ b/wotmate/__init__.py
@@ -7,6 +7,7 @@ __author__ = 'Konstantin Ryabitsev <konstantin@linuxfoundation.org>'
 import sys
 import subprocess
 import logging
+import itertools
 
 from typing import Optional
 
@@ -232,68 +233,6 @@ def make_graph_node(c, p_rowid, show_trust=False):
     return anode
 
 
-def cull_redundant_paths(paths, maxpaths=None):
-    paths.sort(key=len)
-
-    culled = []
-    chunks = []
-    for path in paths:
-        redundant = False
-        pos = -2
-        while pos > -len(path):
-            if path[pos:] in chunks:
-                redundant = True
-                break
-            chunks.append(path[pos:])
-            pos -= 1
-
-        if not redundant:
-            culled.append(path)
-            if maxpaths and len(culled) >= maxpaths:
-                break
-
-    return culled
-
-
-def get_shortest_path(c, t_p_rowid, b_p_rowid, depth, maxdepth, ignorekeys):
-    global _seenkeys
-    # Zero out seenkeys at 0-depth
-    if depth == 0:
-        _seenkeys = set()
-    depth += 1
-    sigs = get_all_signed_by(c, t_p_rowid)
-
-    if b_p_rowid in sigs:
-        return [t_p_rowid, b_p_rowid]
-
-    shortest = None
-
-    if depth >= maxdepth:
-        return None
-
-    for s_p_rowid in sigs:
-        if s_p_rowid in ignorekeys or (depth, s_p_rowid) in _seenkeys:
-            continue
-
-        subchain = get_shortest_path(c, s_p_rowid, b_p_rowid, depth, maxdepth, ignorekeys)
-        if subchain:
-            if shortest is None or len(shortest) > len(subchain):
-                shortest = subchain
-                _seenkeys.add((depth, s_p_rowid))
-                # no need to go any deeper than current shortest
-                maxdepth = depth - 1 + len(shortest)
-        else:
-            # if it returns with None, then this key is a dead-end at this and lower depths
-            for _d in range(depth, maxdepth):
-                _seenkeys.add((_d, s_p_rowid))
-
-    if shortest is not None:
-        _seenkeys.add((depth, t_p_rowid))
-        return [t_p_rowid] + shortest
-
-    return None
-
-
 def draw_key_paths(c, paths, graph, show_trust):
     seenactors = {}
     # make a subgraph for toplevel nodes
@@ -352,43 +291,59 @@ def get_pubrow_id(c, whatnot):
 
 
 def get_key_paths(c, t_p_rowid, b_p_rowid, maxdepth=5, maxpaths=5):
-    # Next, get rowids of all keys signed by top key
-    sigs = get_all_signed_by(c, t_p_rowid)
-    if not sigs:
-        logger.critical('Top key did not sign any keys')
-        sys.exit(1)
 
-    ignorekeys = sigs + [t_p_rowid]
+    def gen_uniq_paths(t_p_rowid, b_p_rowid, maxdepth):
+        logger.debug(f'search for {str(b_p_rowid) + " " + get_uiddata_by_pubrow(c, b_p_rowid)}')
 
-    if b_p_rowid in ignorekeys:
-        logger.debug('Bottom key is signed directly by the top key')
-        return [[t_p_rowid, b_p_rowid]]
+        # prioq tracks the pairs (depth, path) that need further inspection
+        prioq = [(0, [t_p_rowid])]
 
-    logger.debug('Found %s keys signed by top key' % len(sigs))
-    lookedat = 0
+        found = set()
+        used_keys = set()
 
-    paths = []
+        while prioq:
+            depth, path = prioq.pop(0)
 
-    for s_p_rowid in sigs:
-        lookedat += 1
-        # logger.debug('Trying "%s" (%s/%s)', get_uiddata_by_pubrow(c, s_p_rowid), lookedat, len(sigs))
-        path = get_shortest_path(c, s_p_rowid, b_p_rowid, 0, maxdepth-1, ignorekeys)
-        if path:
-            logger.debug('`- found a path with %s members' % len(path))
-            paths.append([t_p_rowid] + path)
-            if len(path) > 2:
-                ignorekeys += path[1:-2]
+            if path[-1] in found:
+                # We already know a path to `path[-1]` of depth <= `depth`
+                continue
 
-    if not paths:
+            if path[-1] == b_p_rowid:
+                logger.debug(f'found: {[str(p) + " " + get_uiddata_by_pubrow(c, p) for p in path]} @{depth=}')
+                yield path
+
+                # if we found a path of length 1, this is good enough
+                if depth <= 1:
+                    return
+
+                new_used_keys = set(path[1:-1])
+                used_keys.update(new_used_keys)
+
+                # We might have pruned some paths that are interesting again now that there are new keys in used_keys
+                prioq = [(0, [t_p_rowid])]
+                found = set()
+                continue
+
+            #logger.debug(f'consider: {[str(p) + " " + get_uiddata_by_pubrow(c, p) for p in path]} @{depth=}')
+
+            # We found a shortest path to path[-1], so we don't need to consider further paths leading to it
+            found.add(path[-1])
+
+            if depth < maxdepth:
+                sigs = set(get_all_signed_by(c, path[-1])) - used_keys - found
+
+                # If the cert to find a path for is reachable from path[-1], the other sigs are not interesting
+                if b_p_rowid in sigs:
+                    prioq.append((depth + 1, path + [b_p_rowid]))
+                else:
+                    prioq.extend((depth + 1, path + [s]) for s in sorted(sigs))
+
+    ret = list(itertools.islice(gen_uniq_paths(t_p_rowid, b_p_rowid, maxdepth), maxpaths))
+    if not ret:
         logger.info('No valid paths between %s and %s',
                     get_uiddata_by_pubrow(c, t_p_rowid), get_uiddata_by_pubrow(c, b_p_rowid))
-        return []
-
-    culled = cull_redundant_paths(paths, maxpaths)
-    logger.debug('%s paths left after culling' % len(culled))
-
-    return culled
 
+    return ret
 
 def get_u_key(c):
     c.execute('''SELECT rowid 
-- 
2.47.2

