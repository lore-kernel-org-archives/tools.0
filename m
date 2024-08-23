Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F3C01BF3A
	for <tools@linux.kernel.org>; Fri, 23 Aug 2024 10:06:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724407569; cv=none; b=QFz+8xWpGAX43mATm9zYxqb2WR/aVVueUM8eX2l4AtdKVKYQtdyScewI8cR0FUUBxBQZCZIsmq705ZiyllBD9WhnIyzGqW8r3ggLq1mmpOaWx4MQXoUjwtTAmvwr4ACtwTreTZZZ3QekvifBUWzpcFXCcAOVFv4wm2LZaYYeOyc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724407569; c=relaxed/simple;
	bh=XWSOiAX8/Exz2mu+SvobfClMrO64wWUMJpcZlw7puIo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=HxtMh+UnSDNg8u7618hhMuTxHYBFLcBSpeeGf0+ePu/jn0iRzx746EqU2I9JFtiQh+nC9blpvihzuRmuj419e8RUl5s47HKqczNkY0kAoqjIPU79QtRTzyzwhjNhRd/jbphRcqmwA0j0kmGIuxzyIcY2NwmygQdDWCvXsoTfE5o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=k/YoPiow; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="k/YoPiow"
Received: by smtp.kernel.org (Postfix)
	id 36505C4AF09; Fri, 23 Aug 2024 10:06:09 +0000 (UTC)
Received: from mail-pj1-f66.google.com (mail-pj1-f66.google.com [209.85.216.66])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 32492C32786
	for <tools@kernel.org>; Fri, 23 Aug 2024 10:06:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 32492C32786
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f66.google.com with SMTP id 98e67ed59e1d1-2d439583573so1310555a91.3
        for <tools@kernel.org>; Fri, 23 Aug 2024 03:06:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724407567; x=1725012367; darn=kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=B3S2xMjYtX6zqEiHtaJIlne+uer2ECru6vnzpeHPzFE=;
        b=k/YoPiowN9nnAaRfwXf+dIeJQ4C1Y3sykgyOxgUCipX9yk4asj38ufjlA6t6vrltSc
         +jM6+lVhLphtiSUqDawRZDy4/jTLvJlYNht/nHvhZDRyjdR4DL0XR6SF+19MnJw9kFOy
         92rjojuGA/Cz/d1++9x+20ehrBKaHv93OIG4akRye+LrzlbY7lzLyUls2lJge/8FPjJP
         6HRkDIGWfmT355t/gSKjZMVLALLRMgLWqMic+9qqUVtDPDGlg7at2ZS0EQ6pVkM1v/uJ
         EPohaZerGQ6ozNsqE7il44LOG6d+9JJHZp4uUlIGtR//ZgFq6E03++ZKqxOacd8DDEUw
         T0QQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724407567; x=1725012367;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=B3S2xMjYtX6zqEiHtaJIlne+uer2ECru6vnzpeHPzFE=;
        b=laAfpwMQ9A4ppXpyqylooev7aaYGrV+5et0Jw1Al5SsX8rxutQI314XJ5AUA/gsyEL
         /U480H2rgH5t/Q///B7ZZdYYG3zSSpQuwCagLtLhyXXXmwKp0u1r/CGx6zPE28/tgq+v
         8jRinDturdqunIUw8pVdS0JzrhIFV8OM01c5QKoFh78F4pUry6NDhtkjQv0Bat6hR955
         nGX0l0CusU79U1rFssBeMd/qKiZNtuzoKuAS7zMw0rseanoirPrUkk+FQ/iaYI2QGm/b
         uh3/5Y+3Nh39NopiwlM0I69EWe8rjOP2xEJqBIbEoYmwUwuJEppiOYaAwJttpB1/DsqM
         MJwQ==
X-Gm-Message-State: AOJu0Ywjz6vdn2gQauma7/Pr8du1+13QIE9XYHE0zmPbfV1Yc7sK6M6P
	A4cfgJnx/sLqGfcqgSbsrUpOIAn+W9RBEO9K2o1WlSlrWUoEIZ2D
X-Google-Smtp-Source: AGHT+IEOKm+CkU5fE8QuYa2lN+RUYs8whJxReX2gMXVtCtBZgjANfJinRbSBk2gCFNx37FJzeqvtmg==
X-Received: by 2002:a17:90b:23cc:b0:2d3:b357:7857 with SMTP id 98e67ed59e1d1-2d646bce05fmr1719634a91.16.1724407567242;
        Fri, 23 Aug 2024 03:06:07 -0700 (PDT)
Received: from localhost ([103.156.242.194])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2d613a60f24sm3592464a91.32.2024.08.23.03.06.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Aug 2024 03:06:06 -0700 (PDT)
From: Celeste Liu <coelacanthushex@gmail.com>
X-Google-Original-From: Celeste Liu <CoelacanthusHex@gmail.com>
Date: Fri, 23 Aug 2024 18:05:57 +0800
Subject: [PATCH b4] Fallback to sendemail.identity when
 b4.sendmail-identity is undefined
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240823-feat-use-sendemail-identity-v1-1-7b9f7d0e0ae3@gmail.com>
X-B4-Tracking: v=1; b=H4sIAARfyGYC/x3MQQqDMBBG4avIrB2wiS3Rq4iLqL/tQJtKJi2Ke
 HeDyw8ebydFFCi1xU4Rf1H5hoxbWdD48uEJlimbTGXqyhnLM3zin4IVYcLHyzsXCEnSxo3zFnd
 nm8c4UD4sEbOs172joab+OE4ZNdFOcQAAAA==
To: "Kernel.org Tools" <tools@kernel.org>
Cc: Konstantin Ryabitsev <konstantin@linuxfoundation.org>, 
 Celeste Liu <CoelacanthusHex@gmail.com>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=1047;
 i=CoelacanthusHex@gmail.com; h=from:subject:message-id;
 bh=XWSOiAX8/Exz2mu+SvobfClMrO64wWUMJpcZlw7puIo=;
 b=owJ4nJvAy8zAJfY4pvNJRPo6U8bTakkMaSfiubne/9ZcqLDEtmTD9WcxuZO0b/RNK1n38Mxbo
 a8rCiatWcvZUcrCIMbFICumyCK28+nrZaWPPizjNZkBM4eVCWQIAxenAEyE3Ybhr+yLGetlvYJM
 X03WyuCdv8SN16rW/FXR9Hvc5xdPcZM75svwv/RP2ZYHmieEGiacd9LjFD8n0ZgyNaq7wW2qou/
 OaRPfsQEArdpMDw==
X-Developer-Key: i=CoelacanthusHex@gmail.com; a=openpgp;
 fpr=892EBC7DC392DFF9C9C03F1D15F4180E73787863

To match the behavior if git sendmail better.

Signed-off-by: Celeste Liu <CoelacanthusHex@gmail.com>
---
 src/b4/__init__.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/src/b4/__init__.py b/src/b4/__init__.py
index 2b1a058..5908de8 100644
--- a/src/b4/__init__.py
+++ b/src/b4/__init__.py
@@ -3727,8 +3727,8 @@ def _setup_sendemail_config(cmdargs: argparse.Namespace) -> None:
 
     # Get the default settings first
     config = get_main_config()
-    identity = config.get('sendemail-identity')
     _basecfg = get_config_from_git(r'sendemail\.[^.]+$')
+    identity = config.get('sendemail-identity') or _basecfg.get('identity')
     if identity:
         # Use this identity to override what we got from the default one
         sconfig = get_config_from_git(rf'sendemail\.{identity}\..*', defaults=_basecfg)

---
base-commit: 37811c93f50e70f325e45107a9a20ffc69f2f6dc
change-id: 20240823-feat-use-sendemail-identity-98a3e58396cb

Best regards,
-- 
Celeste Liu <CoelacanthusHex@gmail.com>

