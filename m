Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A51AD39A061
	for <tools@linux.kernel.org>; Mon, 13 Apr 2026 22:08:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776118105; cv=none; b=UpumMo7CTA/Gi0uZQIkv7KOvP4LnmlPLthTTGNPMSM385dYa1DKIV3WZ0Oxr6JZYObbJaWDSDBZ7dnc4quBr5YINM48A89g8TW3Xv5SW1hLMKauKM4paOxOkCUiPQWkExQx/diWR3JScU1KyBtF/YDg+QfcKfL9CWW4uo5HkJ/Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776118105; c=relaxed/simple;
	bh=uxrvdu9AckqbQtgmskFBuusuGWqF3gx6n/PfD6KlgZU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=LNEateUEZY/Ss7mAoos/2qRZM3Kz4oIDzkLE79+vk989KdROEM9JsgXAi89FCPSh1acxprHc5hzI6vZ9FkYfPnGlzcOAhlqLlCfaLTOqn73MQNUgpyuCmh/E+FTT0qkdETSgtM3tbiUStJf2+T9+DC00no7k/KpxWsJ9PzdijFw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lnKAJk3Z; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lnKAJk3Z"
Received: by smtp.kernel.org (Postfix)
	id 61521C2BCB6; Mon, 13 Apr 2026 22:08:25 +0000 (UTC)
Received: from mail-qk1-f171.google.com (mail-qk1-f171.google.com [209.85.222.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 8773DC2BCB3
	for <tools@kernel.org>; Mon, 13 Apr 2026 22:08:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 8773DC2BCB3
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qk1-f171.google.com with SMTP id af79cd13be357-8c6f21c2d81so371654785a.2
        for <tools@kernel.org>; Mon, 13 Apr 2026 15:08:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776118102; x=1776722902; darn=kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=C4IaVGg7KERGflbxCN+fwn1AEsoVeXLgmxJPFp6MAuw=;
        b=lnKAJk3ZPnBnag/TC8fSIFvEgqbEdY2CQrenFrPmB9x8YtvfuBNL2aCLQSp+MieAwU
         XqKIiV+P4ujM2naq5YnMBjVHAiKjnJI7vfqBWLE08CXlfBcZRpysR5NxNHs9asDVlU74
         70EvHWtzM6ink7911YeORp7tjrTh+eqIztBZhg+PKWhWKb5r3mjvtlttaLS5vVym2JNw
         rriyqXZ9Ay2oDoZ/NsqbaXiOzapunWaIyyTz8dFFfX7qH4IRswNTdzXEpkv2y5yYoIL3
         yn8i0skpSe2Yu/l3FuQ6o90czvRbn4ApWLAHT9q4Gtg2yP8w4sS2ltzibKF+hCUdoDIP
         J8Kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776118102; x=1776722902;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=C4IaVGg7KERGflbxCN+fwn1AEsoVeXLgmxJPFp6MAuw=;
        b=hjkSAzpr34AtK1kIDhgNeQUkzJRZkdLVJvkLTBWbwsw84MTwInQbOqpHru9Grz4qDL
         IL/zXqdi+8jNdvG5A0fvuMwDCiic4dQoN8HUIEEZ4R8z5D7FxP/GPuJlTaY9d/YOwWpb
         qsGr9Mky1ObOpCB2Gz1u1UO++PGiYMpIgwxGrt9sTARgEWaL+y4rx5Uks1E68gfSr5v4
         EIgw9WrAARS0g1luli9vBCx1j8y8jQ9gX0jHrCkiaW+CJSvGCxb4n2xh7Bt0uv+3OW3s
         bCLhCSstFlZ+S8XSxitTLoJxaNGeFdJTAbswPej/E1XXBP6mHpy6X5zksuV0xKmBByQ9
         bhfA==
X-Gm-Message-State: AOJu0YwvEF3HvTYaNn+hO7OWbyP7RjaEiUypTjhLqaIhz60kHQy45ARn
	fwmAdVNVTD9OnmlTpzXS2EtpTkJTBdU3ihre8x6o58z/HujGeIMc093Q
X-Gm-Gg: AeBDies16KnHfvGEEWD2wrmoH6wXviK73JkTs8eksarV4nLQzo8QfvpLu/JEnhZzLnF
	15NsKC/T8DqdulEfL1HQmRPppsz3ga0acaaFntPUSr0GiAg+eQoYq+zM0J98rhFUarQ2N1F4xsB
	jUYVEYKXmMAqszQh0p45QfhSKZrdjhI+Gx9JRGJ2ADbXiG9zOzKllaeEdAMXv86SChMRqDPGLkv
	oJUpUKYbiPUBcwg0b9DNkzQ18xppR0KQAJxzoQdh3mS13IBdayycQz0SpX4gd/0gnK53reoYh1a
	aCEn2negRTzzq4/hHkZanmS7QiaLFjdYAMwfsRekktQNTkgr1DwTHeBW8gvzLxurgrkcm3C/4tB
	PBzVmVgcwF/lNxCC1PsEmCvA05BeCq80n06wJKhP9rjUSdzal4LKUY9PkKQH/ktKRUf6AHvp4L3
	DF0HsVt+ZF5Jz6IGvR8V+AQTBW86ZSRw4BfouYW0iGOvj04tDxV/p82JKFvUnmXrAcpMiIp22xI
	Rjr9ioWOpQofrAkKN4ACo2PVQuhvRQX20R6pVqNQOo9LEv7oRiGe6uZEvr9L17jmjtR8Lkl+bPl
	tzkh7oOVFyLF58cRzP7eCGwZOZEuftjPkqBnZ61gxbkntI7G+4RIpaQ0YLaHOd+ysEm40HXNPG8
	=
X-Received: by 2002:a05:620a:1990:b0:8cd:972d:335 with SMTP id af79cd13be357-8ddcf2be7c4mr2095209685a.43.1776118102390;
        Mon, 13 Apr 2026 15:08:22 -0700 (PDT)
Received: from 1.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.ip6.arpa ([2600:4808:6353:5c00:c007:ed8:60aa:a884])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8ddb8d6e387sm907506185a.30.2026.04.13.15.08.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Apr 2026 15:08:20 -0700 (PDT)
From: Tamir Duberstein <tamird@gmail.com>
Date: Mon, 13 Apr 2026 18:08:15 -0400
Subject: [PATCH v2 01/14] Add ci script and mypy suppressions
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260413-harden-type-checking-v2-1-1ba6056288d9@gmail.com>
References: <20260413-harden-type-checking-v2-0-1ba6056288d9@gmail.com>
In-Reply-To: <20260413-harden-type-checking-v2-0-1ba6056288d9@gmail.com>
To: "Kernel.org Tools" <tools@kernel.org>
Cc: Konstantin Ryabitsev <konstantin@linuxfoundation.org>, 
 Tamir Duberstein <tamird@gmail.com>
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openssh-sha256; t=1776118097; l=1347;
 i=tamird@gmail.com; h=from:subject:message-id;
 bh=uxrvdu9AckqbQtgmskFBuusuGWqF3gx6n/PfD6KlgZU=;
 b=U1NIU0lHAAAAAQAAADMAAAALc3NoLWVkMjU1MTkAAAAgtYz36g7iDMSkY5K7Ab51ksGX7hJgs
 MRt+XVZTrIzMVIAAAAGcGF0YXR0AAAAAAAAAAZzaGE1MTIAAABTAAAAC3NzaC1lZDI1NTE5AAAA
 QO3NCe7z1OINq69L5spKQ1o2vgZxSAniBUotErpUxslg7Wear+CcSdedZ3pRSuEesB3L8qboV4i
 4/Zyy9y3RnQo=
X-Developer-Key: i=tamird@gmail.com; a=openssh;
 fpr=SHA256:264rPmnnrb+ERkS7DDS3tuwqcJss/zevJRzoylqMsbc

Add a simple shell script that runs mypy and pytest.

Introduce targeted mypy suppressions for current test-only issues so the
baseline is green before tightening types further.

Also add pytest-asyncio so pytest recognizes
asyncio_default_fixture_loop_scope and stops warning about it.

Signed-off-by: Tamir Duberstein <tamird@gmail.com>
---
 ci.sh          |  6 ++++++
 pyproject.toml | 14 ++++++++++++++
 2 files changed, 20 insertions(+)

diff --git a/ci.sh b/ci.sh
new file mode 100755
index 0000000..1e8ccb3
--- /dev/null
+++ b/ci.sh
@@ -0,0 +1,6 @@
+#!/usr/bin/env sh
+
+set -eu
+
+uv run mypy .
+uv run pytest --durations=0
diff --git a/pyproject.toml b/pyproject.toml
index 2353a18..e31a05c 100644
--- a/pyproject.toml
+++ b/pyproject.toml
@@ -40,6 +40,7 @@ dev = [
     "build",
     "mypy",
     "pytest",
+    "pytest-asyncio",
     "ruff",
     "types-requests",
 ]
@@ -56,5 +57,18 @@ strict = true
 module = "authheaders"
 ignore_missing_imports = true
 
+[[tool.mypy.overrides]]
+module = [
+    "test_email_utils",
+    "test_formatting",
+    "test_message",
+    "test_thread",
+]
+disable_error_code = ["attr-defined"]
+
+[[tool.mypy.overrides]]
+module = "test_auth_headers"
+disable_error_code = ["unused-ignore"]
+
 [tool.ruff]
 target-version = "py39"

-- 
2.53.0

