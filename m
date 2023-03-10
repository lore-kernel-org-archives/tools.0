Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BAA8BDAA5
	for <tools@linux.kernel.org>; Fri, 10 Mar 2023 20:09:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 94430C433D2;
	Fri, 10 Mar 2023 20:09:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1678478969;
	bh=N8T1mnidIAGFlRerTtxyjKRFYGdtNdZ9/rNorNdxSaY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=XX2g69vTZth13eKLuqoOuWqP2Ni65JcWUjqkhv0JDXTG5HnVXrce4760avtyQj/WX
	 C0+Gr4cRd+BVprD3/MgZXc4vOA8/i/PUSZkwHy2wkHOhcXGvrKfy2pUxvJ9E+i8AJY
	 3jWSSbc0kGxsB0RTpwIMARMu6/qWIZeqmQ1LQU+q6yX71s+B4b67VbbZ+REPD7v+Jg
	 aqyonIcaXX+iT5p7egTvtz8TMpspBXXY/9geoJ0jGX6O0P8YSIa8qZaSkS3+QoojJt
	 3MKsTb0G0vYt1b8npDLmh2OsyJWG5KD6kSm+95lodBv3UtXFpgqSDxe8CW3XAvXj6X
	 4ZX51YfgJiL6g==
Date: Fri, 10 Mar 2023 20:09:26 +0000
From: Conor Dooley <conor@kernel.org>
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc: Palmer Dabbelt <palmer@dabbelt.com>, tools@linux.kernel.org
Subject: Re: b4 shazam picking up the wrong author from patchwork/lore
Message-ID: <02704762-7a14-422b-8d26-b24c12ffd48c@spud>
References: <mhng-2765f5e1-e3d9-4f36-82e2-1212e13b0cdd@palmer-ri-x1c9a>
 <20230310192652.ymac3w2lucfdf34p@meerkat.local>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="jRzcUFa/IqP9U5yc"
Content-Disposition: inline
In-Reply-To: <20230310192652.ymac3w2lucfdf34p@meerkat.local>


--jRzcUFa/IqP9U5yc
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 10, 2023 at 02:26:52PM -0500, Konstantin Ryabitsev wrote:
> On Fri, Mar 10, 2023 at 09:38:54AM -0800, Palmer Dabbelt wrote:
> > Conor just pointed out that 2a8db5ec4a28 ("RISC-V: Don't check text_mut=
ex
> > during stop_machine") was listed as authored by him, despite having a F=
rom
> > in the message body.  That usually works fine so I'm not sure
> > what happened here -- no big deal because neither of us really care abo=
ut the
> > authorship on this one (and the SOBs are fine), but figured it'd be bes=
t to say
> > something in case it bites someone else.
> >=20
> > I merged the patch with
> >=20
> >    b4 shazam -lts https://patchwork.kernel.org/project/linux-riscv/patc=
h/20230303143754.4005217-1-conor.dooley@microchip.com/
> >=20
> > which is the way I usually do things.  This is the first time I've noti=
ced any
> > sort of issue like this.
>=20
> Ooh, very neat catch. This would only happen under the following conditio=
ns:

> - the message had to be patatt-signed
> - you had to have had the key to properly validate it
> - and, most importantly, there had to be mailman trailers in the message

Heh, I suppose that (plus it being me sending Palmer's patch) puts it
well into corner case territory!

> When all of this was true, we would re-trim the body to the size that was
> actually passing verification (using the l=3D parameter from the patatt
> signature), but this lost the in-body From/Subject headers (because they =
were
> moved into the actual message headers during verification). There were
> workarounds initially for this happening, but they stopped working right
> around 0.10.
>=20
> This is now fixed in master and backported to 0.12.y. I will hopefully pu=
sh
> out a 0.12.2 some time today.
>=20
> Thank you for the report.

Thank you for fixing it!

--jRzcUFa/IqP9U5yc
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZAuOdgAKCRB4tDGHoIJi
0mFWAP9yp2HhV93qrp7waWmJHqN4Eh7X7YczELqvu84renfflwEA0abwG6bKkNLd
qso5wq9XQ52A+YaPNFVfcHYsDnB7hAw=
=PLMz
-----END PGP SIGNATURE-----

--jRzcUFa/IqP9U5yc--
