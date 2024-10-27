Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 270351E50B
	for <tools@linux.kernel.org>; Sun, 27 Oct 2024 15:34:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730043243; cv=none; b=XQsEg1Icnc58I5j7X9zelWF7SvLRl+cbkJO8RJqDE3VSlP2Dfr+HzzAqoeR+tyhPAD8Hmvp/C8kqQ0eDIidqW3dx3dvVsv97VG0C8LeqAuS/Qr47NX7GKQw87FLI1PBKOXfbbSUmfMaDxVo4USuwwQWtgS0rAflBC2IZhdW/igE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730043243; c=relaxed/simple;
	bh=FoJJ2h90LlibaI4SbrmizAGIBwMOx15jNQuyL67WDHw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=dPtLQfnz/9Kkc/uAEcSsnNgZfTokDrY21GSEqCBjPIHLR59JLln6VlEHkoD7jPsK4C1PvDkJBv4q86vBnxTQqlVCnrjgdQnuEMvfYvcGgNxkmzzCEMUDVMwHd0LguuxVoSYMklO7pCVFM1xOcJlX/F2NB2Pfl8SNxASfLBF+8Ko=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dMK+ddPQ; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dMK+ddPQ"
Received: by smtp.kernel.org (Postfix)
	id E83B9C4CEEB; Sun, 27 Oct 2024 15:34:02 +0000 (UTC)
Received: from mail-io1-f44.google.com (mail-io1-f44.google.com [209.85.166.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 192D9C4CEC3
	for <tools@kernel.org>; Sun, 27 Oct 2024 15:34:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 192D9C4CEC3
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-io1-f44.google.com with SMTP id ca18e2360f4ac-83b1d545c04so60556339f.2
        for <tools@kernel.org>; Sun, 27 Oct 2024 08:34:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730043241; x=1730648041; darn=kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bTKpU7tb6k7g67R2E6TGtP/hOf6u3m1LQ07VQt+VPxQ=;
        b=dMK+ddPQyadVVadnrZMZ053xAG5pnkvs9ZNt+eTSMR0PwMptmhU34XJRmJKqr7GDRq
         Sf682n/of9stIv6hyz+0qc4O70os1VeCjTZfRAWlTWY1X7ZBs/ARnbSbwys/acEC4p4Y
         QkvDIHEWHL2UtP4sYzoY9YPaCSMk1HzL8zWtCh7om/z30pOD6j99BVOyIt05R1dyBFrW
         pTnib+bbMRsi84TvZ4ZVZhG9Xmx36rcZ0DOIhYpGjR56UaFHRio+ANqdFvnuy+5zHSR3
         28kBb+jxJNmvBCjXiUtcmrCG0r6CWHJ/jJ2faNIyBkZGhArLxg9uVHHgILIi2UX4VE4/
         DJ1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730043241; x=1730648041;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bTKpU7tb6k7g67R2E6TGtP/hOf6u3m1LQ07VQt+VPxQ=;
        b=oapxlAsSVAoX5IuTQW/GRUc9gAva+JBw6CPbrgSrCvyDZlx+gJ9FaiiKe+2Mz+qzMp
         bKG5Re2JF/4T11OX3/b7f49qeUXTFsPBBCr5N1eBXdZmzXfC/ZWAeUCvLpe27+vO/9f3
         sdk4cuKXa8q0JSWb9XuDGj8YFhEgWUHQ4hyECr9yRxhqQNe5+bo5YN3cy2QAM1fzfv2/
         UOZ7hhzPDOd3KPDHQIct+ol70IPi/uNsWrWWigam2OT6ARgn6GB76Z1MvkSz8MR/8vk6
         NtIlIW6g6xX0b53VgCDa8wnycmaHpEun3cCH3s0Ojzrf6CAxj0DzS6dSW8wnrAvx/OrZ
         L6zQ==
X-Gm-Message-State: AOJu0YwMcBc//Bt/HBwb3P5IMqrmEC7ZXmDxOIC1AHq9sa9CR3I7/1un
	HB6e3i0to79YWzEngm06awGxufOR0PrEpmO3/40mAFOQBK1l4FfE
X-Google-Smtp-Source: AGHT+IHhPWkq0RBs+XazjMnZG6/DGzNBgG4rv2eIG5M3GCQKPgfKeM6Q4um5Md97S4pwRk5Fm+J6wA==
X-Received: by 2002:a05:6602:2c8a:b0:835:45f9:c2ee with SMTP id ca18e2360f4ac-83b1c3de174mr443380939f.4.1730043241002;
        Sun, 27 Oct 2024 08:34:01 -0700 (PDT)
Received: from localhost (207-191-210-45.dhcp.imoncommunications.net. [207.191.210.45])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-4dc727b2997sm1208736173.174.2024.10.27.08.34.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Oct 2024 08:34:00 -0700 (PDT)
From: Brandon Maier <brandon.maier@gmail.com>
Date: Sun, 27 Oct 2024 10:33:55 -0500
Subject: [PATCH b4 3/6] b4: handle trailers with improper formatting
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241027-trailer-special-chars-v1-3-1bd180dba425@gmail.com>
References: <20241027-trailer-special-chars-v1-0-1bd180dba425@gmail.com>
In-Reply-To: <20241027-trailer-special-chars-v1-0-1bd180dba425@gmail.com>
To: "Kernel.org Tools" <tools@kernel.org>
Cc: Konstantin Ryabitsev <konstantin@linuxfoundation.org>, 
 Brandon Maier <brandon.maier@gmail.com>
X-Mailer: b4 0.15-dev

A patch trailer with an improperly formatted email parses to an empty
string. For example see the linked github issue, where a trailer's
display name contains an unquoted comma.

As patch trailers are often hand written this can happen frequently. Try
to gracefully handle this case by checking if an email parses correctly,
and if it doesn't fallback to displaying it verbatim.

Fixes: https://github.com/mricon/b4/issues/50
Signed-off-by: Brandon Maier <brandon.maier@gmail.com>
---
 src/b4/__init__.py | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/src/b4/__init__.py b/src/b4/__init__.py
index 5115a9cd9b8746f84eb104a2be69fe121724167e..cf112e3bce2911c78cff18aac267608f796957ab 100644
--- a/src/b4/__init__.py
+++ b/src/b4/__init__.py
@@ -1063,8 +1063,10 @@ def __init__(self, name: Optional[str] = None, value: Optional[str] = None, exti
                 # Normalize the value with parsed data
                 if self.addr[0]:
                     self.value = f'{self.addr[0]} <{self.addr[1]}>'
-                else:
+                elif self.addr[1]:
                     self.value = self.addr[1]
+                else:
+                    self.type = 'unknown'
             else:
                 self.type = 'unknown'
         self.lname = self.name.lower()

-- 
2.47.0

