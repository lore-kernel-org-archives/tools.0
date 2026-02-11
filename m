Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07E802E06EA
	for <tools@linux.kernel.org>; Wed, 11 Feb 2026 20:51:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770843093; cv=none; b=qYfgzJ+GD48pJYCOsyCtfqyK8uZOumyhDjq1WdZeW4dMPx383QdzwNrIs2231pbIDkrUc4y0Q/0L9+H1Z4SG83cbMUD8dD1+Vk7eQ52JhgefHZNpiJTXJxXv/sHokuGlVP4r4Eckh48cELnSE1gy91WaQvboUfP/qYrKre1f7oU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770843093; c=relaxed/simple;
	bh=QmqExgSUB9tkv5J4NCX4iwmCYqM0ShCQanbIP+efAzA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IuncjPI3PFV+SS3fVTMuYSBiKa9LA6LOdfodhG5aWXWvOj4dHvaAUwyotIQPAV0/2DCk4YmxrDnjSZX8PCdD45WFIlFy/unSFShYRz1Wg8X9N/z/cvk/WXB+Avtdo1EaBz5JsrgRjBRvbeNaRbAVQbZPtQoZReRftttERktNEXQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=fail (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b=C8NgjcU9 reason="signature verification failed"; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b="C8NgjcU9"
Received: by smtp.kernel.org (Postfix)
	id BC1A3C2BC86; Wed, 11 Feb 2026 20:51:32 +0000 (UTC)
Received: from mail.alien8.de (mail.alien8.de [65.109.113.108])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 0EF6FC4CEF7;
	Wed, 11 Feb 2026 20:51:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 0EF6FC4CEF7
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=alien8.de
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTP id 2F2C740E0368;
	Wed, 11 Feb 2026 20:51:26 +0000 (UTC)
X-Virus-Scanned: Debian amavisd-new at mail.alien8.de
Authentication-Results: mail.alien8.de (amavisd-new); dkim=fail (4096-bit key)
	reason="fail (body has been altered)" header.d=alien8.de
Received: from mail.alien8.de ([127.0.0.1])
	by localhost (mail.alien8.de [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id PAgMNkjGdFMu; Wed, 11 Feb 2026 20:51:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=alien8;
	t=1770843081; bh=znkrzVwpMWGUZJjKRijlbu2mRwbJjbK3tCq+CM+xdKY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=C8NgjcU9mGNgSdRCiZPQ/J0fXdQiqbekd8QyUt33SK4IbFkWeYXVEC8LCriWcSSpD
	 11VKDYBvZE693PFfkEmBt1qV5ermfGOEg+0xW4hb5NT4dWsvGwf5de55YRPxVgM/bO
	 Phkf/yzkMVFk1wtVHgztoPYdj0f4mghmtckYuTqi+l18T7YGRtB6mT5C509yyROr7A
	 ZKCoXW7sVgVEyb38Jb5iOgEZIaK3dX7kKNZt+oRlJnn0UBjbR2F1c7LKP0RbcwqEZB
	 VmOsuwlWt5DDfQ1C09dtvRx60CDVt0rNV50jpi90dqH3oJubQDCnaL8wVIlwUOyKaQ
	 FvUMMJDr6517o5wWpfF6aBYWQ04U66b7ubHk9mRt8O4+99F39hkZ3iDy2QIPaQOykU
	 ZtLcd0G0A4V2mTALeIDp52vUNSIkYTCcKVmIoT48SjdRTxOLEPVvWKL6CydSYq+ySY
	 M43BQzuZi9H7xyR5rTt9Q2LZllmuGdwnfxO8JsmFtwIEISEsvRuQ7JL/QnfSpn0FRQ
	 5KdK364emq4MpSfkaneXjnUkfGuPCC0MSJB526N4YxAzsOZxgkwk2dweOvFiNYwtVF
	 woCE7ynMTfAhyFoTRDbilEwKx1uAEO8flKD8JfvtYQUWNf56nfojbgebCQEGbc7Pxu
	 nSIG2ecotQD7GSA6QIB3tpDc=
Received: from zn.tnic (pd95306e3.dip0.t-ipconnect.de [217.83.6.227])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature ECDSA (P-256) server-digest SHA256)
	(No client certificate requested)
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with UTF8SMTPSA id 8E21440E019D;
	Wed, 11 Feb 2026 20:51:18 +0000 (UTC)
Date: Wed, 11 Feb 2026 21:51:11 +0100
From: Borislav Petkov <bp@alien8.de>
To: Konstantin Ryabitsev <mricon@kernel.org>
Cc: users@kernel.org, tools@kernel.org
Subject: Re: korgalore v0.5.2 now available
Message-ID: <20260211205111.GHaYzrv792wmWdAUMM@fat_crate.local>
References: <20260211-courageous-ringtail-of-judgment-ae8c68@lemur>
 <20260211183509.GEaYzL3U2BhUIsAJ9b@fat_crate.local>
 <20260211-honest-unicorn-of-advertising-e0fe37@lemur>
 <9305e0e4-b6e6-4cb2-ad71-a929bf282565@app.fastmail.com>
 <20260211193320.GFaYzZgMJ2jHuYbHpl@fat_crate.local>
 <20260211-enchanted-cicada-of-aurora-105bd9@lemur>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260211-enchanted-cicada-of-aurora-105bd9@lemur>
Content-Transfer-Encoding: quoted-printable

On Wed, Feb 11, 2026 at 02:49:07PM -0500, Konstantin Ryabitsev wrote:
> Bah, I hate it when tools think for me.
>=20
> This will definitely do it. Probably.
>=20
>     pipx install --force korgalore=3D=3D0.5.2

That did it:

$ pipx install --force korgalore=3D=3D0.5.2
Installing to existing venv 'korgalore'
  installed package korgalore 0.5.2, installed using Python 3.13.7
  These apps are now globally available
    - kgl
  These manual pages are now globally available
    - man1/kgl.1
    - man5/korgalore.toml.5
done! =E2=9C=A8 =F0=9F=8C=9F =E2=9C=A8
$ kgl --version
kgl, version 0.5.2

> I'm switching to uv.

I heard good things about it...

Thanks!

--=20
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
