Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78AD01CD213
	for <tools@linux.kernel.org>; Fri, 28 Feb 2025 08:08:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740730139; cv=none; b=hEihrhQrvmV1mTN3FYCUhO3UpVpedzxaUO/xue1+gMR9SCEVrFVKEQXK7oIFwp4y2o5nV5mG+t8tWC9AxKY71cHb4ygqtEWhS+gpeCiv1kGFo8tIo7v3LatouaKNGGvDQW4pE2n1aNuDdh2ndLtcXOPvHgDD7akzgnSKTyDo7K8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740730139; c=relaxed/simple;
	bh=WkGUvbBVAXStroKlVV/EDj7GFDnCNiI71vqXOZT2g2o=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=gteH5HyZLf74mJWBdnj3OEbPYVYkxXVdVxJay6A/HUWklEuQ79mGPLVL/dZCjgVFt1B+iXUFJlKk3rncLEowATmlJV2vxxWUd/na66hLbUYMerubInd05U5PC1snh4tnvmH5SKXH16bdYyrdGXzvAc0Y/AGIFd1txw8QqPTuesU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=pOaGIgK6; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="pOaGIgK6"
Received: by smtp.kernel.org (Postfix)
	id 6E235C4CEE4; Fri, 28 Feb 2025 08:08:59 +0000 (UTC)
Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id A7AC7C4CEE5
	for <tools@kernel.org>; Fri, 28 Feb 2025 08:08:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org A7AC7C4CEE5
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-5e04861e7a6so2925960a12.1
        for <tools@kernel.org>; Fri, 28 Feb 2025 00:08:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1740730136; x=1741334936; darn=kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tQm3STlr/mCjMcikHznXVSUxTc2sXIdQQDIMcyNrNtQ=;
        b=pOaGIgK6YzbwVHszkPA4TU7UtpHXfSjvTrGMgVmT2+I4JCI/WRcoaB3BgoWnMulLHN
         MFPZDLhaB1QD/Xq3+xER7f8/W6Q6y2jphxnMjgJwfff7Anew9Vlac2OWZF+UYSnWS2ir
         h6aVw3KNpFbL68++XVuZNgs3zuIxIwX0pJXSV5JUF/TIaLGkuFt0JDQe8HPwSTnbQr99
         8gjSyuCQB/eIfkxYtLJLOzJpgN5CgaszX+vE4L7r5ATaOQ6U4uc/cbst4xn6GOcPxLQV
         CcxQj1tarkJVPDu43DyQv8TEMNGVPY9rTuzxbfH0F+X36oRq8rX2nji8nWSrDEpwxuQt
         hpvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740730136; x=1741334936;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tQm3STlr/mCjMcikHznXVSUxTc2sXIdQQDIMcyNrNtQ=;
        b=GF9eLcyIgrMDkdoUybnZbvVNSe/C1qHINasNbsn+/ERm29pywRFIDNQbimJYNFEuEb
         AlmBSjH36Acj1y2XBMWbk2YTFp/nV6P4uFHKMn71zT4LRKpEE3Xhu80idzY9ca4Hvgf3
         ZwkVTGTs99P0zxWb0ud/hq6clBhhsWLbuhxDHcx0uq/MtEYsnI3Xb7DDvG4YJebDJGA7
         SQwMzUEUlhhKQjoToHvSefUokyonoLKvD1dBXm9shP0JsCMowz2D6/7bj7PcouVULQh4
         ojOjHhk++t5kxFy7Wzmj1MF/E787EwrD+vtON75+LZ/rBWmu+2biEdiGDqerDdl7lYRx
         9wYg==
X-Gm-Message-State: AOJu0Yx9/h5NDEJ4s/YYOW+CAFDaOGsHChh/r6ROuozuBo0yBNc2F47v
	JjDAdtZYvr8Y6MHp+6XeumxcBXAeF3UQnlrLXEddY3KG2POiZqS/jCr8a3VDmbc=
X-Gm-Gg: ASbGncvSvS4OReJc+33Z4b7w11y/xoR6D0ZtyIX3DrFth095oK+Q+4Md5xl0yZsnbjM
	7YE3cv+624t9+0vOmJ8jWCZaCUxZEr8UuWSMPFkGewrkJRSrifOcQHMYAl81RBe/QF9Gv7Q8hMo
	ix+V4P/FiLnYRAaTBcGBwpo4QLkSVcOJTAK62tJwYcgu+G48cVBtKkfS/w+0HI7rw8RkPOtb0Kz
	YjrrL84K/m0kgjLQkR1PaSXQlT0Y7My+P+RLePnLeoDQvosZy2uDWhTXOfOgbOF+sGZob8i29D2
	alHD/mGvNZ3YGhLbg7gyScl+NTLjjv3j7n/6VyAxMOQYCuBWOBVE/Ku8d+RQ5/1O
X-Google-Smtp-Source: AGHT+IH/RJaEptaMIR7c7OMh90qlOXCO0x5iPJTvK2JiN6Q0lE4TFOsMdLaKUCDx/iqDm/G3wUWLKg==
X-Received: by 2002:a05:6402:3487:b0:5de:3478:269b with SMTP id 4fb4d7f45d1cf-5e4d6b75ef2mr1478076a12.32.1740730135968;
        Fri, 28 Feb 2025 00:08:55 -0800 (PST)
Received: from localhost (p200300f65f2c000400000000000001b9.dip0.t-ipconnect.de. [2003:f6:5f2c:4::1b9])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5e4c3b4aa13sm2123606a12.7.2025.02.28.00.08.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Feb 2025 00:08:54 -0800 (PST)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc: tools@kernel.org
Subject: [PATCH wotmate 1/3] Fix foreign key references in sig table
Date: Fri, 28 Feb 2025 09:08:37 +0100
Message-ID: <7f1715b0c1bcffac8fd8d2ba7dbd3e79439fd140.1740729275.git.u.kleine-koenig@baylibre.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <cover.1740729275.git.u.kleine-koenig@baylibre.com>
References: <cover.1740729275.git.u.kleine-koenig@baylibre.com>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=846; i=u.kleine-koenig@baylibre.com; h=from:subject:message-id; bh=WkGUvbBVAXStroKlVV/EDj7GFDnCNiI71vqXOZT2g2o=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBnwW8GAvJy5Q9TqlX7zPrjgbmxP1hc1CLh9zFrx 10c1ZmT3xaJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZ8FvBgAKCRCPgPtYfRL+ TgslB/4z6PUbxkEAAybdg3WoE0aR4q7pYmK4cI+JGLUU6+3Oqlbuffwo/NaMGlYxej1pgZhTuWI yBgVgjvcTQHTTaiKlMmO2nheOlzkR1lU7h9TQ9qJyk9Tyy+vcdVGr4D+EwdujF/TVz7R0b/i96q 1aq3PpgJavNHB3KxSVHQofNfzKVIeMSA74DXNZCcJ+b+7rtKoydoP/R6NNOXxr0XhKD8rPnCYnp 8PxUVxIQ5/E0ha+No++7Amf0S5BYV9FSfCb0t7BTdrpUUfbqHhy30KXmQB7fxBk3mKEavOz1/hX oIh9mFLMQYkjugwOfTvjg4QpaLJ+nfPvsiFcBnMxlrnrkM+R
X-Developer-Key: i=u.kleine-koenig@baylibre.com; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit

uidrowid references the rowid of to uid table, not the pub table.
Similar for pubrowid.
---
 wotmate/__init__.py | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/wotmate/__init__.py b/wotmate/__init__.py
index b947a41e7eb2..402e9dd735ba 100644
--- a/wotmate/__init__.py
+++ b/wotmate/__init__.py
@@ -140,8 +140,8 @@ def init_sqlite_db(c):
                   created TEXT,
                   expires TEXT,
                   sigtype INTEGER,
-                  FOREIGN KEY(uidrowid) REFERENCES pub(rowid),
-                  FOREIGN KEY(pubrowid) REFERENCES uid(rowid),
+                  FOREIGN KEY(uidrowid) REFERENCES uid(rowid),
+                  FOREIGN KEY(pubrowid) REFERENCES pub(rowid),
                   PRIMARY KEY (uidrowid, pubrowid)
                  ) WITHOUT ROWID''')
 
-- 
2.47.1

