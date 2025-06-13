Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE9C31A4F12
	for <tools@linux.kernel.org>; Fri, 13 Jun 2025 16:19:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749831560; cv=none; b=XaJdmMRLIeUNTrdPMi/ePS6mdAfkcJt878KZogrG3Iz15Ru+7zwrhR5jgIfntYSl1bKX8eqlDo5PE8DctMzKR78DBi93TQJNGkN44OP7reJCJRBtVaIiClPvz5TAR5872DEYk5/AW4HPAkuGI25WctzKPwW3LQw+x+0TQRepYEA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749831560; c=relaxed/simple;
	bh=ozgaR2BwuXme5zOTbbDV5h9YCmhJYA89S2ssSCWSo34=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=teLgBOYN7ORvxAO+9LGXW+ZT5GHA5SVf01S78ttDR8HUQJwj+U18pzW0q1eKZTQV0Y2QGCdMnOX0gx7KnrLuQwDxM7kOXdkVcShqovIxUrSfTupIjbNFhrwDRzhCRZghtnX3C8U7QW4KpsR3LgbsqK+cqbULzOqlTPJl6BgNxOM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=ovC94AhF; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="ovC94AhF"
Received: by smtp.kernel.org (Postfix)
	id 5D9F2C4CEE3; Fri, 13 Jun 2025 16:19:20 +0000 (UTC)
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id C263BC4CEED
	for <tools@kernel.org>; Fri, 13 Jun 2025 16:19:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org C263BC4CEED
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-adb47e0644dso398698366b.0
        for <tools@kernel.org>; Fri, 13 Jun 2025 09:19:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1749831556; x=1750436356; darn=kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WHiclBoTPAlvSn3VYTa6jAWtdNTZG4n9IVbNcj5jpNg=;
        b=ovC94AhF6bKLx2Q9bEd0/E59+nXZ4wr85Gr3QQidIH+rBTbVDF+p6sLaaXf5Q4gnV7
         UP/Y3sHh9f2BzsSJN4aycMqWN6SBPVugQwgyTQWMr8Rbkskew0SRSW/Xmgy4RTqM3uIv
         IuWrZh9Qi+YFYI+K37WFFtpmF5zzHZfGDA5U7MfHZsBoPiDn192qQay/NCCYH/1tGGo4
         jaSDZLYbKWHG8vRt3njW9lZzF+U0oZjVG/sTFVn465MGbwApuaA7dqqDmoFruPGxMKYS
         hanMsRaa1CZZ7iCM0wSRnzS7CruRlb37OMBK0pgsW8QUTDzo3yH21AnSRrDeLBq58f04
         YyEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749831556; x=1750436356;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WHiclBoTPAlvSn3VYTa6jAWtdNTZG4n9IVbNcj5jpNg=;
        b=npvfVU6dqXnoPk6bVWdbjbMk9DaVvZdnGUOZC/Kf07NtlZ6Ua8qrqf8i7yJ+ftsoWs
         uXcgCSwqZNYJG9nPBkL6Be+hmLz5ieDrdIyYv55HU8hak4hLOeqBCHXDDVrLe4pRs4MB
         qZmgkc3tccWfmBOMhQI7RF4xsrkbt1CENtNNhYQivh7brqEJmkimheEaLO7ahWzv8Ri7
         Gtybz2o7XY+oAGlbM+ZIf5ts8gWHMZjuS1HmUcwJDh5ZhjeK9uWfK5k3BFZ57wcSCkse
         i6Zmy+VvGnTs4Bxhuts299vZhtyEwNP+/xLVpGDAiIzMk1AnXT82Wj3TImyQzYVusYKM
         fu7w==
X-Gm-Message-State: AOJu0Yx7RHnd9KUmTriS3b54JkLjEADXDM70q5AKVJfN750Y9rNjVz8Z
	HS7szkyFw7nQtdcIddIZFOmrbmfmwvgUINLUYX29Gxq1mvmer9xlbNzfo2w3xyRtVbA=
X-Gm-Gg: ASbGncudI1Y8fwd5sp/Epx9mwaMJ6fyb91KrLvURFajTqyNzGE/H+ftBHeIOpW1OM6A
	lucl6xqiI8NYdRY7IdjjAWohLgInaEn4fQ0G54vHGXDu8mYjkCA7jk9LVE2z3cgLyOAzLBU13wU
	6+7sKSgbSfzv4hEUrmz4sRthhtTMmrvWNhAouWd53X6PUkONmWPGzzFuk1adyBnlYL6cD0ScqKJ
	0izyJxgn4LaULNlhph9fBepegZKdQ3Y0cDX4YDZiFvPqSQQ1kihgIPow0On6QSjwp1PaemOjrPI
	Xror8R/U9P68LBHUp9RK+FqF28ANh4+TbldlQp/XNuTiStDZM/7c+zOCjMOf7pNEfNg=
X-Google-Smtp-Source: AGHT+IG7zAR2Di+7HQw/O1PiwbpLv7WZ3rBHnyXR7V6DsZ9aTmQDJ1m9Y6+tCS71/0josbc08W0jiw==
X-Received: by 2002:a17:906:9fc4:b0:ad5:2cc5:4496 with SMTP id a640c23a62f3a-adf4acc8a68mr159581866b.0.1749831556051;
        Fri, 13 Jun 2025 09:19:16 -0700 (PDT)
Received: from localhost ([2a02:8071:b783:6940:36f3:9aff:fec2:7e46])
        by smtp.gmail.com with UTF8SMTPSA id a640c23a62f3a-adec81c1f6asm152499266b.55.2025.06.13.09.19.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Jun 2025 09:19:15 -0700 (PDT)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc: tools@kernel.org
Subject: [PATCH wotmate v2 2/4] export-keyring: Improve logging
Date: Fri, 13 Jun 2025 18:18:57 +0200
Message-ID: <e28f461d9ac292133fb68a52533e83be6d668a4a.1749831371.git.u.kleine-koenig@baylibre.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <cover.1749831371.git.u.kleine-koenig@baylibre.com>
References: <cover.1749831371.git.u.kleine-koenig@baylibre.com>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1205; i=u.kleine-koenig@baylibre.com; h=from:subject:message-id; bh=ozgaR2BwuXme5zOTbbDV5h9YCmhJYA89S2ssSCWSo34=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBoTE9z/GMswT05wHihm5BgLRgl8f6lwec3vCHfx di2PHncRu6JATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCaExPcwAKCRCPgPtYfRL+ ToG7B/4+A8bht1gfD1d0qRIOTLuVzuI3a6KQYN9wxvGWk5+ZWoAlmY9RcoPSTwMUP7WxnGM5Fol 4et3I/UfGDFPbpNR/t8bRyJQT2Lgrx99pY5HpJu2Kgh2LNOKPhPvKhAQYnKH171Kb/nMaMn05Mn eU2RY1bEqI3x3YmmJh2HffvkTlpwDuL5aSgJbUFGlkj6WA/obF3xsjL5AzxQFhSdWs+ZS8zzPxN dntd7vmjrfMzVNgtNa9rESsmnLT/y4SK8dcf1Ytj8lP8EMX1r77kaXjvueJ1e/80alS8gE4qfyR Cw1gJdoXiLmEkxt3aVlTlHTty+Xs1UJsu7YPh7FRYaG5sSxB
X-Developer-Key: i=u.kleine-koenig@baylibre.com; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit

Issue message about not updating a key at info level and add another
helpful debug message.

Signed-off-by: Uwe Kleine-König <u.kleine-koenig@baylibre.com>
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

