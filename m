Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795642369;
	b=HgauDzgQRnxWxYqINOdnI9YMQ9VnexFi1GNDmd/K+EHmC1yg9f9EiWaQ9/9qRBEMKtni
	 B2sPetN54v7/zXNQwSIyelK1M5lQY+e3drGkLS6EIEYz01s7DWKpPNL5lsxOrF3Gpueij
	 9HZ2N/WvVc1J8n4mOaVSZG2cmGLtx7fxMJ49mnDpeQYCoXV0UfbExhlblt/C0lEJbrUq6
	 7XJoGC0sxDW5BjGoOJYEXPnBPTZglXir7ZAFQATraXw/3ujFPLtjHowqU2I8lIbs47qYf
	 sVEgrZWtW88BaAkR/sheCeSOYwMm88B5ikwXvl7mzV8QNkAYxwEHXMNJJJOQzQ7hNPw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795642369;
	h=Received:Delivered-To:Received:DKIM-Signature:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Subject:From:To:Cc:In-Reply-To:
	 References:Date:Message-Id:X-Mailer:X-Developer-Signature:
	 X-Developer-Key;
	bh=17a5cJoiF2mBM4Y9ITTxMHBymUnc8b/BO09R8Sedaaw=;
	b=u5LbZykMMSmTRN9qnLUDjCR0rNpmSKwcAjQpZslTIna5d4GQ2P6cSujxHoQtBNVRXw+l
	 DpKHb5GhEITtnFE2Qg1vgPVl2IQBCYvPuKgD1nTsFWnqH50U7LBgKPFzebWgjAhbUl8N4
	 QSpgc2+9g9azafn99Nvur6Nus4XnuABjC7RHI8LwMaADYGOV/heqZsuhklibkYIGpoEnq
	 RAHqqQnwyOCw5xGuaNf4SFV5fKU4WnD+0xsJ8EjamDwfFIm0ME/GjQXXpq5ecDyxy5nbt
	 C/keR1/SYmDHgKHK+YPskJpYaEFfquSmmqlkPSvLUorWF7dKizKk/wVZbsUJ3IPH/Tg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=mLt32PSP;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F1FD606A323
	for <tools@linux.kernel.org>; Wed, 25 Nov 2026 21:32:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=mLt32PSP
Received: by smtp.kernel.org (Postfix)
	id 77EFC1F000C4; Wed, 25 Nov 2026 21:32:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 114371F000C0;
	Wed, 25 Nov 2026 21:32:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1795642369;
	bh=17a5cJoiF2mBM4Y9ITTxMHBymUnc8b/BO09R8Sedaaw=;
	h=Subject:From:To:Cc:In-Reply-To:References:Date;
	b=mLt32PSPvjqnrxvZZa7nM7ChuPpWec0GIAkSiius3e5K2oXkVgizPHpIfEW/AFGOO
	 CMK/ORTx+OKAXxsx7c5VQ1A15j9EKe0XAUn+ZFYmI72lqa4qPB2NI956Zp2DguIzMJ
	 iC7oxO4KrO55bZrBA1/rnU8Bck7Euu4A+EPqEBMQ=
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
Subject: Re: [PATCH b4 0/2] review: do not carry sent reviews over a
 revision upgrade
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: Konstantin Khorenko <khorenko@virtuozzo.com>
Cc: "Kernel.org Tools" <tools@kernel.org>, 
 Konstantin Ryabitsev <konstantin@linuxfoundation.org>
In-Reply-To: <20261110-b4-prep-khorenko-upgrade-skip-sent-reviews-v1-0-4533266d020f@virtuozzo.com>
References: <20261110-b4-prep-khorenko-upgrade-skip-sent-reviews-v1-0-4533266d020f@virtuozzo.com>
Date: Wed, 25 Nov 2026 21:32:46 +0000
Message-Id: <179564236658.1145923.2195187607264671876.b4-review@b4>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1086;
 i=konstantin@linuxfoundation.org; h=from:subject:message-id;
 bh=Te/M9YRZbVm/aKjvay01vAspdrlS8OOGjXSK+SkU9AY=;
 b=owGbwMvMwCW27YjM47CUmTmMp9WSGLLZg/+LyHg++Twzc7s9q+E67kRDTpP9nLI9z7k9fxhs0
 BTvzHjeUcrCIMbFICumyFK2L3ZTUOFDD7n0HlOYOaxMIEMYuDgFYCLsrQz/nTdzyC+/Nmd1wyYV
 1m8bZG7fOfMuUOTGganKqwxMmguEpzAybOO1klwduf9kSdCD7MAZeZn5BV+WVJ31Viz1iD1kGrq
 RBwA=
X-Developer-Key: i=konstantin@linuxfoundation.org; a=openpgp;
 fpr=DE0E66E32F1FDD0902666B96E63EDCA9329DD07E

> A revision upgrade carries the maintainer's reviews of unchanged
> patches over unless the series status is "replied".
> 
> After a reply the series is often moved to "waiting", and then reviews
> that already went out come back as drafts. The next send refuses to go
> out until every such patch is marked done or skipped, and skipping also
> leaves the patch out of the take by default.
> 
> e4b0805 ("review: don't re-send reviews carried over from prior
> revision") marked such reviews skipped on upgrade. eb5a313 ("review: add
> visual cue for patches unchanged from prior revision") replaced that
> with the "unchanged" marker, and a64487d ("review: fix two bugs in
> series upgrade workflow") then stopped the carry-over only for a series
> in "replied", which a move to "waiting" gets around.
> 
> - Patch 1 drops the maintainer's review when it has sent-revision set.
> - Patch 2 tests that, and that a draft that was never sent is still
>   carried over.

Thanks, applied with minor tweaks.

-- 
Konstantin Ryabitsev <konstantin@linuxfoundation.org>
