Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 684C836308F
	for <tools@linux.kernel.org>; Wed,  2 Sep 2026 14:08:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=100.103.45.18
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788358107; cv=pass; b=j908XSpjXIgH2CbYlaWnNo3rn5nXZXcjSv4EjE9CATZXaSpLZbWMyGxK5Yau6oEFnLpNZilahAUqJ5nQtX/KyxN3AM/LVEFOQjoe1x8OS7MixWLXpe99wHaczVOKzCKK6RKDI30fer+oFbTKt/FRclAg7nRyQQ95MH7ZTLz/sW4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788358107; c=relaxed/simple;
	bh=mlBXZpHMp9BHo/xnknWP1hwdB+/y+8cMODQB/5/4Ggc=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=JIKJIPkyLbmTRvMsFORBdM1iqagX/aSuAuw/iePmpujWpudIGdHluhDktqU0z8HqvCtMDSAGCL74HrdY9ZVCT8rOBPNuy3UYAU+45zdcLJmS2eUG+EQwxEg0FuSWheXAPATok2HLp42JY5tEOC5xzUikO9ShwVBTukHUTwN5YSY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GbbkfinX; arc=pass smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GbbkfinX"
Received: by smtp.kernel.org (Postfix)
	id 1A4041F00A3A; Wed,  2 Sep 2026 14:08:26 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=209.85.128.51
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1788358106;
	b=dns1vvVcBItvB1tINr0z4ndz3y21hzR5br1oS9l96cYTiBJz/rdQuFEHC9PcTiJinQAs
	 6Tc8lFy6sQINyjwAFMFEJ+haufCQn6qw+MyryBU72hDCq4g0Z/B9c1PqH4E/QnI2hnd9H
	 ePh3LNm2THHXAN7c6+O76d+daJhyNxfu7Xlz/WgGhdK4i2yPeoh7OJALP3At6IebiuV8l
	 eo/IjSm9DRy66ZUlBYuymkcuckerdr1YFsTAkkzcHeXnbPG7dB8mjH940rhVREgpi0JKs
	 nXAc6qAgbpg1SBHARRVt4Zh2rr8CTaKIJokXeTvJXgiUMJjzCAaC8Ugwl7i0th1HDTQ==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1788358106;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:Subject:Date:
	 Message-Id:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:X-Developer-Signature:
	 X-Developer-Key;
	bh=cr2DOpTUfU6nEVBSacqrJhV1xnPikdhJKLlMLNWxY5w=;
	b=Y9r725h1kVUxg4lC0fX9buqrw1RLNuNkzXuN2gXDTlXLfbqB7HS8is7Q1MkNfGKNpabs
	 czKoGDriNFHHtur6LCdixK364bilscmynfGC/DpEsP2UoIDkJEFyGgshcjg/L1TAevjm4
	 EondoWtHaM4J8UHCVZhF89vbJBxc/3MNyB6q2wulqSluvIvZ/fPxqc/Z0uiPHBcLnvn2t
	 fXhVCFuHlLXicUtvdJs3sM6idYEWn0r7VbHdChU4Ihqy6Dl/hXOgHqsEg9NFQgR9FHWIv
	 YjS8A2oh5BHa/udAITKoxI+M1jWZUxaPkCyFOo2Z12aQsFGvujnSRmWdahefVNaUBcQ==
ARC-Authentication-Results: i=1; smtp.kernel.org; dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=GbbkfinX;
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=209.85.128.51
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 857241F000E9
	for <tools@kernel.org>; Wed,  2 Sep 2026 14:08:25 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=GbbkfinX
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.kernel.org 857241F000E9
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-49b8be0409fso8089605e9.2
        for <tools@kernel.org>; Wed, 02 Sep 2026 07:08:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788358104; x=1788962904; darn=kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=cr2DOpTUfU6nEVBSacqrJhV1xnPikdhJKLlMLNWxY5w=;
        b=GbbkfinX0nOOOTY39F+U3NDBzaph76xFGYwGAvKPj8iTBBniPFm6o82z56x6iuhuNk
         +1o5yHA0mLhiZNrvylYC43UI1IzxXQo0CYtDr8K0DISpFaEskjoPzuA5TSIulncruYND
         GrteGFIF2Fmj1IsZwSKumhFUAfEBJTo0K1CR8I6stX709kmieCwjrchonewaZTbjC2cD
         kcJz0EeflVXH7wh9gtjTOWCjn0Z743RLiZxxib4LuLQG/yyc+74eB8Y/4jZbtrvoiNSE
         xyK4GgV/ExvC9M5Jyb9TJYzVLdoMYy6W/rNXuF6rIPjSCIHQy5lN4jSqrbQeRvpZQZLi
         rp/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788358104; x=1788962904;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=cr2DOpTUfU6nEVBSacqrJhV1xnPikdhJKLlMLNWxY5w=;
        b=M+jGijYLSzJtIabcf4ay5NNZYNr/wc9j9EiVXG9qvhM8QqtCSeBudbieXLL0DBTyQ9
         5vkZi9/F++/M5RoxTkJpc5JiCxG2CP1xD3d4neLyExzaBNSxGDVptP4qQ3t2sctToQXi
         V2p1gbMPFBFeUvASjkFplnSr8aoAfM9CVmGDqjfoBt38t8g4CvYpl9SuXr2SooCJpUry
         t75/ANOP/ramBRsBdh93LrDcdH4p+amL8FJjTJcpV2luIyaW8ofquKfRSsk+33LLa0Cm
         BaZVOWvVzDv1yyZXmz583NSYtlZB1OrCEbuJH+UiqRzdlJYXoBBHM64qxBEP2JgAuJOU
         IhTQ==
X-Gm-Message-State: AFuF++kdj6PrNwS9g0LBVwcjovcypQQ6guW44iSeL8InlJu0JAjWz+o1
	BLKZ5kOyMDTXwRBwQN2mexz24ZXuu8tqN91qd65RC8HUqUNoL2wgK7Tf7vl+mZ0V9xk=
X-Gm-Gg: AR+sD13q/kariEOXvCvPCIwHfiZYatcxEOsBvZWxKiGyK8iiigTKuMxZF/HvZGyWghz
	tzQOVQ43bmsWbNY6DAe3vSqAlTn+0qPLpGflEKMm2DsLMUtHMVWgMoezJvWMegV45yRvKi5qyWJ
	wxyebqGgEjdV9yL+jDp7VgjoYgeRlu82qtR92wVD/0RV8RBz0aXq5qtTk7/ymojY8mcNZ+BPtei
	FGSotpH8YggYXYS7+8Q78NuSFYkbhxuF36qXTGPQCtlJ66yyup0MlUprPoBy9UAZYQKMTbF0oSx
	S485tg0RNb4AXj/bCHp5H7gt7ajf88iezCjx0XW6JakDrhIfZMxAuRZBHxn3f5fIzzS7mkpNbNV
	3TTXDpo+pzT0D3+0jxLLotbi6LHG9szn+ahOv2/pyba2iRbAR64Fdc4aIwtFcgBmOMLlmF2tPJi
	MCF/a2uZdql/RyLk0LKpcML/en+VkaNEkuynqwGl/7AYk7Ly4Jl+2XPPmAP7sY2DGx4gV0eBBHd
	eBM+PvAwlOTW1d0wPa2fXYqN8uMRHb2LqKvhlt2X8Apxh5DVufJAMgLRD0+Jg==
X-Received: by 2002:a05:600c:4f0b:b0:493:bd2a:93be with SMTP id 5b1f17b1804b1-49ce581316dmr73976815e9.6.1788358103716;
        Wed, 02 Sep 2026 07:08:23 -0700 (PDT)
Received: from valmpani.valmpani (athedsl-11462.home.otenet.gr. [87.202.45.32])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49ce551bf7asm38317335e9.2.2026.09.02.07.08.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2026 07:08:23 -0700 (PDT)
From: Vasileios Almpanis <vasilisalmpanis@gmail.com>
Subject: [PATCH b4 0/2] review-tui: fix missing signature on sent replies
Date: Wed, 02 Sep 2026 16:08:18 +0200
Message-Id: <20260902-followup-reply-signature-v1-0-394a5a4394cd@gmail.com>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIANItmGoC/yWMyw7CIBAAf6XZs5tQIvXxK6YHWpe6hgBZiq1p+
 u+iHmeSmQ0yCVOGa7OB0Iszx1ChPTQwPmyYCPleGbTSnboojS56H5eSUCj5N2aegp2LEFJ3Nsa
 27mSMgZonIcfrb32D4Qj93+UyPGmcv0/Y9w+yr2iRgAAAAA==
X-Change-ID: 20260902-followup-reply-signature-e6855a1f7555
To: "Kernel.org Tools" <tools@kernel.org>
Cc: Konstantin Ryabitsev <konstantin@linuxfoundation.org>, 
 Vasileios Almpanis <vasilisalmpanis@gmail.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788358102; l=1233;
 i=vasilisalmpanis@gmail.com; s=20260731; h=from:subject:message-id;
 bh=mlBXZpHMp9BHo/xnknWP1hwdB+/y+8cMODQB/5/4Ggc=;
 b=0OoqR8ORtQU6WeC73VbIZF/U7IFyA4SHkvv9VIPQlnzyE7JnsjuaY+MOEZXoHFOqMlJ9VGNA+
 WiTtxTkma4cAK+c1t3F2qrqxphk3Uc5lVqWQKe0JKwGOMvWvnpV9GW0
X-Developer-Key: i=vasilisalmpanis@gmail.com; a=ed25519;
 pk=gn5Uo6yL8Tlpq5uATxA3nqoq+U8eWLRbjD+bOk0qSpU=

The reply preview shown by "b4 review" includes an email signature that
the message actually sent does not carry.

To reproduce: reply to any follow up message from the review TUI. The
preview ends with a "-- " block, the delivered mail does not.

Patch 1 moves the "append unless one is already there" logic out of the
two places that had it copied, into b4.append_email_signature().
No functional change.

Patch 2 calls that helper from both send paths.

Two other variants (bugs/_tui.py, ez.py) are not touched, since neither is
equivalent.

Signed-off-by: Vasileios Almpanis <vasilisalmpanis@gmail.com>
---
Vasileios Almpanis (2):
      b4: factor the signature append into a helper
      review-tui: sign followup replies that get sent

 src/b4/__init__.py               | 12 ++++++++++++
 src/b4/review/_review.py         |  4 +---
 src/b4/review_tui/_lite_app.py   |  1 +
 src/b4/review_tui/_modals.py     |  5 +----
 src/b4/review_tui/_review_app.py |  1 +
 5 files changed, 16 insertions(+), 7 deletions(-)
---
base-commit: db0b7456d0cd606f397e18fa0c589fc621fa57b5
change-id: 20260902-followup-reply-signature-e6855a1f7555

Best regards,
--  
Vasileios Almpanis <vasilisalmpanis@gmail.com>

