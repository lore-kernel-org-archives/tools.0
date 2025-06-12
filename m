Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B3F0299A9C
	for <tools@linux.kernel.org>; Thu, 12 Jun 2025 16:25:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749745512; cv=none; b=agrXUd4oPCECow0vtkBzAYxGhDIjbv/0DVlkykDY2vLyVwr91KHMBzgj40czcB3Yw/PQEuB0ZSu2dpBlRHYhBicwzsRz9/W7uURtM5UO9ZddHN/UuekS7U2xzxsA4Bz7BPuQziFWxWtTD4ekTJ6F3XdFMSYgBP+v/+dqB5uZu6s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749745512; c=relaxed/simple;
	bh=smEjYZBv3sYNvg3yKowCRf5XhjNLBzKjCll96UkNscE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=DtP4knlUwHH01K3Wwsjy8tszI/yfYv0Rj1EF9yEOdcADU2YFjD7aYSbPZjNSG28biyylMlmEROueR//+T5vK0PvVfBz/8Uxp88mQSZukEqEn2yx823Ym88H3MFQQBRuHgYphWz88HjPag+VVrbQ5JJunFX4uVHfs9sjw4DagQdA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Hn+NRmLI; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Hn+NRmLI"
Received: by smtp.kernel.org (Postfix)
	id D4B0AC4CEEA; Thu, 12 Jun 2025 16:25:10 +0000 (UTC)
Received: from mail-qt1-f179.google.com (mail-qt1-f179.google.com [209.85.160.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id EF922C4CEF1
	for <tools@kernel.org>; Thu, 12 Jun 2025 16:25:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org EF922C4CEF1
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qt1-f179.google.com with SMTP id d75a77b69052e-4a6f0bcdf45so13807621cf.0
        for <tools@kernel.org>; Thu, 12 Jun 2025 09:25:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749745509; x=1750350309; darn=kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UXgsuVFJvtRtzRqZTqGIp1XpGcYpO0gLi9x23UkWf10=;
        b=Hn+NRmLIrVl7UZpNMq909dw86dbqYL5BdPMEapwG6Wdr9b33kt1p9dlJ97wTI9cLS/
         x8oEEUiakIq161ZAg/RyHQbSUlGsfo9bvfsAxzGasPkMsXwAxTR6QpPYZH8wM1KGt+IE
         cS3ChinGHXULVb1cmEMr6blPilL5Zpj3Y4UQBi/7lcra+Aj09c2iNivnbACuFgZbrAK4
         ilXVfw4hyrCNHWreWMv4UJ3/KOoLpyHPs3gxHRl3oBSBh5nXPTOwYV5iXCIbKtaCRqTX
         aMqyJocNv5ebNnAWUyL0jhLId8x6o1WcQlnoVcwtjfIPUWed7A1qcHuI0tm+qZWPMA2P
         tAbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749745509; x=1750350309;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UXgsuVFJvtRtzRqZTqGIp1XpGcYpO0gLi9x23UkWf10=;
        b=gYiYGZe4w5+iK/mEdBDoiy22tBLHPUeC2aX5LvFAXLnEdLQ85yVPIlyy7uScoJkqOz
         vfCylyPhziYBzNAE3rCvoobkaZZc+opYyhP+MwmI7vDmkSL0dIDpNYqi7UnU1KVXgVj6
         xkGko3iCYbxfVy5yz12O9/TOC9ozt06xUjz5z4WjLAvasLdO17TfpOOh0MocVGNoMYyb
         IaS57Pt3jih4YARXShmBWUWwJYnc725GjMVWZYijymH5LQ9rUfN8TEdElRMmU6h3qdXn
         w37ISO95AJ3Ckr8XXH9uDCxGn6iA3q7m5YUkYJB4ShHQ8WRlxF0OwqWDiRUR4vZH9Tkt
         GzlQ==
X-Gm-Message-State: AOJu0Yw25C+OOSdUSssVGi7onXS2y4DfBtOQyxtlw4UePeB5lRLvfeiz
	8KLKli1bk/IzOmU5DysqoIsXz88UgDW2g0nLnUIGwJEUm9OLLRK5RFKS
X-Gm-Gg: ASbGncsb9RhWO2NKAWQuGIdgZj54bZx5Kp6pWzKNSRhon+hR//FJrPtyXFwhIK+liHD
	0MkIMuwNLLSTFi9wjyO4PxVTAqQaQ8m5AvN4CoYfzJAoY4rrp4HdeckSjWEsjOp+DxXjaJT5pxy
	j0uBIBNAfU17wDUZOEzYYU4BKM50O/dSG7azLgL/dMZZu5UwQZhroOAQWuKxUgK2dxyC8tev3JQ
	cC23vFVYbAP5i9LhVAXvqqpHVPp13HjZpPxQa8uqPjXg/EvzJzB2xiXEnr/0bIl5A94eVEwS/Vb
	zzuG0Vu16oTTQQ2QycRiwcCE2agXqG+wk7jQFTPKXP04jmwH0SmYC0Y9jVdqHY9pNvE=
X-Google-Smtp-Source: AGHT+IGRAB73e9R0MiRH6HNedO2dHqEiVMIIkPa2JSxz7X96oL4+FMxDRqKZZcWiBn4ACRbarV5dEQ==
X-Received: by 2002:a05:6214:124d:b0:6fa:c5be:dad6 with SMTP id 6a1803df08f44-6fb34602ecamr51642916d6.6.1749745508534;
        Thu, 12 Jun 2025 09:25:08 -0700 (PDT)
Received: from 1.0.0.127.in-addr.arpa ([204.93.149.233])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6fb35b20f72sm11996486d6.23.2025.06.12.09.25.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Jun 2025 09:25:08 -0700 (PDT)
From: Tamir Duberstein <tamird@gmail.com>
Date: Thu, 12 Jun 2025 12:25:04 -0400
Subject: [PATCH 4/4] Remove impossible assertions
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250612-better-errors-v1-4-3aa1523f6d8e@gmail.com>
References: <20250612-better-errors-v1-0-3aa1523f6d8e@gmail.com>
In-Reply-To: <20250612-better-errors-v1-0-3aa1523f6d8e@gmail.com>
To: "Kernel.org Tools" <tools@kernel.org>
Cc: Konstantin Ryabitsev <konstantin@linuxfoundation.org>, 
 Tamir Duberstein <tamird@gmail.com>
X-Mailer: b4 0.15-dev

Return gpg, sshk commands from set_bin_paths and use mypy to enforce
that they are never `None`.

Signed-off-by: Tamir Duberstein <tamird@gmail.com>
---
 src/patatt/__init__.py | 15 ++++++---------
 1 file changed, 6 insertions(+), 9 deletions(-)

diff --git a/src/patatt/__init__.py b/src/patatt/__init__.py
index b50003f..e9d8746 100644
--- a/src/patatt/__init__.py
+++ b/src/patatt/__init__.py
@@ -861,18 +861,14 @@ def get_config_from_git(regexp: str,
 
 
 def gpg_run_command(cmdargs: List[str], stdin: Optional[bytes] = None) -> Tuple[int, bytes, bytes]:
-    set_bin_paths(None)
-    if GPGBIN is None:
-        raise RuntimeError('GPG binary not set, cannot run gpg commands')
-    cmdargs = [GPGBIN, '--batch', '--no-auto-key-retrieve', '--no-auto-check-trustdb'] + cmdargs
+    gpgbin, _ = set_bin_paths(None)
+    cmdargs = [gpgbin, '--batch', '--no-auto-key-retrieve', '--no-auto-check-trustdb'] + cmdargs
     return _run_command(cmdargs, stdin)
 
 
 def sshk_run_command(cmdargs: List[str], stdin: Optional[bytes] = None) -> Tuple[int, bytes, bytes]:
-    set_bin_paths(None)
-    if SSHKBIN is None:
-        raise RuntimeError('SSH keygen binary not set, cannot run ssh-keygen commands')
-    cmdargs = [SSHKBIN] + cmdargs
+    _, sshkbin = set_bin_paths(None)
+    cmdargs = [sshkbin] + cmdargs
     return _run_command(cmdargs, stdin)
 
 
@@ -1007,7 +1003,7 @@ def sign_message(msgdata: bytes,
     return pm.as_bytes()
 
 
-def set_bin_paths(config: Optional[GitConfigType]) -> None:
+def set_bin_paths(config: Optional[GitConfigType]) -> Tuple[str, str]:
     global GPGBIN, SSHKBIN
     if GPGBIN is None:
         if config and config.get('gpg-bin'):
@@ -1029,6 +1025,7 @@ def set_bin_paths(config: Optional[GitConfigType]) -> None:
             SSHKBIN = _sshkbin
         else:
             SSHKBIN = 'ssh-keygen'
+    return GPGBIN, SSHKBIN
 
 
 def get_algo_keydata(config: GitConfigType) -> Tuple[str, str]:

-- 
2.49.0

