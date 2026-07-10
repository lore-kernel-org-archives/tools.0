Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D0B73148D8
	for <tools@linux.kernel.org>; Fri, 10 Jul 2026 15:14:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=100.103.45.18
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783696481; cv=pass; b=bQtX/5xZRJLOGxYPdp39RieF5bPGUHjrFcTxZt9bWIMOayR0OMd44Wn6WFXToxG8SRWrxX7W92MuzdylzRFPLRj8wnwFVXwdZZ4H+D0lt4x7vCpuNvDoxiIP7YarXyjI6yLNS+vDBiT44i0DGU0geRyMirMgUjlum42aachWExg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783696481; c=relaxed/simple;
	bh=7VK83N1ZX71cvgLAvMb8eW+HR4tfCpdm20QWtrOW7fc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=aIUIOpaKGn79JC3747RfJpPAojEz9xey6beXyTByHbCXGw4eLSlp1x3YDg1/q2AH3fW65aERjT6KHgcpFwgRBoh/wzRIzDA6oC5EJnl68UcS3W1cjm84KdrfwMYhqKrNlnJDxFZ6Hj6Vn2fcreSTlvaIh7fsqPH1ppn5aYwfwT8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=JNzdf/1d; arc=pass smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="JNzdf/1d"
Received: by smtp.kernel.org (Postfix)
	id 11D991F00A3A; Fri, 10 Jul 2026 15:14:38 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=209.85.218.49
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1783696478;
	b=1VKHH8J/SjTSOBZ9u2b+1C22/sDyMCvXedDd9wrVq7UrNpmCMNCDLYfKULaJziEVfN0D
	 ZXTlPDYBW2WYf5jcQAi8OhyG589+fqL0Ky1FTpV+mWk6gfUMc92O1XQ203dYeRfjhuVOv
	 ax2l7jU6SlcsnkARtsM5DnowFGnMS3m3BPQshJGj/ZiQenbcoUsJIzBdfC6kwxzjycST0
	 k/2idLBm1BrL9FlU2BiS/a8sXAPywwnCOhcLz6wtOgobXnifiOlmTOO9/gYaw4Ihhw0Fh
	 LVNLk9MLcv+ZXL/dk5zmckZj8uz+Mquw9XO9MsqPmrmA0sLv7+Irh/1OK39GJgaf+5w==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1783696478;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer;
	bh=aWduelIB/oXAtdXOpuuIbASndIYRqIDRFa/dYqiR1Xo=;
	b=KRB1rsT31ChcUUhkjRqUcDS1KLGIer3AmglJHLLt+x7ZdndpFY5xlI6KR/Y8mNcphTyP
	 dC4XZcreMXwd9rrxMTQ4G/2i03UKBQt+XxYyZlHcG3fDq5cBYKkGgQd390tbSmxYtF6Pj
	 mv2vA8ac/iPtVLVFgpYe1DtKlLGQy9DMFBfidveSPZFbsomOCebju6Z62ISU/lobZI9lM
	 L+0NHl/ymdOf/i3MPb/ItNQ5mA3+X4zpf/v2MfsT9fandt4djpKsZgXUwTRXnSYdgAyQ8
	 TK5YkkzfXudaT5YtI26y3JIdTLUErYRmYPqxRiEapAG0qD7R1xEvuRJTNf4Yvs5t+xg==
ARC-Authentication-Results: i=1; smtp.kernel.org; dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b="JNzdf/1d";
	dmarc=none header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	arc=none smtp.remote-ip=209.85.218.49
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 966FB1F000E9
	for <tools@kernel.org>; Fri, 10 Jul 2026 15:14:36 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=JNzdf/1d
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.kernel.org 966FB1F000E9
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-c15b75c9e48so143980366b.1
        for <tools@kernel.org>; Fri, 10 Jul 2026 08:14:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1783696475; x=1784301275; darn=kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=aWduelIB/oXAtdXOpuuIbASndIYRqIDRFa/dYqiR1Xo=;
        b=JNzdf/1dXf8B0vTDi6NSLgx0r5Sv7M06Gki7xiZK9vVCImIh8QfBYjI0bjuMfpIhY/
         VoYomgzevSmRmat+pYejFviahTh1EIH4VoGe+gz8Of/h7+TuPPUuWvUCULUgnpMErMkn
         zvPcXCk71dMyq/U6Un8cL+EXu8SIPkrdf9+Xt3cHXM98reuTHdOpkloxQInTEzegE6Br
         SWk+bml+GPbG75ZK7sUKI/B1MtEzuRwVXCudgaXjXo7ZgPeHRBaob7VcYraI1u4/6qMb
         JvdDlNM1CSLQ2ACd+uAyjVilX/9pLN6F6EiHI15PndKA9ws8sKwBR34sTROIT9pdB/FS
         zL5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783696475; x=1784301275;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=aWduelIB/oXAtdXOpuuIbASndIYRqIDRFa/dYqiR1Xo=;
        b=l1s9G/dQQXliahLsQ5LOWUrkunnpm8MNHuhA7m03Lxtu1d7KsN/KAya8BwFuByOC2x
         2A53t93zMGVfxSo0yB29yiUw7ZGCQ1G/f1NOUVIsgj4I2m8Yje1D4F9JvWm0hG5LSiWV
         eXlmIIof/v/i+J0ZVYSnotuKeO6rSb+RGp304AWJRL6LsgqacxhQl7T355mAgxCj+X5X
         /lvk657VbcpAI8z8qmza68nVUBMxcR/pgZJKbS7ZMGZo5ouHh5r7oQ+NBY1wwAPAF1Xj
         rA5ZEskq+rB/+S9Z8WkNuVErPrBMkLAdwkFlOO0i60URCW0MKv0o7njmdBOYxQwKkjEV
         BisA==
X-Gm-Message-State: AOJu0YwRWO0wj0BeslVAt5GAsM0SABs/XSzGS8ESb8bf9HCF2LfIdsMT
	IOYYPNzKpgsaDGbXgrXwhpnCphGyDSqDwLBlZl/smss1DTk8Kd1AwC4uxnU0jz4u06Q=
X-Gm-Gg: AfdE7ckmrsTijSLD2IYwbpY+F7Q/XIlKQg3FcwegCaR82JhQTGFNLc/huDAXp3g6nt8
	4LODqx45QFMeeghl9EN5AxKFTUHx7hlpTVIABQ4/BLRyYBIBGYYW0Oy8zVeh++ba66Ij4bBcrio
	szdcMJ9jjL4dVnLVNAAVuFjc7kHanVHvGEiKRcL51VTTEzG6ZTojwXBz4ewZ/gKUo+J0a5kIOPU
	WsIGHOraMaUE9nFECZb7QxuUV/M1dRGqSwb5gWIsjM2VMuMjirNrMiFA1S/8AAYfYo2HH0ALfUw
	teSwknnZKBaj79PCGGOlIWTTOzgEnjCSpfWCSvW6bexNj45bDWpWoql9a4pc+jY2vipBHNV3PHc
	PoQPLGyW+KricVD0J7s+LlG6HVUrvTgdTE8IXxYZePCimknnsHvSAxV6O2CgkeaChGjBZRIYlWn
	pZZfO/LRoWNlQaEkpHERA+NGJgqaF/nWFMvBhAfkyag0WBSwZqBVwdhfP6uvWstlZcaAdzQp+YB
	0/C8x8mts/a4c0=
X-Received: by 2002:a17:907:a286:b0:c15:b6bd:cbb8 with SMTP id a640c23a62f3a-c15ce121a12mr517497466b.50.1783696474760;
        Fri, 10 Jul 2026 08:14:34 -0700 (PDT)
Received: from localhost (2a02-842a-9b20-0d01-a06b-e180-2ea9-f6eb.rev.sfr.net. [2a02:842a:9b20:d01:a06b:e180:2ea9:f6eb])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c15c1470325sm489825366b.14.2026.07.10.08.14.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Jul 2026 08:14:34 -0700 (PDT)
From: =?utf-8?q?Cl=C3=A9ment_Le_Goffic?= <clegoffic@baylibre.com>
Date: Fri, 10 Jul 2026 17:14:06 +0200
Subject: [PATCH b4] config: accept prep-pre-flight-checks from .b4-config
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260710-b4-config-pre-flight-checks-v1-1-ab16cf14a00c@baylibre.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXM0QoCIRCF4VdZ5roBFbHoVaKLHEedCjecLYJl3
 z2ry/9w+FZQ7sIKx2mFzi9RmdsIu5uA6qUVRkmjwRkXzN4ajB5pblkKPjpjvkupC1JluikeTEr
 BuUDBehjCeGR5//QTRA/n/6bPeGVavixs2wd3CvGNgwAAAA==
X-Change-ID: 20260710-b4-config-pre-flight-checks-80dd6226c614
To: "Kernel.org Tools" <tools@kernel.org>
Cc: Konstantin Ryabitsev <konstantin@linuxfoundation.org>, 
 =?utf-8?q?Cl=C3=A9ment_Le_Goffic?= <clegoffic@baylibre.com>
X-Mailer: b4 0.16-dev

The .b4-config file is a convenient way to share project-level b4
configuration among contributors via version control.  However, only
keys matching a set of glob patterns are currently accepted from it
(see wtglobs in _setup_main_config).

The prep-pre-flight-checks key, which controls which pre-flight
checks are enabled or disabled before sending a series, is not
matched by any of the existing patterns.  The closest glob,
'prep-*-check-cmd', only matches keys ending in '-check-cmd', not
'-checks'.  As a result, setting prep-pre-flight-checks in
.b4-config has no effect: the value is silently dropped and the
default 'enable-all' is used instead.

Add 'prep-pre-flight-checks' to the wtglobs list so it can be set
from .b4-config, allowing projects to disable checks (e.g.
needs-checking, needs-auto-to-cc) that are not relevant to their
workflow and share that decision via version control.

Signed-off-by: Clément Le Goffic <clegoffic@baylibre.com>
Assisted-by: huggingface:zai-org/GLM-5.2
---
 src/b4/__init__.py | 1 +
 1 file changed, 1 insertion(+)

diff --git a/src/b4/__init__.py b/src/b4/__init__.py
index d7b41ee45dad..a2f1a008d41b 100644
--- a/src/b4/__init__.py
+++ b/src/b4/__init__.py
@@ -3847,6 +3847,7 @@ def _setup_main_config(cmdargs: Optional[argparse.Namespace] = None) -> None:
     topdir = git_get_toplevel()
     wtglobs = [
         'prep-*-check-cmd',
+        'prep-pre-flight-checks',
         'review-*-check-cmd',
         'send-*',
         '*mask',

---
base-commit: 4217c3e5d3e1eb259626142fd71b91ec6d5e3d1e
change-id: 20260710-b4-config-pre-flight-checks-80dd6226c614

Best regards,
--  
Clément Le Goffic <clegoffic@baylibre.com>

