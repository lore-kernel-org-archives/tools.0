Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4FC8323D
	for <tools@linux.kernel.org>; Fri,  6 Jun 2025 19:51:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749239487; cv=none; b=qnWQ35/pgLy8UQy4A/1fNljX3SPrK81SF0kBOUc2zKqwlH4bjMdDD1c/ABBCVuBRZ/vybKAik7Y8ggyLXH4E7CST9RMRW24MHUKeLntIv4Y6mq1lFEo5p76ZBmuXcwle38OitLcz3YdZvaPMJsQUCU67MTosEOFq2UvMtqQA8KE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749239487; c=relaxed/simple;
	bh=zzk7dCatcEgPx8HLbNDkVWiX7+ULBi0oCQStR5/yiXA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ADI92XPYEJKYsXOJhR0Iq4Q+QzaU5A/Ko12nUMRK8Yw0vyZGBvq9s2EVh49jBlUfYmWUOuQOqYedxOD2DAjbfvLTEfALDQalDioPBVqUTOE5wAwrBaIJDFBMaT/9mfRQ37gBwrdyPihlKMv/CW/pw4KcfsCY3N7GpwU/qiJLStk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MZXp7h5N; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MZXp7h5N"
Received: by smtp.kernel.org (Postfix)
	id A9A0CC4CEEB; Fri,  6 Jun 2025 19:51:27 +0000 (UTC)
Received: from mail-qt1-f177.google.com (mail-qt1-f177.google.com [209.85.160.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id C708AC4CEF2
	for <tools@kernel.org>; Fri,  6 Jun 2025 19:51:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org C708AC4CEF2
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qt1-f177.google.com with SMTP id d75a77b69052e-48d71b77cc0so30003391cf.1
        for <tools@kernel.org>; Fri, 06 Jun 2025 12:51:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749239486; x=1749844286; darn=kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rPT/gbekow1QaDGLA8wFUgDXY23lu8f7qYRCsmNjzVM=;
        b=MZXp7h5Ns9uKBld6AsxLu9ZHFoHvvUe04IJOsklnjuEpFqkAdYl2eYlScx84K6OYAQ
         ZVnQDZV30CkedM11lI3ea7bd8XnuSVg4a3/B1qT+gfxjQXYV2LAJdtYmOkAZsOkDn3uF
         5f7IEbR3yXstYUdo2JhtXfiAn2XNS1c0u8SjeW/2iKENV192Ve6v1HfYDMhMmL5ZdGQv
         7V9KmqkV4y3fm5hE+DTX/gxahuG5hsG7e+Q47AuPU2Dma+9dGOCea8IcZvZNP3aFVNOf
         3mCEiVZGW7+wPTAsb0R5zYVGgRrzODILNYlw0yFFPjmRieUCL2QzfMw5iG02g+fNaEn9
         HOTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749239486; x=1749844286;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rPT/gbekow1QaDGLA8wFUgDXY23lu8f7qYRCsmNjzVM=;
        b=jjHzfN+JbaTs4O9x8WxjEJLEqiErfQAM0m1HeNKvS6/TnMc3SIhCrx/vX+tI7r29/n
         1+BU6NFzq3Os9DmMDOh6or5ORgz7mW8QIJJPPi1JYQL7MEa5YQPbSBT1RDclyhOntRlr
         ZqsWKSVqvKNC2BmAouZ3IlV7UTfEkIp2JmnwchiKeCq8rPPRVWOdQD4liqBPNfIZehWC
         oe0Ag3UVekewQlr6LUoAiauFEF6W2rTP/LD4VoK0S6u7tsKipsGmYmU+RLz3bwgpnYjP
         vQ6RWxshFbLKRh+7eDqH07IEdNQxa4xFSGt10LbKD95VzRWuXdYuv0f/iTN9dWe/s2Nx
         ARQg==
X-Gm-Message-State: AOJu0YzTGmmtoG1HoGu8i57ATzKgeCjHpaPhIwJ9JSIgpvQ5YlnWBIJr
	2ci6G5POpYUPCii5cG2XC6dvR+Znzqqd3P6m/jdA+AiS8mC37kATE10z
X-Gm-Gg: ASbGnctAyvA2+BlgKozRXnFMtxYEzsXYJ25It/EqFtudZpl37qFUf4Xqm8D1RlG9lJ7
	4Cw2GQwln/RcTVyySJq38MVHie1xoUfQ0HJWvDJCaKKp1vUagolc7en2HBASdcY3f/CU5o9Stho
	eXxWCRSFULc66RDwEPwdDqLHW3DEZANLRcHDmNdb+ERsN2l2IJbaHVpruIbBUjrPkNIjmmIpIOl
	gCD5k0+SDk8yl/6suwoms+PU3nfsPKDPeOI216h2G8V2bWeK+2G2wFFCBOimDAlPmRHXUeiJSyO
	vv9acEUrM4FnYj+1OaWosD8WkeFbgDchxSyzxXFRpUKAK/vFH9mcqVIO+fvDP3zSbgcg/pnCFPj
	AE+xZx25k
X-Google-Smtp-Source: AGHT+IG3E748y4B5CCOVNIalo9X3DR7yFASkeIWKN2AKzCk61zywgCnChBnFUS0mVATA9iLtiZDhvA==
X-Received: by 2002:ac8:6f08:0:b0:4a4:3d43:6e55 with SMTP id d75a77b69052e-4a5b9e00684mr86246881cf.2.1749239485592;
        Fri, 06 Jun 2025 12:51:25 -0700 (PDT)
Received: from tamird-mac.local ([2600:4041:5be7:7c00:d553:69f3:49b:5c70])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4a619895298sm17718521cf.81.2025.06.06.12.51.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Jun 2025 12:51:25 -0700 (PDT)
From: Tamir Duberstein <tamird@gmail.com>
Date: Fri, 06 Jun 2025 15:51:18 -0400
Subject: [PATCH b4 07/10] Add missing LoreTrailer.lmsg annotation
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250606-uv-compat-v1-7-c76c1c8d6eeb@gmail.com>
References: <20250606-uv-compat-v1-0-c76c1c8d6eeb@gmail.com>
In-Reply-To: <20250606-uv-compat-v1-0-c76c1c8d6eeb@gmail.com>
To: "Kernel.org Tools" <tools@kernel.org>
Cc: Konstantin Ryabitsev <konstantin@linuxfoundation.org>, 
 Tamir Duberstein <tamird@gmail.com>
X-Mailer: b4 0.15-dev

Signed-off-by: Tamir Duberstein <tamird@gmail.com>
---
 src/b4/__init__.py | 1 +
 1 file changed, 1 insertion(+)

diff --git a/src/b4/__init__.py b/src/b4/__init__.py
index 14e9066..804169a 100644
--- a/src/b4/__init__.py
+++ b/src/b4/__init__.py
@@ -172,6 +172,7 @@ class LoreMailbox:
     msgid_map: Dict[str, 'LoreMessage']
     series: Dict[int, 'LoreSeries']
     covers: Dict[int, 'LoreMessage']
+    trailer_map: Dict[str, List['LoreMessage']]
     followups: List['LoreMessage']
     unknowns: List['LoreMessage']
 

-- 
2.49.0

