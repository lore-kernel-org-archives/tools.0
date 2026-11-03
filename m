Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793716187;
	b=e1U4SjT2gjoFL3JbJt/NeNBrm8++fwCZh7t0+hN6aGu4ndKjgNAIe8R8NZRqFuHkPaio
	 qZ1vgH6H0okYHG5SrkWax4aolZWpftfOa21UKpNAA3Ofu0UE3ZtFh3ICJtJ4kyUhQCx6L
	 uWIn+O9llpSJzlymXuy7oaRoJ0fMNP0bv5gMoT7+w0ab4wJvNskS4SkXSV/SVPHzPQSa7
	 EqcwphNMFq6DPmEifoWL03zQSZtkGfm4hLcJSBuxws+Hz2S78zP6sy8ZmXhtLh9+qNjtM
	 waqW7Hu/ZHxNL7y3kvKkB3b3ikydrolvNxBVAW8PCnJk2YyOeyKy5UFMm9rkisX4oIw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793716187;
	h=Received:Delivered-To:Received:DMARC-Filter:Received:DKIM-Signature:
	 X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 Received:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
	 X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=J5hhY8dVIwnYI9B+rBuhKqUq/sWSJOyshkTfQ8f/+XA=;
	b=X9m3n13yaP1RwCda88uyi4LgGWFmR5ARDF9EZCHbj+/KStFRgTfHQJbGkEZQ+qW3Xzko
	 GcrcdXgDrGr6uKehP+pWLZs+4hMTmNaE/uS06eznLvDm/7SUg7nzhAlFgOQg7ag8HcD7b
	 ugTynxWIufYeYPrbZZ/2hjT4dUsPRDS7sWl0GBEG3qPHuq54ZiGDg5q15qHq2ibCUsnoO
	 x4SqFvcoDGuwkvz1d5Za8DVZZD+HnOzIg/Dy5n5uB42s5AbqFwC/dbIQRYLFnhAATyu/U
	 KRbGXbxSIG1Nj1JvS6XiJaHcBaa7Dfen+8iqZWyMjEd2apfwqbJ28H9QmS0NvNo/NrQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=fvstgDax;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4791A606A33E
	for <tools@linux.kernel.org>; Tue,  3 Nov 2026 14:29:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=fvstgDax
Received: by smtp.kernel.org (Postfix)
	id 037F21F00A1C; Tue,  3 Nov 2026 14:29:47 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=209.85.128.52
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1793716186;
	b=0Xvy1cFazFspvwsSOpNVi/jqlYVUCyNmwZlqaChRSRIqk1G9//I1eFWGN96Imd9PpGNV
	 1bpl5InvzTFhFZXuXuJlw0C1HDSUzhD6XmPa+SkW6inch31UXfDfkye0WWy76p4aT10y7
	 cEkUQo/zEN+PCYJnEQTqTDZbMIo8y+ft675Fh2nQb8V8J+RA5ZemUs317HG1Uylso+dzm
	 xNWLaMczhNfn00JvaGg7FMf6nAtEEqXjmt4rrNN+5K8sCvd33xYPvUG1/5y5lLZpEaY/q
	 Ihg6g6INgCyKYGzQUA9kvz1hJ3JjOyqzda1m4WN2ARoy5/+qMAW+3F9EGBFnrosrBeQ==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1793716186;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:
	 X-Developer-Key;
	bh=J5hhY8dVIwnYI9B+rBuhKqUq/sWSJOyshkTfQ8f/+XA=;
	b=okVNPnCC6JafGM0N7zYwOsLTX7ZXDEcCqnEEW+JSUWFnGqHLTnZcSX9KsbzZy2WvfeGt
	 OvafVRpVvy68w2pJQLuZH5QXtYZHV/88hzdEDkeb+5jowz92hcwwOv1S4Y15g6yJAFqLl
	 cD+TqjqqWxMqPGzSCoAKoeRTwUd8kcl/KEaKWL8HPep7eX3+epcJlOv34U+Z9Sn0OVPkp
	 FjO0eqdrFKUO+OCTAd/NAq/WZEMLmG1SJP48x7JgHMMeb/3z3F0sfYxNWBvYPaAg5tx73
	 SPz3YVqIgvkfgtZbZLDweayAESVxdFsoOqIIkhD3HNOGKbC825bunZxvuaIIHX6NjAA==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=fvstgDax;
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=209.85.128.52
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 713BA1F00919
	for <tools@kernel.org>; Tue,  3 Nov 2026 14:29:46 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=fvstgDax
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.kernel.org 713BA1F00919
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4a214c5c4c0so38311675e9.3
        for <tools@kernel.org>; Tue, 03 Nov 2026 06:29:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793716185; x=1794320985; darn=kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=J5hhY8dVIwnYI9B+rBuhKqUq/sWSJOyshkTfQ8f/+XA=;
        b=fvstgDaxWLvfM0gVI4KdIkzeEmnsu7QwZXUVZhGNS78r52hVt6mFnDjuFrDgV73oMU
         4id51MwQ1Q6bM8GPAm1TSu6d8Yazz26jNz7EJKG9FupDzhseB3tIoA5dDOlRYP7fRS0+
         sPqv4P4utqpWMyvMqcLnbfo8oquPFqCJiZcVWKIwV9lUWIZ3iH9P6jij7Vm4yzUHA+D0
         fiZXsvhmyJA8WZ3ryO+48Bp0B1UPM5msFbPCVkaBgwWppqDxEXsFj6KHOasfKlgtSFiZ
         0xksv/a4+B5C79HM9XYymIsvDF9MKOuwo6TIKyodMEoEQeb27182zWFX2e3NIfIynoxm
         OPQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793716185; x=1794320985;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=J5hhY8dVIwnYI9B+rBuhKqUq/sWSJOyshkTfQ8f/+XA=;
        b=pdpPwN9PJlUGlpFZZJME2oXSoMhwhiDEV3oDazas/xL3N0VL0Ydf9VBRJ5kAbjZD7k
         OUr08uUMAw1AwrYQ/LB5QFeCO7o3pbzecbRNhUeTfNGNP8HXNCQ2mmBoJ6KAxwQcR7j6
         PxdEuiwK4S5+D1D4iOojssWVgZKYdeaIWLAIBy+pkj/qD1uBsx8D8Lz1AzDH/lf2CHJC
         TiNXwJSerxdaic1J6V70MlInhEh8L7VL+RwuDLCu2GFYVy8lWRxsghG9fAw91ubDgoX4
         9bNZNHLyNsZfL4ZwdiESG8VAIiEFKA1ksDLTmAQbdfbtlE8c+NTHGSEcTMN1i5sunrJF
         vsGQ==
X-Gm-Message-State: APuU4Z8SJtLFmQ+gQCfngviJc/d2GyCgchG0X5xG8dUWFT14NIAJvA4d
	LM8Nn+N2KRvsgoIAGxxLdr24UUhStT7MJOzRw04ySI10BbCt38xj4tos
X-Gm-Gg: AYBFou3DDF7R2H5jXiWDc1zsQLE3Tn8goKIe85cGQ+G56wsYLsRIlKoKPPKvk2cXvQK
	LwJaXArswGWBornYajsOSA9F+3OSuPcxXamxTzm7vQhRuAnwvXueIfFb9wabnY8Br9uZ5cRy8ux
	tphlG8QeuzfGapw0n74BgVT/w9MmTYwxZ8miuK7vcGmeSb29mJxNYSEH4rweKjpKQmvY7qscq+0
	AkEzXvqylc6SKZmr0lFVhbn7WhPPng2PgFLoguZI0Cgyh35jhKzAJMT3XTX1oFewZEcaijQ2I4m
	UILkZhVtSs87c+p2FEVfrt1u6tagIuuSBWVrosIcoEcUkg07hfwWs7Z3GHgAGbdcX8rP6phPmxc
	kwL3pC1poM7yJmC7fJnOu70/Q4zy8919dLc0a312CFozsK1W87tDzrzMn4z5dSkOzjNNGUENbOx
	+9sNs+xpWIQoM8kSFu2WsMgLnd+00gYcBIGbomvm8uCMr5X8QzPV7RUogtJ/97qM2ZiR9UOIR1m
	78mcKTIUkPtl/5UJGb399Q6hqqC3Y9shkR+olQgOmxhDBRggTbYjeNJx0qK9A4UipMEqveQ7bgw
	A6LYdOTTHa+7Zz/yKKTw/JiYmZ7VYiS0bYT/usPjXuapMg==
X-Received: by 2002:a05:600c:348f:b0:4a2:be6:60aa with SMTP id 5b1f17b1804b1-4ac17d16b14mr306745675e9.10.1793716184817;
        Tue, 03 Nov 2026 06:29:44 -0800 (PST)
Received: from 990pro.localdomain ([185.68.248.203])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b2a96fc933sm65290805e9.11.2026.11.03.06.29.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 06:29:43 -0800 (PST)
From: Bernhard Kaindl <bernhardkaindl7@gmail.com>
Date: Tue, 03 Nov 2026 15:29:34 +0100
Subject: [PATCH b4 1/5] review: Split track_series_from_mailbox() from
 cmd_track()
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Post: <mailto:tools@linux.kernel.org>
List-Help: <mailto:tools+help@linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
List-Owner: <mailto:tools+owner@linux.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261103-browse-and-track-series-v1-1-d9c9306f4033@gmail.com>
References: <20261103-browse-and-track-series-v1-0-d9c9306f4033@gmail.com>
In-Reply-To: <20261103-browse-and-track-series-v1-0-d9c9306f4033@gmail.com>
To: "Kernel.org Tools" <tools@kernel.org>
Cc: Konstantin Ryabitsev <konstantin@linuxfoundation.org>, 
 Bernhard Kaindl <bernhardkaindl7@gmail.com>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793716179; l=1103;
 i=bernhardkaindl7@gmail.com; s=20261024; h=from:subject:message-id;
 bh=R31vwTsqqyvNa+q+4EBWiJufVCgM6xswX13g3F+PAXU=;
 b=izQpyzYyPDRD1qkf66U4Wo62FV5LxKe+/NZ+mroiEtnleS96DCBtZWpl4dHBtJhszXVu84suP
 lppXdRPbNzhD34jM81IcNGC1CLL4qpKr6UibFo6HTI6pGlIHVPL8fVs
X-Developer-Key: i=bernhardkaindl7@gmail.com; a=ed25519;
 pk=oIjnI/us0Uh5d/WP18V5IQq/FrLPUp+W0JAhJ9QCQIs=

Split cmd_track(), makes track_series_from_mailbox() reusable.

Signed-off-by: Bernhard Kaindl <bernhardkaindl7@gmail.com>
---
 src/b4/review/tracking.py | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/src/b4/review/tracking.py b/src/b4/review/tracking.py
index 57fd141..891891d 100644
--- a/src/b4/review/tracking.py
+++ b/src/b4/review/tracking.py
@@ -679,6 +679,17 @@ def cmd_track(cmdargs: argparse.Namespace) -> None:
     finally:
         signal.signal(signal.SIGINT, _old_sigint)
 
+    track_series_from_mailbox(identifier, lmbx, wanted_ver, topdir, was_rethreaded)
+
+
+def track_series_from_mailbox(
+    identifier: str,
+    lmbx: 'b4.LoreMailbox',
+    wanted_ver: int,
+    topdir: Optional[str] = None,
+    was_rethreaded: bool = False,
+) -> None:
+    """Track a series from a LoreMailbox, given the desired version and project identifier."""
     lser = lmbx.get_series(wanted_ver, sloppytrailers=False, codereview_trailers=False)
     if not lser:
         logger.critical('Could not find series version %d', wanted_ver)

-- 
2.43.0

