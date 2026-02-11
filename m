Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB2DB1FE47C
	for <tools@linux.kernel.org>; Wed, 11 Feb 2026 19:33:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770838421; cv=none; b=k1MmK7dKPJ96DYYvrJS8+M5iyqRFdbp1F/LUpV5EES6l/RduftNRsNuuCnUHNMsxTTSKruxTeKpezWMdh3MuS3sb9f3KIsqKAs0Q8dV6w7af07QT1tWMh8GAIi+JmDzoG+/Z5WESeUGgthPKsAek8nxNRklIxu7Y0Mnmjd/ZXeE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770838421; c=relaxed/simple;
	bh=ys+QByBOdjNBy1Gf394Q+a/wYEYLmFPLSm4m0YIEE48=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RViyB/GX0aaHaZHfqgs7dieGyEmrwEqUqnWEi+ks0cX8wfkbn1OJ9pozTuNrHP3y0RG//53+jsGC3SAs6B547B3OSaVghPoDlRvB1BzL+ACqg7+7k55Qz0+zXGc7vObILOXmowM9t+ZEMkXW77uQzS7OkhPkp/Fy8VGoatZJ4qM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b=hwPKjNes; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b="hwPKjNes"
Received: by smtp.kernel.org (Postfix)
	id 93422C19423; Wed, 11 Feb 2026 19:33:40 +0000 (UTC)
Received: from mail.alien8.de (mail.alien8.de [65.109.113.108])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id D6F04C4CEF7;
	Wed, 11 Feb 2026 19:33:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org D6F04C4CEF7
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=alien8.de
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTP id 8D0E740E0368;
	Wed, 11 Feb 2026 19:33:34 +0000 (UTC)
X-Virus-Scanned: Debian amavisd-new at mail.alien8.de
Authentication-Results: mail.alien8.de (amavisd-new); dkim=pass (4096-bit key)
	header.d=alien8.de
Received: from mail.alien8.de ([127.0.0.1])
	by localhost (mail.alien8.de [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id aRO1U5NhrRmU; Wed, 11 Feb 2026 19:33:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=alien8;
	t=1770838411; bh=uBXGUnEPsX5KYjxA2sn8uIFQzbewNWwlKVhqq1bOMJM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=hwPKjNesLRv1650l/qruqkIaigTEjm9zxIfzOj9AMgcRqyrnxHjNQHDFxVj5ryTkK
	 FveZ07Y1amFC6e43G15O8/pUW/iEHXXTglK01r0DHG/p8GzmipXMOzjzFeBCDTKm5L
	 AVTisrFNzZv8cHhRpmFEeGtiVb4NByONNsJqywK5v4aWYTj/BC+yoWw3srbfXoeDc6
	 sqYaT/VGO8Seb637iXP2M5/rswsLyCsoW6LMmgiJYxAe+2p1szP89NvA1smv8kVswn
	 rPLeHiQ/IYFcueg1nRgWTk/EMDDs2BFm9yCgY7tc9OeMjxtx6hbnUZIba9cqi+Ora6
	 byRMRA2qqKMoAqbLWb8bKxnnZf+ATD1sGHzLBeehV2QEAssQjLoK7noElSrUc6gfo8
	 A+z8xcdsmx93rXy+Y3WBopZQi+kZIHUpy9vk0hynFAjHg4hEaS/uiJILR4dXhiCI4z
	 PUU0P8Iury620W1mj1zYZ+IdC3n9td8jx0jxVZv/OMVc6fPayMY3GB1VUjuc4mB9FK
	 pQ91YzYIzQ6bMd47dF7MS2UDGsQiITnHprDg3yrb5+2N0FALI+1b6gxDeYUlymIr6x
	 xmRKoH4OT3Irf1HYiQliFXXiwqkjUp6Nc4KALivO7MBOTWlYrC2hzyv2Csw1esjivU
	 XdKM5RK/654YJpYDSrd1bs/w=
Received: from zn.tnic (pd95306e3.dip0.t-ipconnect.de [217.83.6.227])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature ECDSA (P-256) server-digest SHA256)
	(No client certificate requested)
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with UTF8SMTPSA id 1A9B940E035A;
	Wed, 11 Feb 2026 19:33:28 +0000 (UTC)
Date: Wed, 11 Feb 2026 20:33:20 +0100
From: Borislav Petkov <bp@alien8.de>
To: Konstantin Ryabitsev <mricon@kernel.org>
Cc: users@kernel.org, tools@kernel.org
Subject: Re: korgalore v0.5.2 now available
Message-ID: <20260211193320.GFaYzZgMJ2jHuYbHpl@fat_crate.local>
References: <20260211-courageous-ringtail-of-judgment-ae8c68@lemur>
 <20260211183509.GEaYzL3U2BhUIsAJ9b@fat_crate.local>
 <20260211-honest-unicorn-of-advertising-e0fe37@lemur>
 <9305e0e4-b6e6-4cb2-ad71-a929bf282565@app.fastmail.com>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <9305e0e4-b6e6-4cb2-ad71-a929bf282565@app.fastmail.com>

On Wed, Feb 11, 2026 at 01:55:45PM -0500, Konstantin Ryabitsev wrote:
> On Wed, Feb 11, 2026, at 13:52, Konstantin Ryabitsev wrote:
> >> $ pipx upgrade korgalore
> >> korgalore is already at latest version 0.5.dev0 (location: /home/boris/.local/share/pipx/venvs/korgalore)
> >
> > If you installed a dev version, you'll need:
> >
> >     pipx upgrade --force korgalore3
> 
> No idea where that "3" came from. Just korgalore.

Same thing:

$ pipx upgrade --force korgalore
korgalore is already at latest version 0.5.dev0 (location: /home/boris/.local/share/pipx/venvs/korgalore)

v0.5.2 doesn't wanna come. :)

Thx.

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
