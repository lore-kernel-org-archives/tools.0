Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F182F330330
	for <tools@linux.kernel.org>; Wed, 18 Mar 2026 13:00:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773838841; cv=none; b=P7xZ+nLSVr57l8zaa/eUQXG94znuF3e+na2K/JaEZTiP1gchR1+FBiDkGVujneDYQQ80PLw6kdaQ0v1mCNBGYPV6UaworkfiADMgceSz/DENsIDYuUAqDt9VdgZkLYWDeeZiDnNhhU0aah/o/Tp6+rVYgPF/9TKrSfnrUFie3I0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773838841; c=relaxed/simple;
	bh=YbN54lpHM912M/AfnUgQJbsGxKV6Lb84vBCQk3saCaI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NrCQ98cfbMQKeEUGBLpxSr27VfaWEaTkdWAV4BUKXkGPiLLkTJ77Kp25J9DVzYVMGejPFiBnG3R+w/SN8TZeLLzjAGdW+iY2Tu4xGzB3gpQYqTl7FoB9+hpGA//bKlEYu7+TL9dF22lQM6xtWsDuk9T5HLapGQB3UA/kT3hp6ew=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JSiM4ACN; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JSiM4ACN"
Received: by smtp.kernel.org (Postfix)
	id EA3F1C2BC87; Wed, 18 Mar 2026 13:00:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AA61BC19421;
	Wed, 18 Mar 2026 13:00:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773838840;
	bh=YbN54lpHM912M/AfnUgQJbsGxKV6Lb84vBCQk3saCaI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=JSiM4ACNXVL/KpKfy9hqEXxMGfgAIYmhCK+KF6orKiw5w4PncIa/lOCROIEKUJZwo
	 R2xXC+2jalHkrGyAfjCWiIqP1yTlJGSBRPat4u/PIgkR0jfbiL7OIx/ALFzNxbeqKl
	 nb3uehvgE2sB7qcl6xDScwK3lIwIvt/PC6SHd3WtE/fbp0VR91xIVzQvhP8zjU0wg7
	 4xJ5NWhMZ/tzgpLjC8GECqP6gnP3fBOb3de1mHe348KF/kY+mYWAN3zrQc6yGK0Q2a
	 hH+slP0IfWhW0562mLw0lePacaiRksUGEJXXLgJBFhIFxWgQu76+tRWDG2XwUtIBei
	 Dg2TQCe6bBcQA==
Date: Wed, 18 Mar 2026 13:00:36 +0000
From: Mark Brown <broonie@kernel.org>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Konstantin Ryabitsev <mricon@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>, users@kernel.org,
	tools@kernel.org
Subject: Re: b4 review available in master
Message-ID: <8e3b01f1-7a68-4029-bae5-635640d07ea7@sirena.org.uk>
References: <87tsuffj7h.fsf@trenco.lwn.net>
 <87h5qffikk.fsf@trenco.lwn.net>
 <20260316-quizzical-raccoon-of-refinement-d88fdb@lemur>
 <87qzpieeb5.fsf@trenco.lwn.net>
 <20260317-starling-of-delightful-exercise-3472ce@lemur>
 <20260317-optimistic-impartial-kudu-deefac@lemur>
 <87o6km86zm.fsf@trenco.lwn.net>
 <20260317-crazy-belligerent-llama-a14ba6@lemur>
 <20260317-majestic-efficient-raptor-59f17a@lemur>
 <CAMuHMdVTLdeNr3gk7aE33+Kgedw+j3fmdaZ6CO9iDnNGsUxcGg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="rvWvdYtbl22DajX1"
Content-Disposition: inline
In-Reply-To: <CAMuHMdVTLdeNr3gk7aE33+Kgedw+j3fmdaZ6CO9iDnNGsUxcGg@mail.gmail.com>
X-Cookie: All celebrity voices impersonated.


--rvWvdYtbl22DajX1
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Mar 18, 2026 at 08:56:56AM +0100, Geert Uytterhoeven wrote:
> On Wed, 18 Mar 2026 at 00:37, Konstantin Ryabitsev <mricon@kernel.org> wrote:

> > However, I am now curious to hear your feedback. The idea with the review app
> > is that you are not really sending an email, you're adding comments to code
> > and adding review trailers. The app will render and send that out for you,
> > trimming and formatting things nicely so you don't have to do it on your own

> I haven't tried b4 review yet, but how do you decide what (not) to trim?
> It is not uncommon to explicitly not trim some parts, as they are important
> to understand the comment on a seemingly unrelated part.

I also find that it's frequently useful to trim things while writing a
reply to a patch to make the message more managable and show what bits
still need commenting on.

> > (I've noticed that many maintainers don't bother anyway -- there are emails
> > with a terse comment at the top and then a huge quoted bottom that is only
> > followed by their sig.

> IMHO this is very bad behavior: not trimming replies forces everyone
> to skim the remainder for more comments.

It's extremely annoying.

--rvWvdYtbl22DajX1
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmm6ofQACgkQJNaLcl1U
h9AGEgf/Ts4rNNSe8ZmsozOLcihHaEX+VnvgDRK7OBBxVMH0yM3Xr4cgFZCppNnz
aHxI74l6s/A+jsYolNiWV8LJnbx4ftJ8xa6kkJue91vMd5+KPL0sDsAuWFfLrMZn
f+5c42h+2Tx+FQpBdEJfNmqpjmbzlnRbIp/UEKpPsWdgfHGQct3LiZp4ogs12HhT
VG2KdXOc6ub5TYwvl4in8owSFhkylkCDIk1aYDUpuYAb9f+SeXtr1yUlFFzO6dFt
2vG44/7u7Yz2ikBQyXDofW95v8g1AOK9vXln1iHODCCJToGcNTdeUA+TeLPWLYbp
owKh3BgYsBlCb7zuHdKbhrfYA0KI8g==
=y9P5
-----END PGP SIGNATURE-----

--rvWvdYtbl22DajX1--
