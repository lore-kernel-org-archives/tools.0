Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1613DDA81
	for <tools@linux.kernel.org>; Fri, 10 Mar 2023 18:14:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 02841C433EF;
	Fri, 10 Mar 2023 18:14:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1678472087;
	bh=u3lgGzRCxR1P9AglZN6WmgnE9sR0HjQRflg7FMDG23Q=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=evL5bM4egLcoKosWWMWW2yRWQfGGLM4tfLYnC/fqrqHyLGjuswv/EdpcONyYF+mhy
	 FG0uyrkjvqdEnwldOxQ6pJ3DT33lS9UiTsQzpknCsDypsSLt8k9q8onrJZGOGhFbfH
	 C540okImMguwfHhjzYfbPz2a0j8j2u6IwA7fhys1tj2UYy3c62/IzwCWuHE6akfEQx
	 +Cj4u+XQBIYwjUwhgJ0X47AKqpFxfC4uukFjVBLaeeJnnLD0Cq/AKZ6f0jmtfnDjyu
	 EUMv2gvnffhkgQRn6fQ02roYT3+Y6GUDx20NjeeWA2B3j6np58c3NIJt5aTRKkEvOS
	 dC23APdhCtJsw==
Date: Fri, 10 Mar 2023 18:14:44 +0000
From: Conor Dooley <conor@kernel.org>
To: Palmer Dabbelt <palmer@dabbelt.com>
Cc: tools@linux.kernel.org
Subject: Re: b4 shazam picking up the wrong author from patchwork/lore
Message-ID: <185b8d0a-757e-4e23-8031-3828c34f8239@spud>
References: <mhng-2765f5e1-e3d9-4f36-82e2-1212e13b0cdd@palmer-ri-x1c9a>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="hSvbFpyjg/EaUcK/"
Content-Disposition: inline
In-Reply-To: <mhng-2765f5e1-e3d9-4f36-82e2-1212e13b0cdd@palmer-ri-x1c9a>


--hSvbFpyjg/EaUcK/
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 10, 2023 at 09:38:54AM -0800, Palmer Dabbelt wrote:
> Conor just pointed out that 2a8db5ec4a28 ("RISC-V: Don't check text_mutex
> during stop_machine") was listed as authored by him, despite having a From
> in the message body.  That usually works fine so I'm not sure
> what happened here -- no big deal because neither of us really care about=
 the
> authorship on this one (and the SOBs are fine), but figured it'd be best =
to say
> something in case it bites someone else.
>=20
> I merged the patch with
>=20
>    b4 shazam -lts https://patchwork.kernel.org/project/linux-riscv/patch/=
20230303143754.4005217-1-conor.dooley@microchip.com/
>=20
> which is the way I usually do things.  This is the first time I've notice=
d any
> sort of issue like this.
>=20
> Just to make some headaches: I've got some out-of-tree patches for b4 sti=
ll.
> It reproduced locally for Conor, who I'm assuming has a cleaner tree,

Yah, I have no out-of-tree patches. On the latest master I think:
0.13-dev-041d1

> but just
> for full disclosure here's what I'm running:
>=20
> * 901c5b9 - (HEAD -> palmer, palmer/palmer) shazam: Add the --add-message=
-id argument (3 weeks ago) <Palmer Dabbelt>
> * ca426a4 - mbox: Add the --pipe-each-message argument (4 weeks ago) <Pal=
mer Dabbelt>
> * f54fa86 - pr: Provide more information on PR fetch failures (4 weeks ag=
o) <Palmer Dabbelt>
> * ada3021 - (b4/master) PEP inspection cleanups (5 weeks ago) <Konstantin=
 Ryabitsev>
> * a328183 - ez: modify --show-info to allow getting single value (5 weeks=
 ago) <Konstantin Ryabitsev>
> * 9e0bcc5 - Up version to 0.13-dev (5 weeks ago) <Konstantin Ryabitsev>
> * 7e797fe - shazam: Add the --merge-base argument (5 weeks ago) <Palmer D=
abbelt>
> * 173e358 - Use typing compatible with python 3.8 (6 weeks ago) <Konstant=
in Ryabitsev>
> * 63004e9 - Update patatt to 0.6.3 (6 weeks ago) <Konstantin Ryabitsev>
> * 1f7f126 - (tag: v0.12.0) Up version to 0.12.0 (7 weeks ago) <Konstantin=
 Ryabitsev>
>=20
> That's all in git.kernel.org/palmer/b4 (still meaning to get around to te=
sting
> your better version of the Message-ID bits, sorry it's just been crazy he=
re for
> a bit).

--hSvbFpyjg/EaUcK/
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZAtzlAAKCRB4tDGHoIJi
0my7AQCU8FGd9gzpifOgZSSSiYM9GvEvPAUOs+ChZ/FvdwmDhgEA1Yg3l0cCuQ2k
sV+nVSdmuxphtfDQIocHwsulgcUvmg8=
=WFaP
-----END PGP SIGNATURE-----

--hSvbFpyjg/EaUcK/--
