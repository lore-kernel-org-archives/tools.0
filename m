Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 935EB3314D0
	for <tools@linux.kernel.org>; Thu, 21 May 2026 02:10:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=100.103.45.18
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779329436; cv=pass; b=EMIm8ohH26vv/Sa8mC8YA4GbIIuG2qXI0Rapw2L/NajQaAkEsqbYSzBjyVFeBUxaD4l6EQKttufiqr7PVZBs9FKowkR5WDYYqIGA6/05LJsB4zphSq3enQ2XnKiVgYiapARXvWYBMDp5EkC00h5rmpND4ZNl8mSk4AugOmZfG1E=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779329436; c=relaxed/simple;
	bh=9KP+lEBBDWH4XjO2Ey/tv/khGoi+GdYadJbHUFbJeJI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sdd1CXZshPcE3/MeUTvudWawbpM+5tGYrKaHUf7ZPZYKqIvt83bcGfbKj5IVAXyoaJaDW3UEQhxz0b1EmN8N4D8GNhZEQJirlvsByoaJsdD5JVVosobpXM9+WihBAa57keUgim1LjJsbqW4+ejVHIHmCST0abeCDEdFpD7iEkrE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b=jD6HIsvT; arc=pass smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b="jD6HIsvT"
Received: by smtp.kernel.org (Postfix)
	id 475041F00A3B; Thu, 21 May 2026 02:10:33 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=65.109.113.108
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1779329433;
	b=ZH6UcCKUezxYRvAh1X+tokkuUMTMERkJG9uNVicrelNDIMvs7jwejNynteeShqchzZ2B
	 OuXFN3fHc+V2MiYUG3EUF5kc6r8GElWuIKtgqFurPZMSTN0Q/69ewh5PncfxlvZKsUBF+
	 x9KMqs7oo6IpqGhGirfRmekhm37usx8kNsVu+6bzVt4wdKDTI8Bax5PnXkdZZO/cp+bD7
	 +vg3ObWn2IIW8gkiEsq0pPa7alsikJmZ3j6OFb+BZYR5Dz0uzf0Js079MUHhamxrGPSIA
	 mT6tmQGF89tSWM7uVjk2N1YLMWUChOFxFN2b+CBDEPIrXS/U0LoCBMB/U7P23ED1K+A==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1779329433;
	h=DMARC-Filter:Received:X-Virus-Scanned:Received:DKIM-Signature:
	 Received:Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=rRE9Wrq9Q58xY0lagpGugJXOUw9ZtXUlpmMxtioMi34=;
	b=ozTTjC+VljRBSAFmYzX+IJxTxyNvvOT9aPgtrIb19zWVlNPN0HiaiZPTDM0h/3cLQ81E
	 SYEZMSNE1+4UlcFky0DfOXv9lIvpegrQtGa18XaOrEzDFhLXfH3OhqdRhfTp8a5JcMV2G
	 jPogIeZCboInunYBvjb1cIvr5QX+DiD6wG8ARKXN7qR/GhDpM/Q6knU00U8ob18lEgCfO
	 rV4xGSDgf97vfzFD9vqae+YXrutpTKYan4/Y5o58tiVeESOky+2uKDvC/Jbua5DYBhcjK
	 7QPEtRZquIS3iIgdSNQ7RsCQanQa552cEYmP/0RSVrP8fBMiOH+RGrhIkzIzY8zGGAQ==
ARC-Authentication-Results: i=1; smtp.kernel.org; dkim=pass header.d=alien8.de header.i=@alien8.de header.a=rsa-sha256 header.s=alien8 header.b=jD6HIsvT;
	dmarc=pass header.from=alien8.de;
	spf=pass smtp.mailfrom=alien8.de;
	arc=none smtp.remote-ip=65.109.113.108
Received: from mail.alien8.de (mail.alien8.de [65.109.113.108])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 97F5F1F000E9;
	Thu, 21 May 2026 02:10:32 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
	dkim=pass (4096-bit key, unprotected) header.d=alien8.de header.i=@alien8.de header.a=rsa-sha256 header.s=alien8 header.b=jD6HIsvT
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.kernel.org 97F5F1F000E9
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=alien8.de
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTP id 0B5C340E01A1;
	Thu, 21 May 2026 02:10:25 +0000 (UTC)
X-Virus-Scanned: Debian amavisd-new at mail.alien8.de
Authentication-Results: mail.alien8.de (amavisd-new); dkim=pass (4096-bit key)
	header.d=alien8.de
Received: from mail.alien8.de ([127.0.0.1])
	by localhost (mail.alien8.de [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id fL502KvhmpRr; Thu, 21 May 2026 02:10:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=alien8;
	t=1779329415; bh=rRE9Wrq9Q58xY0lagpGugJXOUw9ZtXUlpmMxtioMi34=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=jD6HIsvTisZbIAwLW2K9dOjz3iF3c9UXvGzxAEbsJlvu2sAA8iJUjGtVIkZhofXCh
	 zwC2TWEzmV86VHdMX+TzbSeHkZgtAwcZI/yzCd9zs+vEsrY+IV5ggIcsI4YH+2rlkG
	 tIdL59zwkTGnbByB/TnejbUVwjHS+pmNQg4sLu2KtGedu2VptS0OQCfnlVfEqBO7sO
	 2+8iaaJvnlEis/42URWo1gxywBA9ySyv9KENg0ABSZ1o+R/puBzziUfx85xNWji92N
	 IvhwqZTqDC09gmeuZOuQkLYMrJxIiLboU4whkwlzs/r+Cbr3kLQpTIpCQjtHjq1SKp
	 YuBAg7OS36MNzVaXqXclRBAk7Vr2saKoYyOz6r48oPLkvDeejiHrzBdGYPJs65Li14
	 Mfgcz/9l/wbrbGThPqRF2pF+b7Fc+zGPhiD36PF1B5VBXPiHuj6r9wl52hcs2Px1px
	 yw2hL+8aHRgXY2dgJ2yfVVNrWzSZuS7Q9RDaaRlYx4t/iB/r+FS+Om10m7QiL5UUPv
	 LuTP22nwVXrDlpQ+hypDEVxpxUdeeisa1eOyzXRpRaHrK/ynUEvMswGb1YyFGbI7QS
	 8H1jRvRRijFvjMVMHNHwRyORYE9egBaOS55tbComm+87VBPgfUHtASXfnTvpUy6hhN
	 pGCfaGq5O17/wMvIa48z9x/E=
Received: from stx.tnic (unknown [IPv6:2600:1700:38ca:c00:b8a3:f58e:8829:9ca6])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature ECDSA (P-256) server-digest SHA256)
	(No client certificate requested)
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id AFCC940E0032;
	Thu, 21 May 2026 02:10:12 +0000 (UTC)
Date: Wed, 20 May 2026 19:09:58 -0700
From: Borislav Petkov <bp@alien8.de>
To: Konstantin Ryabitsev <mricon@kernel.org>
Cc: tools@kernel.org
Subject: Re: kgl and git shallow issue
Message-ID: <20260521020958.GCag5pdn7ojEIRXMrY@fat_crate.local>
References: <20260520203544.GAag4bILhFL9wSQpxY@fat_crate.local>
 <20260520-invaluable-careful-cockatrice-e6ed3d@meerkat>
 <20260520-ancient-thundering-bobcat-2f086c@meerkat>
 <20260521011540.GBag5cvFqefROohMlm@fat_crate.local>
 <20260520-greedy-dalmatian-of-protection-4e28ed@meerkat>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260520-greedy-dalmatian-of-protection-4e28ed@meerkat>

On Wed, May 20, 2026 at 09:30:26PM -0400, Konstantin Ryabitsev wrote:
> D'oh. Try now.

Now it says:

$ kgl pull
Updating feeds  [####################################]  1/1                              
Delivering to local  [------------------------------------]  5/34277  lkmlerror: Aborting deliveries to target "local" due to repeated failures.

Pull complete with no updates.

---

Lemme know if you wanna still debug this or I should simply refetch things?

Thx.

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
