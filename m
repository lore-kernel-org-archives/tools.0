Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1AA818DF7A
	for <tools@linux.kernel.org>; Thu, 19 Sep 2024 06:43:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726728186; cv=none; b=WKsUo5t9H+NxdQbo+MHQUm+y7SplEHwRjaCc3NcnBY0CiaL1XlHMqtdsE3gLRrH+j5EYALaXXeUGm6S1gQIMapH0wgxIHosyKQC7HeRIIgktmVzAQNJZuvbsZnEczVB6nw87pFt+9ujgqrHoJrN/hASyMgSlQ3exSR0zY4JHjbo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726728186; c=relaxed/simple;
	bh=c1OzEke54YaWRHvL1HF5cu0A1jzwlPDtH7sjIObZOV8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=LAEI7Yfr2WPvSKlh0SrxWh3Clbw0RWRWozZTLCARcO0RJUOPkDGnz/C/hTMfIo7DgaBjxSFkJ3qOfPzWUr+1b743Rwv2zdtQ/LHs0K+OPO4ve1COAF2K8R5Yul88ax/h/v8shTeN/BG27UWQcYsZiBQkvrzEKcvOewB7bGJRgNk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=JQ/TThB2; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="JQ/TThB2"
Received: by smtp.kernel.org (Postfix)
	id C8B0AC4CEC7; Thu, 19 Sep 2024 06:43:06 +0000 (UTC)
Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com [209.85.208.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 9D0CBC4CEC6
	for <tools@kernel.org>; Thu, 19 Sep 2024 06:43:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 9D0CBC4CEC6
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f169.google.com with SMTP id 38308e7fff4ca-2f75428b9f8so6037381fa.3
        for <tools@kernel.org>; Wed, 18 Sep 2024 23:43:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1726728184; x=1727332984; darn=kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=NcDOud4UAOSipTGB/7CkQK0D0Jn+AAYnLFFNRp/gVJc=;
        b=JQ/TThB2hEAf9UhmlJHKvAFfxPr4PPs8cvssYI87NQ/JSWpqEkQDFShPmZ3mO5rcMi
         QXCynRt7/4nqLNobnaFl5M1aT/bRF4SyIKUhMKKgjMiUFyXV34RVEvK7T3uaxN7WtpII
         jLX0XvsPpWJAaMHOp0dPkNG5VlH9Ujjz9Rantss5scD1Tv+uSQekZIJlsmPFtFlqnO/i
         XFFwOaq7JveX03TlAKrYslxbw0Gqdt/XQmFeyAnAG+7BGld92gIGyxkBrYoy3e6JfHkD
         WGBXbrud2poYZCkxf32TtvsJT0lMW4vAUP3/ZGpTrCjI5gLVtd6PohI8oVRoUnPAEUcF
         5+bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726728184; x=1727332984;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NcDOud4UAOSipTGB/7CkQK0D0Jn+AAYnLFFNRp/gVJc=;
        b=GqDTy+hVRHV13RlwbPQpkVIs4PBh0tOsqip2+Rh3IcQTj4BteuGnV99s/xugHuBGLr
         U8XxZUzBggZLTqT+UjXEmd1M8Lgix79dRUKeaK56FE/dzqqPUogQttLWBLUErliV2cnJ
         XfE0Ihzh2+0rU3zI9eqmx6FJNL+CxYg1SzPPJH0BeMlV9u4IRmEBwKlr2rJ/ENyZM8eC
         wSYZ+knQkbCL6CZqo6Lpq3u6sjlJXr/LpXn2eDSyCQxv/CDrknz9la1is9ISggavMgQW
         3fqBcD2u2iaVei5Pm/Ew6AeHm2xR3p4YE6hmKaZpcKTczLroHnfrDSPK8d4ihTht/JBB
         ijIw==
X-Gm-Message-State: AOJu0YyTZKFGNrvOtjqF7ot9qXP5yQRlt+qnXyQtwunpuUGoomt/x0JF
	ILh6cvbpVyH1KvgcwqH3tW+jYEf015wHF+SuiUTGo/joHuCfU321YGs4XR/XbBbI1Ji6AmCPpc5
	THnE=
X-Google-Smtp-Source: AGHT+IGAXy9wXf8LQaM19V5VyM/mhwoj8yWu7hH5UrKCtYY8yd0+EphbHI0fnt7oCbb5pe0eY7D2gw==
X-Received: by 2002:a05:651c:1505:b0:2ef:2422:dc21 with SMTP id 38308e7fff4ca-2f791b66a93mr126500191fa.43.1726728183464;
        Wed, 18 Sep 2024 23:43:03 -0700 (PDT)
Received: from [127.0.1.1] (adsl-13.37.6.161.tellas.gr. [37.6.161.13])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a90612df5cfsm686396766b.146.2024.09.18.23.43.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Sep 2024 23:43:03 -0700 (PDT)
From: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>
Date: Thu, 19 Sep 2024 09:42:45 +0300
Subject: [PATCH b4 v2] ez: verify default checkpatch.pl arguments
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20240919-extend-checkpatch-v2-1-3557f177a942@linaro.org>
X-B4-Tracking: v=1; b=H4sIAOTH62YC/32NSwrDIBRFtxLeuJYo5mNH3UfJwM8zPlo0aAgpI
 XuvZAEdnnu55x5QMBMWeDQHZNyoUIoVxK0BG3SckZGrDKIVsh15x3BfMTpmA9r3olcbmBEepRm
 V08MIdbdk9LRfzhcYCVPNApU15e91s/Gr+WPcOGuZNoPvO2mwV+r5oahzuqc8w3Se5w+qVSPXt
 wAAAA==
X-Change-ID: 20240815-extend-checkpatch-b2fe4b89da78
To: "Kernel.org Tools" <tools@kernel.org>
Cc: Konstantin Ryabitsev <konstantin@linuxfoundation.org>, 
 Manos Pitsidianakis <manos.pitsidianakis@linaro.org>
X-Mailer: b4 0.15-dev-544d5
X-Developer-Signature: v=1; a=openpgp-sha256; l=2073;
 i=manos.pitsidianakis@linaro.org; h=from:subject:message-id;
 bh=c1OzEke54YaWRHvL1HF5cu0A1jzwlPDtH7sjIObZOV8=;
 b=LS0tLS1CRUdJTiBQR1AgTUVTU0FHRS0tLS0tCgpvd0VCYlFLUy9aQU5Bd0FLQVhjcHgzQi9mZ
 25RQWNzbVlnQm02OGYybFl6RHBicFlkWXdiTi93ZFowNzR4d0xGCkRJZkNPOUt3WVpadFJYQng2
 WXlKQWpNRUFBRUtBQjBXSVFUTVhCdE9SS0JXODRkd0hSQjNLY2R3ZjM0SjBBVUMKWnV2SDlnQUt
 DUkIzS2Nkd2YzNEowRTllRUFDTkVaRWN6NEZvZndXdll1akppTjRQM0hQdWxoOFgyVkwyZE56Vg
 pDRnBOMUlscGJIR3F4WE0zOWc3enl6ai81VERTM1doVmw3T3VjYk1tS2hqSUdia1Jkak42K2JUQ
 ldPRVp0aHNyCkFVRW1tbU1uN0NPTStWQmYxRGcvZjlLVVZKaVNMbWRCWTEzSXp1aHVuZHpidmFa
 ZmhoOFhwR0hMU3V5S1N3S1AKZnp0TUliTGtrVVNYU3lJSEVtV1Y0OE1MdWhlRFBRblFFS2c1bmN
 SV05EU2VONlc5MGpnZW5YMFUwWUwvK3NoTwprWTc4cGsrTG9HdFVLQXRnb0xOczNFMDY1NDZQcU
 92ZTNSb0NOTXVaTGZMQkpYY3NadTRNNkE1K0RRaitkazRMClVwY09xdUVBSkJWU253SXoyYWl4Q
 08vYU5pMDZaNzFQS3pwelFzd05tbUxSQ0FmSk9hNVMyUmliU25sV09rUHMKeHNJTlpiSGRSWmhT
 N210UW5OL0NsWHJTTEZ5aXFmbllBanBoUFZ1Zks1RVZrb0RKdzNHWndOTWtIVnZXaWlONgpjUzh
 jM2dROHpPRXp2aFpobHgxOXh1eXY4MW1hVFZRVUlNRHFlamg4VExMMllVamZpYlo2NDRjQ0xlRn
 ZaZEVUCmQ2eUpDTThVOElZOTNLcExza25TMnA2NW9mNmlvNFdER0srTzBLaWs0MUlaK25kS2thO
 WNHUmRpeSszUlc0T2UKQ2x1SlRoVGErZDZ3djJudzRuNytMNXoyTEZHajBZbHpVUGVzei9oaDh0
 WFVDOHZUZU4yK3Z4SVRGelFrSms3VApsQnQwZmVGSUpaTzlLVHFVQTRBTFlHYUlNL3JyVkcvdFJ
 JOE43TFloVHJQVWlJZllZT2hIQWp0TC80eUVNQy8vCkhtcUVtZz09Cj1aaG8wCi0tLS0tRU5EIF
 BHUCBNRVNTQUdFLS0tLS0K
X-Developer-Key: i=manos.pitsidianakis@linaro.org; a=openpgp;
 fpr=7C721DF9DB3CC7182311C0BF68BC211D47B421E1

For projects which use a scripts/checkpatch.pl workflow like the kernel
but do not sync its source [ever/frequently], like QEMU, some arguments
might not be available. This leads b4 prep --check to print the script's
error output.

This commit only uses arguments that exist in the script's help output.

Signed-off-by: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>
---
Changes in v2:
- Dropped patches that touched stuff that are fixed in upstream now
- Link to v1: https://patch.msgid.link/20240815-extend-checkpatch-v1-0-ab7f654be699@linaro.org
---
 src/b4/ez.py | 12 +++++++++++-
 1 file changed, 11 insertions(+), 1 deletion(-)

diff --git a/src/b4/ez.py b/src/b4/ez.py
index de3fa4287ad08c88b12956d47c4d1cc7bd03591c..1fdf0810a4378dee4ca0397b4983679f12a30d81 100644
--- a/src/b4/ez.py
+++ b/src/b4/ez.py
@@ -1680,7 +1680,17 @@ def get_check_cmds() -> Tuple[List[str], List[str]]:
         if topdir:
             checkpatch = os.path.join(topdir, 'scripts', 'checkpatch.pl')
             if os.access(checkpatch, os.X_OK):
-                ppcmds = [f'{checkpatch} -q --terse --no-summary --mailback --showfile']
+                ecode, help_out, err = b4._run_command([checkpatch, "-h"], stdin=None, rundir=topdir)
+                help_out = help_out.decode(errors='replace').strip() if help_out else ""
+                if ecode == 0:
+                    ppcmds = f'{checkpatch}'
+                    for arg in ["q", "-terse", "-no-summary", "-mailback", "-showfile"]:
+                        if f"-{arg} " in help_out:
+                            ppcmds += f" -{arg}"
+                    ppcmds += " -"
+                    ppcmds = [ppcmds]
+                else:
+                    ppcmds = [f'{checkpatch} -q --terse --no-summary --mailback --showfile -']
 
     # TODO: support for a whole-series check command, (pytest, etc)
     return ppcmds, scmds

---
base-commit: dedf88cb947bab87c418b49d975df11f83621692
change-id: 20240815-extend-checkpatch-b2fe4b89da78

--
γαῖα πυρί μιχθήτω

