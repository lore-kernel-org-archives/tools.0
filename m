Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACE752D054
	for <tools@linux.kernel.org>; Thu, 16 May 2024 11:53:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715860390; cv=none; b=rGzcvb6x9xzmp63hwfiY4bWQnDN/EEfjGBPd6BeLj9rnV3YOdd9zYtKkALvug9IPZvtAxjYn/UaEgDslgcBcd3VPfLSopAurx8jkXuXz/KPvdLQhhW8sFODuAGaelGFVeM75oPYVWVaIRQDXyAKrc8KHcen/0+tfHIXDQlEBQ6g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715860390; c=relaxed/simple;
	bh=d4Z2DYRVv/LUngmbbeImCQOAfKedMnFEN6le8UMtcKk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lJysa2I862jb6ka06tF7iu9DAOtRlAgB4qmaL8NjazBB1R94u1jvzk46ytXwEC6KrCEGwf7xllXwMFs9h+7mfJXbEl5OEnNmCf+YZcNV4jRSUn6mp+Muu5nzJ1rSD7V8ZQ6VoCYgUfxG4O0EMe0rI6nFJERDw+3dQc0/4yqPXbM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kyEf6tfC; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kyEf6tfC"
Received: by smtp.kernel.org (Postfix)
	id 52663C2BD11; Thu, 16 May 2024 11:53:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 53FC2C113CC;
	Thu, 16 May 2024 11:53:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1715860390;
	bh=d4Z2DYRVv/LUngmbbeImCQOAfKedMnFEN6le8UMtcKk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=kyEf6tfCpIbu+/mIGDTwR7jthSomyNg7pbntJlsXOawm5xPQJzldB2E8FyH1yLCZH
	 BpEnFN021SDvy+Ibu/ELkYZtKDUkz5+0shdoekWyoX7NKTK5q1D3BIKA1yxXu2Syd0
	 6HyzAKUrlq9WTbUruomhrwxBDu6gwDAGIQKd6qY8cZoYt1C13HmAAcqsV9sKheXkCI
	 XUTQKDYcRWCQZjdRB8viq3diaiSYTAOeNFOSZ9SQdrpudEidTiMKJM/hWdVR1WbZg+
	 5yJGDKivX9mTbSlVrdcfEDQHmVWJZyvRLwUAJTCJI6QthQbbf3ZNHhf3HfWPe9lXHu
	 wmNLUd/Oo7AnQ==
Date: Thu, 16 May 2024 12:53:06 +0100
From: Mark Brown <broonie@kernel.org>
To: Jiaxun Yang <jiaxun.yang@flygoat.com>
Cc: tools@kernel.org, konstantin@linuxfoundation.org
Subject: Re: b4 one key git rebase -i
Message-ID: <b89ad184-f920-4f6f-af9c-59ff9ef52b8f@sirena.org.uk>
References: <b483c569-66b1-4a4c-913f-3b60ebcd1743@app.fastmail.com>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="wUHZcQXWij67pUzs"
Content-Disposition: inline
In-Reply-To: <b483c569-66b1-4a4c-913f-3b60ebcd1743@app.fastmail.com>
X-Cookie: I'm having a MID-WEEK CRISIS!


--wUHZcQXWij67pUzs
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, May 16, 2024 at 12:47:45PM +0100, Jiaxun Yang wrote:

> Is it possible for b4 to have a one key git rebase -i to whole series feature?
> Or at least have a command to output base commit hash, so I can make an alias for
> that on my own. I think that would streamline my daily routines a lot :-)

You can get the base with:

  b4 prep --show-info | grep base-commit

--wUHZcQXWij67pUzs
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmZF86EACgkQJNaLcl1U
h9CzMAf+NihcADsg+Z4MsjKXjfM3O0U1Ed/P9EfH7jd6WI8nfeIZIFHIShzbH9DS
1ybDBtOhLSkHdWH1UJ7ozqGtUOtkAGlCrX1wf1KhJrshsOr+FkLZRzgCEIsJ0z7V
nHNL46VQ1jzE1KWpnZtPnmqivMM5mkhr0aJ1Gel61F6I36UMqqO6Vw8olGKFS/qD
VK3ztMbksGq9OSJMdvnODqShuquN0KTw8gf1WRRNE4BEDj/7W3zpD1GL5zLWzNAc
vq8eH47YEpTzG3eU1hwG1UblvE228UTwSHemZ1doILwKHPtrEe57IrouwxU7hK03
OsBMgJnjAePAwudic9AzAugYNMypOA==
=2obO
-----END PGP SIGNATURE-----

--wUHZcQXWij67pUzs--
