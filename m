Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1AC1168;
	Thu, 30 Sep 2021 23:28:58 +0000 (UTC)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4HL8RG1LCWz4xbG;
	Fri,  1 Oct 2021 09:22:34 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1633044154;
	bh=TFf40XJVbD9FAd2hyaELvXEcOUwZ5R8+t2Wcp4buQg4=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=rkKPbWWU9fNciVrCrkgjhZKXuy8HfL7aodCzBB4JmtPLiaPi+XO9XUMOM65Jx36MD
	 aBIs8mgfTy/nIKs+PNka5GVgKZPbcrTboc3j2xmWql2tNQosTWVtLSnkMU8xMqmN2J
	 jZ5hueTgB9K0Fvbk5hMfzeqy7CtqIvoW2OitMn9Z1FMjhBxu/7W5Ie94vY8bzWreew
	 sZv3q8PXDARZ2xOMXldtxEXgcu3BQO/Mm4uiA8RUjFPx4h0EY9dVDx7oU/GX0gOB9L
	 hInp9IQnq8G/QebOy7aZgwkf2pbZqwx5DU4vkJKzxI37hqDoSlGcDNjd3xStEoNasv
	 Bpgu1BN9hrSdQ==
Date: Fri, 1 Oct 2021 09:22:31 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Kees Cook <keescook@chromium.org>
Cc: Konstantin Ryabitsev <konstantin@linuxfoundation.org>,
 tools@linux.kernel.org, users@linux.kernel.org
Subject: Re: merging pull requests
Message-ID: <20211001092231.6fefb6c7@canb.auug.org.au>
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
Content-Type: multipart/signed; boundary="Sig_/B=PjX+MnlSRYMKP7fuIZ0DL";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/B=PjX+MnlSRYMKP7fuIZ0DL
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Kees,

On Thu, 30 Sep 2021 16:09:13 -0700 Kees Cook <keescook@chromium.org> wrote:
>
> I think so -- that seems to be sort of what Linus does? There seem to be
> a few templates (tag, branch, and "patches from Andrew"), e.g.:
>=20
> Merge tag 'char-misc-5.15-rc1-2' of git://git.kernel.org/pub/scm/linux/ke=
rnel/git/gregkh/char-misc
> Merge branch 'misc.namei' of git://git.kernel.org/pub/scm/linux/kernel/gi=
t/viro/vfs
> Merge branch 'akpm' (patches from Andrew)
>=20
> Though I'd love to know why there's a distinction between "tag" and
> "branch" here. Are "branch" pulls not checked for signatures?

I assume it depends on what Linus is asked to pull/merge.  i.e. if the
pull request refers to a tag then Linus will just merge that tag.  Some
people just ask Linus to merge a branch from their tree.  In Andrew's
case, he sends patch series which Linus would import into a local
branch ("akpm") and then merge that.

The messages seem to mostly be the default git message for a merge
(sometimes maybe editted a bit).

For linux-next, I fetch all the branches into remotes in my tree and
then merge them later.  I have recently changed my merges to include the
source tree and branch in the merge message (previously, all you saws
was the local name of the remote branch).

--=20
Cheers,
Stephen Rothwell

--Sig_/B=PjX+MnlSRYMKP7fuIZ0DL
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmFWRrcACgkQAVBC80lX
0GwhNgf+KXf5sPHpYMz+koniWGQ8/DthU7c25bfNhe4tT0/9nJBRAVpXsXO2CDdY
Z56H4csaIkQXWD6q/AH1Ik6SsIoVHKNTFRAXgevIdPfLpWfpwstl6S/kmVwKQskj
tWfZZaxy6flEJ+Drzuad9/jjITblbIRXdSv5Mwc4hOXA6a90Xoox63e/r+uV9xdQ
xVbTAhrSJoj5mLEbgL6Fzse3xgoeuJQkUuDXa0e/xogyZM7DBnV4X7CuzZ2aTfqt
cRK9KQwuQxC1QZiCuL9s0dMbsqcHMMGropjMNNnE5W94GvSXwiKKu/Xt3OSmUkpS
z4+lm29TWOOAP3u51ZULUsdSPzQzmA==
=Zisj
-----END PGP SIGNATURE-----

--Sig_/B=PjX+MnlSRYMKP7fuIZ0DL--
