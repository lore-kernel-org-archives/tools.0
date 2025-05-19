Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D238B272E79
	for <tools@linux.kernel.org>; Mon, 19 May 2025 10:17:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747649854; cv=none; b=kTdtFWBcWLkjOq0zZJtDeNntJx2Tebft/+LAwYauaCODCZsagwOQ13xn9gfxoYGVPZQJfPaJlF/bKoWA9jkXBlreFwcK9sVKas3jYcpAqSpnSWohigTMAaeIwiw7rGD5LTTlCPFYUkeBrjbqpNn580/HVoFCXyl8KU161Sz0kkw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747649854; c=relaxed/simple;
	bh=Vs66gLXcsUmGqeisBdNu1x8cX+fOcP2H5gLDSnK11ZQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ZIHf2xJxjBI1v05pAq7OHDKuwIHr0n0OkvAJSTIIAEp0HEvTTOrplV/kER/uxgwRoRNHUIs6NpblJqm76OLvD043LObggK6LN+f1wPlB5UCmpC9V1CkBwGARKOtdINXbh+OfOhjbyFxQo0kawCfgTJf6Ae6xi3v4P7r71qcCc7c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=0PSpJotn; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="0PSpJotn"
Received: by smtp.kernel.org (Postfix)
	id 6B6F2C4CEEB; Mon, 19 May 2025 10:17:34 +0000 (UTC)
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 88003C4CEE4
	for <tools@kernel.org>; Mon, 19 May 2025 10:17:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 88003C4CEE4
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-43cec5cd73bso27816175e9.3
        for <tools@kernel.org>; Mon, 19 May 2025 03:17:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1747649852; x=1748254652; darn=kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IdEwAFYmR+6Wp+ieT8mMzPzG03Kgg+/pltuBC7l2vZM=;
        b=0PSpJotnH2zAh6PqOCBTmsd4WlB5OYohx3BNoi1OTXclhip1L2sYAXJtsrizeqirST
         oGfE1r+Xlq88ysvDFU9mSzSQVW9np4Z/BqWZIOK8SgIwxPQJQibIkTtyVHhDXOxPxLFc
         WLViJuR6zhsEMmY2fO5uJHb+HQj3qC0oKY3IXWRtJ8fPaxqJauB8+Zs0CHZDVEKsrRAY
         yuRr2iSmHuSPxBYHdiCyirzxS32NUqLc+Nnxe+aDjE2wHBhhTvgmNJAU38QRDOwm8eiI
         ohAC4TY74MmzSAly4ZM7PgeouXG67QlqNISbkVrCZz/qNfiqmksuCsh9IaGa6lYoYN7F
         9ScQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747649852; x=1748254652;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IdEwAFYmR+6Wp+ieT8mMzPzG03Kgg+/pltuBC7l2vZM=;
        b=KSb4dkwdRA+gX6EUwuEMieTDj283dITd9gwKfkGa6w85t8CwP/IaSl1X0vbmN38XH3
         eMbYkYgAZYc0qViShznRy8Asd+S0/udICvxbLa433nma7jOZx7nlGW47q/tX9EJFB4hm
         Eb4JKQuADUoMIjKcLcE1MQFC3VJN3wjKUA3pvIVbGcG3QPMuoyQCvgs/SfUuBfEXlqB+
         iZwGW/1ibslF2vqRw4yn4hj4SX+NBr35YdgLkogwG9vk2CtaxJx+jdUvUrocNntfqsIU
         Fd2HuLsKkbdVe5LChHXyBhYICzT5Xzzx+PLTE0G+6SSSCEJe6cbvbAAjVyw/AptNxNJg
         8XnQ==
X-Gm-Message-State: AOJu0YxPOeYTxW56haLVS3GQ3vwI63oywXXDotiO0Bj7oVYGdxER9Rbp
	Fo401QX7BHKqAUjGSc4KkBXbal7QRnEkJJlSCsmIgVAwJuKTDiR/qSEnIr9XXyabts4=
X-Gm-Gg: ASbGncsz2+H02sAHQOmeiQF5fY96cmrCA2/3l5B+nyxJ/TqZ2hvJj1UFybM7nVZ0XAB
	EiW5B9OSZ1URSyFRq1Eha3ESS4vxgJjIEA51F+tjNgdTq0eeu3KihnVMFzcd8y7NBAA747KEOEd
	kl2utLU8xC9icImlxHchpxZ5vtR+LHxmrgbWIEk0QDt+ZfB5BXfKL7+T4zfnNg22cK4Qgvl5dLW
	JT6IluExOLYUEceDb31Vz2a7rAqlBA/ixH5kr7ChNZf6FjGmJ4GUWQVdYy3SXtYBqCjE6wieZI5
	Up3jhdj6EIKlXeQujQ4J9d+0ZMZM4Fh+k35MyB4gIgkYt7r6ZF78Sjwenw5w/FXcRKEEz+pcn7D
	+9tpgcg9SulHjmVoAvQ==
X-Google-Smtp-Source: AGHT+IF5e2ivx8tvge0wiNKAxsULhHKo67zdLFf3TeDcd6aGiTxhREVsniyNr4Hjk9YFir+fag8KzA==
X-Received: by 2002:a05:600c:46c7:b0:441:d4e8:76c6 with SMTP id 5b1f17b1804b1-442fd675b5amr129040285e9.30.1747649851574;
        Mon, 19 May 2025 03:17:31 -0700 (PDT)
Received: from localhost (p200300f65f00780800000000000001b9.dip0.t-ipconnect.de. [2003:f6:5f00:7808::1b9])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-442f39ef400sm198678965e9.33.2025.05.19.03.17.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 May 2025 03:17:31 -0700 (PDT)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc: tools@kernel.org
Subject: [PATCH wotmate v4 6/6] make-sqlitedb: Don't consider SHA-1 signatures for trust paths
Date: Mon, 19 May 2025 12:14:36 +0200
Message-ID: <20250519101429.1558947-14-u.kleine-koenig@baylibre.com>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250519101429.1558947-8-u.kleine-koenig@baylibre.com>
References: <20250519101429.1558947-8-u.kleine-koenig@baylibre.com>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=802; i=u.kleine-koenig@baylibre.com; h=from:subject; bh=Vs66gLXcsUmGqeisBdNu1x8cX+fOcP2H5gLDSnK11ZQ=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBoKwSWrSAyKKJ3EGLJpiXL+uRjYu9dEGHmM8SLQ 6c6eGOvDxGJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCaCsElgAKCRCPgPtYfRL+ TqYUB/94U+QJUZ5VyVzs+WMVzBNepmB9ikvraLamcWOaFtbY8EtqlKUnB592TVxURvqHaDKEi82 vfnIN0GsOgAa84BRvqzc0q5YtzXE3HXgWZWsgWos+HwLkOwD57j38XC/IpoC1iElLbaDqj8JQnK odAXrU9yf8VeyuvS1v4T+FqP8C8U52KYuvY4zs1sXdiDbn9xLUosfttwUL0T44JJpsD2qQpWQ5h kZWAikd+KS82++ft8feCkhtlqJ1sToZnH+5cW0eVlJ+0ZOJcWW9rzMmVg0gNmyrM7BNtrKw/lvT TMrm18iuuVeGypJcs/RtZZaOhTUCXfBuA+wYqP2dKSHC2GZQ
X-Developer-Key: i=u.kleine-koenig@baylibre.com; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit

GnuPG stopped trusting 3rd party signatures based on the SHA-1 hash
algorithm. Follow that change and skip these signatures.
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

