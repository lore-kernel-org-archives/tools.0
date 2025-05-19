Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 969C5194098
	for <tools@linux.kernel.org>; Mon, 19 May 2025 10:17:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747649849; cv=none; b=hAIw/Y91S2ZYtABPBeHSaxHXME+i3r+znv2y0xXUCq5K+MWSiFWkrIsupIofb8+DHnPkRt0o39jq5RJ1peB0WSVPoK73b+vB3boRWE9fOnvBoCOytQJoehfSm4Xp+kz6OMZlQSFbr9wRNSH0hQkGyZhaCI7KaUl1O7FAfer7I74=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747649849; c=relaxed/simple;
	bh=dkx8hXeKSfsNV5/Di83O+sLUj0yL0ykOcHGk6cqUcP8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=cAg4nyjxPpNowqwkW24NM8I5wq0ifK1N/1NZ3KP373elDKbIlSBrde1WgAy4zgmrcKlbu+EQNbqZ3nV9+KGACZ8j1syCCBPbH42XQ+dQw05vyRTgt5fSD81Ah7ffrJeqtv0TLgGR8G6zMhBTZxHS3vNU+HoD++P118weTJmpQzo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=xDnddIrX; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="xDnddIrX"
Received: by smtp.kernel.org (Postfix)
	id 105FBC4CEF1; Mon, 19 May 2025 10:17:29 +0000 (UTC)
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 1AD44C4CEEF
	for <tools@kernel.org>; Mon, 19 May 2025 10:17:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 1AD44C4CEEF
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-442eb5d143eso41483255e9.0
        for <tools@kernel.org>; Mon, 19 May 2025 03:17:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1747649846; x=1748254646; darn=kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6vurnMKy465tYmrM8OCdRDLx6O4DqF9v1v9JmO/yz5A=;
        b=xDnddIrXTqwMtZt8ElZBaFZjAqiWaQ7dQzv+GczV2KZKJHiHMVLFkJU/hus4dkEmpU
         6Rg6bTSrRXAdY+7QbYO3PTOdEf+cSs8q05c9/p7UVhhw853IvPvuo4qT6aM48NyNvkje
         4Q83uc0I4NhBEj4gYBkIJVtClng1fwuB1KCCJL8evvXs8kPyRUFoouadKTUwNlXH2ia6
         Eym/ZJhEkf/vud9kNEBUGVaEuug1wwdk9f1Er7KXyeUXA/nRn9edc4c0+LHPdmGEO2nT
         ll34hBKfH+/ceVHAp1ZXmx3G5428CzUVdTWfjzDN4kXFQw0SaFYu/ntz0y/01iHiYmJf
         9uJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747649846; x=1748254646;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6vurnMKy465tYmrM8OCdRDLx6O4DqF9v1v9JmO/yz5A=;
        b=CjmyhTmKGmNMFbodZoFSiB/XnmgWHJjiL3z13rN55OnfQa0Sy8hYmsqaRRKDSsj+YE
         HJadRzL3YzdOKbbeOxgn/0heSxQMmziA2vAxMJXridnuoq3uvxPpHUVdws4ztVJowHUb
         iOeyJbBs2Dq2CVLWYpsCDd2CJACHuDDbTYN3f5+NwpD2Ub+Rtd1XQd4IOb/QWHAHfCLg
         mZVLCS+k+/IIgO73AshAzbBQ+zYANCwIQVaygiPO3nEV/BzBQPm9SYcXnGYhYMjhKAoV
         OkNe06CwjBHrWQf8oGWf3jkqNRpOqY7ZtFJqcBM8C7T0JSh7J1LKA8tHB3ZxZMu8nqR9
         y0tA==
X-Gm-Message-State: AOJu0YxiYPe/y2WuT3OiRBwtfObwMzZkZVP4Q3U57rBWKcqRrq/IYtNt
	dUbZgZpL+m6xdJ1BRlJxc+A0f+L0uhepNSlN5vT85R4F6b1k+3yKCkIUQvumxyeFYnE=
X-Gm-Gg: ASbGnctnsgF1Uv0Ll877P7OpGPAdb+M5i8CgFBAndE87BgO5doQKUbs5O1NkYMOwCKX
	gkJLWbeQlhUTLJAL22ilCAHF8rF+dMVOaS2JfEQ5jvA/V3SRTEKJ9N/8cqG7G8ePChxj62lFRmr
	w/sI+zvy7m3KU3tBqECig0Z5MomEU/p1o2ph9gLXYtFNbGABmi8M9HxuLIreYv/JVRw/stOSEpE
	4zOAFNsv9ffUqNHZejmbGouLAllir8KKo2dHq2TNKAHMQtI1LCLaQWHLqU6AXjcQhzLWHxC4+M7
	VXq1eBiPwKW08VV0NuZfBSXP+kqafofCgHLjaHUKBLXwhlomwdoFFZkcpVidrT0cZKIye8I4Ikw
	eGtRgW/4oB5hEdD6NrQ==
X-Google-Smtp-Source: AGHT+IGNeWPCntDEx3i+61wXw9GaemEyIOVl1GXG8yi7WFFfqxqe3lMuG1scZLdjc4V9lNiVy9zjSA==
X-Received: by 2002:a05:600c:a016:b0:441:d2d8:bd8b with SMTP id 5b1f17b1804b1-442fd622c81mr119686295e9.8.1747649846392;
        Mon, 19 May 2025 03:17:26 -0700 (PDT)
Received: from localhost (p200300f65f00780800000000000001b9.dip0.t-ipconnect.de. [2003:f6:5f00:7808::1b9])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-442ebd6fe86sm161651495e9.0.2025.05.19.03.17.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 May 2025 03:17:25 -0700 (PDT)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc: tools@kernel.org
Subject: [PATCH wotmate v4 2/6] get_all_signed_by: Return a plain list instead of a list of 1-tuples
Date: Mon, 19 May 2025 12:14:32 +0200
Message-ID: <20250519101429.1558947-10-u.kleine-koenig@baylibre.com>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250519101429.1558947-8-u.kleine-koenig@baylibre.com>
References: <20250519101429.1558947-8-u.kleine-koenig@baylibre.com>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2144; i=u.kleine-koenig@baylibre.com; h=from:subject; bh=dkx8hXeKSfsNV5/Di83O+sLUj0yL0ykOcHGk6cqUcP8=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBoKwSLWp07bAy4wXhILGASoaPPEZafDyLTyS8+L EoESmWxrBCJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCaCsEiwAKCRCPgPtYfRL+ Tth4B/sEgz5vqd/LoBvdPvOL2oVm4txd5v8c8v2ymJNjNCLItHnkYSiVfunOKmZOEpUF6cQmSwe qAOeyNQwYxoA5udgduCtjBUcvvuflvI1C3vx2NX3sFZ+0tAVrsqvRM5KBzGNz8PgOJ9pJqafNs6 dAsjc1d7oXfmYQ/jCposaMKLtcW+845ZXh7or1xJM7rs60R+rhHtb4aLEhfinN4pgGYwInFL6Cb rdRVYm22IYGddbV7E/cC7+ovw2OUzsgTB4eVVFpgnsZ5zc3hWTscmwpRqCHu/mKyZHMw/GKPGVT 3HupY/mcls9WULZMYZQVZcD1TPaBDwmufiBHWcLQLTB7HgPu
X-Developer-Key: i=u.kleine-koenig@baylibre.com; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit

This allows to simplify the callers accordingly.
---
 wotmate/__init__.py | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/wotmate/__init__.py b/wotmate/__init__.py
index 7806859f039c..eb55105a590a 100644
--- a/wotmate/__init__.py
+++ b/wotmate/__init__.py
@@ -162,7 +162,7 @@ def get_all_signed_by(c, p_rowid):
         c.execute('''SELECT DISTINCT uid.pubrowid
                                 FROM uid JOIN sig ON sig.uidrowid = uid.rowid 
                                WHERE sig.pubrowid=?''', (p_rowid,))
-        _all_signed_by_cache[p_rowid] = c.fetchall()
+        _all_signed_by_cache[p_rowid] = [pubrowid for (pubrowid,) in c.fetchall()]
 
     return _all_signed_by_cache[p_rowid]
 
@@ -263,7 +263,7 @@ def get_shortest_path(c, t_p_rowid, b_p_rowid, depth, maxdepth, ignorekeys):
     depth += 1
     sigs = get_all_signed_by(c, t_p_rowid)
 
-    if (b_p_rowid,) in sigs:
+    if b_p_rowid in sigs:
         return [t_p_rowid, b_p_rowid]
 
     shortest = None
@@ -271,7 +271,7 @@ def get_shortest_path(c, t_p_rowid, b_p_rowid, depth, maxdepth, ignorekeys):
     if depth >= maxdepth:
         return None
 
-    for (s_p_rowid,) in sigs:
+    for s_p_rowid in sigs:
         if s_p_rowid in ignorekeys or (depth, s_p_rowid) in _seenkeys:
             continue
 
@@ -358,7 +358,7 @@ def get_key_paths(c, t_p_rowid, b_p_rowid, maxdepth=5, maxpaths=5):
         logger.critical('Top key did not sign any keys')
         sys.exit(1)
 
-    ignorekeys = [item for sublist in sigs for item in sublist] + [t_p_rowid]
+    ignorekeys = sigs + [t_p_rowid]
 
     if b_p_rowid in ignorekeys:
         logger.debug('Bottom key is signed directly by the top key')
@@ -369,7 +369,7 @@ def get_key_paths(c, t_p_rowid, b_p_rowid, maxdepth=5, maxpaths=5):
 
     paths = []
 
-    for (s_p_rowid,) in sigs:
+    for s_p_rowid in sigs:
         lookedat += 1
         # logger.debug('Trying "%s" (%s/%s)', get_uiddata_by_pubrow(c, s_p_rowid), lookedat, len(sigs))
         path = get_shortest_path(c, s_p_rowid, b_p_rowid, 0, maxdepth-1, ignorekeys)
-- 
2.47.2

