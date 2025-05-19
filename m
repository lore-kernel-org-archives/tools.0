Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1718C2741DF
	for <tools@linux.kernel.org>; Mon, 19 May 2025 10:17:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747649852; cv=none; b=B61PnOFaOF624cOfoWOIGmchKlTdWasfXQN4hc02Vp0+QNCOKsrzOgs4GgxQR9L3ZzVKZJhUH3sskbAisRCshb2cKT+sJpdrmEP2rBEBfGCE8mnW2DWEtZaAZoHVNKB54GTJUL3+htdYOOoISpC87bmMikqElNSNOE9v+80SBJg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747649852; c=relaxed/simple;
	bh=G9C6/VpyKDOCHpYwe/dRuYaEP+5mpl+9x2MQZmcDujQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=QMvIySTiEYK5glF+/4GStayb7C5GLlPPZ1uTI9+SXzYWD8ykPByFNAANLAKtfe/hzg9RvIJQWxb90K1L9iZVgeOavPjMnNWI/AsdB6KxwDF0yM82qAB2e1TmNdvMshZRitdb35flSfz6ciJEb1UXFK3KyOZzM6eUGjf9OHwxlso=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=lSTgTyvk; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="lSTgTyvk"
Received: by smtp.kernel.org (Postfix)
	id 9BB6DC4CEF0; Mon, 19 May 2025 10:17:31 +0000 (UTC)
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id A76F6C4CEE4
	for <tools@kernel.org>; Mon, 19 May 2025 10:17:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org A76F6C4CEE4
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-43edecbfb46so33575195e9.0
        for <tools@kernel.org>; Mon, 19 May 2025 03:17:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1747649849; x=1748254649; darn=kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1vdCYsN+FpN3EM5qRqSM2M8BinoRtn0AVO3mrzkxjlM=;
        b=lSTgTyvkhWygv5M1cILYI2jqAkb/igCYq/GE756MRGyYkB6FbyVYBVN5xSjWcSDeIn
         qQS8jdX7QmOwhQDtShK9HB4RUfONUHsBzrQlVi7UuCkOii44TOI/eprOi+BZg55IZFNj
         7ljtivMEhYIHniLf9ReKrHtte+2jtIU7GRTv/KCK+U12Qq1oIsg2WGjNWndWYOOjTt07
         zPK0BUDtSdmuWpf2tVRklx6PYsD4/oP/WWJU2/6gC5Dcou9ex8UzJqpZBkjSKqdt2mf7
         lnZpqEf7XPECCFFx8bgeDqY2hQoITuUOnzm814yrFTBjA4QG5pHWn8aRcH0yIeCUbX+q
         Cb+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747649849; x=1748254649;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1vdCYsN+FpN3EM5qRqSM2M8BinoRtn0AVO3mrzkxjlM=;
        b=w/qc2mFLLWL6843unZmUbP+hfPLAqWZGGb1Bw7hfO+D5FXNtqj4svadTjTcuAQJ4Y+
         Iz4Czksj/gFnw9sUP31cRYECwpz4YumK21xcX4J7GRQshShXVoZhQvOPWtPfoDuj0p+R
         Ta4zywdfWcMpbgG7SFcHUBABb67rLhoaeAvqwnZlT6JAsUrj89n2oqiGN54so4K6Q2y4
         djO+paW+etN/iDpJaYMkclzoENqhEfoGSJ8XhAtftZJHYI+M57lqgHf92qY4Y8SE3/WO
         r4b3LNEXbH5Pq3gU3rTdSi5MynQCHKhFuaMKdupBYzWqvMFaM3UxhLAUD17m5Z22qCKD
         k7Bw==
X-Gm-Message-State: AOJu0Yw9JgB9j3arZtKgw6YlYvXlDlzo8QLjvhWtpeB7ev+uMXVyu6aL
	/F86a8UsLH40f0gFY2pCH5vtbh8km8Fkm04MsbTLlH3NrULVXRvZIUPFVvwEbm/cvXI=
X-Gm-Gg: ASbGnctnDugLkk6/dTV26c/NY21oi4h/fwaDDuoz9pmvntH1ZMZ4DEkEuu/b8jRedwI
	GSGvWN57+PjQT3owo/1bH/j5pOU68y00vpTz7/AyGTpxFXlIbRQJZcCzGUAFg4BSVwfM7hnUQfI
	ND09VDZf+Rx9IiB84dBdOMwbbtaxk0bslg2k86ZgzDsfkkBdcZKgjB8GJxntfJr63ibYpBXBjcF
	IGcspihhUknwe8jkAZkkdpkTTdg3o/4V08ZfN/j4PFHwFBdgbB8LoqIXzT5G/I2CLePOjtf/402
	cv6Or35AyaRxoDAVcbadeq0B/dZJpGZQwO9Ogs+2kLXmUVyU896NqtmX1OMuvtr3kKINDTpK5pQ
	cKljy/m8P7V83N/bVqw==
X-Google-Smtp-Source: AGHT+IHP5JeGMwCkRYr43sJvmFymN0mj/mX7MP3f4XYK21hsj+Pq0zJeTpE0zEq7jH6O7mwmoCqUsQ==
X-Received: by 2002:a05:600c:8115:b0:441:b3eb:570a with SMTP id 5b1f17b1804b1-442fefdab8bmr113070065e9.2.1747649848947;
        Mon, 19 May 2025 03:17:28 -0700 (PDT)
Received: from localhost (p200300f65f00780800000000000001b9.dip0.t-ipconnect.de. [2003:f6:5f00:7808::1b9])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-3a36a83b63bsm6311295f8f.97.2025.05.19.03.17.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 May 2025 03:17:28 -0700 (PDT)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc: tools@kernel.org
Subject: [PATCH wotmate v4 4/6] export-keyring: Continue updating keys that lost all their trust paths
Date: Mon, 19 May 2025 12:14:34 +0200
Message-ID: <20250519101429.1558947-12-u.kleine-koenig@baylibre.com>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250519101429.1558947-8-u.kleine-koenig@baylibre.com>
References: <20250519101429.1558947-8-u.kleine-koenig@baylibre.com>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2536; i=u.kleine-koenig@baylibre.com; h=from:subject; bh=G9C6/VpyKDOCHpYwe/dRuYaEP+5mpl+9x2MQZmcDujQ=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBoKwSRlvIpacjBvu/tlQKll8TWaJdkC5W+/CN05 m/J7dih04WJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCaCsEkQAKCRCPgPtYfRL+ Tk/bB/9GlmtT7o9/Vnup0N99y0JPhSWVuQ0oM6+x05vxQKlU0Hl/WsIFc0h+CfviGAkekhaDjf1 M6PfnohFAdi99tCBEySqC61GrIQ91jjxWPYvm10O3Pv7+Ovli71B6cjiXa3juL4DKLc0RipCie3 V/0Vsth/Ywzgl1fmprq3iIXh2K3si3kN4M9CYfzvbPoBuq8z+8j7R+2SRcQFV3zVIaYOgSkqvN9 ZUA5Di/YIWQGN8iXoXOdmnMiNkcJbT5KpKy//62m5oEeCgthE2PWtC680YrzhDc5t8WE6A79n4R 34oMD8BobUi7mI6rTxP2DoVsgUxJhIOoUgb7d+zHTUgVLU8R
X-Developer-Key: i=u.kleine-koenig@baylibre.com; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit

With recent gpg not trusting third-party signatures based on SHA1 quite
some public keys lost their trust paths in the kernel pgpkeys repo. It's
still sensible to update these keys, so only skip new keys without a valid
trust path.
---
 export-keyring.py | 33 +++++++++++++++++++--------------
 1 file changed, 19 insertions(+), 14 deletions(-)

diff --git a/export-keyring.py b/export-keyring.py
index 5fa272bdc578..6c206a8daada 100755
--- a/export-keyring.py
+++ b/export-keyring.py
@@ -105,10 +105,27 @@ if __name__ == '__main__':
         keydata = wotmate.gpg_run_command(args, with_colons=False)
         keyout = os.path.join(keydir, '%s.asc' % kid)
 
+        # Is there already a key file in place?
+        key_changed = False
+        if os.path.exists(keyout):
+            key_already_exists = True
+            # Load it up and see if it's different
+            with open(keyout, 'rb') as fin:
+                old_keyexport = fin.read()
+                if keydata not in old_keyexport:
+                    key_changed = True
+                    logger.debug('Key changes detected for %s', kid)
+        else:
+            key_already_exists = False
+            key_changed = True
+
         key_paths = wotmate.get_key_paths(c, from_rowid, to_rowid, cmdargs.maxdepth, cmdargs.maxpaths)
         if not len(key_paths):
-            logger.debug('Skipping %s due to invalid WoT', kid)
-            continue
+            if key_already_exists:
+                logger.debug('%s has an to invalid WoT, but already exists, so still update it', kid)
+            else:
+                logger.debug('Skipping %s due to invalid WoT', kid)
+                continue
 
         kpblock = ''
         for kp in key_paths:
@@ -119,18 +136,6 @@ if __name__ == '__main__':
             kpblock += '\n'
         key_paths_repr = kpblock.encode()
 
-        # Is there already a key file in place?
-        key_changed = False
-        if os.path.exists(keyout):
-            # Load it up and see if it's different
-            with open(keyout, 'rb') as fin:
-                old_keyexport = fin.read()
-                if keydata not in old_keyexport:
-                    key_changed = True
-                    logger.debug('Key changes detected for %s', kid)
-        else:
-            key_changed = True
-
         txtgraphout = os.path.join(graphdir, "%s.txt" % kid)
         trust_changed = key_changed
         if not os.path.exists(txtgraphout):
-- 
2.47.2

