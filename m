Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B640194098
	for <tools@linux.kernel.org>; Mon, 19 May 2025 10:17:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747649846; cv=none; b=MSFXjCTs+A++N+c/1MEX1EwsYE5vHPtHE1BetkossdBWLn+je6F9bHFrJsfacLrTEJoopYVWIbW/Nd2N4tTCwrpADQkqEA3C4tYNUpwJXZWM25BxscGd/V6ZhXGPkvv1MtmIJIR5/xJmNsQ+JSx4TVM5rz4XbIf58Uou6fP29gs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747649846; c=relaxed/simple;
	bh=0u5g8hVn9C1B9pzOi2UHoRuGXgu8/98bOiEROCf6oZU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=RwAwuSqXCiqd4RwYe6GzVQq4IlIRnnjxNCSOd2SkMdI9z1nHKTOAjkcH0w+2kAtgza29AFmBaiT/6ogrmE41pdf8Z2cuLIaGei23DUB/Lce3V7hgCyXyH3U2zc0AjDkHgHFRnlVLVV/EZLbhl3jMUnXNtxM3iC+48npfa8ezyyk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=xKhEWpRy; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="xKhEWpRy"
Received: by smtp.kernel.org (Postfix)
	id 26B5DC4CEEB; Mon, 19 May 2025 10:17:26 +0000 (UTC)
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 1D135C4CEE4
	for <tools@kernel.org>; Mon, 19 May 2025 10:17:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 1D135C4CEE4
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-43edecbfb94so45843255e9.1
        for <tools@kernel.org>; Mon, 19 May 2025 03:17:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1747649843; x=1748254643; darn=kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=crSxjCtgtygH3Z+UaapzlKs1cVV+3CQsbYD5vLrOKBA=;
        b=xKhEWpRyUeVAZvrcFPoN9cUheKnZdNn+SS2cZnsJhDznOMM7f5lNDED7PfFFCHSgTk
         PErpWCNOSUXKBfvXP7eRcdb7rjC+md0r6noVvdplQT09WS1w97AHMh+wmDIu8tFdTs1e
         peSpUPQ76QtjnC4q6zBdKgOAj27FHgTL+DvyFnJmcTrUdJbJplQ+Big/MqreOY1f1xM/
         KWpE6ZogxEYn+EFjyglK98LI0RG1CTuxIq01fh5UMgbRwxTfnch5QbX0qS3eZmCRBg+M
         6L7KLvjBOcCiEmhrexuy0jKKW7qj2iTbmaMAOdxNxOEL8/aY1/XHFEP7gV2icqBhfCZM
         PN6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747649843; x=1748254643;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=crSxjCtgtygH3Z+UaapzlKs1cVV+3CQsbYD5vLrOKBA=;
        b=Z7VmyY7ViOJoQ8cyy3TmqMUmkm1h7MwocmTO92J6AqQSK6IKA80SKaMMCU+yrXYQAn
         thTOWEmBKHlQ/Qdey2ngghSy+jLPww1JF92N6iIGpID7yebtnHfqNDbJI+gTn2WpZxCL
         rnt/m8nWY2/QK14wX0RYMvNjo16Ds8Y2p9NuWb7xUNwqhWCA+cLxckkjoH//WzJN2nnF
         OdYCwL9JM2bVCdd0hGLGc1BAiTFBwIu7CzFB4+St4pSZ/ZkVVCeFfRgUNC8QPItqPJHz
         wljiA7ufsDYJeT5FzUsx8aQ8pKJir3SeySpfwo+8gWh8fD3rjVnYHNscgt1Wd0lBuULv
         xqOw==
X-Gm-Message-State: AOJu0Ywr1mVPXNPqyVxzFtuRM4aC9tuCfN+ge5AMoNwj6znELlWLoWLF
	CynC+oMF4khj76HhyHWqa+YC38dDRC5RDRnHMthWRvKBTU78mN64EZlebW0uK87g5oo=
X-Gm-Gg: ASbGncvdZAoPIqtlVPCm9VrxGhBLE2Lki+DIBDhw6KyC4mL79qH2kaHW4U8hTrwgApt
	iXpguBI1hpAyrxVVAKfkPGDfjitMJWhiUTvFaAB54DvQZOf41fIc4av6oe879Cgj8ZHAg9zEG+2
	UfDAVk35HCCcJrdj7096UOC9E97lAmI2D2ADH4JhHxgwtMy+wAkSRrbAsvPZzLfwFT/mP3RikTM
	cmosRC+fcdt0sMMxcHb3z4mTT3KUuhtQiJDelIJEdfCky3NYfQNi8PTCATHKgRJ/r5qsOEXWtDh
	j1D/xd1TJB01rKxi4rjFVLl1MN4o4lBVSO22BG6TFA9jDmktJzncKkoB6pi/8aQ1mo5ZWb+zeZl
	FMo6pXrCQqA9rvEP6Tg==
X-Google-Smtp-Source: AGHT+IG9FKgb7Jjonw/YFgU4N1hrxuPXGzYhSmTz8ncafmUnW8XdCAGvA88FcPuDJKYrrLEhi8U2yA==
X-Received: by 2002:a05:600c:c092:b0:440:66a4:8d1a with SMTP id 5b1f17b1804b1-442fd950b76mr95731035e9.7.1747649843406;
        Mon, 19 May 2025 03:17:23 -0700 (PDT)
Received: from localhost (p200300f65f00780800000000000001b9.dip0.t-ipconnect.de. [2003:f6:5f00:7808::1b9])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-442f39e84acsm210974565e9.25.2025.05.19.03.17.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 May 2025 03:17:23 -0700 (PDT)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc: tools@kernel.org
Subject: [PATCH wotmate v4 0/6] Cleanup, a fix and txt representation for trust path finding
Date: Mon, 19 May 2025 12:14:30 +0200
Message-ID: <20250519101429.1558947-8-u.kleine-koenig@baylibre.com>
X-Mailer: git-send-email 2.47.2
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=3092; i=u.kleine-koenig@baylibre.com; h=from:subject; bh=0u5g8hVn9C1B9pzOi2UHoRuGXgu8/98bOiEROCf6oZU=; b=owGbwMvMwMXY3/A7olbonx/jabUkhgxtltaEx0bJrZILi2z3uT6Y1Hr3ZcqRmi7bivKc59dYp /UGN17pZDRmYWDkYpAVU2Sxb1yTaVUlF9m59t9lmEGsTCBTGLg4BWAiB0vY/8cJFj9ZdiJ8schp oYpL1Qom6VKWCcukzlfrLZ77X03S0NDywsIZeV8uWKU/t2ZJ33xJ4TIrk/iFZNkLQTbvhesuGAf WmX75Xhf9otv2bc2Lq3p/i07qFjZZ1UfvlV3Gv65pg66fbVqQaupfKcbyw6szTy4XKQ/iPc3pWl k0jU2xbSvno5lda67PZj5ok83YLiTI+eq/+d6Lq5frWC/YLBY0TfITx4uTa9+s/vd3q6XmS99CP hdPTgHBr58Odwlv6Hf55zwzNupPCmtLAs/7xUv1/Gex/pO51HX9gW5wVpx93+anU1X/1/jKZJus jNIIDYude0iLr4NHdF5uSI70uw9nVDxmpZY/Yr4f0scGAA==
X-Developer-Key: i=u.kleine-koenig@baylibre.com; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit

Hello,

This is v4 of the series that I called "Updates to wotmate, partly due
to changed behaviour in gpg" before. Now it does some more things, so I
renamed. The previous submission is available at
https://lore.kernel.org/tools/cover.1747038870.git.u.kleine-koenig@baylibre.com/

While testing different things with the kernel pgpkeys data and trying
to understand the path finding algorithm I wondered if that couldn't be
done in a simpler and then also faster way.

It turned out that using Dijkstra's algorithm isn't faster (which I find
surprising) but the algorithm I implemented finds some more valid paths.
I didn't debug where the old algorithm prunes these, see the commit log
of patch #3 for an example.

The first patch (as before) isn't needed for the fix in patch #3, but as
it simplifies reviewing the emitted graphs, I kept it at the start. The
only difference to v3 here is that the txt file also contains the
certificate IDs now which was helpful while debugging the path finding
procedure and which is also a useful information there.

The second patch is a new simplification.

Patch #3 contains the new path finding algorithm.

Patches #4 to #6 are just rebased and the commit log slightly improved.
They were patches #2 to #4 before and care to follow GnuPG in not
trusting SHA-1 based 3rd-party signatures any more.

Note this also supersedes
https://lore.kernel.org/tools/20250411064226.1461929-2-u.kleine-koenig@baylibre.com/
which is a fix for the old algorithm.

For maximal transparency I suggest to do

	touch empty
	korg-update-pgpkeys empty

in the korg-pgpkeys repo after patches #1, #3 and #6 with the linter
check dropped (just comment out the `continue` in the `if not
wotmate.lint(keydata)` block. Short-cutting the linter has the effect
that the txt files and svg updates are also done for keys with SHA-1
self signatures.

After #1 this is a noop to the keys but it introduces the trust path txt
files which also regenerates the svg files. After #3 the fixed algorithm
is used showing the paths missed before. After #6 the SHA-1 signatures
are ignored which reduce the WoT considerably. 

For reference I created

	https://git.kernel.org/pub/scm/linux/kernel/git/ukleinek/pgpkeys.git wotmate-changes

where I implement these changes to the kernel pgpkeys repo.

Best regards
Uwe

Uwe Kleine-König (6):
  Put a representation of the trust path in a txt file
  get_all_signed_by: Return a plain list instead of a list of 1-tuples
  get_key_paths: Fix path searching with an easier algorithm
  export-keyring: Continue updating keys that lost all their trust paths
  export-keyring: Default to store "clean" public keys
  make-sqlitedb: Don't consider SHA-1 signatures for trust paths

 export-keyring.py   | 156 ++++++++++++++++++++++++++++----------------
 make-sqlitedb.py    |   5 ++
 wotmate/__init__.py | 151 ++++++++++++++++--------------------------
 3 files changed, 160 insertions(+), 152 deletions(-)


base-commit: f146a1815ad93b2f318e0a5fa857b11814a78b8b
-- 
2.47.2
