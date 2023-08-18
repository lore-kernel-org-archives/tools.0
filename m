Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6A362C9A
	for <tools@linux.kernel.org>; Fri, 18 Aug 2023 21:45:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3F29CC433C7;
	Fri, 18 Aug 2023 21:45:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1692395157;
	bh=uZ3H5Afau9Y6eLtwL/eAJI1tDoK+UkRHa56FalyXzIk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=SJkaZDCAoYqRpE0GVIx7EQx1xj+handr364NNHD1AUh8nCIfSmNzns1NtmbpOZptA
	 nX/kf/5QdVD9nbOKFcIeNRen9oP2gBt85b4tZaEdGMRo2xifUo6XqSA27lGsEE/H+M
	 xKn9k0DKJmp7N9ULGH8DRqDIfe3HoptcjxeoXYoomEMg0/oAacfWGQ3Ck1KGJVbsbY
	 v0akce2RhmgRnBxndrvQ9BzYsTJ+erlZuMYSnZp+XQPV8kZJpflU1cRoDpIMFQOwV2
	 7D2xqO6a6PSgl7pvcAo1xpxOhOIAcCxddm03g0upCwAZMn8FOfoCQrDHNRG0ycNeNZ
	 fhtaHZx+Kz4Wg==
Date: Fri, 18 Aug 2023 22:45:53 +0100
From: Mark Brown <broonie@kernel.org>
To: Song Liu <song@kernel.org>
Cc: Konstantin Ryabitsev <konstantin@linuxfoundation.org>,
	tools@linux.kernel.org
Subject: Re: feature request: b4 am verifies SHA1 from the Fixes tag exists
 in current branch
Message-ID: <bf0db0f2-f7c6-4f0a-9a19-7d00f5fac0b6@sirena.org.uk>
References: <CAPhsuW5Fqv7g=AVCGgQtFotG1oaUO+j5qBEyoTWJy0=n0mJS8w@mail.gmail.com>
 <1a184dc2-8c8b-40e6-8fe8-f0309615f886@sirena.org.uk>
 <CAPhsuW4FOtZLa7S7pYWcvssNMjQxvrTkkUKentyu5A8Ppg6vGg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="YKugnaJnqkDYnm1v"
Content-Disposition: inline
In-Reply-To: <CAPhsuW4FOtZLa7S7pYWcvssNMjQxvrTkkUKentyu5A8Ppg6vGg@mail.gmail.com>
X-Cookie: Your aim is high and to the right.


--YKugnaJnqkDYnm1v
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 18, 2023 at 02:22:13PM -0700, Song Liu wrote:
> On Fri, Aug 18, 2023 at 2:14=E2=80=AFPM Mark Brown <broonie@kernel.org> w=
rote:

> > Note that one of the most common sources of this error is Fixes: tags
> > that apply to non-upstream commits which amkees it hard for automation
> > to catch a commit that's unknown upstream (or at least requires fiddly
> > configuration).

> I think we can still have b4-am catch the issue when the SHA is not in

That'd be one useful approach, yes.  Not saying don't do it, just that
there's gotchas.

> current branch? A rebase may still change the SHA later on, but a check
> at b4-am time should still catch some issues?

Indeed.  A lot of people use something like Greg's scripts for this:

   https://github.com/gregkh/gregkh-linux/tree/master/work/scripts

--YKugnaJnqkDYnm1v
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmTf5pAACgkQJNaLcl1U
h9AnMgf9H9e/Gr1BusIQ6yxacuhtKeiaKLzwztB2BJFQGPW7qUQOXVjWStXR/YjE
F1P9eCnOzCbcjSA5nLjdv+AYwRuhMGc2zcqmjItoBjOiSOmMbVigULfib4hxbIcm
QIwielHkFz71WF1ZJvWluGpEyNBq1ap+llCp1LSm6XIA0VUiIWHdR6u13n4GQ76V
/mVZ7ErsWKEuzMQ5wqGoiTp86INiKlZKEKLdFE0iwByQgPG5NBnA1vOYqr8wRZPC
4y9LZuCh7xU0136XE/RNxRPM5+rFHWOu7YwVCmBN7eAgSGMevu8r8NBtZdi/eoo7
DWbPscByfCRZDyr1tprupxk1Vdtycg==
=cujf
-----END PGP SIGNATURE-----

--YKugnaJnqkDYnm1v--
