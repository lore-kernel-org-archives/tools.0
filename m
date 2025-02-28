Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7C951C75E2
	for <tools@linux.kernel.org>; Fri, 28 Feb 2025 07:21:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740727288; cv=none; b=CAnAwur8eE7R21lWUbs02vDGIcwv7D/AuruFKepiHXpJrOMrWY2qZAhkD+FmYJhRxJBEj8hB9ASbkAp/VI+6a/215V46XzkmNCGgmrc9nMjOEcYD0Q61/FAoGkqkfvdItknB2JOma26t7x+pN7uV9+4hKcuyA3pNUS2Mzyhf6mM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740727288; c=relaxed/simple;
	bh=/1wLJn0D4+axwt4LU0jB25aybhdyierVFh5LyAW21bA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=btsLlAGdt2L18b2urOSGrGLvZcCGGqS06oNcuE3roI3Y1p327kPFH9cpYNf2LScU2cY0iCyAZFUq9QD1pocFw0X2tkFX5V+GnVrZHtkQoyAZgjoQqnshs51rZOVaDnoAjQ2xwD+UYyA628rkfHavX0IOO9kzWMNEZPNIrHq77QI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=ZZzJ7C7M; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="ZZzJ7C7M"
Received: by smtp.kernel.org (Postfix)
	id 9DAAFC4CED6; Fri, 28 Feb 2025 07:21:28 +0000 (UTC)
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 22B42C4CEE7
	for <tools@kernel.org>; Fri, 28 Feb 2025 07:21:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 22B42C4CEE7
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-439350f1a0bso11579445e9.0
        for <tools@kernel.org>; Thu, 27 Feb 2025 23:21:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1740727285; x=1741332085; darn=kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zdMjNNLYWEB6Vw4WoLdhFXh3+L1fy8Kvz1+CUaZ342U=;
        b=ZZzJ7C7MfdRvpTmuKok8WP1xUxTCoVjQ0LDzrb+4iF04Ep1ZWKPdRK8tQgndO5atVS
         xG+sCNHa0Da6b8MpVZGHZCoTUjVbKxV8I+rPDVg0z8nIFageHhUE5aeKdHGIfmZldYCh
         UJXuTHICqYun4XFzQNUb1nNcE84HCvVGoHfGueodKeujAFw+L7HXHtX9an9EOMdYYl4i
         GrJWnur7jaS4N3SvtjRiI9+BNL0xzNnuszMCD+nJDmqhUQO4VkUuauPB0xRhb30SQDLV
         PXVOp/ZwWTwC2HQX32aSphWs58BvkAPlgdCsOLbGj73phX+XtFLTKzFgieOMi+rbnnSO
         Mibw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740727285; x=1741332085;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zdMjNNLYWEB6Vw4WoLdhFXh3+L1fy8Kvz1+CUaZ342U=;
        b=RFxOtTMUY9PoULTmWzVUwZ3Mc4GtN8PEK8QN6rCQTVrK/0EVDXPGt+cvs12IVickBv
         DjTllgX3UMvFQUPmA3SY4Fr+i+JjaQP0VObSibR6i9ijRsVfDr6wL8a1Hsmb8GGrz9X1
         0JUZM+8fxlfJhavkkldSMCc5yCmrd+u5xBRacTVLDzVyj8Z21TeNwWdXzWGoJNG8oE8F
         hB+7CpnKpGCEbGFAWwd8BUpetdy00DMIiMla06llADQL1Vjkbc7yDxSM4ODM8Xn5gl1u
         I8ehbcwrmMnY6+ltwAJd66G996lVPhJa3TrQ043Itpy1Ydp726yTjPMsc8/mIGYQlRlX
         AMPw==
X-Gm-Message-State: AOJu0YyNzRLDWjR+A9K0wsVsSA94Rv+rPEZYGMwpaTWlwfKXWqeTLl5a
	tJ/s6zuYbrYDSHXPFSU+Nn/lQW8wX0l73FDeokDyfb7jsYGoeGIE7m5j9d2G/mM=
X-Gm-Gg: ASbGnctAP0m6e7QfY9O2s24G5phllNpfyDEr4cLKfI3dliNyhkgkiMbhRK/HUgYF4C/
	q24wTJM0364c7VlUMFSrC2qz787coNQm2N+4un1ffAPWCtZxdURTDaLQUbm20J7efiikepeCKqI
	dN6Sl+2OR2RFIqooQ9EziInqUhV7+lk3gEYs6gbFfaQw7Z8/oDRwH2v4ZbCfiUZ9sEuhltzIfQp
	3W8TZTcNrSM8IgnF6dSloYTJBzb1Ck/GnfsWa78h2XHgFKbhH5H2v4FoBOwie5nCCvm90NDZGqR
	6s0FjVfeh/gbpN/lzb2PLNfD8nad5cBM7kusFB/TWHcLwu3p5jweQkEqRxCOF0jG
X-Google-Smtp-Source: AGHT+IFFx5CbVldt6PRPHmH7pwD11eZl3Ha70kDrq02z504FwmxqCZBv5RxyErFWD/NP6ga+YzEl/Q==
X-Received: by 2002:a05:600c:6d44:b0:439:5d00:e78f with SMTP id 5b1f17b1804b1-43b04da839emr51295965e9.11.1740727285431;
        Thu, 27 Feb 2025 23:21:25 -0800 (PST)
Received: from localhost (p200300f65f2c000400000000000001b9.dip0.t-ipconnect.de. [2003:f6:5f2c:4::1b9])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43aba5870e7sm81382285e9.35.2025.02.27.23.21.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Feb 2025 23:21:25 -0800 (PST)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc: tools@kernel.org
Subject: [PATCH pgpkeys 3/3] korg-update-pgpkeys: Pass additional arguments of --refresh to gpg
Date: Fri, 28 Feb 2025 08:21:06 +0100
Message-ID: <3d0bb9cde747c0f5ea564aa54832b56d7beec324.1740726978.git.u.kleine-koenig@baylibre.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <cover.1740726978.git.u.kleine-koenig@baylibre.com>
References: <cover.1740726978.git.u.kleine-koenig@baylibre.com>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=880; i=u.kleine-koenig@baylibre.com; h=from:subject:message-id; bh=/1wLJn0D4+axwt4LU0jB25aybhdyierVFh5LyAW21bA=; b=owGbwMvMwMXY3/A7olbonx/jabUkhvSDyc88jMQ7+xTVu60/ffh9Wt3ftqc2YZqiwJfTTz98O J4nbivZyWjMwsDIxSArpshi37gm06pKLrJz7b/LMINYmUCmMHBxCsBEZuix/xXZKDWfU15jZd/C t9zs2h2p8TJNUzpq/fYzB9calLS/0fi/68uFTZL/TsoWfisX4r9jZfQ/2d55QdXRr6nvqrrvFJZ MqZxX97iNK672WPHs/hvPUt5fEJpmm6L+oWxf9ZEj2ed1t5+KT0m/XrZ4waGiCMf9KX9ZDK4nLh G5Xm192Kh7Q+GvM7b7X6c9tZ0uZsfrWOnxaFdUVPBiXbckqy538917/qxbGaZy5orQp5svLI9Pc axSf1q0zm7TMVOLlTFr0t+lJJsY6awPvqo2c3nlAgnFuMfGiyz3Hljuuiw6f6+bHldPdWR1+YU1 Xe9MS3rPaIr1+PGyi28NbvuoELM5wYpH5Ma0Xi8pwf1fAQ==
X-Developer-Key: i=u.kleine-koenig@baylibre.com; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit

This allows to update selected keys from the keyserver only and pass
additional options.

Usage is for example:

    korg-update-pgpkeys --refresh --keyserver keyserver.ubuntu.com --keyserver-options no-self-sigs-only E2DCDD9132669BD6
---
 scripts/korg-update-pgpkeys | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/korg-update-pgpkeys b/scripts/korg-update-pgpkeys
index 4dc9be07c157..4d516b2fa5c8 100755
--- a/scripts/korg-update-pgpkeys
+++ b/scripts/korg-update-pgpkeys
@@ -40,7 +40,7 @@ echo "Importing current pgpkeys.git"
 $GPG -q --import $PGPKEYSDIR/keys/*.asc
 if [[ $1 == '--refresh' ]]; then
     echo "Refreshing from $KEYSERVER"
-    $GPG --keyserver $KEYSERVER --refresh
+    $GPG --keyserver $KEYSERVER "$@"
 else
     echo "Importing the new key"
     $GPG --import --import-options import-clean $1
-- 
2.47.1

