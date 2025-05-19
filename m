Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CB4E274656
	for <tools@linux.kernel.org>; Mon, 19 May 2025 10:17:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747649853; cv=none; b=pSLUueI/ieHCTHY8ex+GLvBIWibAAx8Th9xB0BEwoejjvVsF/Tlw7ALO/9YHBImAI7XBNSJxnjji6tXpXjUF4RI/QBWM6ECNUe82iO9KA6JX4mLYfpTJFY8fUOaErPcosuz7eelBVhM0K6Ugz5gVfcPRFWhTntcZaTYwybm57cQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747649853; c=relaxed/simple;
	bh=ZMkBC9m56rZWvzk+P6IdRfssYzpY0JXbcdY1oG3Fwts=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=JTXy2qBrw8HudDgvmMgLixoZvwMqtwO5xWZ8RVXPj0Llst8Yjckggol85xn0S8FpUn+0k8u52LgPtgsALhOT3PbtFsM9g0Xz6uEFIzmANbTrS3eXt/QiUNus7XsA7u/c+ylvCm50w5FoE7xuGSc1PRBZavvLgJvPjYorA1WZzko=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=PaiaJytL; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="PaiaJytL"
Received: by smtp.kernel.org (Postfix)
	id E78D9C4CEEB; Mon, 19 May 2025 10:17:32 +0000 (UTC)
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id EC45CC4AF09
	for <tools@kernel.org>; Mon, 19 May 2025 10:17:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org EC45CC4AF09
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-43edb40f357so33799455e9.0
        for <tools@kernel.org>; Mon, 19 May 2025 03:17:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1747649850; x=1748254650; darn=kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rIMFcb0rsaibHTmcI7aKnU2bp8xcDuOkiJ7i9CZvaNw=;
        b=PaiaJytLBXENO/n4ThPR7rYZNkiS5Pydc4R91tzb99NWPtXCE/zfNNxG9wTlYKuT/g
         ZyTWsQSm+5NPqy7l4yhDSttQKXEmpVP51j+yK/xHXvW5qydhJ0JU28lZmkg20RIg/euo
         5F86q9y7gRBVzxHqSn609DQg4C3z4zFp1M0MM5ujSwscZQEt5ftPc5GZav8Z2aVaeHa6
         u6w5oqFhx4gE1KHTwcTjlsoEswFkLtU33gLoIpMUm+VyBt148K+Y08/3FAJlgapl9FU6
         Mgfn9yEebKCAvCZXH5Dfp9VDlXcBXoMJjNDBPXAvMXB1i9+Tu17yYvuHTKnaqZePkQcP
         DWUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747649850; x=1748254650;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rIMFcb0rsaibHTmcI7aKnU2bp8xcDuOkiJ7i9CZvaNw=;
        b=kTUk8Zwx4mEC4O93GZAV/SSbscI3LB13Z2HXD3du+EOHNufPQeibTz0uj0K/dCGaeg
         bHtEeX+CjoXVYauuwIgi2L/1x4wNwxsD8uqOXztAC+1m7UBNvAQufetsl3fF3xkWNfJi
         kjQNpg4egs7UwZFk+qM7FsWEPEOlZIZLmd0nNZ/iH+qjhoR2rXsn66CQbqN/eShTCFjk
         gOXP/FPuRHrCR2M4vGBtNkFLddEPhuLfniLwbw9XNufHYrYq+XROQRi01eEDEfSTrQ03
         1HJI2c6LFdaLVce4f3/sQQIJQnQat2yUDVa15952k6A4rlq76zrmx/77S8tgZbJG9ICU
         MQmA==
X-Gm-Message-State: AOJu0Yw9HQtMFPEI9wCjT4ZqmWhgMp6Fe8tZ6Q7+1Vi5Wtzm2CRr4qHy
	dOEzBiJbgZeiug5GzbJBbUgTIxWX58O+xfap/7DNUD8Av18RplzrW/4eZtNCSvSiW0ifqExtp6n
	oEZ07
X-Gm-Gg: ASbGncs0k7nt9awzbZwjvOlrpBDslYlP5kWaASrSE4hAT27eeVSYRQTjDjP4W+3u3gR
	PuicL9hMH5uFqW4DlVWR2zH2ldKJ87yQHpcKqCH9SUvnaSKvGnTMWYfnbzyfWDsWbB5Dt/R1bX3
	1n1dD12DRyGarxy43MaYcma8PKFbKOSXnK9/H4xgsDJbtTCSHY0teXuzqTsP9obal3TP+BkgVJ3
	MdWynh68P3TbTPESNt7n/m6m5+bqUDtKn+eJs8lXAOnb5tYvIDS67JkXTcQTghHFGJygJbizyIj
	F+9Vm7lX9pM991fXxlzNwev/fZgrQR/A7MBGdqnYi/dllZMtIlG588VbPQyResSbNHc8eagTv5/
	aWgjz1lfXOobVmQ08cg==
X-Google-Smtp-Source: AGHT+IE9WYFMdAcnwQ2pAA80Xg2+nT8b8fTQKerPWpOezPBZnYpiWY3n3oq0n7+aAtjD3oosNh+ZRQ==
X-Received: by 2002:a05:600c:4447:b0:43d:172:50b1 with SMTP id 5b1f17b1804b1-442fd675932mr114943455e9.29.1747649850289;
        Mon, 19 May 2025 03:17:30 -0700 (PDT)
Received: from localhost (p200300f65f00780800000000000001b9.dip0.t-ipconnect.de. [2003:f6:5f00:7808::1b9])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-442f3951a97sm214161505e9.23.2025.05.19.03.17.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 May 2025 03:17:29 -0700 (PDT)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc: tools@kernel.org
Subject: [PATCH wotmate v4 5/6] export-keyring: Default to store "clean" public keys
Date: Mon, 19 May 2025 12:14:35 +0200
Message-ID: <20250519101429.1558947-13-u.kleine-koenig@baylibre.com>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250519101429.1558947-8-u.kleine-koenig@baylibre.com>
References: <20250519101429.1558947-8-u.kleine-koenig@baylibre.com>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1614; i=u.kleine-koenig@baylibre.com; h=from:subject; bh=ZMkBC9m56rZWvzk+P6IdRfssYzpY0JXbcdY1oG3Fwts=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBoKwST28JnKKCeVO+hZqml4J1+OEjjV5Z0aKH9/ 4fIAR8V12GJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCaCsEkwAKCRCPgPtYfRL+ TsUoB/0RwTCeNDlwUQv7M3cQOfLo+XKPmR3cTUCu35FlzwjrzRRX5ZydmBWO7enp+ZkyRV575Sy e28x4jLEzSXTtHWBdCMoClLu7tlr9/ZFBHFXq7H+PtW8fd5rODZZ1j132w9S4yYKDcCtmSZAHL2 /Xk/UrMzZ832v77QJimirbz+IgCDWUl9DN0qNP8mrGLq38L75bGbo5rbbIL8UfogWrkmkKEvvtk 7DaFaAsUNTgoLkA9YdTaWx8JTe4yhfJ02Itr8qtwjkRqF+vjAK1NF/iX4pxcqfOMRRkCQ5VMERD Su4uZv2lkucNUzpEi125mL4Q+Wdte4G3tUP6Km6rAwOGmMKF
X-Developer-Key: i=u.kleine-koenig@baylibre.com; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit

There is no need to keep duplicated self signatures and signatures by keys
not in the keyring. The default behavior of gpg seems to have changed
regarding the first type of signatures as commit 671a0c921fe0 ("Periodic
update from keyservers") in the korg-pgpkeys repo introduced quite some of
these.

New key material is also only added cleaned, so it's consequent to also
let export-keyring clean the keys. A side effect is that signatures made by
deleted keys are dropped, too, but I consider that an upside.

An arguable downside of this change however is that not only duplicated
data is dropped, but also 3rd-party signatures over SHA-1 hashes. While
this is good in general, this will considerably damage the Web of Trust
in the kernel keyring, disconnecting 483 keys from Linus POV.
---
 export-keyring.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/export-keyring.py b/export-keyring.py
index 6c206a8daada..3d8d400c9334 100755
--- a/export-keyring.py
+++ b/export-keyring.py
@@ -51,7 +51,7 @@ if __name__ == '__main__':
     ap.add_argument('--graph-out-format', dest='graph_out_format', default='svg',
                     help='Export graphs in this format')
     ap.add_argument('--key-export-options', dest='key_export_options',
-                    default='export-attributes',
+                    default='export-attributes,export-clean',
                     help='The value to pass to gpg --export-options')
     ap.add_argument('--gen-b4-keyring', action='store_true', dest='gen_b4_keyring',
                     default=False,
-- 
2.47.2

