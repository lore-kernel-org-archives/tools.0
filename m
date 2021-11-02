Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E274E2C80
	for <tools@linux.kernel.org>; Tue,  2 Nov 2021 18:31:10 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id E8A6E60F90;
	Tue,  2 Nov 2021 18:31:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1635877870;
	bh=lPpRpVydTGTkGKyZWOj4gH56l+P965etvqzfEh0Cq3E=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=DFfL2pFaUIg++LgiA04XX4DmacYeBHwk2Rr8Tt0Ep+Wt/dHv5JgRkMiKKiYbG5sG2
	 R8TegYM8vPxYlP6zUaAa2mpgCCNYWFEa7R1y/umZhn7KZq+QsFhWiSWJ/RWE+xTZpg
	 LjthEqj6fkl291JiQOgtSf/eHuIW9gNnfrglBxabwxHq54lj6KHszFNtga7uQzQ1CI
	 /5U1Jxh0b65j9E832eQPmiNJyzIzSS16s6VBp4wRUxkB29eOf2dck1wz3hcvDQbNe1
	 YN8RtpykZ9hAJsBLIqfOa4K6xtUhllEdJjF0RgmounYucjgGs95ZThE72Lt2hzgIdP
	 uAMs31Z1960OA==
Date: Tue, 2 Nov 2021 18:31:06 +0000
From: Mark Brown <broonie@kernel.org>
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc: tools@linux.kernel.org
Subject: Re: Crash generating a thanks
Message-ID: <YYGD6n84JhKfqnIp@sirena.org.uk>
References: <YXxhlEuodVLx8KjI@sirena.org.uk>
 <20211101160032.gz46kfybjruvgb4k@meerkat.local>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="vSr4D3ge+swH8q8j"
Content-Disposition: inline
In-Reply-To: <20211101160032.gz46kfybjruvgb4k@meerkat.local>
X-Cookie: Love America -- or give it back.


--vSr4D3ge+swH8q8j
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Nov 01, 2021 at 12:00:32PM -0400, Konstantin Ryabitsev wrote:

> Anyway, I think I have the fix in master that doesn't trigger this problem.
> Please try it out and let me know if you see any more problems.

That seems to resolve things, thanks!

--vSr4D3ge+swH8q8j
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmGBg+kACgkQJNaLcl1U
h9DePAf9FTGO7ghVh0414J21jXPFG3/cs1VpZM+fiB4+OTQC8LGVkPWq8v5pIptR
f4SWq/qypEMaBOEGMzrAsreYkrh/ftJXESFJFvW3ePFwXThSwPF5nsBUYwam+J4+
b1o46p4DoziDOJlR8oyc87Qhn1jTDTSHBKEL7OqvRrtd7l4iQ2J8yCucJKYmy1QB
0Hr8wFn5BMgpkn8Cs4HePqG6CTOwXIsuT9xsOUFmXk+87W7nnIEu4FnpDGDEuFTK
MhmYWPW6lSYnN+bsEEDazxoLcfjGrbIcwyorx/n2prQ7kXVTdE2Y424lH8VUDgBm
CzfQIqbH6vEwuJpRjIedtSFDz7BH3Q==
=uOWl
-----END PGP SIGNATURE-----

--vSr4D3ge+swH8q8j--
