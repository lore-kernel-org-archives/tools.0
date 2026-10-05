Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 370224D90D4
	for <tools@linux.kernel.org>; Mon,  5 Oct 2026 17:45:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=100.103.45.18
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791222353; cv=pass; b=hNBBNJ2cr+e2TVhk3gWNujnqKaIsz1OpJkBmk0PF4FTz+fGk1fd0Ge1qKmbmJGOklbwcSJLJjQTUspBuXZVgtasmCHzOCi2QDXmuoOEnQo4OuKF9L+LrE6Of/hVt7DkrZjpIbORwmvlj5uWI/xH+yPqI9RIaLb/K3Twb13i7NN4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791222353; c=relaxed/simple;
	bh=moTICYMZ4AbKoU+XH4FUvb8uaJTu0i2QBWn2m547Hbs=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=CBk2Tal5KHRkYkNMFYaECc5YsGOnU6WgwCXnRyIKjrMcvN0ZmMtbxqu19bhWCgSmpe5602NKJKch9hCA9sdLvKe2IcHGLuxzay3NukE0ypRhfuGlTpQcqAJkefiM+BQG5SH2xyciN4gtvyU19TvTGWYdPXwHD87dOSPesrfF8rA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=pUrPUoQP; arc=pass smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="pUrPUoQP"
Received: by smtp.kernel.org (Postfix)
	id E89DA1F00898; Mon,  5 Oct 2026 17:45:51 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=74.125.225.140
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1791222351;
	b=OiPS+DmjAyRwGEN2qCxk2sWHDWtyFqqRoDsNxpfmoD054NPpeOcXV3afHCBgXOZb1fxq
	 yYQ9bgLDmwIgHdfEfgZ9m76JSsFrq/1O4JBIMCXa9Ax3Apc3yMsrxtDTxmTpnyz9YXI6r
	 0AabGljKNY9VNHhUjnpM5agNMSwX5sGLS7Y7gE+zokcLkJBTL1R0B8HcutfQn90Gu+RKz
	 6czlVMixbuJuLfZwVtzg4hKNY2Jo4+6JFaV5SZma/mUnNL0uwfLxUA+Uqp2+emN9Xyr7E
	 DMHSjXornNr7z/YELkM+Xs9KAIGTcdGcIP/Tm4BfKW5rIT/j1xEEXbvran9nKuo5DzQ==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1791222351;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:Subject:Date:
	 Message-Id:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer;
	bh=YEeE1+qn0jwhaSvHfbtm/ThpgdJCYvYp2z4+88DCBGw=;
	b=ghUJLFiUQapkbKVHah3fru931hgOAWRU/sXfiPQbsYAjQhiWhfvUp5T306xJBwRWFCyq
	 i8wUQ09n65Ys+USGLSnTzewxlGQUZyAhUPpCacEGnzOFN1qJ7B9jTRhlRgemEv25jhFaE
	 px9ZW7JQMj5QV3Si691VHbiyvhN7AGZSxgns+wh0XKBg8WH6p8CbsJfoxuBvMTDQ6KXGo
	 fd+40d5hYAHmhFj6ZII/yXB3fk1WVBRTI00A/fJtCmIZHN7klXpLaKwVt5qZUI4yLwgiv
	 k1OGHar+MRxHhAx6k23lnrOYXKHzLlcCoEhGPI1W4OoX5neME0yjzahFx5qC6tzJ/rA==
ARC-Authentication-Results: i=1; smtp.kernel.org; dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=pUrPUoQP;
	dmarc=none header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	arc=none smtp.remote-ip=74.125.225.140
Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 766D01F000FF
	for <tools@kernel.org>; Mon,  5 Oct 2026 17:45:50 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=pUrPUoQP
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.kernel.org 766D01F000FF
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49b912d8239so17659995e9.0
        for <tools@kernel.org>; Mon, 05 Oct 2026 10:45:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1791222349; x=1791827149; darn=kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=YEeE1+qn0jwhaSvHfbtm/ThpgdJCYvYp2z4+88DCBGw=;
        b=pUrPUoQP1Dc9BJy+I17IiM+kf7RT6Nmi+yxBfcZuQu83C16RrNq2/x+M8K+/aQaCsv
         tBPSEF4j4ZCJTZ9EqSQo9xypI8HTQCW9uaA90WHjo5mESkJNzZP8Iqgx6+8LTkkaIxeJ
         qQNGq5qbLDigv1Auhen1obZcjQ1TNd8PPwEFpNQ5T2UPuMcNdmTE3ivLhU/VHEKzcm+w
         1dqOLj7j7s3uM08HSqIiAvx4CX6/7emkOlNCL3KT+YrVSPsSJn+oGEWKcTC3DQPC1xBT
         VBXZL3FBDcy3F6EN1Uwpa4japULSR0E5k7uSlpzUa3Fj9SXfb2ksoVth6onLL20CdMb/
         sh/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791222349; x=1791827149;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=YEeE1+qn0jwhaSvHfbtm/ThpgdJCYvYp2z4+88DCBGw=;
        b=AI/JGboCVgTVPm3J9Kqy60PT+ECsAQUmQhz6vFLCtYRhTUgFX/RL2BmJcPAYBfc03G
         q1DfGgxQhkngTUgYUlCn+sYlufUwysDQTTUmDMVcBHB9e8sbo4utvhHTwl9RMVMtZLKW
         fJACSLD931oXKUz1Ukw8o3Vg1wcYZcAliiL3oVHGHKZbURWPHyZUIR5iI2bDFxAum3J9
         H2Bca3tz0vWdhcYHwVXnURt4fRvWs/VBqDwEWHdLRAyzKizHxRaQ9GycTWmHPr/N4XLz
         K1JMjFWriXnZWyzpb0N7AtF++ZvF9wFTMWELPUebJxGH8rOatUSqelcRAVvvO0Q8rwsz
         Fehw==
X-Gm-Message-State: AFuF++kT7sQ5UnKVWEMqn0tu8OFHjnOLt6FxrfUinLdImPhzVkHEIr6A
	+tlKyoDBEPHdTUkNjouWlXXHIfdV5MSPXow0SGtpxNgSGr4TjiJuFTojnv6V7xfDED0Tug9VeVe
	wHDqX
X-Gm-Gg: AYBFou0AIM8iVBUs/xYHUihNNmfS0D3Ad4Uq1304to9Od5i1Ayy/2X6TsFsDiWXP71W
	m93gD0f0fAT0SEseXUZY60Hc7qFw93NWS3vJpQCO7wwDaDg8kGaBudagP6HqTfjcQiyjrgAS/ZE
	KuXgov3okd9IeLwxugiBhR0TQsNZ0WFV3eUSPXjdjEcBfK0d4LReBsMekE7K/8NWNbNjC0jAn7x
	JeTmaVMHu8fRmjYybS2diZVas4XknVDPKDHkUoMyGPSS8u1eQHVvDotS8XWGwAhEeYWXeOsK3XT
	rvzDLBLcPBNX9YZUN1mWfrY6HD//Iv9MMdOKXTo5BJc1h9NI7DIhD/k/0ESy6k4OIDPaaM1HSKC
	e6gDWvWxTfAjZW6drvVsDK8apGuSoHNrBYIfwZpXPyR8pcxW31EDI3QIGNGrUC3xYtXeqSTIHD2
	RsIM8DZSHqEjsHqZRwWJ2eCXiuKAAIABSpSMxT3p+fb8BYV4hLSHYIBm6rX81P16prtqxG82zNq
	gI/4djRsnEWCKIkdY8OUA==
X-Received: by 2002:a05:600c:19cb:b0:49e:69ff:c6b1 with SMTP id 5b1f17b1804b1-4a0276a312fmr218558155e9.31.1791222348711;
        Mon, 05 Oct 2026 10:45:48 -0700 (PDT)
Received: from localhost (140.30.66.37.rev.sfr.net. [37.66.30.140])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a178db8b09sm9629685e9.13.2026.10.05.10.45.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Oct 2026 10:45:48 -0700 (PDT)
From: =?utf-8?q?Cl=C3=A9ment_Le_Goffic?= <clegoffic@baylibre.com>
Subject: [PATCH b4 0/5] review: fixes to track and forget
Date: Mon, 05 Oct 2026 19:45:41 +0200
Message-Id: <20261005-b4-send-b-v1-0-7f6ed23f5106@baylibre.com>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAEXiw2oC/yWMwQrCQAwFf6W8s4HdNq3grxQPphvbeFjLRkUo/
 XdXPc4wzAbXYuo4NRuKvsztnivEQ4NpueRZyVJltKEdYgg9CZNrTiTE0nHk1PU6HFH7tejV3r/
 XCGGc/86fctPp8Z1g3z9m6KdWcQAAAA==
X-Change-ID: 20261005-b4-send-b-4b3414d35e67
To: "Kernel.org Tools" <tools@kernel.org>
Cc: Konstantin Ryabitsev <konstantin@linuxfoundation.org>, 
 =?utf-8?q?Cl=C3=A9ment_Le_Goffic?= <clegoffic@baylibre.com>
X-Mailer: b4 0.17-dev

These are standalone fixes to "b4 review track" and "b4 review forget", found
while working on reviewing a local branch with b4 review, which will follow as
a separate series:

-a failed retrieval ends in one error line instead of a traceback
-`--offline-mode` no longer contacts lore when rethreading
-`--no-stdin` is respected by track and forget
-re-tracking an upgraded series shows its live revision instead of an
  archived one, and no longer suggests "b4 review forget"

Each fix applies on its own.

Signed-off-by: Clément Le Goffic <clegoffic@baylibre.com>
---
Clément Le Goffic (5):
      review: report a failed track retrieval instead of crashing
      review: honour --offline-mode in the retrieval
      review: honour --no-stdin when tracking looks for a series identifier
      review: honour --no-stdin when forgetting a series
      review: describe a re-tracked series by its live revision

 src/b4/__init__.py                |   9 +-
 src/b4/review/_review.py          |   3 +
 src/b4/review/tracking.py         |  70 +++--
 src/tests/test_rethread.py        |  55 ++++
 src/tests/test_review_tracking.py | 622 ++++++++++++++++++++++++++++++++++++++
 5 files changed, 737 insertions(+), 22 deletions(-)
---
base-commit: 7768e1d35ae5e11c79175d6efb4083d57709b690
change-id: 20261005-b4-send-b-4b3414d35e67

Best regards,
--  
Clément Le Goffic <clegoffic@baylibre.com>

