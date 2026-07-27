Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B33763CB90A
	for <tools@linux.kernel.org>; Mon, 27 Jul 2026 19:28:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785180504; cv=none; b=lVVmfqe+xYTAc1Xq/JeoC8SPDH/Jes1O6AFk+AGRxJq5pN7THO/gx9MX6WgSgJj2gHqxgwIkOgsrBKNnEyFj2SS86bEYfWbfY2L3xm8Nwiu1nHxx4fqL/YFGELUFUovCFBNAGBNwZUBQG3cS2JSmf3EefjAJ4K1SpGQ/Yb2fQWU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785180504; c=relaxed/simple;
	bh=G6NV1p3ZrluG71LjRqiKswACBF04eMkoP/naT1SX5rk=;
	h=MIME-Version:Content-Type:Subject:From:To:Cc:In-Reply-To:
	 References:Date:Message-Id; b=ZXUuKTGOtTWw4pd0982IhLynAJGHwPpk/Yjk1R0kHyYhAEZULVZKK0Qwh4DZVGT4K+GfAELI/o7pth8uTx+LGVzANvKEUKa4ba420UDC0NOXDuSKOeSYBy2WmNjIeMLhY9qn9Ck+t20mDTCbiE32AryvxMDrPapFOT1TOS65YIQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=RemEOli0; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="RemEOli0"
Received: by smtp.kernel.org (Postfix)
	id 595051F00A3D; Mon, 27 Jul 2026 19:28:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 00D541F000E9;
	Mon, 27 Jul 2026 19:28:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1785180503;
	bh=iACsdyvkpKraIlN6goEs1vx2vdJQNVmVy3NO+HlAd3s=;
	h=Subject:From:To:Cc:In-Reply-To:References:Date;
	b=RemEOli0nXTt9abRpe1l4fooA343uz4wgF6flqDNLWA8w3Tq48yx93FRaA60pKtKz
	 LHYhB0+x4WpEsvBKFJxm+so5OgGselBeoyiqXdg31SUIV2TZ8vRaIth+zFmvybTb4R
	 yjhq1Tq+mLZ6sBvka1Mc1UmF3WLYoM/WLmKB83uA=
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH b4 0/2] Detect naked cover letters that lack a 0/N
 prefix and diffstat
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: Christian Brauner <brauner@kernel.org>
Cc: "Kernel.org Tools" <tools@kernel.org>, 
 Konstantin Ryabitsev <konstantin@linuxfoundation.org>
In-Reply-To: <20260727-umfahren-klinke-mutation-b23efcc7258c@brauner>
References: <20260701-work-b4-naked-cover-letter-v1-0-f651c2ffb63b@kernel.org>
 <20260727-umfahren-klinke-mutation-b23efcc7258c@brauner>
Date: Mon, 27 Jul 2026 19:28:21 +0000
Message-Id: <178518050148.2787052.7066452208131813379.b4-reply@b4>
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1906;
 i=konstantin@linuxfoundation.org; h=from:subject:message-id;
 bh=G6NV1p3ZrluG71LjRqiKswACBF04eMkoP/naT1SX5rk=;
 b=owGbwMvMwCW27YjM47CUmTmMp9WSGLLSN4a97nm5yPbcweVtB+Tn3/O5G8eeZfN9Z3Puwwu6f
 sqHPeVcOkpZGMS4GGTFFFnK9sVuCip86CGX3mMKM4eVCWQIAxenAEzkjRLDP+1tvev0jHZOXPH4
 R7xhyYz7Eh8vSHkGuhaYFE1cunpfZyUjw4qtJZGmBaz6l+7aLdqy57CG/s9UHcba2WJBpv3Xtpx
 z5AIA
X-Developer-Key: i=konstantin@linuxfoundation.org; a=openpgp;
 fpr=DE0E66E32F1FDD0902666B96E63EDCA9329DD07E

On 2026-07-27 16:37:45+02:00, Christian Brauner wrote:
> > LoreMailbox only recognizes a cover letter when the message carries 
> > an
> > explicit zero counter ([PATCH 0/N]) or, via the in-reply-to fallback in
> > get_series(), when the thread root carries a diffstat.  A "naked" cover --
> > one with neither a [PATCH 0/N] subject prefix nor a diffstat in the body --
> > matches neither test, so it lands in self.unknowns and is dropped, and
> > LoreSeries.has_cover stays False.
> > 
> > The visible fallout is in shazam -M, which then reports "No cover letter
> > provided by the author" and links the first patch instead of the real
> > cover.  This happens whenever an author writes a short prose cover with no
> > diffstat, e.g. Christoph Hellwig's "don't build bios/contexts over multiple
> > iomaps" series:
> > 
> >   https://lore.kernel.org/linux-xfs/20260629121750.3392300-1-hch@lst.de
> > 
> > Patch 1 extends the in-reply-to fallback to also accept the parent as the
> > cover when it is a non-patch, same-author thread root (in_reply_to is None
> > and not itself a reply).  Requiring the same author and the thread root
> > avoids mistaking an unrelated message the series was merely sent
> > in-reply-to -- a third party's bug report, say -- for a cover letter.
> > 
> > Patch 2 adds positive (naked single-patch cover) and negative (patch sent
> > in-reply-to a stranger's bug report) fixtures and a test.
> > 
> > Signed-off-by: Christian Brauner (Amutable) <brauner@kernel.org>
> > ---
> 
> A solution to this problem would also be nice as Christoph keeps sending
> me patch series with naked cover letters and I have to fight with b4 to
> apply them correctly. :)

I will take this, but I will grumpily point out that it's the second 
time today that I'm adding special handling for patch series generated 
basically the same way as in 1999.

-K

