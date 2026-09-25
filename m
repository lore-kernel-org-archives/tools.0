Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 585C3468C16
	for <tools@linux.kernel.org>; Fri, 25 Sep 2026 12:50:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=100.103.45.18
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790340633; cv=pass; b=Pg7OSnR5IcaiJWGtqvskVjI3kwmZvM7BUA0WgyEJS7Wj4r3ISRADhBT+oJ4gC2zqG2LbSybZ1D/lW26pXauYkpgLJhjgadB47UMFUXkCQ2JbjPXnQBntrYIf/EmWyzCC21s+rVbxI2FdpMQHpVbYUcO5ADehazcRh0m0VauYCsY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790340633; c=relaxed/simple;
	bh=fxACXL3a4WCx38UecZyjnSPYXvu3WowZ8oI8khC0hpE=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=W5nyz4BiD3oXUEihdmOx4f2LPieMDx6ctFZigh82soeFPNX1ncLLdYNmktrrgacJsdf6621uNHXwOFIkejkczviEpUoD4xppo7Xi7JaSJgzAzWi2bXsKjNxdU8l4yxt7PyVvMGz0cAZThTt+QByiSrCMTgTpvHYLRC/Ou4wxtvk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=LqOOXYqe; arc=pass smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="LqOOXYqe"
Received: by smtp.kernel.org (Postfix)
	id 17A641F000FF; Fri, 25 Sep 2026 12:50:31 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=74.125.225.140
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1790340631;
	b=NgB0OEKlXnM4y0kttHaATwhCwZpkRqm3lbEZ7iSiqSGG5LA/Hg1PzOGMtUoO6pHdIEkE
	 qRLBE9mc8bsiiR+1eB5S8/QqXZWdlyRqHSuMb03l7sSxNR0JvaP84KGGVukzgmzkZS2P8
	 eqRkEe0M15WKbNPzUC2dOq1MzIc8cDZEEwgSW+XqRInHaxsMZsiW2bs+bpYojsigssHqV
	 SwvmXgXiTLbwQdjuCkbh9FMW914ZL5Ojl4cEDSWg/vmqkV5bwqDJJvSwg5TC++c5uRi0/
	 4hvyzgEC5qsUs4CwvxlWPOD63L5/EDCEMx42R+kHtuzB/cRChqb5S6be8w2mHAKqE2A==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1790340631;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:Subject:Date:
	 Message-Id:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer;
	bh=0GESGFeTujqpyblk6eWwXpFcCvMN1rAnkIkrRk27AFw=;
	b=F2+1DrsNqs4SMmQ56j9CxfWzoHczvaBFGWa0aDiwZ4+4mxgk+y9hpOqcTCo8LOQIfkDY
	 tZAdexv0kGD+I6meJzKzJnCJP51+NF77/RuBvso4gJ+5oyLS0IgTFHFY5PvqRuoXuLpdo
	 ADyhSkLqaDFX1ikfK2SZ7R+4CpgmK9fEsRN/fNm/JJ8nhWcExzVG5fLv05kOwgqmfKDgd
	 eY2ytck9tkHglo2mDrk4anWIkojxrwE9miZSqBquk/CxCDyxcg3oUE4diaFyW1WQ7Vi6R
	 GQEViRMXd1a7vgQtStqYK93b6EYq9Si4Clwr/Gyl+CYI+OGAjZIZ3/wxeotc4CixTaw==
ARC-Authentication-Results: i=1; smtp.kernel.org; dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=LqOOXYqe;
	dmarc=none header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	arc=none smtp.remote-ip=74.125.225.140
Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 7128B1F00893
	for <tools@kernel.org>; Fri, 25 Sep 2026 12:50:30 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=LqOOXYqe
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.kernel.org 7128B1F00893
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49b912e64ccso5897945e9.0
        for <tools@kernel.org>; Fri, 25 Sep 2026 05:50:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1790340629; x=1790945429; darn=kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=0GESGFeTujqpyblk6eWwXpFcCvMN1rAnkIkrRk27AFw=;
        b=LqOOXYqea6TCrFFSi/MxVoddkb0w7dg/YLUe3mLRrI6DkCrCIItX9xkV+ILvTcusqf
         cOEFs0VK3XwOV/t0Ipiy+yKIgcE7Rpnc0cYuvxTB1tCKSF3DOdt+KSbkC6yXJoIEe4aV
         80IOaQf0CDWJWpR7XkIuJYkE7nR2NRqv9ax/p5ttJ59zZkwIY9u2QRQ7TW+QCo8aLg5l
         ntNQwgL6mgKEsnGIJSclT1wQT7lSam5UBfxHkyHYNJ1WoVvrLOCNWtXq6P8xJwsrs5zZ
         KYpZL9KSvUCMxr8Key8N+gIlExR5uIClsWuGXfBSnSWwbwcpig8ZAwl+FOFw3xW43y1r
         K1Hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790340629; x=1790945429;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=0GESGFeTujqpyblk6eWwXpFcCvMN1rAnkIkrRk27AFw=;
        b=PP5QLHUv4yvpIeIN3dBIwZ1mcCHp5riOAaY7JUJF5v/i8lhrTOiXCOg5eG8HZeyUEq
         UVCarNwy2R8cW2XsuUO5BheoW//da3MWkzYejfgwkswLipGRQQ4M3hM+y7ww1OonfLqn
         quKib1nk0QIK4MU7DpYRrWD0L6cn2STb44h/t9aloZf87UK6WSvzHO2AnwIgHRnlffHP
         uJC66uC2ZN9T5UEAcRb+M+vlSj284A1iqd7kLWzHg5ULgAHuIxBciItXVEY3bqcBv/de
         Ub+BT+3/ReGeQFKHaX6Z7aPmDb7VeyS7XuNgK9AjAWXiWlNqqItAgovw2J9pt0fVrDVZ
         WsMw==
X-Gm-Message-State: AFuF++nrOVC2kwiY7Bi8pj2VJ4KOBuaLfsFZ+4dYJnwNfZ2ww8qBbwGT
	iOlDE+8Qhrf7fIcEHM4nA5BPqmKo+6g9LKw8f/II2Se/FawZ1ccsgVmGiNt1lYi0m0uOhhHKbeG
	lztWZ
X-Gm-Gg: AYBFou0CXDc9W8m29MyNpF/iHVfCDiw/rR3jYH0dCUQamGpPPh11lZ4wIp3+K8dP90j
	28tWtAVv/XSwqRfHWEp044LIvVvheq9RpKlj0qCmUEZU6S1hKfHA8ASb4mKU2xp01D7dI7ZKX9X
	R0Il9Ixg+BUrtSfEVVAvErLPhRRm+B3uRTvw4HSz8Jq4RZa/ERqavAyuQ4/8+7KMG0hVgsHjVmM
	wR9mMWcWJqkxJvEtOZ21umRr+f40kZ2ae7dEPNwjLHcBPm/0nUNE/QSDYrDhrST2/CwmxCk51Zo
	PJaqme3OOKKlC34z8lTMpMkQmTkxn7qYdH50wj8uCXUGpgOMfGzRSS+2hnq7qE51488PJiUWY8y
	IkxPOLOD/+ye42YhGSpB88MocvFqhwsBBQ+E5YUOOGOTXwqASB8aV2W12MvSePQiEBXImVKaHLx
	5xKwf5sk7N7K2CdxeA2/uwLZEAmhxQpviheCZdF//kDot4F+J2rbh5dlDLQPlnS7BVruTYggSW8
	9AqK2Y8vzKb+cqmlzNsWCWlY9d295o=
X-Received: by 2002:a05:600c:354a:b0:49f:bd3c:bc1d with SMTP id 5b1f17b1804b1-49fe66fd425mr91718755e9.24.1790340628691;
        Fri, 25 Sep 2026 05:50:28 -0700 (PDT)
Received: from localhost (140.30.66.37.rev.sfr.net. [37.66.30.140])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49ff06cbd2dsm56124165e9.12.2026.09.25.05.50.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Sep 2026 05:50:28 -0700 (PDT)
From: =?utf-8?q?Cl=C3=A9ment_Le_Goffic?= <clegoffic@baylibre.com>
Subject: [PATCH b4 0/3] lore: three fixes between a posted serie and the
 reader
Date: Fri, 25 Sep 2026 14:50:25 +0200
Message-Id: <20260925-b4-lore-fixes-v1-0-103fd9507e67@baylibre.com>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIABFutmoC/yWM0QqCQBREf0XmuQvu6kr2K9GDq5PdCI29FYH47
 632eM5wZoExKQ2nYkHiR03nKYM7FOhv3TRSdMgMX/qmbH2QWMtjTpSrfmlSuTAEhqNruwq5eSb
 uQ07OiDUuf2fveGf/2o6wrj/R092UdQAAAA==
X-Change-ID: 20260925-b4-lore-fixes-315d5e5819a3
To: "Kernel.org Tools" <tools@kernel.org>
Cc: Konstantin Ryabitsev <konstantin@linuxfoundation.org>, 
 =?utf-8?q?Cl=C3=A9ment_Le_Goffic?= <clegoffic@baylibre.com>
X-Mailer: b4 0.17-dev

I'm using b4 in other projects and this allow to catch some issues.
I used an LLM to find where does those come from and fix them.

Here is a serie with three independant fixes.
The first two are linked and come from the diff parsing:
- a prior parsed file mode is kept and not cleaned
- a commit diff with a submodule mode didn't allow fake-am

The last one is fixing some pager issues with less that is leaving the
window mode when the content fits the screen.
It was causing tui range-diff issues on my end.

Signed-off-by: Clément Le Goffic <clegoffic@baylibre.com>
---
Clément Le Goffic (3):
      lore: parse per-file modes in get_indexes
      lore: fake-am series that touch submodule gitlinks
      lore: stop a less pager quitting on output that fits one screen

 src/b4/__init__.py         |  77 ++++++++++++--
 src/tests/test___init__.py | 251 +++++++++++++++++++++++++++++++++++++++++++++
 2 files changed, 318 insertions(+), 10 deletions(-)
---
base-commit: e5168b69c2b0661c7a167eff8ddc5753c458b1d1
change-id: 20260925-b4-lore-fixes-315d5e5819a3

Best regards,
--  
Clément Le Goffic <clegoffic@baylibre.com>

