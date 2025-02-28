Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A87061C701E
	for <tools@linux.kernel.org>; Fri, 28 Feb 2025 07:21:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740727285; cv=none; b=NwMBG5aIi4qk8TCNkIBEK2c/xVG6SnpvpbTZYg+jB9FR+Tv34zup8yembMcgwi9aos9wA3w2vS2X3D6sgNA0szdqP02kUJKWhSRyWbiVrc+D6y+4EUptgkVXPlvJCXXPg4JWsfegvMi5jUvLWNETuSaY8dycGmYTwn5AOTgPX2c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740727285; c=relaxed/simple;
	bh=ZL7SXuT0nnENXMBkt029RtZVNX86t/lE9zSQWKWCHNI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=WUT8WNXujGfN6XAcZAXMuYKzo0gspcuoPOi1+9syTknlfYmgEmMeu98DHpf41pjTUKvjahztYVdIyaoYjVv0LcdKet3KuEP3cco/RuSo+n4tkcf/LCsxOCUEluiJf5rVjj+nJUUKuN8sYcFdsm+94YaprXsvPgcWKo9SA/L+bMA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=LhgP4r/n; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="LhgP4r/n"
Received: by smtp.kernel.org (Postfix)
	id 44CA2C4CEE8; Fri, 28 Feb 2025 07:21:25 +0000 (UTC)
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 96A66C4CEE4
	for <tools@kernel.org>; Fri, 28 Feb 2025 07:21:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 96A66C4CEE4
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4394036c0efso11055435e9.2
        for <tools@kernel.org>; Thu, 27 Feb 2025 23:21:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1740727282; x=1741332082; darn=kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YzBejdUZOO3OQROopeyYpIVfut1YaR8RZoRg9s22H/A=;
        b=LhgP4r/n6azRjXsLsbASe2HyvBFCi81UUFzZk4jRRxmM05ppSHm3hzrI7zWnMtqALD
         AEFaNm73ZvuXAV6Q1IamxoWMiI18x/0jabAaYgpaOgBGAhozZQQzF2PaXGwKViV7nG+6
         QF9prWanlpcvDqOFkY7eIbN9fR8lJYQm//b5gDUXYJuSPvsPEFCUNmD/XfHtHEqR9+N1
         hISyp9HUVdYe22YRRJCQEMNtmu0I5DjxxAaCKLK9pPQk17hy/11q/maq2cbx1B656h23
         c/iueLPWwaWjQCgIRNC3wqwth6SgNzsEgLGUXwq83Pf1gZ0/SSakfv2T8CC+pbwz33V3
         qVdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740727282; x=1741332082;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YzBejdUZOO3OQROopeyYpIVfut1YaR8RZoRg9s22H/A=;
        b=AuXl123cca6ZTZder8v8omLwI1Poh5NZevBIOTPagko9JkLV22Lnr6VnKEwY7S62/w
         PwDeocsFhdQQpaJ4XmbQwFYYLqz0o3M9Ross718hJ3rl7YDqDVTOA8a28AyYQcySAWuG
         zkSSZSzxOcB/LA33pG9XSiIBcudziD9olXCsBxtriDDtq/4cZnmY72WcP7nNSLniRP9F
         nkGLLTAFYYLCiyP0iYMSZJ27HGhn5hpEzd5XnApb97GPKHGeQRHbFqeeObnNgsc8HQrm
         6NrwQPSSFEZwEW++GXMyzOhS2QSoK17fZu8ryRazEYK0LhF3hdDdQNtHlSttZxodKui/
         Ehjw==
X-Gm-Message-State: AOJu0YwhUPd/5+W8x5ZeqVmPbBj/rO9uCqcoR6+hMCvcBdBjw5gcAwaB
	Dr8toJhiN15v+6lQuaX9M+OgI3YOYgcJRp9FNCmHuVy6r1Foyngf3N3hspYhrTpEdmaMh3cU1lf
	p
X-Gm-Gg: ASbGncs3Zf15N03kvAj/1xmtonGc4rIkpqOoFgnDrrLKIQyYk6KC9faRtP6cd/dC2Ew
	Boe4jndHI+gyTFK4m4yPkJfiLrG8weSJdPC9Gh+Cv0g9SX71cYYLW493ftWPIVfckbtuE+bB1Jg
	J0FZ+hE0mHg/dYlb697sSVVBYKdlpaIao7yeCTF8iKpk94lVjVNQlxe3eqrv+WwVUkgP5vXnIuK
	2wn8zHmvLannhcxkVtKpQjg5evhWrSr6Usow9977tu/nKF/R0kvxJw0r2dSZBkoLEsZLSPKsBaB
	l/hQ3OSLQ4USJsfMge/RUQ96NJEnLqvEfC+WKrcrfY3dEZ0kr/D95nIZHrIH7mnt
X-Google-Smtp-Source: AGHT+IHv0Dq9b4mJeWnyR2eYPM4enihMLPYIQCETzHqlDb/pMBslb7dIkX/8ZQDJjr/4rFigNyd9WA==
X-Received: by 2002:a05:600c:190b:b0:439:955d:7ad9 with SMTP id 5b1f17b1804b1-43ba66fe855mr16104015e9.14.1740727281893;
        Thu, 27 Feb 2025 23:21:21 -0800 (PST)
Received: from localhost (p200300f65f2c000400000000000001b9.dip0.t-ipconnect.de. [2003:f6:5f2c:4::1b9])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43b736f74e8sm49498345e9.7.2025.02.27.23.21.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Feb 2025 23:21:20 -0800 (PST)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc: tools@kernel.org
Subject: [PATCH pgpkeys 1/3] Make scripts executable
Date: Fri, 28 Feb 2025 08:21:04 +0100
Message-ID: <18464ce5093946667fa7cba8df9d50b327bb91a2.1740726978.git.u.kleine-koenig@baylibre.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <cover.1740726978.git.u.kleine-koenig@baylibre.com>
References: <cover.1740726978.git.u.kleine-koenig@baylibre.com>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=565; i=u.kleine-koenig@baylibre.com; h=from:subject:message-id; bh=ZL7SXuT0nnENXMBkt029RtZVNX86t/lE9zSQWKWCHNI=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBnwWPhH9LEaavYbffxFlZY5Mt7mY0KMbXjd2Fob dFPnIWlxsCJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZ8Fj4QAKCRCPgPtYfRL+ To9IB/43l+k0U3Sf+26Stcw8IoJC/m5sMLKPylQh35mas2B8wbtgIT24ZqATgjguEfD83PrCLEh CqITJyQ2T/sJtbwtK/lJ3TIsRqxpXm+ApHfgK50Npl8gcQvJhKBlWENARJmrlSy4FMTLjzGidOh u05iCy0lBd+fBDATpYwpSi989ep4/a6w95lqt/SG5CB0KgD/CGXHt8VBh0XKeUKf+jD3oMK0pe+ FqSckhTZDmZNTyXjNaA+WKiDbSTcZW4s4CXUWFLC6bpMzvNKj/mPpJ9kV+8AXJu3r/y+CtcR3gv 1+NiEq5tpXk76DMpwNpzV364SejoCwJ0OV0iY+a1oOM5sKba
X-Developer-Key: i=u.kleine-koenig@baylibre.com; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit

While they are not designed to be executed directly, making them
executable simplifies their usage.
---
 scripts/korg-refresh-keys   | 0
 scripts/korg-update-pgpkeys | 0
 2 files changed, 0 insertions(+), 0 deletions(-)
 mode change 100644 => 100755 scripts/korg-refresh-keys
 mode change 100644 => 100755 scripts/korg-update-pgpkeys

diff --git a/scripts/korg-refresh-keys b/scripts/korg-refresh-keys
old mode 100644
new mode 100755
diff --git a/scripts/korg-update-pgpkeys b/scripts/korg-update-pgpkeys
old mode 100644
new mode 100755
-- 
2.47.1

