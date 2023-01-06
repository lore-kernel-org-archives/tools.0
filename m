Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 317862770E
	for <tools@linux.kernel.org>; Fri,  6 Jan 2023 17:35:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 330B8C433EF;
	Fri,  6 Jan 2023 17:35:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1673026523;
	bh=taCE58kjV7QND+9SWtwvhJKU1rlP3/3AbjKPSrHh3R8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=F4To/p2BGuOSpsKKBwYJZMxxYyBhkH4GtNW31H4yQCb59F0iAbe+mBkv2ne9NIxp/
	 STehshQbpJX82al2ts+gD97f06qHByWgcOzShX6mVPtr54ByWLfn+ULqhsxJtGuFmM
	 s+fr+7yMOzKn5S/81TJH6rn9Xvbk5gv/ci67/r/QNQtlRjn42xrqaxyK+Z1IqSNftQ
	 vfYB8TyH07kd/iv5nXYQ39JoKYwRE3lfs9RIY4v6VzmcSbdVSe2fdXAzK5WgGU7iLA
	 obEtQCmf6YbRjMGXkxrHluFEFlM2gzD3UMPh60R6+LmVi1iUp+KrDqMdLnuw9Bkm0o
	 vKQhvvWp+pitw==
Date: Fri, 6 Jan 2023 17:35:19 +0000
From: Mark Brown <broonie@kernel.org>
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc: tools <tools@linux.kernel.org>
Subject: Re: b4 am doesn't fetch all recipient headers
Message-ID: <Y7hb17cciwrXm4E1@sirena.org.uk>
References: <Y7hLWvgqqJCK7+yM@sirena.org.uk>
 <20230106170038.tbdihuu667upvqnr@meerkat.local>
 <Y7hWOEoqPsF+Wrtx@sirena.org.uk>
 <20230106173237.tpsdbdnzjfbgulcg@meerkat.local>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="dzl0oZkdOP3owQr+"
Content-Disposition: inline
In-Reply-To: <20230106173237.tpsdbdnzjfbgulcg@meerkat.local>
X-Cookie: Do not fold, spindle or mutilate.


--dzl0oZkdOP3owQr+
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Jan 06, 2023 at 12:32:37PM -0500, Konstantin Ryabitsev wrote:
> On Fri, Jan 06, 2023 at 05:11:20PM +0000, Mark Brown wrote:

> > For this workflow a command that would easily let me fetch a specific
> > message without pulling in the rest of the series would be ideal, b4
> > mbox doesn't seem to even have an equivalent of b4 am's message ranges.

> What if I give you:

>     b4 mbox --refetch mbox

> This will refetch all the messages in the mbox with their original headers?

Yes, that'd also work well I think.

--dzl0oZkdOP3owQr+
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmO4W9cACgkQJNaLcl1U
h9BWpAf8CdaY95PUaRXYXDjJpQToQ/5oiZrz3fBA/6sKwAZUch6NBastVCBAwV21
1P65deTslhqSq31Gvkh0btjky8NcLD8/vLbD9P5eSISobWkeBFyFxZa2oL89km2Y
6Z7Q0u4Ain/6BzKIBhKQTmStJzXfmnv4gcuUL8U1a+MBOabAY19ou2eU07uV1r20
0OObqtYVMEYpIuLA8ToF7QWcWzI0IM1fqYU4h0nN9x9/g4ABpy4RJWmmra49Tf2w
ZAYLLc8QzDHy/HVteVAEWR70PecLt3wwAVZ/tylLE6tWbLFLhwoMnH+qvFA1asS5
2Xi/bJunIlEG/h9v7nPCbK1BqSRUKw==
=SFHk
-----END PGP SIGNATURE-----

--dzl0oZkdOP3owQr+--
