Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 568621DF24F
	for <tools@linux.kernel.org>; Thu,  8 May 2025 09:45:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746697519; cv=none; b=l6nIQzBYEWYdQOxNSyVsVi9DewvaCcRDkFe43XEg57DSYv3DUSMi8Qqf/Jp0KjMcrTWL8ksXdfyVY24ub705fYa8lxJMF3FWYUIv95CGRaG3lAQ1nXEZNnOeB/rTEHaX1BSk9gOHqXCdT5v+e+Z7ARUlqFgvRf9MsMXEAkpUl1k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746697519; c=relaxed/simple;
	bh=d1MkALuYnslcV1Efkh24VKRDcwKYmg/qzgTXFCusfCE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=YvOPDWh55Txs6Y9z/ZlDr6WaLLlvpjQKJnF7xvtK5R71y1hwsnfUCFlHHbybo5EG6WsHKk3wv97qgbXP3pA1tp1er+dVXMEnENfa0Cj0TsRDqv6/gR/r84YzPj2bq6apHbYMoxPg64glHV42DA0ZPfzTSdp+RkaWMw2+/8RyZok=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=x4K/LMW8; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="x4K/LMW8"
Received: by smtp.kernel.org (Postfix)
	id DA7C7C4CEED; Thu,  8 May 2025 09:45:17 +0000 (UTC)
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 7AD33C4CEE9
	for <tools@kernel.org>; Thu,  8 May 2025 09:45:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 7AD33C4CEE9
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-43d0359b1fcso5372015e9.0
        for <tools@kernel.org>; Thu, 08 May 2025 02:45:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1746697513; x=1747302313; darn=kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0z9dvDUlXRmet29uAf6UFAgXUCG1GHA8TrdpxcgQfwU=;
        b=x4K/LMW8za6AksbShMixqqU33LfjAs7qnAnDxFKKad8suB5Zo2dwEeLfbdVcYopZJ4
         jkrL6EKiwpPmMmM8h+APxOGztKiFW9iikE+YssC7kb/GuHrqizbTIzreRRCbZHSEEVUs
         cQd5NzXXSdvdvyZfQZOgRspYHm58NCnOkqvAekPpyb5Oo777espDYiPaXnG2545LQyro
         AOrpCfBTR+U1eAt5B/h5KBg6f+y/zID5FKIhJAY7ciZMlgBrlcYjYLcyaVgQjBJ45ENl
         2Z8rWTBpuGjs/BdGj41fei1ykIIwil6mjAxikN8W+UpUJI/j1U/j/7pC/c9MjaA/fwhf
         Zjnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746697513; x=1747302313;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0z9dvDUlXRmet29uAf6UFAgXUCG1GHA8TrdpxcgQfwU=;
        b=onHoDx9xJH1CMj6MSkHicRoTeSwYFZNCIZhncSyY1q+6EfkwpX+zsj2u5s7XZkP5Q6
         /Pcv1ZfNCWolP2DyyrmxDOLvnpEmjL67eY1uXXttmhFcTmyBbN/IdWr7AEjRK0TucwCh
         yYc2D1efOXprnrFyWHdn4C38+4rfW+UHfV7LKyOWbV4Jk+2953WsWB9if4cRf+V/w5Db
         +RREzGH3k2XuJsamtey5SwO3FXDtfI3koslN+k24Zy31NsgE5pnc1OfIq+6eGQpKfvBu
         EsLjzM5yzqbjeuou54dnHtSEyz+MQZmaddZB1PsHD/L7CIEpH6tmspi8gShrAKq48sRw
         /NXg==
X-Gm-Message-State: AOJu0YxcZDDKFxpSvhBV1lHh0lszcYD1G0lizkzIKiYkMeOjv6vbZEgA
	YgqcqTVxgyKzluAygPBY/Njrf4g2pmxiGR6EOxPz71fc6yCrDRhXV8zXm+S6rWk=
X-Gm-Gg: ASbGncuyhL1FrrU4Ik1g7DUjjn5h49BmdIzQrQis/HGH5kHSFRiuhMeRPJPgeAKDHME
	x4/D7dOsEHkRyQ1aSvMvxrfCY02FwaMbUxghZ2V+7OH7B0yAbIEeC/SjPz2OAaXqZ0Vje6QjdY4
	UHukxXG9iKWslUT5LwBsi+HoWY5aj6AWnk8ZmxWLiKe5kN05H/0LZguEv7HxfIB+izCKZ2ZP82L
	gsn876DlTB/Rvl2pDn/5AlOBs5AA7cI8Uc4ueVKD7e9qA9YlOTkVLwu+RT5BFtFT6aOWfjcbqRL
	/BXxXxB1/DWTooyMGegjI6WY0KrNml1xlRwEPvK+Ja4Vf1sjspkWL/FQ+qFxzdSoBTLJTtxX0cc
	4DhbVeXc=
X-Google-Smtp-Source: AGHT+IErSGsvVZdJgbJjeg0d621VX70Hz8q3zwOUmB+2LyqD/5p7rl2yOh5vuj9huBvqBUe+KZDRiw==
X-Received: by 2002:a05:600c:6a86:b0:440:69f5:f179 with SMTP id 5b1f17b1804b1-442d02e06b8mr19302375e9.7.1746697512678;
        Thu, 08 May 2025 02:45:12 -0700 (PDT)
Received: from localhost (p200300f65f00780800000000000001b9.dip0.t-ipconnect.de. [2003:f6:5f00:7808::1b9])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-442cd32b070sm31369535e9.1.2025.05.08.02.45.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 May 2025 02:45:12 -0700 (PDT)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc: tools@kernel.org
Subject: [PATCH wotmate 3/3] export-keyring: Default to export "clean" public keys
Date: Thu,  8 May 2025 11:44:55 +0200
Message-ID: <20250508094451.762484-8-u.kleine-koenig@baylibre.com>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250508094451.762484-5-u.kleine-koenig@baylibre.com>
References: <20250508094451.762484-5-u.kleine-koenig@baylibre.com>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1330; i=u.kleine-koenig@baylibre.com; h=from:subject; bh=d1MkALuYnslcV1Efkh24VKRDcwKYmg/qzgTXFCusfCE=; b=owGbwMvMwMXY3/A7olbonx/jabUkhgyZWpnbLI0n2z9cumA25cj0mKsMBtNPnVywi/Fzcqsdl +kjzoXWnYzGLAyMXAyyYoos9o1rMq2q5CI71/67DDOIlQlkCgMXpwBMZAUDB8PGlzLJokU/q0vC W7jjD8yo3Oeus2gXSxyXQreK/9OpWy3tpzn+8TZPXvZac3NdW+rHOdaSm/9fyV1x1+i00oHVWZE PNP8zLYjvtlX2U1H8KXT/TaaRyP489UWpaqd8wwPTNQunhB6fyft9Q3KSflrfOn+zxu0JvxlOii y/93lj5WoBf5nEW2xTkuzfJazKvesxv0g2xT4xanGLp+R9jd9HkjKuHJm36JFb2xFZlrNHViYe1 pfdy+t0f8EdxogFqo22G5J4326zdP4dODNN+SQDy/SVhYn5nYKhyo1TGniTvSvvHNRT3PEoIbF9 ymFXpWVfztX5+ryfNYuXRf8v8xsxtnR2FeZf5nY1bctLAQ==
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
---
 export-keyring.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/export-keyring.py b/export-keyring.py
index fc12624a42f6..fa35d7a381ae 100755
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

