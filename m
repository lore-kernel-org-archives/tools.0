Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C550F221275
	for <tools@linux.kernel.org>; Mon, 27 Jul 2026 00:42:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785112965; cv=none; b=iyP8HECT0PDtmYTgbXahlzmfJQvyucrDOxmh42q3eXaLgFO7xsymxYC0SH7RRF99tU3MmqeRoVOKpooLFD8jthyaHOgx6MvDNqpTFNZm0EzxjTnk5vBlzkdcISNi8+EnsmUQQ5FIyhHOzDtCMd4QqbOUzmfgtK1E/J1WF+r+nkQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785112965; c=relaxed/simple;
	bh=S2CI+D8Qf9raGQvU2f3l/2182pBIBDiVXh5vuLpjaBA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=htiDHs6h8G8IqwzdBe9rn2dWMaORVTbBpIHI5156T/FzAUZwukAx1wR8XCIt/245dSmNzUFLhqjzaiU1DhPDJrIwLW+mPewn58Ul87JHWb8eUUFN0/MSnzfOUiVBQo8nN/EYvrFdf+AWQ0CHJISVTj0pUxeY/wfVyHGbO/gzOxY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YExrSFrQ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YExrSFrQ"
Received: by smtp.kernel.org (Postfix)
	id 8C87A1F00A3A; Mon, 27 Jul 2026 00:42:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2ACAF1F000E9;
	Mon, 27 Jul 2026 00:42:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785112964;
	bh=8vZZAD0O61pjcEjDDrwoEa56FL/FeBpy9xJ7HsrdziU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=YExrSFrQBcWyb+fNVTpOPRBgBqK/oEKlEcB4E1d1uXtNANiNcCOT5KCJ5g1gSHNZH
	 HUaECWyrdm3+pHbI+vaubsxWAN1fL7jBAYkA/ZogqxtHJ8g0bKH4V4sKoz1DNGLxn/
	 tK9jNGtiSWQCW9L1+Ash5WiJuaTvfl1fdNK8KYUAHq0AVtSX/KKTAAHA3DeKWOins6
	 /UJED/4vOiQ20Y/peKHgRzlvGaiSbd0qYE7fiitn62jsqkxY7jUa0tnxbCIJhEroOO
	 uvo0dJzoYiXmpvecKbVNRxvixmJSTRjlceF6HEw8SHs80fOI1NyaFw1T/3aRxjmcol
	 1sShHIGs3x1VA==
Date: Sun, 26 Jul 2026 20:42:42 -0400
From: Konstantin Ryabitsev <mricon@kernel.org>
To: Arsen =?utf-8?Q?Arsenovi=C4=87?= <aarsenovic@baylibre.com>
Cc: tools@kernel.org
Subject: Re: b4: DKIM 'x' causes BADSIGs on otherwise valid emails
Message-ID: <20260726-astonishing-jolly-bullfinch-c45bdb@meerkat>
References: <87mrvfdvwb.fsf@baylibre.com>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <87mrvfdvwb.fsf@baylibre.com>

On Sat, Jul 25, 2026 at 03:46:44PM +0200, Arsen Arsenović wrote:
> Hi all!
> 
> DKIM signatures expire, due to the 'x' key; see
> https://datatracker.ietf.org/doc/html/rfc6376#page-24
> 
> dkimpy implements this check:
> 
>     if b'x' in sig:
>         if re.match(br"\d+$", sig[b'x']) is None:
>             raise ValidationError(
>               "x= value is not a decimal integer (%s)" % sig[b'x'])
>         x_sign = int(sig[b'x'])
>         now = int(time.time())
>         slop = 36000 # 10H leeway for mailers with inaccurate clocks
>         if x_sign < now - slop:
>             raise ValidationError(
>                 "x= value is past (%s)" % sig[b'x'])
>         if t_sign and x_sign < t_sign:
>             raise ValidationError(
>                 "x= value is less than t= value (x=%s t=%s)" %
>                 (sig[b'x'], sig[b't']))
> 
> ... thus, it seems to be impossible for 'b4 am' to verify signatures of
> patches sent more than ten hours ago.

Correct, hence my 3-year-old bug:
https://bugs.launchpad.net/dkimpy/+bug/2047054

I even suggest the simplest way to fix it, but dkimpy appears to be abandoned.
I've not yet decided what would be a better course of action here.

-K
