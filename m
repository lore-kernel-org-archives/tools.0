Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 995AC1714D0
	for <tools@linux.kernel.org>; Thu, 15 Aug 2024 13:36:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723729008; cv=none; b=hIzvyqeMxf6aGc6hvP8TySPuOaPgXs1eT6hPYmZ7Ym/cNYpWmbQ5b7JU+srroKYcaacKu3503BhjazpDw6q+aEbdQ+CteoniSKasMZIPUbK9TwPNYkARWO57ET3yiHJUOeTi8NEVwBAdzE+YcDJEOIgMEL690alZMmEE3nVVgEM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723729008; c=relaxed/simple;
	bh=2GmDA/gpIrJ+c+E4keM+XwVSuB6I4bxLO+cBO3pELDg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=mfS/IvCjnFI5Uzk3AiiSLQpDdSa7tp7zSlMkkq6+TTqFjuuCquPTMhgM1tKxSeOurG73/To7fECOGLwECzL8+5EmquP3wDWEqPKdiv8YtFkfDi3BG/IdwMliYMDn4jmplRwRB4hYTHRj1WHxbhiJAHQ5+HbNmjGQHsxcVvehTdE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=HUc8T5NM; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="HUc8T5NM"
Received: by smtp.kernel.org (Postfix)
	id 88519C4AF0A; Thu, 15 Aug 2024 13:36:48 +0000 (UTC)
Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 95861C4AF0D
	for <tools@kernel.org>; Thu, 15 Aug 2024 13:36:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 95861C4AF0D
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-5a1c49632deso1118769a12.2
        for <tools@kernel.org>; Thu, 15 Aug 2024 06:36:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1723729006; x=1724333806; darn=kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HthjNwlDydQWPfCjmmNwaH4OPUWdga8QPZJGk2thjx4=;
        b=HUc8T5NMK+2igbo1rGJeyfA+Gx0pK6xvze1yYNgzglCl1z2g0fY+wbbTjVTyvOv0yb
         mwutTZPZwfS+FTQYgFQGH2Q/1Ltt250QmHd6mFRb5/AaEAO+MQwas4ZTGySEDVPhme2V
         GPNvnY+BRev4UuyHCoExRgqhDWgffPo/yqRrPoGx1XbIQr+bY1gjSp9bgQyrm0zBN5FM
         kVYqJC4wZmi8tu/bVYI7avZXYtwUCXztB0V7rcwu9vLsUPd1qU/uORzQp95jCLdYh84R
         mHb3YAfGE1Fh7ithiTsrOjppZduf6/ko9v8t7uMF+6jQd7CAaCnjrQwxQBtPKdt1S9Ol
         RnAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723729006; x=1724333806;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HthjNwlDydQWPfCjmmNwaH4OPUWdga8QPZJGk2thjx4=;
        b=UO2nyu3YBK3b4TFrgZZ6GAq4SGOXQMjtOgiFd9mwzI5JQB8c1dOyScrQGGmOg2TLeE
         foP9bi4k7GZ7y1JwWD6mBnpG+L5IoMVnIviYqZ9ccjpyXTpDW8SPuFKLDsrVm433iMjC
         OdW8/n0i8JosIAPQr3HCKgxCfgIrVFuGnBSk/GjNb1Rv3P4h4mrwvQPs2YygqDSIGjoJ
         VhdmySmg0HBAqJql6sizZJBPqcuQ+4bJQroyRKQRdffxza40w2tEKlcP8fxP+oxOiIUe
         N0oSH7sYxWpSJYL+HuChL70X+4KlvIxzm2niNsCuzzKhXzZCyNyp3oy1DOaGrNjRPt3Z
         RYXw==
X-Gm-Message-State: AOJu0YyuG/LOg43nChkHZWnVPba5rkbDDci0HXGe2eUTPLv/7WDp//Ep
	vQKt2eKKla1FWpjjT6m2VyYguDMbAaLodDj7tAV7Hvahp4hb37HgjSy358lqHLOKvl75rNNINXu
	mk1E=
X-Google-Smtp-Source: AGHT+IEx65sjX98tjrDblKFIAULKiiKTBz7AI4UcIyaVkqhaZw0KFjnhKXochKMHi3UpVCaw+rXNAA==
X-Received: by 2002:a17:906:6a1e:b0:a7a:bbbb:623d with SMTP id a640c23a62f3a-a83670c0032mr407353966b.66.1723729005631;
        Thu, 15 Aug 2024 06:36:45 -0700 (PDT)
Received: from [127.0.1.1] (adsl-122.37.6.3.tellas.gr. [37.6.3.122])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a838396d375sm102979966b.221.2024.08.15.06.36.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Aug 2024 06:36:45 -0700 (PDT)
From: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>
Date: Thu, 15 Aug 2024 16:36:28 +0300
Subject: [PATCH b4 2/3] ez: verify default checkpatch.pl args before
 running them
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240815-extend-checkpatch-v1-2-ab7f654be699@linaro.org>
References: <20240815-extend-checkpatch-v1-0-ab7f654be699@linaro.org>
In-Reply-To: <20240815-extend-checkpatch-v1-0-ab7f654be699@linaro.org>
To: "Kernel.org Tools" <tools@kernel.org>
Cc: Konstantin Ryabitsev <konstantin@linuxfoundation.org>, 
 Manos Pitsidianakis <manos.pitsidianakis@linaro.org>
X-Mailer: b4 0.15-dev-49d31
X-Developer-Signature: v=1; a=openpgp-sha256; l=1690;
 i=manos.pitsidianakis@linaro.org; h=from:subject:message-id;
 bh=2GmDA/gpIrJ+c+E4keM+XwVSuB6I4bxLO+cBO3pELDg=;
 b=LS0tLS1CRUdJTiBQR1AgTUVTU0FHRS0tLS0tCgpvd0VCYlFLUy9aQU5Bd0FLQVhjcHgzQi9mZ
 25RQWNzbVlnQm12Z1JxMHZkY1VWdmlubEtPREZvcHlWbWpaU0FECldkbk5ySXg4VjdIR28rbWtx
 RkNKQWpNRUFBRUtBQjBXSVFUTVhCdE9SS0JXODRkd0hSQjNLY2R3ZjM0SjBBVUMKWnI0RWFnQUt
 DUkIzS2Nkd2YzNEowSERNRC85ZHVnbGt6M2lpR2ViSDQ1TnkreWNBVkFubWJ0WHNRN3ZIUE1Ceg
 pUdUVNd1ZVZ2MzU3JhZ0tIa2xYcitRQnM3OUpEaVpIUHRuR0N3SklSY21TbnNOSmZXODNzNS83c
 zZ5Y1NQamVyCjhnY1dtdjNENjRIMVRyNzZSbmxQTHczZ2paWlo4K2FZMThsd0tid0tXc0hrRkRT
 NkFYbDBLR1RnbmJtQ0JranQKdk9Hc1pGaTlDT2ZWbjVHZG9jNnBlQ0J0NkJZWTBnYXFjMWoxV3F
 4UklwK3dOV29WdHA4bVpZSXRWYmhqdm1sdwo4UEJiYnlTVEwzZ2RCT2MzaHh2SldsTVF5NEtLRl
 dObWVRdnd1VjFMMTgremdxRUNaVjJXRzcrVU0zQ1BGWlVrCmlLL3hjVDNINTlleEJEcEt4T0VGe
 TRDTUVHRmdrYTIrcmhzUkh3OFVrR3NZeFQ1a2MxeW5PclNTQUNJVjdpeTUKS1luSmgwSitHSHho
 aHdvM0hsNE51UlljM1lVTlhKWHQzZnphQU43S1JWZEphaVpVa2JJUkpDTTFORTJveXllKwpaUHF
 1eCsvVjczS3RlK1daeWJYQjhMa1IzR2d5eVQ5aUlydU5UdzVZTmdmREZPMmQ4bDM5M0p3Mm5EZ0
 1zQ2dyCnBqUmtncTFVcTJCWklOVVFGMVlNTGVpMElhRTRHcGQvUlNSRjhGdlZwYldvSXZPSFRIb
 kFuU0dpTzVuRVV5KzIKRjdCMHVuazdHVityak5ZNlI0b2FMTEZLb3pXVi9XS0FEb3c5UldYMG9P
 UkxDL0xqWko5cG9qdFkyYW5pN0NEUApXN3hBblJ2NzB0cGRPSUlHUW9McUdHblB3NlJiYkFTMWJ
 PQ1NMcWVCZm0xcmpnNWw0ZnJFV2IvVkhFaHc0UXJyCkxTRSsyUT09Cj1WNUVBCi0tLS0tRU5EIF
 BHUCBNRVNTQUdFLS0tLS0K
X-Developer-Key: i=manos.pitsidianakis@linaro.org; a=openpgp;
 fpr=7C721DF9DB3CC7182311C0BF68BC211D47B421E1

For projects which use a scripts/checkpatch.pl workflow like the kernel
but do not sync its source [ever/frequently], like QEMU, some arguments
might not be available. This leads to checkpatch not working if it is
automagically detected without the user's knowledge leading to hard to
diagnose errors.

Signed-off-by: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>
---
 src/b4/ez.py | 12 +++++++++++-
 1 file changed, 11 insertions(+), 1 deletion(-)

diff --git a/src/b4/ez.py b/src/b4/ez.py
index 20fbd76..013a63c 100644
--- a/src/b4/ez.py
+++ b/src/b4/ez.py
@@ -1674,7 +1674,17 @@ def get_check_cmds() -> Tuple[List[str], List[str]]:
         if topdir:
             checkpatch = os.path.join(topdir, 'scripts', 'checkpatch.pl')
             if os.access(checkpatch, os.X_OK):
-                ppcmds = [f'{checkpatch} -q --terse --no-summary --mailback --showfile']
+                ecode, help_out, err = b4._run_command([checkpatch, "-h"], stdin=None, rundir=topdir)
+                help_out = help_out.decode(errors='replace').strip() if help_out else ""
+                if ecode == 0:
+                    ppcmds = f'{checkpatch}'
+                    for arg in ["q", "-terse", "-no-summary", "-mailback", "-showfile"]:
+                        if ("-" + arg + " ") in help_out:
+                            ppcmds += " " + "-" + arg
+                    ppcmds += " -"
+                    ppcmds = [ppcmds]
+                else:
+                    ppcmds = [f'{checkpatch} -q --terse --no-summary --mailback --showfile -']
 
     # TODO: support for a whole-series check command, (pytest, etc)
     return ppcmds, scmds

-- 
2.44.0

