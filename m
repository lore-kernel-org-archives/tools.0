Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD84627D764
	for <tools@linux.kernel.org>; Fri, 11 Apr 2025 06:42:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744353767; cv=none; b=g55g5mqSUjVtaJx5PUOARmEtKnxWeiKqWGvMdbG9GlFo9cN4Ti/wC6QtaIk+hdXTveQHrWlYHuL+S+zgF8UbBTUT1I5DIUuZkAs9Xl6zvHWpMGtkOhIJ09UZCp5blJ+FAnAlCLLFu/yyqcM2VnVCbISe1s1sWhZ4cfOtVOf2KTQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744353767; c=relaxed/simple;
	bh=1mZltoX4b2aNzqS9j9qCRaFP72g4j0sbzFZMDS3WV4c=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Qoejoyj6weR+pZXH7EVST0/v7jSYLVBaLbEetTlgsNCZn57/1qfYByCzmvAMjcXn9JI/wMT4wv3qr12WE3a9OQ/XebDh7N7BJjUTHCnq02kx6Z/ir8CELSxgBzbz9naoy0Rqng0rO6USy9g6vCKfQCCaNr1KdgDwmdWHLd5RtZs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=Qs3iaObV; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="Qs3iaObV"
Received: by smtp.kernel.org (Postfix)
	id 27DE9C4CEE9; Fri, 11 Apr 2025 06:42:47 +0000 (UTC)
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 00BBDC4CEE5
	for <tools@kernel.org>; Fri, 11 Apr 2025 06:42:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 00BBDC4CEE5
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-ac3b12e8518so270986466b.0
        for <tools@kernel.org>; Thu, 10 Apr 2025 23:42:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1744353762; x=1744958562; darn=kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=FmjnXWGJrktk8pCFQFp3RkH+oDPKoer0iqFwMkYSDwQ=;
        b=Qs3iaObVy2EBTx4RmVDYcoAdsWfBg3z2nEQv4oJ0tLgk0M0T8g6UBedgSNwBpvkUrA
         t+OxcE3mXewwlvTC0qiRn9Yop+S2ww0XfdzXrqswSTHaYh/+PpAeQY+ea3xr1jyhyJxX
         tdI70wP+c4SZt9JjnBFR0uRT2JoWCdgNe5JMJvUbqCIIKqov56cW0NskZcAbytCPBSdK
         wp3zp1H/A0LiA2DTjxjWTP+AYVpvZkOKlIylbpuQvG4MTZdjxsQMg9hzXIIJCt+CntnM
         c79OxtJpkDTdUAuiolBXaA1eyyWh6o0/wZeGr/nDZbaxDnXAMmS9xPrOtVrAl5/nsFuJ
         EwXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744353762; x=1744958562;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FmjnXWGJrktk8pCFQFp3RkH+oDPKoer0iqFwMkYSDwQ=;
        b=efCVPMQdy+hxZj58ohXUzrI+uQSxNaIehAPwoL/uRgPf3NCBXQasNiO+wTMHr9yAK1
         L6CVXO2Ri7uKTp44nqgCHALQybvKZnivQIvf9UPQskj/U+KRkJ7gfDH5MRTsgBS5aBT+
         C+ca54kxDVJwlna4p+hk92CxOw4xNzFH57oxjZZ60aIBVQWd1/urebVue2xFe9BPLykN
         mT6nPcfaxTQdhi+ojtVeMSZP+2JBZeCkm9KR8BW1eu0+k0hHlD2/Lw748QE4GxrPQZD3
         DJiy1Zx8HMk9MU2ZOmYx3YxVXbhacMM08qHefxox9loYgj5PLUL9Wf9ZTmUbeBQ3d1Lo
         ocFg==
X-Gm-Message-State: AOJu0Yzk/O097PiJsFQBTHhfeDc5RkcJCaz2oN1BkMJip/Ek8XEFSE0v
	uD+zt9DysidOwueVmu8vMmKf4cYbiYu6zIc0bfuGjQ5kNVpTFzyyRVDYsnylTYdr1YhgxQZg0J8
	T
X-Gm-Gg: ASbGnctysuch03s4jmNG5E0blwO6pp4RjgPS6sYYncz26TYCJox5tT6l+dms3QgX8Sb
	C/ebZOWlQLXAbWPwCAxTvHdh7AYZ1lDpQJcd6+J1kvmLlLpvoG9GxvHVisdcjdUgSwsy7v3XnG5
	KER+ibtOBGQeX3kMbFSsk1YLKXKJTKfhPaqbdc+x/zRXadhYP+72V8Sk40h1ixxyUHtbQG9kbS1
	N0lf2fW8EorpN8r/rilrkTTX+G4lTcZN0XL3hkQa9KS7oWaetUk9zKWSjxhX/iiTO03R7c9cvF5
	xXirl8XIND1M5S9mWHiROARmkY8BKJt7zSGV42Lg74rfSw==
X-Google-Smtp-Source: AGHT+IHV1ZuUPzg4yEgyHYWzQY+6OROM0y9zG96BAjLGKaQnISxGLcncU89A5Wm/gHJoyXA2Bhx1tQ==
X-Received: by 2002:a17:907:25cb:b0:ac6:b8de:1a74 with SMTP id a640c23a62f3a-acad3488bbfmr140912166b.15.1744353761891;
        Thu, 10 Apr 2025 23:42:41 -0700 (PDT)
Received: from localhost ([2a02:8071:b783:6940:36f3:9aff:fec2:7e46])
        by smtp.gmail.com with UTF8SMTPSA id a640c23a62f3a-acaa1ccc363sm400440466b.146.2025.04.10.23.42.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Apr 2025 23:42:41 -0700 (PDT)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc: tools@kernel.org
Subject: [PATCH wotmate] get_key_paths: Fix keypath for top key
Date: Fri, 11 Apr 2025 08:42:27 +0200
Message-ID: <20250411064226.1461929-2-u.kleine-koenig@baylibre.com>
X-Mailer: git-send-email 2.47.2
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1154; i=u.kleine-koenig@baylibre.com; h=from:subject; bh=1mZltoX4b2aNzqS9j9qCRaFP72g4j0sbzFZMDS3WV4c=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBn+LnTQENg6DxGJjTDO+Oj02KUkzjeFDrH2p/W4 xbE9zDiw6uJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZ/i50wAKCRCPgPtYfRL+ Tr1+B/kBGjWnCyE2m9Ig6ljUE0i3tJyL80kp7VyNlA+7Dnjd4Zuf9we02QebIcjRZb4cahMHiV+ HjRGWwwJJ18iwhST8ebMrh6+pSyDlPq8Bw55IeRkf6SufDsFksW3XdmDcd8hU8KrOYh0NfVwqaT IpMh9/FO0eSqWFMkPFVYpVOWWOtEvaTOm5fFQEy7kTThg2lUzup9xLXKkkOpj6QHAZbXWePBV0i RWem3IwPsEBTsokbCjTH03SYb6iJ4vF6mgFqqfuKc4KV9tgiSDBBxdX1MlYqQPlRp6uZJZjQPf2 PqlZ4YJ35t/jF/MbTdjWLrHaAQ0vsX5sDi7QilrQqJ00aUF1
X-Developer-Key: i=u.kleine-koenig@baylibre.com; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit

The root key is trusted implicitly and not because it is self signed. So
it's trust path set is [[$rootkey]] and not [[$rootkey, $rootkey]].
---
Hello,

this fixes the issue with Linus' trust graph that I found in
https://lore.kernel.org/tools/6sa3iqt64w2vxne3h2w7oxuna7wae5o3ko664vvrd5aqffk6zg@v6iioe56nnma/.

With that the text representation of Linus' trust path is:

	from  Linus Torvalds <torvalds@kernel.org>

which is better than before, but still a bit ugly.

Best regards
Uwe

 wotmate/__init__.py | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/wotmate/__init__.py b/wotmate/__init__.py
index 32f91cf2a75b..20e7a9a588b2 100644
--- a/wotmate/__init__.py
+++ b/wotmate/__init__.py
@@ -348,6 +348,10 @@ def get_pubrow_id(c, whatnot):
 
 
 def get_key_paths(c, t_p_rowid, b_p_rowid, maxdepth=5, maxpaths=5):
+    if t_p_rowid == b_p_rowid:
+        logger.debug('Bottom key is top key')
+        return [[t_p_rowid]]
+
     # Next, get rowids of all keys signed by top key
     sigs = get_all_signed_by(c, t_p_rowid)
     if not sigs:

base-commit: f146a1815ad93b2f318e0a5fa857b11814a78b8b
-- 
2.47.2

