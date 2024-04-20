Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B404168A9
	for <tools@linux.kernel.org>; Sat, 20 Apr 2024 13:23:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713619402; cv=none; b=ryTpXOlLzEZ8/9dYUVwRN5BHdq2RtvmEHxaaXg+/pNKZUN4pRB3aTdwlwNdZDMDF4M4V/V5wZATKItbSV58P5lAiluLqQ2I+M+HCQ+ggDfEw/R/8ZHAnujdN+5zwg6/ffO9FRk/7JYEUvQ7JiD3whojO0luf2rnljhs74QZTKMw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713619402; c=relaxed/simple;
	bh=8Z5ZzmcD+8LLb75tW73XU0XcLlBY6MF/aoyF+gr1fqI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=G99lProZvKt8NL3SF7FbV3DKHEqmPfQ8xdmj9XvmgQNOcRO2/6wOx07FDtL10Jm9aX1m2271BOdL7PFY5hMtd/rH2QVzI4KNkoR7DIcH8VrOEceDBZJMgNccOPqMnKNosomJxXAnFUjU901STHy9v5jMUZnadSBEXw8/Xs1pagg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=t+VI80HR; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="t+VI80HR"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7717BC072AA;
	Sat, 20 Apr 2024 13:23:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1713619401;
	bh=8Z5ZzmcD+8LLb75tW73XU0XcLlBY6MF/aoyF+gr1fqI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=t+VI80HRuw0Ev16YAxjXaO4HkFQYlc4zIsTi0c/h34X9Ejqx2yGt+wXcUGDi0GDYs
	 MoJfld6Gyq0w0IBS4PEOM00xtm2w0mhYuIcxSVgoEBsmfo6MUuEnNqkJQinKrRJ8wS
	 eKvN30eeU4pdFgqD9BqHXCGuGfemVXNs/EoXDfXxxiiIWwSnmlHEX5tIL0uiK+bgbx
	 6v5h2LFUcduXRkV4diOlK6vPt4ZSnDxgotZ3mS4liW0NTJg5PT6KBjP77AAyH2gpwv
	 Y9pnqJgOyozkI0Y5883HyZ0NfQ4z56t0sRN/n7p3MWQHDZo/NuVrZ0HebJ8EFi9o8V
	 bJKyKh2npLTUw==
Date: Sat, 20 Apr 2024 22:23:19 +0900
From: Mark Brown <broonie@kernel.org>
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc: tools@linux.kernel.org
Subject: Re: Checks for recipients
Message-ID: <ZiPBx36go0AYBWO7@finisterre.sirena.org.uk>
References: <ZhQ8DoS1GaT0603l@sirena.org.uk>
 <CAMwyc-Q466R2za0sMTD9Chx77hL7xBBuNROokemLmp7dt=i10w@mail.gmail.com>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="v59FSEKfKHI48B/0"
Content-Disposition: inline
In-Reply-To: <CAMwyc-Q466R2za0sMTD9Chx77hL7xBBuNROokemLmp7dt=i10w@mail.gmail.com>
X-Cookie: TANSTAAFL


--v59FSEKfKHI48B/0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Apr 19, 2024 at 09:37:46PM -0400, Konstantin Ryabitsev wrote:
> On Mon, 8 Apr 2024 at 14:48, Mark Brown <broonie@kernel.org> wrote:

> > It would be nice for scripting if b4 had a check similar to the
> > needs-editing flag in show-info which would allow scripts wrapping it to
> > determine if there are any recipients specified for the series.

> I added some stuff today that introduces "pre-flight checks." I'm not
> sure if it's quite what you were looking for, but --show-info will now
> give you the following data:

> - if prep --check needs to be (re-)run

I can see this being useful but I am not personally going want to
incorporate this into my scripting as checkpatch is just far too prone
to false positives, especially with anything that isn't a simple C file.

> - if prep --auto-to-cc needs to be (re-)run

I similarly wouldn't want to to do this as there are cases where it
pulls in too many people (mainly cases where you only want to send
things to submaintainers rather than including everyone that gets pulled
in automatically).

> It doesn't try to be very clever -- basically, if the tip-commit of
> your series changes, we assume that you'll want to rerun the
> prep-check and prep-auto-to-cc, -- but it's effective. I just hope we
> are striking the right balance between "useful" and "annoying." :)

> Can you give it a try and let me know what you think?

I think for the issue I was reporting above just showing the recipieints
in show-info would be enough, all I'm looking to check for is that the
list isn't empty.

--v59FSEKfKHI48B/0
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmYjwcQACgkQJNaLcl1U
h9BJcAf+OKRe4E/zPgUbA9Vxxl5jiLE+Do2W45vV38+yBGBFhPLBImFgKXplB4yp
EWWqK3dwMmoGb6pq+pVhGbyBVRDPmpkoR5l0rjkGJ+V4PMD06HDFdQ5zRStdbGK8
fiNI28iMvYXdkmAnxaUcTLzmgNWzu4Z4MryEA8n2A8roPApfS02qmpYeHOtJkDED
VXF6W685NzKtps5fCDBCBZWHJWsPEjYagvyBuxCnJVI/bUWKId4wwEEPV6V/pc5S
yFK5NpqfAqfZDHBhrNbSNV38BKPMHIQBHria5cIm9CSDFX47uCuxt5fdfCoYlNnh
mYjORe9OND5dP5MbbCFfOxP55RONJg==
=SdbH
-----END PGP SIGNATURE-----

--v59FSEKfKHI48B/0--
