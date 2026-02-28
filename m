Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 603491E8320
	for <tools@linux.kernel.org>; Sat, 28 Feb 2026 15:53:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772293988; cv=none; b=tBz+YldpkzlfYxFXw2D6gUEb1RagZhwRUNy2kBycu3nSc86letetDYdiV2kJkQ4+4n+tbypmWxq26Cf5u1zqXVU8wk0J2/ZTb/qo83ekmSzOh7X3NJA1TuKDNgaMgMeWrOGx+gP5mVS1f2h68TkpnqWtEiTQ8qTQxdNpX+cgpJk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772293988; c=relaxed/simple;
	bh=klnPjgnIUfLby334Fa/aTJWpd5xPgGTUImrKZxsnx50=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cQFFLMNwN1oCQr/WPAcOPfftOP3Fi+lcvOAywstyj/Haiattycjz0IbfryZvYSfgBH52HsaQs+CRZ0F9kv7vJV+sUXRjEUhdeLwYVN+LyKj1YhU41cag2lDfLvlGgjYN2AGiWEiyYrtD7t3ybZDp9MR5QSoql1KzmCKqezOmQ/U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=rM956OCb; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="rM956OCb"
Received: by smtp.kernel.org (Postfix)
	id 4A185C4AF09; Sat, 28 Feb 2026 15:53:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0E060C116D0;
	Sat, 28 Feb 2026 15:53:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772293988;
	bh=klnPjgnIUfLby334Fa/aTJWpd5xPgGTUImrKZxsnx50=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=rM956OCb6QZVz/zTlkOnDMZOYB3G6NLa6dJBOXjTbSef0lLt+MF12Z6kgvcgy3ryF
	 6QmHPRsFGHpb8AxjbdkZctb0mF/jWhnO77477mpCH+DsrHCahQAsO00a6lhUwEhnZL
	 RaXZO+EJ2NU6YzKfSDSvMWmHdzClwcBih3JS4kjYfF1PdG+3k1RVIBFzsiKMHaHnVM
	 OT/RbKEvNt1rGEOpdHugzXyspv3ZowGfNgS8YKu4mEsKgTSLmKQHjw5IWsgzTZPZFA
	 O3cyU9FU+Kh7rnQpBeLVJ1C3LQNNR37t/YMT1v350DHW6Zdv+ZcW1er3fd8S4jKiMR
	 WfROkqn8ulbag==
Received: by finisterre.sirena.org.uk (Postfix, from userid 1000)
	id 5BCF31AC597D; Sat, 28 Feb 2026 15:53:05 +0000 (GMT)
Date: Sat, 28 Feb 2026 15:53:05 +0000
From: Mark Brown <broonie@kernel.org>
To: Konstantin Ryabitsev <mricon@kernel.org>
Cc: users@kernel.org, tools@kernel.org
Subject: Re: b4 review available in master
Message-ID: <aaMPYVIgmsDpn7Rw@sirena.co.uk>
References: <20260227-imported-aromatic-guppy-ad3dca@lemur>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="sHd5U6ozAlHMg5sF"
Content-Disposition: inline
In-Reply-To: <20260227-imported-aromatic-guppy-ad3dca@lemur>
X-Cookie: Think big.  Pollute the Mississippi.


--sHd5U6ozAlHMg5sF
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Feb 27, 2026 at 02:53:07PM -0500, Konstantin Ryabitsev wrote:

>   - AI-assisted review using an external agent (Claude Code, Gemini CLI,
>     OpenAI Codex CLI, GitHub Copilot CLI) =E2=80=94 agent findings are pr=
ivate to the
>     maintainer and can then be selectively incorporated into the review
>   - Patchwork integration: browse series, view CI check results, track se=
ries
>     directly from Patchwork, and automatically synchronise Patchwork stat=
e as
>     you work

As requested since it looks like the textual thing I reported might be a
bit annoying to resolve a couple of bits of feedback just from reading
the announce:

 - It'd be good to have a workflow for syncing the reviews between
   machines (with privacy!), for example I move between my laptop and
   desktop semi regularly.
 - An integration with non-patchwork CI would be useful, perhaps this
   looks a bit like the agent stuff above?  It's "hand off to an
   external tool and some time later see what the tool/a separate
   results collection tool had to say about things"?
 - If this works for me I think I'm likely to want an "applied but not
   taken" state, I CI the actual commits I end up merging and do end up
   looking back at the results sometimes.
 - My existing tooling has an "I'll apply this at rcX" state which I use
   moderately heavily when I'm happy but want to allow time for other
   people to review.  Other units of time are available, I'm mostly
   using the rcs as a proxy for that (and it's very useful for "apply
   this after the merge window closes).

--sHd5U6ozAlHMg5sF
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmmjD1wACgkQJNaLcl1U
h9ARQAf/ZD4ISJo+gF2pw26c7WHO/x7F5TTOpvl2OYYrWub+R/w3rTzKqzOQ0lSn
pvIZkIHn0R/gpY7SskdD40uima6FI4YwnglU/OXg9arrA7o6CI1aNGBbO2OBhvK2
NpLrY3fBAWu+COv2rpmW1sfPiF2Xz7oogoMVNkGnLLJ4Py/sDt53BBWeQdciUSgG
fDEJFeE4SwUTsNgVridv/45zvZPltQQwwEyViZ/Ohc6J1hYGvXv6X/KRvCSAVcen
sqYa2zNuKDzU3AhLFUFtyA7rXIvDNRAMsLymZv7FhQiGa2a8lc/2q+TBNsVSp8u7
k5zWjjM747BMnvD42OGuSIG6kFLvVw==
=e+5d
-----END PGP SIGNATURE-----

--sHd5U6ozAlHMg5sF--
