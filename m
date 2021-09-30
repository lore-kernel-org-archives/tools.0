Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1FB83FC6;
	Thu, 30 Sep 2021 23:29:17 +0000 (UTC)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4HL8Zz5Ql1z4xbG;
	Fri,  1 Oct 2021 09:29:15 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1633044556;
	bh=XT3vyRRBG/ZQHUn04XqlXo7NOrs2JWWq7yqfHpIo2D0=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=jebXzy0CCZEw2FRNYUEfuGAQjl/TCaP52LVkF9y7g0ZqmCpFRAA2Pe7oSlPIl5TrA
	 anS8kpcwwtipkxOnUIT4eW+ZyMvp97M8yp9pZa5vXkmCuOr8Dzwnfev5xorQ4jvnyY
	 xZGY6ZRY7vJxitipvD7gjunyMd5C0Xt6lggREBtHo9YyEcmb/XwT6ZJXPTy22lYQcZ
	 WZpE0ebXKAiWJsG8DHEEzQz1cM1c2GMcEoV7Vp9tBXhWo7niz1ToQlrz7R5RE0+XMw
	 wVJQpnbT62XpV9LwoaZ5vUG+T72qba5Vp7S9Zy6zp45Vzil7nfwug9JD9kqkMPWaWz
	 P7Bkc4zcP2jnQ==
Date: Fri, 1 Oct 2021 09:29:14 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Kees Cook <keescook@chromium.org>
Cc: Konstantin Ryabitsev <konstantin@linuxfoundation.org>,
 tools@linux.kernel.org, users@linux.kernel.org
Subject: Re: merging pull requests
Message-ID: <20211001092914.4738513b@canb.auug.org.au>
In-Reply-To: <202109301559.A9BFB03@keescook>
References: <202109301023.B78ABE54B@keescook>
	<20210930200002.67vxbowvegso2zhg@meerkat.local>
	<202109301559.A9BFB03@keescook>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/spIUc45n.CFDNq=xjUad3uz";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/spIUc45n.CFDNq=xjUad3uz
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Kees,

On Thu, 30 Sep 2021 16:09:13 -0700 Kees Cook <keescook@chromium.org> wrote:
>
> I guess it depends on the expected order of operations. What do other
> maintainers do to process a PR? I would think it would be:
>=20
> - pull remote branch (to FETCH_HEAD)
> - review (in FETCH_HEAD? in a "real" branch?)

Our workflow usually requires that all patches are posted to an
appropriate mailing list for review.  If the developer then also has a
git branch/tag containing the patch series (after updating for
Reviewed-bys etc) then that is a separate issue and (probably) requires
a level of trust on the part of the maintainer (or a recheck) that the
patches have not been changed since the final review.

> - merge into my topic branch (where the commit subject should retain deta=
ils
>   of the pull location, body has notes from the signed tag, etc...)
> - review, build, and test

"rinse and repeat" :-)

> - push to public tree

--=20
Cheers,
Stephen Rothwell

--Sig_/spIUc45n.CFDNq=xjUad3uz
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmFWSEoACgkQAVBC80lX
0GzAJQgAmPjWk5+xD9jUnwyk8XqhHfJzyIfEHNG17Zg3+DAJRXO5ZNfditE97jTP
+ReRKiDZlfu+FRCVunqOMSquoLAuDSVcIcXaymx6wZLMCSfUYYtLMZJgaawswhOP
N09xn/VtJ3X3BaRq0kR3wxZn+ZrFPolJa74sCH9yqS8Q/PqHZy38eS3A2KaauvWB
LUTnldkCjk0PqDBMBqxhHp6dQwyXI9OnmFYqCPXaiTcHhvnehRW9LQuVWxfkacX+
wFIsuQnLfXvU3ZIBnu+nGqnMW9UVi3Hy9d4yNXsV8cSt/Uw4rTiDjSnSAzxMNk8a
/T0oCKUAp3zV7mSp2U+1n6hQF6TiDw==
=1iOq
-----END PGP SIGNATURE-----

--Sig_/spIUc45n.CFDNq=xjUad3uz--
