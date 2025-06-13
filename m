Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E7642DA77F
	for <tools@linux.kernel.org>; Fri, 13 Jun 2025 08:53:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749804822; cv=none; b=khp1FP5LAL2Su25DlvmmzAdobrfr5kjMcjJv7dxyTeJmjyuk3qaI5oyMwkhm7rrtrGl0IGkMK70dcWIVmwy4p/Qr1uQlRvoHp9GGKIUpoUjmSGby5fM3jPZSM3h6iFU45OonYIF5fEPFNPpQYNRF+06w/s8udOefPZPA27rNPuk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749804822; c=relaxed/simple;
	bh=BYL0drayU+PIgPbOiO8h9tSVs4tNpRmXrE89+KLuhT4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=oN2Mlm4VnEAg9Kb0T+CtlTwUnekgab7rvguw4QRGVPPMU9+Cd0oqUECtzKHKi5zivdu5fSyNUBFshw+560Ad11BoSX+9zEIpaonrW6HZz6wRFhRi57whHHtUuU9Q6tb56Ydl4xpKgIK4TmTXg8yMgKIXjClslygIq78RR4CEKsA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=g+I7rkN0; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="g+I7rkN0"
Received: by smtp.kernel.org (Postfix)
	id B8D81C4CEF0; Fri, 13 Jun 2025 08:53:41 +0000 (UTC)
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 34F13C4CEE3
	for <tools@kernel.org>; Fri, 13 Jun 2025 08:53:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 34F13C4CEE3
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-ad8a6c202ffso342392366b.3
        for <tools@kernel.org>; Fri, 13 Jun 2025 01:53:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1749804817; x=1750409617; darn=kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=14Hyfg6iCLvQoEC1wgjPWPMYt+gsmMO1GV9NRoGzktY=;
        b=g+I7rkN01iQn2gsAY4MP7CwyQKCazvyXJwJcqkyBUY1oZwcPhEVivzHGrIUvit7gTv
         tcHROTos/mszQA/sQa3UQxEtnjWyFbLPRHL2bhwXMRf4ZfUJriBTrWgar6/MKyLG65zx
         nIEkCkSri7yiuxItqhQBaf9awFpeclBT9pyexW5qle0W77796cbkoqg35gqfeqhSMfDN
         kxk59K4GnNTD46k7bjAd4lsWlHuAsPY4ghRRBaSbuIZgw5QzeF+BcznyGXF4Rs/KNJ+X
         IH//duFIAiGnOja6k5ZRRQLEzwxi/Pu6ZhI/d9o3jFtxn5tr4bWDLOnu2HCeS3ID0cEl
         NBcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749804817; x=1750409617;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=14Hyfg6iCLvQoEC1wgjPWPMYt+gsmMO1GV9NRoGzktY=;
        b=aLCFEsd0yTTUJjmfRsdcZiTKnSLaBLzecyFJ9NyMUNco7ZccW1y434vf5TUd44wod2
         u7WixWhJ4vxyT+/alXtM9U4h9vXGLOswXyrEMwuJ4kJ0cDcGhZS0gM8xoU7R+FiJi+RJ
         lRU9Gse7ri0WD32igrRTEIk0HyArN8GE9vBhEV+7CbWMp2rd0K6X2VUhev9qh1m1eIKM
         4KCUl8ntTKIyMHLMfup/fgvzfA3zQ6DJE//e9uVbf4+RUJlOkdVQ9Mefv0j6nxxm4e6Z
         DiLDyX8+7Xji+nMdYxRSUSFmUOVUuBqHU5tttsOEQfgw3LIAXScYa3w7uE4xsKLz6aSj
         czzw==
X-Gm-Message-State: AOJu0Yzq4e/ELRZnH5HoJVh526Ehn+5MopgE3bwn2CQTB5E6D2USWsj2
	haimJ5acM7n+tmbKls58tQ3JecKLmD1EccJJo2doMD9tzR8FXBtWP5v5+7JboBRXoVei5jLy0jH
	IU8/c
X-Gm-Gg: ASbGnctzSpMHnzs2XmGGVue1/C9JKlCiFXoZka/yctSgHDIN2qkP87VPsfaCASXdJ0F
	mSv038GR5yBUQFCMuGNmT8+9jPSslOAxBaC2pT4OpZeSOv9HA35mtkVai305opEPKVmcaPn2ZaM
	nhzd5S8RNhKK0sTGb3xtLwdcQdnB4mWBA2f79fucylPgRoDAFFgLMonhFSLPIEaMZiwV07Td1eL
	AZA8bVVclk3S6nfaGsAzqFDBk8nopXFigamqOJXlXSpPWuHGm5b3vw7oT9tP8BU5TPbWRX5Ydyb
	0tjcq0b2oJ4II888bPQbDuPyaLxhgCLRzAOqAv7aUYnAkoYSGaIvKC0f/o04XY7ELMs=
X-Google-Smtp-Source: AGHT+IES00vQwqSyIl/hFwaahGyKVqVFQ/N4Wn8ZUR9m+cVR/RDVxO9XXXJ9+v5231dvj9TuKkonhw==
X-Received: by 2002:a17:907:9344:b0:ad8:9c97:c2eb with SMTP id a640c23a62f3a-adec553baefmr247888866b.19.1749804816753;
        Fri, 13 Jun 2025 01:53:36 -0700 (PDT)
Received: from localhost ([2a02:8071:b783:6940:36f3:9aff:fec2:7e46])
        by smtp.gmail.com with UTF8SMTPSA id a640c23a62f3a-adec8156ed7sm94242666b.37.2025.06.13.01.53.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Jun 2025 01:53:36 -0700 (PDT)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc: tools@kernel.org
Subject: [PATCH wotmate 1/4] export-keyring: Skip graph generation if the trust path didn't change
Date: Fri, 13 Jun 2025 10:53:16 +0200
Message-ID: <ef678713de0a9aec1c1f07d92faa29e1f5b5e4e5.1749804735.git.u.kleine-koenig@baylibre.com>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1490; i=u.kleine-koenig@baylibre.com; h=from:subject:message-id; bh=BYL0drayU+PIgPbOiO8h9tSVs4tNpRmXrE89+KLuhT4=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBoS+b71o9C7wX6GECtnuaO6Ikp/2w8/0LxcmEi6 9lZQlgynheJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCaEvm+wAKCRCPgPtYfRL+ TkDEB/0eu1LxlZtwZOkAHLgAx2rkNtQfXSLfQL/ZD0VLw7wY8X0N0922gyOjcdirQ36CS5nSFof 9qXY6qoI6IlUencsJtuWD9+KFpCeIC1u0uAA7NOR73PkzescqL3IznFQLg+ynx0pnV/qIqWOmX7 L69l5dYU+8ky9YEo0IXooRZQS99FwiYVZJzs+N/b/cB6QSTdGMfcAhxdAuhEtDWjIFDe63Wwp0R 4Z1A5OMDW+htMB8sHyhUPocYI6L09/FT+opt77i515zVojC3diRQQSVEMJnxZrXAD467OcR/S9+ oaKz+ZZ/+C8BcyAkIPWSY9QiON4PCbxLFvsHRVZbbGHzwB45
X-Developer-Key: i=u.kleine-koenig@baylibre.com; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit

It can happen that a key changes without affecting the trust paths. That
might be a new (or expired) subkey or a new signature that doesn't
matter for the trust paths. So always compare the trust txt file with
the new paths to prevent noop changes in the svg representation.
---
 export-keyring.py | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/export-keyring.py b/export-keyring.py
index e6550f8ba429..686c77cabb16 100755
--- a/export-keyring.py
+++ b/export-keyring.py
@@ -146,16 +146,15 @@ if __name__ == '__main__':
         key_paths_repr = kpblock.encode()
 
         txtgraphout = os.path.join(graphdir, "%s.txt" % kid)
-        trust_changed = key_changed
         if not os.path.exists(txtgraphout):
             logger.debug('Forcing generation of the text graph for %s', kid)
             trust_changed = True
-        elif not key_changed:
+        else:
             # Load it up and see if trust relationships changed
             with open(txtgraphout, 'rb') as fin:
                 old_key_paths_repr = fin.read()
-                if key_paths_repr != old_key_paths_repr:
-                    trust_changed = True
+                trust_changed = (key_paths_repr != old_key_paths_repr)
+                if trust_changed:
                     logger.debug('Trust changes detected for %s', kid)
 
         if not (key_changed or trust_changed):

base-commit: 5d335c4d740a12a092ecac3eb105194bb5c0a618
-- 
2.49.0

