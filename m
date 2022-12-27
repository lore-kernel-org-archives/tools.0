Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56A5433D1
	for <tools@linux.kernel.org>; Tue, 27 Dec 2022 17:10:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 21CF6C433D2;
	Tue, 27 Dec 2022 17:10:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1672161011;
	bh=t7Cft0pdwHRGGA2aBOHODo1URTTx+7vCK4fqAGnoCwg=;
	h=Date:From:To:Cc:Subject:From;
	b=ABSiUVa53OkSGYKnUq8bkBSYqHkG+0cf0qArQdjGvXk2IgQhifJ0SvWm6WE+/2pfA
	 eFfFrhuI1GDeETv/xX5MANDxNiIWGjx0Dz3+nhdXNAWZGQEn/gpxrtaGccLoR6BC4u
	 Ejwjs/L1R96NZ1W4U6arckg5uEWLQq+ageKfmrfUJ2rZKUSg934618agjxQf6CWOOg
	 7oj7lIcsgenlyWGTAzC/zR+G4DkattZB5nGjiZhIoPo0Mku2OHtHhC+Wgtz/HMRKv5
	 +yG6vMNXMBCwxV8+1LLtTIYqQzS3vFStVPSzQ91rkONVM9C/fK2r1/dERgRCTo7OLT
	 CSVetQAibRqLw==
Date: Tue, 27 Dec 2022 17:10:06 +0000
From: Mark Brown <broonie@kernel.org>
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc: tools <tools@linux.kernel.org>
Subject: b4 prep --show-info for non-current branch
Message-ID: <Y6sm7iI/mOA8/p4H@sirena.org.uk>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="0xXR2YEG0k1Tad/J"
Content-Disposition: inline
X-Cookie: If it heals good, say it.


--0xXR2YEG0k1Tad/J
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Konstantin,

I'm now using b4 prep --show-info in my scripting.  Something that would
be really useful would be being able to pass in a branch name to query
information from, so I can do things like push serieses through my CI
without actually having to be on the branch.

Thanks,
Mark

--0xXR2YEG0k1Tad/J
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmOrJu4ACgkQJNaLcl1U
h9BCiwf/ZIJUbv6Ztq8U0eNcwV6saKs53VDC2P1pOks+g9bQp4XxOifaI2dUML1K
/dJF8/wOWcDjWEtSwnd1Ied4mSawezlVxfUcIpOnnZL2JstcIER9zlCALNF+RLlm
iDhkhmy2nIiCx1Vg0rz/lPT74vzbCShR7n401iDjKZj4KF5x4y/Bk32VCOGSY+vP
dnigLLe83JgFuOd+7GbPF787LjiKFxhW8Pxt33fNKVYzPixy8/khPxVtBQAVGrNe
NI0G6ZCl2+NmunOl1irqWYA5hKUbu+8aZnV23iGcmhiaubtkeks3j+S1OfAeytf6
UqptOlK0f43o0tgj0h48oiKfyW6eWQ==
=F9IH
-----END PGP SIGNATURE-----

--0xXR2YEG0k1Tad/J--
