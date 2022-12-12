Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADF97256D
	for <tools@linux.kernel.org>; Mon, 12 Dec 2022 12:22:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B6A45C433D2;
	Mon, 12 Dec 2022 12:22:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1670847765;
	bh=iaJrjexARbivE+C85nSMYuveUV9OoprWkER+xo1Z2qk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=DA4sTgN9kdI2JzWuJf7zPSu9suBA+sDgeIpgZEI3sqDZdMol79vQbHexUif6X+hLa
	 fICj3KXlzOzRIt3vXyaNJjAn6Bxz6/sq2kykLdDnnGK9Sdi4u3YSa6Ehvz6nY8BbfN
	 MsS730IytdprW4VdAg8NI7sI1BR2N8s20Zi15VI+G3TdYgPTM3rYzCxHKPUmDf/AIP
	 CrDJlsHFKljzI2PmzT8xjczAYvK8xZKazHcLfCnZg3u5OBRejyYlCOKegmrIfi3GfF
	 cnpfFxs/mBn6LUeWnNYcSQxwWhMpIHLdCXGJrqnDwGFGyqNKkXrwRpvnj49o+U06qY
	 6nBHWboRWUIIg==
Date: Mon, 12 Dec 2022 12:22:41 +0000
From: Mark Brown <broonie@kernel.org>
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc: tools@linux.kernel.org
Subject: Re: Feature requests
Message-ID: <Y5cdEWH8+BzYHaxU@sirena.org.uk>
References: <Y4+9Fz7lkzSnFV72@sirena.org.uk>
 <20221206221546.ezjxmz2w3tuxbzx5@meerkat.local>
 <Y4/VuYDJq9aUQiPv@sirena.org.uk>
 <20221209210932.rabvalmiry2a3zge@meerkat.local>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="swmv7w9VRtSVMNZN"
Content-Disposition: inline
In-Reply-To: <20221209210932.rabvalmiry2a3zge@meerkat.local>
X-Cookie: It was Penguin lust... at its ugliest.


--swmv7w9VRtSVMNZN
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Dec 09, 2022 at 04:09:32PM -0500, Konstantin Ryabitsev wrote:
> On Tue, Dec 06, 2022 at 11:52:25PM +0000, Mark Brown wrote:

> > I've had another look at potentially adopting b4 prep/send as a
> > replacement for the bits of my scripting that it covers.  I did
> > find a couple of gaps that are causing friction though:
> >=20
> >  - Some command line options for extracting the metadata for the

=2E..

> >    comparing the current version with the last sent version.  An
> >    equivalent of git config get/set for the series metadata would
> >    cover all this and more.

> I believe the latest master should have what you need:

>     $=A0b4 prep --show-info
>     branch: b4/bupkes-bogus
>     cover-subject: [RFC] Another completely bogus series, ignore
>     prefixes: RFC
>     change-id: 20221205-bupkes-bogus-8f0db5172091
>     revision: 6
>     cover-strategy: commit
>     base-branch: master
>     base-commit: bce9332220bd677d83b19d21502776ad555a0e73
>     start-commit: 8398c66ced5379a8b84d59ec7f703e9809b17c12
>     end-commit: ae4436d441721dd884355b637f02dbc620ad422d
>     commit-ae4436d44172: Rename linux into pengux
>     commit-c0075ed67f3f: Makefile: Make it a ninja penguin

That does the read side great, thanks - the write side would still be
useful, mainly for the base-branch which can change during the lifetime
of a series (it's common to move between mainline and topic branches in
the upstream repo in both directions).

> >  - It would be nice if there was an option to sign the tags used
> >    when tagging sent branches, especially when signing the actual
> >    sent patches.

> Theoretically, this is already possible via tag.gpgSign =3D yes. Would th=
at be a
> suitable approach?

Yes, that should work for me for now - I guess there will be some people
who do use unsigned tags who'd want to sign these particular tags.

--swmv7w9VRtSVMNZN
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmOXHRAACgkQJNaLcl1U
h9Dqvwf/bzzSy0BTX04EhqjHQWXxVx5eY56ltHcZbiouQykhWVqpapw8Ra05ybwp
rgwt+bobfsQZ106GzJEb2viaryrlbKpvbXUQRWCQfxrlt5yPpuRBllJvcRVCUxN9
e2IeKf+a26h1+3TjvVQYrzjXbG3XrAAkD+0d+1rwzBvX+dayr82QDsc4wMt/nxIx
s1Fn6KoXbjOihu3eqCxlYhrtmKmxCzVsdL1RY1rBD7VwHFLzXIYFwEhjryALdva/
7PB7lWU+j1YwJb4t5OQiwDAxIl9yG0umk5APQccwORpSILu7qFRdIQeuQFItPt6i
XmcZ73W57bTlmEqeUW07QDQo/V8qCg==
=Jxxw
-----END PGP SIGNATURE-----

--swmv7w9VRtSVMNZN--
