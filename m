Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39C162C21EE
	for <tools@linux.kernel.org>; Fri, 12 Jun 2026 02:19:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781230764; cv=none; b=WuPdSiSI+q+0YhfZGr9dUP9PxWn5sJ3kdL2wiJcgjmFGdkIVn4omygq27T67MuVnmhE6jhW+760MXzl3yQLDHsWqd5/5N+8VFHv8gm65HvsdIabPvLt1jsLuBmx3wy3H1zdnYbP98+GnDLR6BwJjUxIBJZbUM2xc3AU4ai6QO4M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781230764; c=relaxed/simple;
	bh=g9vqQXXPodl3iYq58vW5d9LLCBy4qVQARdMnRyf3xQA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rDlaCwgM/1CSwrMd45FNc5OtHlBfYGaVXw9eyvSE7W6FHdhRrMxdcdM57bXpdDLC6vqLYakwIzbbWToXgVKwUVjw3d1CDgkCvS6A/ZcT9GDDtkRppKe4NA5e4Dtfirv4HCkiQQFFM1CWhgb1vU1hEcma36R2hyukdUlQGaf+vWw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=yQMZnmp2; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="yQMZnmp2"
Received: by smtp.kernel.org (Postfix)
	id 109051F00A3D; Fri, 12 Jun 2026 02:19:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A03621F000E9;
	Fri, 12 Jun 2026 02:19:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1781230763;
	bh=inTfUGLDv94wpmXQXGF1UIdNV7guNV92VdP1wn98+iU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=yQMZnmp2S8GGiDTc6LWMQSTBk+N5hXX0cy3eF27GJ3Ym5xSYsqSc51iCCykrLWwa2
	 OtMZE668BLcJcML5LFwmiI8RsxyLm/TNBo7sssMNRUGxbv9KoT6Gqy24mLT34/K5xS
	 7af2FOJv2AsEWandN2JihTNrIIwNU3/lKdYBOyyc=
Date: Thu, 11 Jun 2026 22:19:21 -0400
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: Mark Brown <broonie@kernel.org>
Cc: tools@kernel.org
Subject: Re: b4 review update issue with bad connectivity
Message-ID: <20260611-illegal-nostalgic-gorilla-826aca@meerkat>
References: <air1edZVrBclly3H@sirena.co.uk>
 <20260611-fanatic-grumpy-rook-84a68b@meerkat>
 <aitL_0RoILKYXYkn@sirena.co.uk>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <aitL_0RoILKYXYkn@sirena.co.uk>

On Fri, Jun 12, 2026 at 12:59:59AM +0100, Mark Brown wrote:
> > Yes, that's something that was long overdue. I've pushed updates to both
> > liblore and b4 in master -- note that you'll need to update liblore to 0.8.0+
> > for it to do the right thing, but the latest master should let you do Esc to
> > interrupt network lookups.
> 
> > Try it out and let me know if it's working or not.
> 
> The top commit I'm seeing on b4 ATM is 09a97c02bc0b ("review: editors:
> optionally mark skipped lines on plain deletes") - did you forget to
> push?

Yes, I'm clever that way.

(Rather, I forgot what system I was on and "origin" is somewhere else on it.)

Please try now.

-K
