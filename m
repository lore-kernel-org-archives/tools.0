Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34E1C227B95
	for <tools@linux.kernel.org>; Wed, 15 Oct 2025 13:52:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760536334; cv=none; b=VVz47UIr0u2qTt30niBQNLuKnb/c79P6HgT0nsfwzcHg/r8gjtVyFK32VXVm3iok33hdkRwLYfuBxATyIRCLywXowqsmJIel8JOCjQNEIR022X58UBa+v+Z3b6y88QZlAbZCEO25nYxTAA0I6P+7TEB6/2rcSM4aCk8etAJpKH8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760536334; c=relaxed/simple;
	bh=E5IVlfNU/D3sDzUEhkh43Newa9HC0u3+g6p/AeSBdXQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=liDIBf9lGM3OvyAEZI0kedpvWb4an6Kk/ty4NEWCZaZZDRRKmZWFSIj1Z4MDkduKdRx7gJN+qqsgFFlVd8ueUcq4EcyqFyY7U1dj0iXCNJ9D8dKrNugRVzSlJOjTtlTVgV4IibnKYuw6N9a8j5ue8cYcLmbc4W+XFMD3+f+DWNo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mimQFpQV; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mimQFpQV"
Received: by smtp.kernel.org (Postfix)
	id 20144C113D0; Wed, 15 Oct 2025 13:52:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 31935C4CEFB;
	Wed, 15 Oct 2025 13:52:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760536334;
	bh=E5IVlfNU/D3sDzUEhkh43Newa9HC0u3+g6p/AeSBdXQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=mimQFpQVz5OnlE4hmKHYN6h/LOR2c3iCjK3mZ923CkXe/TCGeMhCTdG9v/WvUY+cY
	 aqWJ+HD+4lXieqzb2CtqOJDuoGEyxSLUmoQdDxiiYsMAXTkJYQuW+kmbmDzE4C8sDS
	 z7gvIzxEfMupl2+8uPBF9CcoeSNMnN45aTQK3zPhya4VKeo2lBFf+qR6NRGo+7sz7f
	 GVmCcACFHHpqX2bbd+diAFdNJ8+GJMSQVlH1sYAj1swzKKV68fgTQDvN1fLkiTSsY0
	 LbRjvaFLoWXRyn05yI+5zkw0vxV4EwXBLLcUhmhu8H8kJ6VCYSBUTNEpzXRS+oMX8v
	 PhmjeQDTZX58g==
Date: Wed, 15 Oct 2025 14:52:06 +0100
From: Mark Brown <broonie@kernel.org>
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc: users@kernel.org, tools@kernel.org
Subject: Re: [b4] initial "b4 dig" to supplant Link: trailers
Message-ID: <aa9b53f2-1a42-45f9-a838-9fa24660ad1b@sirena.org.uk>
References: <20251010-muscular-camel-of-acumen-00eeaf@lemur>
 <20251014-gorgeous-cougar-of-endeavor-0c5baa@lemur>
 <741ab86b-753d-40ec-91b5-e1b8bb4a3de1@sirena.org.uk>
 <20251015-arcane-lyrebird-of-ampleness-aec27c@lemur>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="MPN3A8Kc4QBrr0oz"
Content-Disposition: inline
In-Reply-To: <20251015-arcane-lyrebird-of-ampleness-aec27c@lemur>
X-Cookie: Long life is in store for you.


--MPN3A8Kc4QBrr0oz
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Oct 15, 2025 at 09:44:57AM -0400, Konstantin Ryabitsev wrote:
> On Tue, Oct 14, 2025 at 11:13:00PM +0100, Mark Brown wrote:

> > It would be really handy to have a --mbox (or something) option that
> > will download the mailbox like b4 mbox would, my main use for this (and

> I just added a --save-mbox option to use with -c. It is currently exclusive
> with --all-series, but I can also make it be non-exclusive, so that someone
> can save all revisions.

That seems to be working great, thanks!

--MPN3A8Kc4QBrr0oz
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmjvpwUACgkQJNaLcl1U
h9AwIAf/QG/nDhT0Un7fBnXtNDBTRAylGnrEZoz4TVeaevqy/0CbZ51HOgDB5h34
hvK3/zvQZ0wpx1sTvVh8QSStal/gYji5wXYw2rNTIQ/450R7Fkp2fyECLExk9uEm
s65qM79mz1Y/vf9MmFUNJW4rfDZCOP+KGGgQnh8rWczbaCll09LW5p075M2Hy0vB
GCJqyI83243hlCANTJYArhqPVA+yONQiW7aLmzv/emw8XjyBeZrDEnNCHrA317ho
RXCUizBuFs0CD813Fcbfy4Gph77ULmdGSNI6I04N9J3Kd/dXQayGf2FSYMCCE2Dq
BFdJXCZBFLku8JP90tms3QAOsclCUg==
=wtrb
-----END PGP SIGNATURE-----

--MPN3A8Kc4QBrr0oz--
