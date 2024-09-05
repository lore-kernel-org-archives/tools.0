Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2D891946B5
	for <tools@linux.kernel.org>; Thu,  5 Sep 2024 20:17:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725567424; cv=none; b=Mz7TAbyUU4n+AFvv8tlOpkIA58pQ4Z+d8p1sVxfiVhMUgXBjmjjNHnnUDYan1/r70fHMdF2MTfo3D06ePqIFMpEWZvb/Z5knQmXatj6mh8P9jwQP7ywcYi4efN6aApm4iPd6uPOLYj0SNIclylJck+RutK+7PufrX49qT1eVD84=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725567424; c=relaxed/simple;
	bh=3+0wLfsjJyjwG6udlCHH2bd5uDqQK/5Gwd4LA/vzxyE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DW//A4SdMi02lepOjwLf9uxiaf0GM2EnIQyt7RFcEQpOgIXw9uTGh6ycDfLanm34PWbXT17BhSDtpEWfNGu51qaIehQhj5PEUu75ErvG2vBhme/4cifILeMEPag5V0xx4nKVJvjyLzT7XnwWlqp6FONgLqCAKyRwd+yUiTEHwtw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=D7zeqJL4; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="D7zeqJL4"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A82FBC4CEC7;
	Thu,  5 Sep 2024 20:17:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1725567424;
	bh=3+0wLfsjJyjwG6udlCHH2bd5uDqQK/5Gwd4LA/vzxyE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=D7zeqJL4yZzT2hxZAnZZ0KRLrPSKlZb0qmnrwwj2khQhoMD0+IKKxE+RV17Bz3v1h
	 eG7+UzWs/ZlpWLvUSGPolnML2K1VeD2tBbAnSU4lX9jYXwGZu495DYxzivCosAieNc
	 dpg9+TQruNtOezo8VJPHhB0PZGihASw5yMnkt5yWNppYl+sgwhtj9tAabsxiEQIeIU
	 TOhc+bdBAgXrPsdg+ezbdLb9JXTSpkGJbb3qvI3WK0xlbX+YxSNw0mQVbX+ks9pR9F
	 VhJANHKNO+SLJCGsac2B9GIJHD/DgNCbGO0H/Q+MnclxRBLFy9RIE1fMmQa6eIadXm
	 hfWJSWZwsLFog==
Date: Thu, 5 Sep 2024 21:17:00 +0100
From: Mark Brown <broonie@kernel.org>
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc: tools@linux.kernel.org
Subject: Re: b4 prep --check for signoffs
Message-ID: <bd9595ec-c374-4d15-b98a-69e634f1ea96@sirena.org.uk>
References: <fc6eba60-6cde-4e8c-a075-61d564c33e26@sirena.org.uk>
 <20240905-bouncy-successful-chimpanzee-b1e2ea@lemur>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="r1MQe7RlAkNOxtxD"
Content-Disposition: inline
In-Reply-To: <20240905-bouncy-successful-chimpanzee-b1e2ea@lemur>
X-Cookie: The horror... the horror!


--r1MQe7RlAkNOxtxD
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Sep 05, 2024 at 04:10:13PM -0400, Konstantin Ryabitsev wrote:
> On Tue, Sep 03, 2024 at 07:47:16PM GMT, Mark Brown wrote:

> > It might be helpful for submitters if the checks implemented by b4 prep
> > included a check that there's signoffs from at least the author of the
> > patch and the person doing the sending.

> bugbot assign to me

> Is that not something checkpatch already checks?

checkpatch will check for a patch author author signoff but not a sender
signoff.

--r1MQe7RlAkNOxtxD
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmbaEbwACgkQJNaLcl1U
h9Bktwf/YpjXngkx3Mwpi64VvzNJOFua9kYua60iRz0asOCcuXYI6qrddDS02HSl
POPzVW9EksbW5aiGxZBgChflk96+4oStAOD63ZMPD1yC1hMIeM+P9EyxWrGo/3SL
ivHMOFPU/9J3ki92rv2wTxuQgKvWXviK/knz6/ialETCJ6XQSitVVO4nNV+LG4Q4
H9rmdTjMij1fjNmIH6FcFsRiddaSdXaH+55cyA9RO0B065NniAFaOE8rRMwNVJqn
gzU8jKpcolFMVsKYW0JXInZ85qoJ6+dRrfulrSeRHkdELeHkfT5khdGW9/+I5cVE
vJrtTopz2emFEmCFSAMos6o+PZr6ow==
=TO0W
-----END PGP SIGNATURE-----

--r1MQe7RlAkNOxtxD--
