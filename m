Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 142054192FC
	for <tools@linux.kernel.org>; Thu,  9 Jul 2026 11:50:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=100.103.45.18
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783597818; cv=pass; b=hDNiSjqMqwcn1D8YjUkGwHX+fysscX1WPXwBU4PhonMEzQUrzLKP1VndfMaeCuAGcZn5juR9c5yiH3tZKp+pKIHXP4Rlrg9RBvCLlnmPWf41T7y/c0g2p8aDNB6p0KUbXG33l0qoxBPLX7f/ng1F9wsfMsAYckXc7SzFcjqHQ+Q=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783597818; c=relaxed/simple;
	bh=ZWYDTPt2INsfrfjekJ9+Fr6OaUFIO4TQs4dluGhiECQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jRtt9h/TR2d9i8yV8iCkGuhHlYB8fBsB0iNJ2Efe+Geh1wgE7m6Tx4i/ihY5a2+zWiTiTfS0xnJ9dXJvmLpulujFKLvMcIZ84FMsnkV2n5/ymh+vr+XXYoXMjZufMzXftujaiFBZz4nIg4K5CagZr3UxsRgvM5j3gkAPgRHFn+k=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=JkrKuDzL; arc=pass smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="JkrKuDzL"
Received: by smtp.kernel.org (Postfix)
	id C76DD1F000E9; Thu,  9 Jul 2026 11:50:15 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=95.215.58.182
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1783597815;
	b=2eQkbZRoTd2GwZQi+VHnqNQi0Mi8SjU1TyHec2UgChitwUXlzRVRT5r1Fn+x5Cfi1Snl
	 WP+pchQTQM2sqDhUhh6EZ82FLjLkFQzgsvCMmq4X1C/uJ9PegQfWaS63dWph78Ot5O97c
	 iWZBMj5BhsHWx4lpg6P3YS88e1iuyyARKOX09iHzuM+Xs/SScj9Pf/iDwYnODG8RP10IY
	 /QcOxfVvhQ/K91qZMK5sxmvX9NOGqgIafYxOG7b3yuek2gUv+22drCK9kSJuBWCDE8Epv
	 c+ScSxwO7HKXYQ4FdHqOZTaTYBmRXLmyfPqOi1UcKRgpJQi62W9ZZLijt7zZBX5y6KA==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1783597815;
	h=DMARC-Filter:X-Forwarded-Encrypted:DKIM-Signature:X-Gm-Message-State:
	 X-Received:MIME-Version:References:In-Reply-To:X-Report-Abuse:From:
	 Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:Subject:To:
	 Cc:Content-Type:X-Migadu-Flow;
	bh=L3SuTrK7ua1jSt5ecvosiLTOXicZe+1p9rD4HzyC/xI=;
	b=QmL7r5hXbf7eXsKMP949AtMSvdVC9BHEWAj2lOgoFbw7JsJbZSTz9p4YiLfydWAWcpmC
	 VHRFOhg2ARPzKTyWkugrko6Om57Q3zutsWtzL14he9ydA1UbL+lrEkgOasV6Jx1IJ7mRF
	 O3Vyz6/iiXDJU7vW/s24ipFMau4ErrDuRAH744KQdBPrY2zCTv5IVslQklK4UUDLSbzx1
	 SwQJ78T2SBgMI3ryrBdVUofb2GsepXl0lCSymm6xAuLsM57ws9u4hcGttnI+sHe9qxh3z
	 dyLZ9TOy6qvBXqQQeCJX3FT3gYHvmxoYmw/kK4xgP4skjTz7cA/nsztfmNDD+UnGkWQ==
ARC-Authentication-Results: i=1; smtp.kernel.org; dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=JkrKuDzL;
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	arc=none smtp.remote-ip=95.215.58.182
Received: from out-182.mta1.migadu.com (out-182.mta1.migadu.com [95.215.58.182])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id F38A41F00A3A
	for <tools@kernel.org>; Thu,  9 Jul 2026 11:50:14 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=JkrKuDzL
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.kernel.org F38A41F00A3A
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linux.dev
X-Forwarded-Encrypted: i=1; AHgh+RqgMnuq1ELqBb0XO6IPe/7aVrC0DUecUZ09BzwUE9162IzlEHLjWSpkT5Pm7pWfJ/hEB9kt0g==@kernel.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1783597813;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=L3SuTrK7ua1jSt5ecvosiLTOXicZe+1p9rD4HzyC/xI=;
	b=JkrKuDzL3X1UmU3GxUymEOQEVQrskDWmsFwBqIx2alRPGudrufjPSQngo9qJ49tYQ203Wd
	C5Bd2llwDi3xnsWMrhXTXBq9SP0Sky1IHtFV7TutQ8MN5/VYbEfABpph7bUaOsBbK4JWc9
	ufCKTVEkThYyplf+fFaNeVsrCGE0mLg=
X-Gm-Message-State: AOJu0YwAUdWPLEvynfjfjCpZ1BfTTZqcjLWZ7SMK66r1qQl63Q0RahDv
	wRJarZidgXBqE+ZU+8N/jJhhZCB6dQu+dI2drpfY+8ozofQYYM2RvSiX125+DLSE6RSUSZtkwFS
	WlYmwaEjyzmJ3E5g2k0OofsKU4jKoALD3DT/epLkr
X-Received: by 2002:ac8:7f0d:0:b0:51c:6b7:d3de with SMTP id
 d75a77b69052e-51c9c573e75mr5591691cf.5.1783597796410; Thu, 09 Jul 2026
 04:49:56 -0700 (PDT)
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
References: <20260709-kvm-arm64-sme-v11-0-32799f66db9d@kernel.org>
 <CA+EHjTyAxBx4jhGq-Gme5hPi1ZyDAkL2CP_U22ykkQemD1dUhg@mail.gmail.com> <4b2fb0ef-4d3e-4a1f-8d33-177bb4af2005@sirena.org.uk>
In-Reply-To: <4b2fb0ef-4d3e-4a1f-8d33-177bb4af2005@sirena.org.uk>
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Fuad Tabba <fuad.tabba@linux.dev>
Date: Thu, 9 Jul 2026 12:49:19 +0100
X-Gmail-Original-Message-ID: <CA+EHjTyhRFMa+diHpWyKcCuB8DrTH4p1bvraiaQnO0Fru74cHw@mail.gmail.com>
X-Gm-Features: AUfX_myGvG9GzTq40K-onGYQvIqSeZZ7bcchUs-KHtoNqS1WCKCcF98we18uqCM
Message-ID: <CA+EHjTyhRFMa+diHpWyKcCuB8DrTH4p1bvraiaQnO0Fru74cHw@mail.gmail.com>
Subject: Re: [PATCH v11 00/29] KVM: arm64: Implement support for SME
To: Mark Brown <broonie@kernel.org>
Cc: Konstantin Ryabitsev <konstantin@linuxfoundation.org>, Marc Zyngier <maz@kernel.org>, 
	Joey Gouly <joey.gouly@arm.com>, Catalin Marinas <catalin.marinas@arm.com>, 
	Suzuki K Poulose <suzuki.poulose@arm.com>, Will Deacon <will@kernel.org>, 
	Paolo Bonzini <pbonzini@redhat.com>, Jonathan Corbet <corbet@lwn.net>, Shuah Khan <shuah@kernel.org>, 
	Oliver Upton <oupton@kernel.org>, Dave Martin <Dave.Martin@arm.com>, 
	Mark Rutland <mark.rutland@arm.com>, Ben Horgan <ben.horgan@arm.com>, 
	Jean-Philippe Brucker <jpb@kernel.org>, linux-arm-kernel@lists.infradead.org, 
	kvmarm@lists.linux.dev, linux-kernel@vger.kernel.org, kvm@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	Peter Maydell <peter.maydell@linaro.org>, Eric Auger <eric.auger@redhat.com>, 
	Roman Gushchin <roman.gushchin@linux.dev>, tools@kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Migadu-Flow: FLOW_OUT

On Thu, 9 Jul 2026 at 12:36, Mark Brown <broonie@kernel.org> wrote:
>
> On Thu, Jul 09, 2026 at 11:26:41AM +0100, Fuad Tabba wrote:
> > > base-commit: 4c45e14df2f4e77982ad70d6d8e3fe750edd4c37
>
> > I think this SHA is local to your tree. I can't locate it, and neither
> > could Sashiko [1, 2]. For a series this big and complex, it would be
> > good to get Sashiko to review it. Could you please fix that?
>
> That is the v7.2-rc2 tag, copying in Konstantin since this probably
> wants fixing in b4 and Roman for sashiko since this might bite others.
> I told b4 the code was based on v7.2-rc2 (which it is) by specifiying it
> as "v7.2-rc2" in --edit-deps and it's translated that into the git
> object hash for the tag and dropped that in there rather than the hash
> of the commit that was signed.

I figured out what the issue is in Sashiko and submitted a fix:
https://github.com/sashiko-dev/sashiko/pull/317

It wasn't advancing the local HEAD after fetching.

Cheers,
/fuad

>
> Probably if b4 is going to resolve deps into hashes it should make sure
> to resolve them into a commit object in case users aren't pulling tags
> (which I'm guessing is what's affected both Sashiko and you here).
> Either that or just keep the text (which would make it more obvious
> what's happened but doesn't actually fix anything if it's automation
> that's impacted).
>
> Unless someone objects I'll resend with the dependency specified as the
> commit object for Sashiko's benefit :/
>
> FWIW:
>
> $ git show 4c45e14df2f4e77982ad70d6d8e3fe750edd4c37
> tag v7.2-rc2
> Tagger: Linus Torvalds <torvalds@linux-foundation.org>
> Date:   Sun Jul 5 14:44:06 2026 -1000
>
> Linux 7.2-rc2
> -----BEGIN PGP SIGNATURE-----
>
> iQFSBAABCgA8FiEEq68RxlopcLEwq+PEeb4+QwBBGIYFAmpK+lYeHHRvcnZhbGRz
> QGxpbnV4LWZvdW5kYXRpb24ub3JnAAoJEHm+PkMAQRiGsv8H/Rn7Hr3Hp8t6au8B
> xQueZThJWjqQ4v8pyLnXF6OomKiDR24OTXMCrFgDkcmZ7RK2ALqowI3tQVwLUTuI
> yUN0qL2z2y+LyTcO0CYf3Lple8KlgLAXYMsv7pGLsOvhS7BW2jW97/bcbpUNxoHb
> eghxqbIEnyRImUbbyg+nW7VVk65RKdPUNkBPXfQ2NMVwe+SDE5Rl+NXNVqDNjGad
> soDTUBrD9yXkWX+4s0myleE62UzzH5nYgGPQeQgYmzWgq7LybH6WBlbQK9D7ODJR
> Cw3LCq1hwZZ2w04Yx+XwMHquGJYHW8L2pj77h95uhzksz8buKnM0AGwBCTC6RMoi
> AyUQvdc=
> =JUWl
> -----END PGP SIGNATURE-----
>
> commit 8cdeaa50eae8dad34885515f62559ee83e7e8dda
> Author: Linus Torvalds <torvalds@linux-foundation.org>
> Date:   Sun Jul 5 14:44:06 2026 -1000
>
>     Linux 7.2-rc2
>
> diff --git a/Makefile b/Makefile
> index b9c5792c79e0..b4035d3cef26 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -2,7 +2,7 @@
>  VERSION = 7
>  PATCHLEVEL = 2
>  SUBLEVEL = 0
> -EXTRAVERSION = -rc1
> +EXTRAVERSION = -rc2
>  NAME = Baby Opossum Posse
>
>  # *DOCUMENTATION*
