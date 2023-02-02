Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DB408F54
	for <tools@linux.kernel.org>; Thu,  2 Feb 2023 18:16:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4887BC433EF;
	Thu,  2 Feb 2023 18:16:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1675361789;
	bh=TEukc1yaMrNCWSPRZZ8xk8Kjbw3/mDRgu3f52z1K2SA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=WxFtahGGmg3Zt2BNx99PiJLWe+yPbMrZ7cDEHZLyt+1uDWTm9N7glQJQjeAzWeUdp
	 mq/0DfNiyrAsEReus/12gPK+9rNe7m9MytuYortSp7P+Of2CXRyrBgPBbc5f7W60wz
	 LBgBcHXdl6k8W+ZqXas1XpLtag8LgrZ549ukLgvQMhlc8pLxM7X+sBUB4mduy0NgUU
	 /kfqgMvwIYT1upfnb/js0r46vD7KLM9hmNyhTK+2a+GNCUz80ekG9dGUqNKgkSFBTq
	 YKZEhoyHBUCjlibRomtnjAdsh/aB3jaT1UKb+zWXs2XdGQ1lZ4qEy0XKuQbWkFQzpG
	 LsL8w0uM3471g==
Date: Thu, 2 Feb 2023 18:16:25 +0000
From: Conor Dooley <conor@kernel.org>
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc: palmer@dabbelt.com, Palmer Dabbelt <palmer@rivosinc.com>,
	tools@linux.kernel.org, Conor Dooley <conor.dooley@microchip.com>
Subject: Re: [PATCH v2] shazam: Add the --merge-base argument
Message-ID: <Y9v9+YC44LXx+nkR@spud>
References: <20230201173301.54604-1-conor@kernel.org>
 <167528304551.198624.16333876502009679581.b4-ty@linuxfoundation.org>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="bW4os6PcpUDWydHj"
Content-Disposition: inline
In-Reply-To: <167528304551.198624.16333876502009679581.b4-ty@linuxfoundation.org>


--bW4os6PcpUDWydHj
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Feb 01, 2023 at 03:24:05PM -0500, Konstantin Ryabitsev wrote:
>=20
> On Wed, 01 Feb 2023 17:33:02 +0000, Conor Dooley wrote:
> > I was just handling a patch set where the author used English to
> > describe the dependencies.  They hadn't yet been merged at the time the
> > patch set was posted so I don't think there's really any way to make
> > sure the computers always understand the base, this just lets me quickly
> > override the automatic merge base detection when I run into something
> > non-canonical.
> >=20
> > [...]
>=20
> Applied, thanks!
>=20
> [1/1] shazam: Add the --merge-base argument
>       commit: 7e797fe9e052bbc97f4ee2cf14b3c444c2d01653

Great, thanks Konstantin!


--bW4os6PcpUDWydHj
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCY9v9+QAKCRB4tDGHoIJi
0g9tAQDLatsEOmzPJtd8zvKu6rCUzBsqGbZeVMQRNOyNY7t31AEAwDeWcbqZovXC
fx+CEDTerVS0cCBBpFXz7Nls7r723gw=
=tTHc
-----END PGP SIGNATURE-----

--bW4os6PcpUDWydHj--
