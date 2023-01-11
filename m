Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE266BD29
	for <tools@linux.kernel.org>; Wed, 11 Jan 2023 22:22:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 64D27C433EF;
	Wed, 11 Jan 2023 22:22:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1673475760;
	bh=jqvyQlQSff63xBtqVx9j+q3ZImTO6Ezipk0MviQclVQ=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=RpFYgOHG+6iyYGq1ZX3t2FAzjBlagMJXYRjFhJoInThaTAt1w7X91ENySIorPkUwt
	 ZlAgAKSznYvvcHaCQ5BRdeW6JV4b6ubJMg49265dwCs3Y/c2M5vZapz94hKxM2cRTm
	 l1eyH1pNSbMLJ0tDAK0KjxwU8mEGZfpCETIkqkz3lf9jZMtaUMnw4xqOjrXSLAutiO
	 0VQeTZvP4UnevcrvWw7L1QBOhwt6/3Av2KDeLmmo3gdUKqcz/s/D5fMZdso4lQa0mK
	 6FKYuYeKgf3cl++fGi62h4nuhzt/AtxQCHmVJvB5jK2UnuHN52xdl0KuIUu3F4CVQu
	 QkkOlHcdoB7aQ==
Message-ID: <f886465ad1b69fad361aab450fbbc2fca14326b1.camel@kernel.org>
Subject: Re: b4 prep -e oddness
From: Vishal Verma <vishal@kernel.org>
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc: tools <tools@linux.kernel.org>
Date: Wed, 11 Jan 2023 15:22:39 -0700
In-Reply-To: <20230111220007.b5kjtmcvrq3tn7xj@meerkat.local>
References: <ad77e06d2cb9ba322abad4f27865d4d6f79f6644.camel@kernel.org>
	 <LtURL2BzHlyc5ozrnHgbrcad-HXjMZyU1n6qpsGOD4KULaWTgxNP6AfqCh7w0ngAebWLqR7VvQ4JPUaSvIlNIw==@protonmail.internalid>
	 <20230111220007.b5kjtmcvrq3tn7xj@meerkat.local>
Content-Type: multipart/signed; micalg="pgp-sha512";
	protocol="application/pgp-signature"; boundary="=-/7RD/wtv2Hr+KZhroDkG"
User-Agent: Evolution 3.46.2 (3.46.2-1.fc37) 
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0


--=-/7RD/wtv2Hr+KZhroDkG
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, 2023-01-11 at 17:00 -0500, Konstantin Ryabitsev wrote:
> On Wed, Jan 11, 2023 at 01:56:24PM -0700, Vishal Verma wrote:
> > The problematic step seems to be:
> >=20
> > $ git --no-pager merge-base --fork-point master new_branch
> > 9652673e06ea84926e3be7c5cef0285c60fe31ff
>=20
> I'm not sure it's problematic as much as it's just not something you're
> expecting in this particular case.

Agreed.

>=20
> I did think that finding the actual fork-point would be useful, but I'm h=
appy
> to drop that if the expectation is that we're just looking for the best
> merge-base, as opposed to the actual forking point.
>=20
> > It looks like --fork-point uses the reflog, which has an entry for, I
> > guess, a stale new_commit on master. (Maybe a gc will clean this up?)
> >=20
> > Instead, if I did this (drop --fork-point and just do a vanilla merge-
> > base):
> >=20
> > $ git --no-pager merge-base master new_branch
> > b7bfaa761d760e72a969d116517eaa12e404c262
> >=20
> > This is what I'd expect (-rc3).
> >=20
> > I'm not sure if switching to this breaks other expectations though?
>=20
> No, this is literally up to what makes most sense. Do we always want to u=
se
> the actual merge-base and ignore any reflog forking history when enrollin=
g
> branches?

Reading this[1] about fork-point, I'm not personally seeing use cases
in a typical b4 prep/send workflow where it would be useful to use
--fork-point

I'll let others chime in if this isn't the case!

[1]: https://git-scm.com/docs/git-merge-base#_discussion_on_fork_point_mode


--=-/7RD/wtv2Hr+KZhroDkG
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQT9vPEBxh63bwxRYEEPzq5USduLdgUCY782rwAKCRAPzq5USduL
dqA8AP45fOUIdSK+/QhPxh+daYVLjFn656DcR8NSK9ztAW+bQQEAuObhNw23QFmx
t8Pp084gfThZ0OvtMh/f0eP04z60vAU=
=FqGt
-----END PGP SIGNATURE-----

--=-/7RD/wtv2Hr+KZhroDkG--
