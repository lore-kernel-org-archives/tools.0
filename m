Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36FD0272802
	for <tools@linux.kernel.org>; Fri, 13 Jun 2025 08:53:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749804823; cv=none; b=VuQvuMoXPAF4n4m2FE2CoPzGnRjtkeoS/E89dvP7uV5K0ZIc65kPBXN/wggK/X/IpLBeK7uerL2ME81i7B9zDusAxDvObONSunqCKIKEh82mJatRLFSpLr85O3pO3hMSIKtd4R4/IrTz5SeM37JE9VbeI6uTeiZYwCH8o7cuhUI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749804823; c=relaxed/simple;
	bh=LwKoAiwxikVlcmjbKTEvoIa7ioKiTvIWUtSqs03Zb5Y=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=fewZWT6EcRRxZwYD1OdGRdgT4FToeywRdSAdiTMt5zfQff9zBenx1mv+lr7bzq7l5DMLxN/JFUl8L8ReV9HiMaWWoEIccik26WAjPrModGVwMczdk9+eQ1pK4Mkyv/ulwreMsz1Bcq43iDjaV/eqEWJo7t0XFQECBE/UyifLZuc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=DSI/RZAc; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="DSI/RZAc"
Received: by smtp.kernel.org (Postfix)
	id C4743C4CEF2; Fri, 13 Jun 2025 08:53:42 +0000 (UTC)
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id B76CEC4CEEB
	for <tools@kernel.org>; Fri, 13 Jun 2025 08:53:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org B76CEC4CEEB
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-ad89333d603so376707666b.2
        for <tools@kernel.org>; Fri, 13 Jun 2025 01:53:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1749804819; x=1750409619; darn=kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UzZeUoR0doV7gIbOnzMWMcLD0FmKu08/e6eizyv0ZBE=;
        b=DSI/RZAcRWrG13c/kUqXpkq5bOip1DVrqC9bfSf5uJKot9ZTex37rz1xJmdJHsVcDk
         ORdULIfsRHp1fP+BVBgQA5hJifIc/SItffRm2NecjBDb0KTNZgRLcnPJ1LWXagKEgucq
         2bcIYAaj52/uXSg7t760uRnnvPQtt62PmJtTYTYAzUu62TwVRgNxpTSuEg5hlAnWND74
         esk6xP/T6iJuccg8LydMpPLAbfZMKIaMvnlo8vWyiyeuS8q7PnUgfJ+X5FQ85uHGI1Ga
         P/6KeTRWHfbtMiIDGK1P76K+E4RYNhDICG++nGpkbwVjZoiazt41xVfqVvckafi3roE8
         lT1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749804819; x=1750409619;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UzZeUoR0doV7gIbOnzMWMcLD0FmKu08/e6eizyv0ZBE=;
        b=FkMzEsE9nx4vrkh1juwspFjGyTCIc11UhDG0RCxm3PyOAWXFOtgAZg8W7ozdy5ZW9v
         Q8m2KT3T6BSYNYzE0htT4lQDfvGH0K7AU4mXQB/HU+VCuIiqh3klRGYijkdN7Uf2t8hd
         Sy9SSOj5/zLkaMoEwdESzHIW2SoB/CGCNVD7Kwdl9HNrAGr01FNvjAlyYgrkK/AdnZOu
         5lb/5E6MJIV/3omknBReLNFRjyBZbWQYUFa7R327O0ovKGneE57I1hT4m6Ms4FM5gq4H
         iYNcQt8wJehEjXJEF2o8x1FjFqT79gWQSxin6Qq/3yJ/KM0+7WcplHnpf/yfYWR3Up4P
         1tAg==
X-Gm-Message-State: AOJu0YxoxPRFHdZFperH0Z1wBeanT3zUvvib0UGdHFhiV1kOzCK9IJtN
	1sEEMh6CrCft/Ltw0nz1kwF7HfcOZPdOp3qkro1/7Eh4oACrGHZIzgi0kTCITCV4LZCv8+WC9su
	nlViO
X-Gm-Gg: ASbGnctYREDAfXUUoj3gMBxtO2QnbUXdXKt6J0Wr2PxaywLd3HGwx7V75RPHhwQNFfy
	TQTZWNwjhTRJNGr3lDDgygwG5j4tcMBavE21xfBWVMYJra+bFtW8eFJeZrsfHaAmPhgFl6IhT7i
	Vl06D77F+Is0+KTKeB4UuiuJbS2Jp3BzwtHRpCt/PeDC4lMTJfqCphI+2uCvNkWFBcx4mVNFI2d
	5maQWwYx2164m9WlD1dP+m1xIOgXwDrWePQL1wAwWjJoClQhRO7imwC2gSj09O+jHKjPars2GcF
	fSKGarHRG62bsa25iXnUZ0z40M+AlYeKjBAToJluc2NlvTD8OmLcqMnOYqSIBsRWEkBmkz94DoH
	P5g==
X-Google-Smtp-Source: AGHT+IHDcR9oRSGl8tM67Yx6xbeM/eBti4b2oqVxtY0FXd+BluRo55HoWgHjwVF/Z4Jrs+n4ytoFJw==
X-Received: by 2002:a17:906:dc8a:b0:ad8:a4a8:1034 with SMTP id a640c23a62f3a-adec53eac61mr197985766b.8.1749804818746;
        Fri, 13 Jun 2025 01:53:38 -0700 (PDT)
Received: from localhost ([2a02:8071:b783:6940:36f3:9aff:fec2:7e46])
        by smtp.gmail.com with UTF8SMTPSA id a640c23a62f3a-adec8979563sm92280966b.158.2025.06.13.01.53.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Jun 2025 01:53:38 -0700 (PDT)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc: tools@kernel.org
Subject: [PATCH wotmate 2/4] export-keyring: Improve logging
Date: Fri, 13 Jun 2025 10:53:17 +0200
Message-ID: <42a885748f00de8534f806173670b7c5d94e25a7.1749804735.git.u.kleine-koenig@baylibre.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <ef678713de0a9aec1c1f07d92faa29e1f5b5e4e5.1749804735.git.u.kleine-koenig@baylibre.com>
References: <ef678713de0a9aec1c1f07d92faa29e1f5b5e4e5.1749804735.git.u.kleine-koenig@baylibre.com>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1138; i=u.kleine-koenig@baylibre.com; h=from:subject:message-id; bh=LwKoAiwxikVlcmjbKTEvoIa7ioKiTvIWUtSqs03Zb5Y=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBoS+b+tDBFP9FO1MJZSPdH0LtvOuOP8s/lfzgL+ HP/j2Q996uJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCaEvm/gAKCRCPgPtYfRL+ Tj9rB/4v3iihqVWYxiLRDOiUq5mBAWSHGz5kfhPD+pjZg1JBVUVT4kbQ0dR85ALVZzqnlns9IFi dTcF9ah8y1zV4C638noUrxhf8Lbm3IoqQDbfctFcrqJBZNg9QcO7GQpkZ2lrR5k5HZ1RvJnkE8L YktUHq5B1rw0yOVmkgFxmpxQB8wupkvZUztmoVi2tcrsaQ7nuRPHcsB0+HfvoP7E1ONrcaJY4Uw XpAe4HoaKxpcG3eelUl6Jp0+N6XYlcfBXE+UF3nD4jxLrPsKMyqUHHlIm3Nz9CVR/eB39gcFdPu 70IyumHqlU1FbMSZ9q8m/e7hcJvPEfmiYvss0NEVjBhH/Uao
X-Developer-Key: i=u.kleine-koenig@baylibre.com; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit

Issue message about not updating a key at info level and add another
helpful debug message.
---
 export-keyring.py | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/export-keyring.py b/export-keyring.py
index 686c77cabb16..23736f610c79 100755
--- a/export-keyring.py
+++ b/export-keyring.py
@@ -133,7 +133,7 @@ if __name__ == '__main__':
             if key_already_exists:
                 logger.debug('%s has an to invalid WoT, but already exists, so still update it', kid)
             else:
-                logger.debug('Skipping %s due to invalid WoT', kid)
+                logger.info('Skipping %s due to invalid WoT', kid)
                 continue
 
         kpblock = ''
@@ -157,6 +157,8 @@ if __name__ == '__main__':
                 if trust_changed:
                     logger.debug('Trust changes detected for %s', kid)
 
+        logger.debug(f'{kid} {key_changed=} {trust_changed=} {key_already_exists=} {len(key_paths)=}')
+
         if not (key_changed or trust_changed):
             logger.debug('No changes detected for %s', kid)
             continue
-- 
2.49.0

