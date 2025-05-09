Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C725270EB5
	for <tools@linux.kernel.org>; Fri,  9 May 2025 08:11:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746778293; cv=none; b=ADpc4aBdYMsqevYc2A3is+kgs6+yisiuZuTHIJpEX7LrY065irbv5U1monjWFTkpsUK5QC2yKisvJQ9ImlLxPANXPPsbrIDcje7Mt7JIknKqmxM04n+TTlo7XpegEBxldc7QVb4Pd1BodqVa5Sz+grBt0g9QluH6Ni53i3k4PyI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746778293; c=relaxed/simple;
	bh=ZlPpo7bPHQi1X3W6C63vE/fmFzMQWei+LpQwfXU0/ng=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=pqqo5yXf+8t+sLxuaonzO0ainqx7JpfKkKMLdDQWZ7G33qFKoV7HYHgnxEew5k31tOOjxYxMn5GOBM7OGhEiWB+c+Y8o2TryMSOEe/An+Z033+kWs8xKG2gWXZj2YuqJ1koxuqZD7J1HRpPlY8rFKx+ikwt/264FWgqHW8uh9rM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=A2wK+73t; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="A2wK+73t"
Received: by smtp.kernel.org (Postfix)
	id B5BFFC4CEE4; Fri,  9 May 2025 08:11:31 +0000 (UTC)
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 101BCC4CEE9
	for <tools@kernel.org>; Fri,  9 May 2025 08:11:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 101BCC4CEE9
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-43cfdc2c8c9so9194775e9.2
        for <tools@kernel.org>; Fri, 09 May 2025 01:11:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1746778288; x=1747383088; darn=kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TWQCVqyw9y9RLNZ6kgAr96aBPOm4DY/uWinSgtOBQMo=;
        b=A2wK+73t41F57tCCB/+WyEER0xCjDbRPEV1OJp3IsZxwqeKcsejxZbR1KPYpDIpTKM
         KaYOcoHkaJl0QeAMEYBrqCixw3R08pPqKqPE0tf45ISlU3XOPvnRnns+UqRyh/QBhGnm
         QBe0Mf5skqWUfGKh31SDKCEyPtsM6PRag7dmxzcY+KYZ+aTjHI18UXNw0L6EQ/eP92gZ
         hnEfmBvzJzs2qQ7mPgf7TGR3svaNbO3NDUjtll36Po/NopS5Vri58lVNRjaDgJvVlw3t
         K6LdyuQQY1M1yagh1j6T+uS2Agc7XFk2P1lAbm60jnc9eGNI3LiW9eqmi0z7gNkS9J/z
         Ktog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746778288; x=1747383088;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TWQCVqyw9y9RLNZ6kgAr96aBPOm4DY/uWinSgtOBQMo=;
        b=jV9UqnnkuEepHsiYdpM0Lb9GtgBzoXerhI7oNE7h11cwsYiv31/4uTcy5jHlWVOUWq
         ++Nol7sstfm91WK6PW3g2IuIheQ3aei4jDezT753uM2d2VcVgDCaO5fHzIJDWQK5qNSG
         4h25I+KGJfjRCDFdCTEWFUvAyUWQaA+EWr7BLToW9fQXhjFciT0IH5xeKUCUN1QJAy+q
         i941QE6z64/5/hJ6EB8DbpXwG2avYffCo5Ic4GhmaI/ygjThgsXiOMKIq+E82Qf07mmM
         sZe2GjkDlCqE/chtRGc6VpRmAd3dxUnclqaBOYzWAxR4jewlcf3bGcZz8iG1JvhUh9DV
         X+nQ==
X-Gm-Message-State: AOJu0Yz3+rREdNt+DO+V6XEu8nIWyY/sZG6Wwn5/UUJjfIEStbaX+FEE
	AEjX+mff0h7bmLsGljUVED4JANAzxZ87OwZSg+L2EoTXa/aJP+XEGymeE0cHN10=
X-Gm-Gg: ASbGncsy73uvIjZYG43ANYXzO/eGQC401WCVO40i/6PSA1GHOB1i6sMHQrcpxMW8wdo
	Y8Ixy+w0mI973Ed7y+/e6sNeRcLE1F9nWHEeLbxJqfKDVMO4mvDj1RzpgJ9f7qKK2mlCyLCIqNU
	FDksd8tRWyr2ejN/8YwRoaRLeM0VEBnmJVkgB3zdzr48GI5724bVWuoXx31NTns0aw+ssmpRwc1
	P93nmbLRkYiytEkW+aM7fIycu4Pe4zgGrSexGUtFXG3TgFZ884YVrCBFlsWEuMawG0QxM0r6ErK
	v6gJ02EqwHPLKNVgJslftZunGldnE+rjzAACPaPaTNTgQRjt6A75oJ6nhEAA9W9dVL7ihGXCVve
	1FDISJvU=
X-Google-Smtp-Source: AGHT+IHTW6VWXonJQ7vaQ4ONyj2tHi60zI7uNAUn/6iVuCGfmIOkeNBfIkf4h4geiXFpnswGX5u+Eg==
X-Received: by 2002:a05:600c:8115:b0:43c:f8fc:f686 with SMTP id 5b1f17b1804b1-442d6d11aa7mr19505405e9.3.1746778288202;
        Fri, 09 May 2025 01:11:28 -0700 (PDT)
Received: from localhost (p200300f65f00780800000000000001b9.dip0.t-ipconnect.de. [2003:f6:5f00:7808::1b9])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-442d67df5ecsm20986135e9.9.2025.05.09.01.11.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 May 2025 01:11:27 -0700 (PDT)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc: tools@kernel.org
Subject: [PATCH wotmate v2 2/4] export-keyring: Continue updating keys that lost all their trust paths
Date: Fri,  9 May 2025 10:11:00 +0200
Message-ID:  <8428f87ee3705159d74256fa556bc894575159c4.1746774817.git.u.kleine-koenig@baylibre.com>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <cover.1746774817.git.u.kleine-koenig@baylibre.com>
References: <cover.1746774817.git.u.kleine-koenig@baylibre.com>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2536; i=u.kleine-koenig@baylibre.com; h=from:subject:message-id; bh=ZlPpo7bPHQi1X3W6C63vE/fmFzMQWei+LpQwfXU0/ng=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBoHbiZsfXpiS7RQ3qWMQlCjviiwc26j4AlhQOFg 2pDMjxTFBmJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCaB24mQAKCRCPgPtYfRL+ Th1/CACGmSOF9mOzv4rQ5ckLjwfDmRI5vy2wqnJzjkdgMKd/GBE0l7sEi6tb2m6pzsV1zEV49yH WfC5k7mEvBNVhlOcgRHyd717X1gUh/hkRzEFFWH9flh3UyW46LFilY7HKkDguRqf2QVKmgjffRJ pqGZMyn9JgpCY5BSuNqyIKV/kLK4olRhuqzpjGmW5od/j7jibdTAKXZgZjzgLTgAEp/QBP9TFq4 LGHktkGG9yZgM9QFWO994kOnn2tRcaVG9MiIYevjBeC+j6mYBao1MTPmXiqEAq8mFQCVjWobQ9P +xPmTVpZYebL4K7mnYrz1pNHCTfQBao/qCxNI38SLliXXLqy
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
index 5531b096a6aa..fc12624a42f6 100755
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

