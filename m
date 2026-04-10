Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE48E3A6F19
	for <tools@linux.kernel.org>; Fri, 10 Apr 2026 22:38:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775860692; cv=none; b=PEQWS2tI5yyGX++LE/gpxKFT7pJsPnltlXIR37mWAo0siIXLZ940il/NzOa1Wh0wu/OrsUKThhWdDa5J1OrvjxJUCJ+5bjnzrltjR3WXBuDtgLFcw7GfMNT8KiDt6I0bPLi9vSoxj4/8LvV5CQ/mQXWFxbNBRdf90U0fxj48VlY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775860692; c=relaxed/simple;
	bh=jPWAD+3MW2cfa2x3aK4Idcc3GZYOkUEm6CcghoqHz3s=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=by83aTacrSkKpprJp8WMHLFhaH+A5H/hUlLsQvJey5xVADktLrhyzIuMiANxlWyxRtbt6PxdvJ573ZuyTFXD7XQ7LHB1XPFRlSADxEfhpS4mW2fCWtl7xuy7GmdnvFFcxk/qHMClQOnPgpxv+eBmvHPIhh7O1PzsLvlXep5Bcco=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HTRWUGfe; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HTRWUGfe"
Received: by smtp.kernel.org (Postfix)
	id B17C1C19421; Fri, 10 Apr 2026 22:38:11 +0000 (UTC)
Received: from mail-qv1-f47.google.com (mail-qv1-f47.google.com [209.85.219.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 047BBC19424
	for <tools@kernel.org>; Fri, 10 Apr 2026 22:38:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 047BBC19424
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qv1-f47.google.com with SMTP id 6a1803df08f44-8a5800772f3so20669556d6.2
        for <tools@kernel.org>; Fri, 10 Apr 2026 15:38:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775860690; x=1776465490; darn=kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3n4VJb1ieLQNBdeXZgizz7fHuDpIsTrtAhHsuk1zgCY=;
        b=HTRWUGfeCPn0jLefjEQ3hAkjSyXVHBlLNnUPyIC4dQzhEK27o6bFVKHBacTttyGW7b
         Ozd3ReU4AQvLTYGUsBxH6ATso/6izwrQSU70UQpjz6Sx6//dfp6aBrKaaDz01kXedsSL
         R6MasAY9CE6A0TYj/G+elEHC1x8vdZuKTW4VJFmY9N9q8TKEaNLhmfbdkthzXK78mmV3
         6wnGCO0WisYM68ZF9cD6DSKCzYqB3CqrDY0D8epDxprgXU1Jf1pPI4k70n465Tw4bACY
         ChdTdHFOTI9e9p0Xc5W+DlkWBRIhueV3P0wvZQwQnNBdsnzqWutLtyYCrsn/C81WXTIX
         tOCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775860690; x=1776465490;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=3n4VJb1ieLQNBdeXZgizz7fHuDpIsTrtAhHsuk1zgCY=;
        b=NE0osijrTJZM06PmA0pRA6XNND8HGssx4tRd36rfdSj+GkyhLi2E4mgrfHwmCcmliQ
         9DybgpnKGpxtkcABhNb8xSKeyQ3BirQ9O5kxov5ibIcYz9kfI+F+pzeH+cjud539y0Vj
         MOMMItrCk7gNJmkGHFUG4myRojIVUGhEbQC9XE0+3j8e0qSGGzNbGx2VuHmHMTFS4/PT
         t9Faf3zFTOrFRYHVJCfKUkew9gCstkh0Qjjjr9B+xWCAVpEd159EQMQdWCH+hkoZx/b7
         zAP/yr9POL+mXxAqHc2Vl/7/FnrP0uW/6vcQ72n2cHXHjdabVF5B1ZvmIN2Cbp8L1OoN
         ZOzw==
X-Gm-Message-State: AOJu0YyFyrkdjiISloQZ0sc8ZkGdhKQ5xL8OkHJx9vDlPQQU1O29y7tl
	0MD/aJXIfN+0gSkmij3ZJ3t9NZvTCLgsxkGMGv/Nx7tVMNabQNQYbo8j
X-Gm-Gg: AeBDieuT2yQD7xA15dQGS6f8THTHDmnobopRa9KDNDuknu7VezBk0ZFvRUHMybSqRgD
	KTFVWMZC1mOR6dHX04DKADv61C9ZUw0z+sh6A/cv3wt1zOAq4Yf/AbbMBD2YAUOFiRifAwoJ5Wg
	pI3lhIIuGa8RhC4rC0FGHenFW/j0Tps0uPuuUfX0f0iQKaU5Suvo3daKA9ne4PHBsR153Ea4tmV
	XytrGCyauTBKt+mRd1bHWWXMxNFNNXLkVDmVmCn4RzbEsGFI0tUCAyGKuU4jl4g5W1ECgLXH7m/
	JKdw61hIPhXMB7HpR5R5tafgQk54xCZwp9H7ai5k8KF23JJXVZYhApxGP1oGkDPW2riqtY9QQJc
	OtQfxdU4UbjmuNPok1+v0tb1QZwX+wSa8cnsrDaXo359F+OqoEBP/exxDFFfaXkv9UmBJezY+K+
	lZu9L9rpZKVTQhv8VnDn1BGsoobSm0tRIddNE0TYhJjGl27eYIz2+lEUMaN91D4Rh4DgIJ+f7M9
	4YO82uFKIH2G/jJMjK8MG3XHb6CPXG6MCclgBNTSsZhcWBF3oMhAuZ2brqKhlMQfRQKZSsCjcxM
	16Y6rjKhzQ5fHBPQ3/b4t49I5fQu47g0rIrivOKxHDRcN/pbAkdh
X-Received: by 2002:a05:6214:3d05:b0:8a3:6f43:c78a with SMTP id 6a1803df08f44-8ac86220f23mr75465326d6.39.1775860690012;
        Fri, 10 Apr 2026 15:38:10 -0700 (PDT)
Received: from 1.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.ip6.arpa ([208.80.35.36])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8ac849db735sm41370096d6.2.2026.04.10.15.38.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Apr 2026 15:38:09 -0700 (PDT)
From: Tamir Duberstein <tamird@gmail.com>
Date: Fri, 10 Apr 2026 18:38:05 -0400
Subject: [PATCH 14/14] Add b4 send configuration
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260410-harden-type-checking-v1-14-fcf314d9d748@gmail.com>
References: <20260410-harden-type-checking-v1-0-fcf314d9d748@gmail.com>
In-Reply-To: <20260410-harden-type-checking-v1-0-fcf314d9d748@gmail.com>
To: "Kernel.org Tools" <tools@kernel.org>
Cc: Konstantin Ryabitsev <konstantin@linuxfoundation.org>, 
 Tamir Duberstein <tamird@gmail.com>
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openssh-sha256; t=1775860675; l=736;
 i=tamird@gmail.com; h=from:subject:message-id;
 bh=jPWAD+3MW2cfa2x3aK4Idcc3GZYOkUEm6CcghoqHz3s=;
 b=U1NIU0lHAAAAAQAAADMAAAALc3NoLWVkMjU1MTkAAAAgtYz36g7iDMSkY5K7Ab51ksGX7hJgs
 MRt+XVZTrIzMVIAAAAGcGF0YXR0AAAAAAAAAAZzaGE1MTIAAABTAAAAC3NzaC1lZDI1NTE5AAAA
 QNLuo9fijuofF3TuKfaOBM0xBelxEDMw7LCVBfNTdXbTWqv/eH2OrWkIEK5SpsbAgmNGn9pkHsW
 SqcafKhzyjQg=
X-Developer-Key: i=tamird@gmail.com; a=openssh;
 fpr=SHA256:264rPmnnrb+ERkS7DDS3tuwqcJss/zevJRzoylqMsbc

Populate the repository b4 config with the lore masks and default send
settings used for kernel.org submissions.

Signed-off-by: Tamir Duberstein <tamird@gmail.com>
---
 .b4-config | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/.b4-config b/.b4-config
index ad41b6b..1cb97f4 100644
--- a/.b4-config
+++ b/.b4-config
@@ -1,2 +1,8 @@
 [b4]
+  midmask = https://lore.kernel.org/%s
+  linkmask = https://patch.msgid.link/%s
+  send-series-to = Kernel.org Tools <tools@kernel.org>
+  send-series-cc = Konstantin Ryabitsev <konstantin@linuxfoundation.org>
+  send-endpoint-web = https://lkml.kernel.org/_b4_submit
+  send-prefixes = b4
   review-series-check-cmd = uv run ./tools/b4-ci-check.py

-- 
2.53.0

