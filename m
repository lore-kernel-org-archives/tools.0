Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39F3F272E6C
	for <tools@linux.kernel.org>; Fri,  9 May 2025 08:11:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746778294; cv=none; b=VaoETNp4u9ddkgyWPK/6glz09/pDsL5lGtKvTL2EO5dBQwxR4gBfi8z+kCaOi+em/ubP0f1JcZ6ZPkc8TwdtPWulNRxTWTsEx4eEewBpZi/2nq02LI0g3ahPrKEusKIPIjMq7PfO+d4I4zs0xJ5EIHBs+rcEWG9KAWHXgAnOsnY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746778294; c=relaxed/simple;
	bh=xrkqhv7od4lwlYk30DAeIWn8QPvyGOEgeRrOFhHxQRE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Jv+FLfG3dcE5kZf6bzDTG09oetw2eApn94x1haPKDzOp/zU54epbdaW2PBAdlnF4/dVxTX0KkMmH1SO5i0Kg0CHcOButbZwTRTI9nDK4LKCNHRaCCqALNw9WoQfPIFQamSf/amT2Wvu31cViwLXUggC/zr1WJVkPAvLxHHxmiys=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=TRNoFsH6; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="TRNoFsH6"
Received: by smtp.kernel.org (Postfix)
	id 2FD35C4CEE4; Fri,  9 May 2025 08:11:34 +0000 (UTC)
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 90598C4CEEF
	for <tools@kernel.org>; Fri,  9 May 2025 08:11:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 90598C4CEEF
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-3a0b9625735so796506f8f.2
        for <tools@kernel.org>; Fri, 09 May 2025 01:11:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1746778291; x=1747383091; darn=kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Hl3+Y308S48HQySFF7LW0AcmwDSZRgVfwqzL4MuJNY8=;
        b=TRNoFsH6BOjZieiftfIU0H3tVKppQIAa7wf4XsvwIlO2c03bOz+7Ar1HBla1GM7Qh9
         jihuQr86uefxj7f6/f1mjiHNITW2P+O1jxtgg2z2fAb7SQhWPSmCNeq7AH0FcEjJ3BDg
         QVA8TIL6DHMnTrESJFgb6NXQh+PwQoaR6dWrldmDXJRo0EFT9auWTS6vBUn2h44uOsH2
         Qy0+CYIRQ73UpV2kvS4cbDJKdzPx6+Nl00XIdlS2BGx0ApQAIeao/JAQhpeAmFRWMBQA
         4auIaqfFhIxMM5dROlmhXj2ULSkMtLfeTjdUwXm49yr2/7RTqHWe9eawbadGdw3FzYL+
         lofg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746778291; x=1747383091;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Hl3+Y308S48HQySFF7LW0AcmwDSZRgVfwqzL4MuJNY8=;
        b=gYTpeTPPd3cLJ/wNGkSkpe+i75Ud80ExlwsDpqjJPjuQ5eLhZqNPTcNYVDCU57cEqH
         O8QwltUe+HIYTJHvxoIywiKQpO1mNYMG3xN2QNOcUgmyjLsIcNms8hMxSDYPNxlas1sx
         EkoOiOLBRQP39tRcS0Drvh0dGQ+h99Xee7BTxNmKPhfdD9Nxw3lkLvxxRXlYP2XXznyJ
         2v/8xsS9/dmEKyZGtr9XE4yCHiedHPtZXlbOa4DCgF8OnRNT6CLxhigS3lPnNfHLgqZH
         PWQeA8/HOmkfGnZi78ItFbg0l1IxhnNhgFL3CjFzLkeEtuSF78lIGUGFsubz5RLBV4qe
         zUwQ==
X-Gm-Message-State: AOJu0YyNPvD/mhh5/9fLrw6c0uowVUpvWiDlf7/jCm547JLwD120F2hN
	QXUSxGnckVcwaquUnbf7uv+wX4JA7md7ONIltTDV7AFqssljjGId+gl0FpPT0lg=
X-Gm-Gg: ASbGnctvsWVTqohzOizihdvvrt0hueXDFv800S/NrDZZqZdLp/lZhFostPVd5GJ/gwM
	dg/zf7ztJvNaiOtOVYmWIM6gJdA7DC8Bf84mcs2v2s1Nq0dRUSBjSqNGmo2vzXQRl2HD5P4lITr
	BF9J4OhPxaTtIIjAPn5RfX3c/fdXm9i4+WMCcncGBLkoKBgOpaOa9x8CfQRlp7/4mIyBr7Ya8b6
	5c2ePSr7WqcSIF5VHwEMABjnBbvG3NvJ/Aj5uho5/QyYG2RnrezJxdwKp5NSDXwv8HOxQryt1yW
	WU6evNc6J62t/Ep/NrQNGv0mUN3NZrrxDHAY4yahYXGosmztXBe67b2b++0zCiLruPEGPffD/z5
	sUYWpz1g=
X-Google-Smtp-Source: AGHT+IG5uR1Xdn7rUFRl81dqav0x3Wk6bGzr22p7WxOTLEsSZPY/HvzPRqQkKlWH2QOKrCHd8gxEiw==
X-Received: by 2002:a5d:5f8b:0:b0:3a0:b4f1:8bd1 with SMTP id ffacd0b85a97d-3a1f64ab2b8mr2265137f8f.52.1746778290839;
        Fri, 09 May 2025 01:11:30 -0700 (PDT)
Received: from localhost (p200300f65f00780800000000000001b9.dip0.t-ipconnect.de. [2003:f6:5f00:7808::1b9])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-3a1f5a4cc44sm2399162f8f.85.2025.05.09.01.11.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 May 2025 01:11:30 -0700 (PDT)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc: tools@kernel.org
Subject: [PATCH wotmate v2 4/4] make-sqlitedb: Don't consider SHA-1 signatures for trust paths
Date: Fri,  9 May 2025 10:11:02 +0200
Message-ID:  <571a1147310545bcfb446dd47737a574b1b03b93.1746774817.git.u.kleine-koenig@baylibre.com>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <cover.1746774817.git.u.kleine-koenig@baylibre.com>
References: <cover.1746774817.git.u.kleine-koenig@baylibre.com>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=885; i=u.kleine-koenig@baylibre.com; h=from:subject:message-id; bh=xrkqhv7od4lwlYk30DAeIWn8QPvyGOEgeRrOFhHxQRE=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBoHbiekKjkksvaS3ciOQhHz60p5upNoJZ95nEAz dZDK5F+bfaJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCaB24ngAKCRCPgPtYfRL+ TutYB/432vkseWpk1zw1q8p1RO3VcigQF5KvREzQT9/0nZO8qevFdh50KqYLz8y3lXFRVw/xNsY OK3a5grz9G/lHkHK91TgLrG8cI+n7MKd++2eap+V/DG9/Fp2dsPDwKc30gRca9+Z6FuMAzVn48w v48c40HF1GYfXn/EZwktlobp6KzsIcIUeXpP7jyOdCDSfx4t9IX5BadMvGc9sw77id7xaTrY9Fk yxGWTlaUeRpNslZtAeLgwteaGL7YrVTRfTn9rkA59WvDGzpADoij5yeQSlnfFPGgIXMtNLxWRu9 SpR/QMbgRr6hZLwd7rp4kNXMf9aCXbFgND81nwvSSJFuTjJi
X-Developer-Key: i=u.kleine-koenig@baylibre.com; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit

Following GnuPG (and other OpenPGP implementions, e.g. Sequoia) and stop
trusting signatures based on SHA-1. While this modernizes wotmate, this
has a considerable effect on the model of the kernel's WoT.

---
 make-sqlitedb.py | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/make-sqlitedb.py b/make-sqlitedb.py
index fec199def51d..e8c5969f4d50 100755
--- a/make-sqlitedb.py
+++ b/make-sqlitedb.py
@@ -163,6 +163,11 @@ def keyring_load_sig_data(c, pub_keyid_rowid_map, uid_hash_rowid_map):
                 ignored_sigs += 1
                 continue
 
+            # skip SHA-1 based signatures
+            if fields[15] == "2":
+                ignored_sigs += 1
+                continue
+
             # do we have the key that signed it?
             if sigkeyid in pub_keyid_rowid_map.keys():
                 uidsigs[sigkeyid] = (
-- 
2.47.2

