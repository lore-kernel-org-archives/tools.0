Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E5D13537C4
	for <tools@linux.kernel.org>; Mon, 13 Apr 2026 22:08:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776118119; cv=none; b=eQ/CimnvERaOMijfhSudwJ9IRNDWnhvhw3/nwObZuUYzEgwcjUwmf2ZoIPc3Frb2BAV4CDs0vOndWUbdDLUruwQTZ+CXV9/vQ6gLOpYeucQXwbd87zG7uxm4F21SkYymFOh0v4m7x5DwRSPBf3o5N1yRmAPB573kZ3IabbX1eK8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776118119; c=relaxed/simple;
	bh=fyCWB7ksFJ3QAD9ldlDhpmzaUhMUzNJcPRQMc2rUihw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=k75KWyCus0pKI8o1e9KB5XFEFUjUty9S9c9sGhk4lJLecWve8SwLGESD/TWeC7NDCPjJJfmMdq6VA5O8azXX1JwCyHXdpz3mkmlmiOVREKR1Dp07gTzrMHPnNlkTJhyzzbUSGp9hK0vtu5tiEe7mwpGPnPsHcF3HpaeAiJCMsY4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kTmcaiKF; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kTmcaiKF"
Received: by smtp.kernel.org (Postfix)
	id 087EDC2BCAF; Mon, 13 Apr 2026 22:08:39 +0000 (UTC)
Received: from mail-qk1-f174.google.com (mail-qk1-f174.google.com [209.85.222.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 559FDC2BCB3
	for <tools@kernel.org>; Mon, 13 Apr 2026 22:08:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 559FDC2BCB3
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qk1-f174.google.com with SMTP id af79cd13be357-8dbbc6c16b2so630649485a.0
        for <tools@kernel.org>; Mon, 13 Apr 2026 15:08:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776118117; x=1776722917; darn=kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3tZnm59ysDwwDwv2MrwNNTZlSo4LhvLuSB48enqFRcA=;
        b=kTmcaiKFcjbm9H9VwlOGgvSsV0C5yNoMGm16x138QkW84JfxcU5GODmtNQFtCPmNfQ
         JMjCsApQe25yIFQJMBtajVo33NI9aBZBR+CLO9pgzksybPTxQHbj908hoMqnHVL9v0gl
         brRZn8quOKD0LC6Za7K136PITXjGNHMhwmj24+YKKjVRn9PA1ULdh6z4T3BPJ8Uhnkru
         coIviyLY3qpN4Gl9HD2pr/hgG3wpRFxq4yBc0Ie5PvmCVaeN1FWw1WosqOs6ZPYXfTKw
         /MLRDUui4fRyxSRZQA0QFO988/sUyFTE3nD61hyxDpLOAuqRqoG+QOz9FapIHupCaOI2
         fpjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776118117; x=1776722917;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=3tZnm59ysDwwDwv2MrwNNTZlSo4LhvLuSB48enqFRcA=;
        b=jqZw33WZ68ND3RUEr3OmRq6fW88DntweREMQVXTvW2a1R1kE+2V7cTfm30AaReDwsw
         iumBaWRx9O0impMaB4SWLVIwJvmF/Z7rCO3iUN9ivU6JpFSx48oPw//HcT7s4d57w1Ay
         /hDKEMe0ZgSDuKUKimws9zODdve6R/8F4bvcQZdUBSvXueXybkRIO0m1t41oqxs8zGqu
         mJs/zpF/xhrms7YbX+Y5yo2k2LIVLaaskwG59DFGwmxVrEQOU586IcVUMifjTl+tXAM+
         fxK0Iw9truAmFq8TaojsBfjHZ1ZpU7jRWtFGofK2zp0+0FwKkxIlMsIW4IBdDouVPDKk
         GsXw==
X-Gm-Message-State: AOJu0YxlNaZUZAD9K6k4/5act6638+D+2ADa2WnNJYrLZ8RGNW34b0ZF
	pd0RqX69DTxWfVHjifjJ8O3eUFIphH/KV5AMlsk0L7jIE/uKjEfi3uWYyb32VfwO
X-Gm-Gg: AeBDieuXZWqAvJzicysSYOLYZ7i0sQiynBC+kgPfEsxvcxP5YfApDH+dcU4pQH8ffnp
	wNcSJZja+rDrN+CkV96eGZY5HckkEX1XvcCn9mchmTqxJnI1sX0PUv+9d5aIMSuV3qaTjrHH+Zw
	PsSmERYkScAtEDhtuWDAYZdlN7kPnRK9JvWuGibXkDxKDCpSo3IRg4LZ7urKBfIE6Mdn9u+N/Ub
	VkjsMr/6dWZ6J1HbZTfiUEbQvKrOf0D2kakBnQrMA16vsMbri4r5ZOR41mWVVKLg36hEGPC662x
	XYVJuPvC++x3VSz6godISOdFch/Bn99YouPfqKBDfUfs65ArcEohZdC033XnOud6QrMtmSLhED1
	hEZ3ocYWlXzc2nzwz1D3baIjIUUgQglBm6EkSoir9TRHBkC0Cfni3hG8QuOJvN/JcUYuMzN8ruI
	vfosc5PnKQzvzQ4oIBMhpi+44YEQzGVh3afkkYjle1EBDo4WH9QACr/4Uq+UyWyWkFZKpaNfdRd
	u6hRcF8LNQa4IITd0XU7hZWvj96C9sogDX5BYxwSaAspzjnwtJ0UGYkCZduu24hGuoemsWuh7Rt
	+qKJ0+vns5dT1Smbp+wsFLj5/tnS7hPyftAPAVHIKJVv8+YxLJPd2tBy2czhlxfH
X-Received: by 2002:a05:620a:44ce:b0:8d8:9434:9379 with SMTP id af79cd13be357-8dc444ad8d1mr2544679185a.18.1776118117201;
        Mon, 13 Apr 2026 15:08:37 -0700 (PDT)
Received: from 1.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.ip6.arpa ([2600:4808:6353:5c00:c007:ed8:60aa:a884])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8ddb8d6e387sm907506185a.30.2026.04.13.15.08.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Apr 2026 15:08:36 -0700 (PDT)
From: Tamir Duberstein <tamird@gmail.com>
Date: Mon, 13 Apr 2026 18:08:28 -0400
Subject: [PATCH v2 14/14] Add b4 send configuration
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260413-harden-type-checking-v2-14-1ba6056288d9@gmail.com>
References: <20260413-harden-type-checking-v2-0-1ba6056288d9@gmail.com>
In-Reply-To: <20260413-harden-type-checking-v2-0-1ba6056288d9@gmail.com>
To: "Kernel.org Tools" <tools@kernel.org>
Cc: Konstantin Ryabitsev <konstantin@linuxfoundation.org>, 
 Tamir Duberstein <tamird@gmail.com>
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openssh-sha256; t=1776118099; l=694;
 i=tamird@gmail.com; h=from:subject:message-id;
 bh=fyCWB7ksFJ3QAD9ldlDhpmzaUhMUzNJcPRQMc2rUihw=;
 b=U1NIU0lHAAAAAQAAADMAAAALc3NoLWVkMjU1MTkAAAAgtYz36g7iDMSkY5K7Ab51ksGX7hJgs
 MRt+XVZTrIzMVIAAAAGcGF0YXR0AAAAAAAAAAZzaGE1MTIAAABTAAAAC3NzaC1lZDI1NTE5AAAA
 QF0uKF+JcgBMjwuy8LCMtBMHrjoT7xflxZF22UiKLr3RDzqg75XO/L2w7aQ9ezgsIa8zE9hJIW9
 EeDrqYf4mJQU=
X-Developer-Key: i=tamird@gmail.com; a=openssh;
 fpr=SHA256:264rPmnnrb+ERkS7DDS3tuwqcJss/zevJRzoylqMsbc

Populate the repository b4 config with the lore masks and default send
settings used for kernel.org submissions.

Signed-off-by: Tamir Duberstein <tamird@gmail.com>
---
 .b4-config | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/.b4-config b/.b4-config
new file mode 100644
index 0000000..5084661
--- /dev/null
+++ b/.b4-config
@@ -0,0 +1,7 @@
+[b4]
+  midmask = https://lore.kernel.org/%s
+  linkmask = https://patch.msgid.link/%s
+  send-series-to = Kernel.org Tools <tools@kernel.org>
+  send-series-cc = Konstantin Ryabitsev <konstantin@linuxfoundation.org>
+  send-endpoint-web = https://lkml.kernel.org/_b4_submit
+  send-prefixes = liblore

-- 
2.53.0

