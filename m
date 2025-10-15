Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68AFA324B30
	for <tools@linux.kernel.org>; Wed, 15 Oct 2025 12:11:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760530284; cv=none; b=Tlv1EuteP5nwbqLYxoCyetdSlNAyM8ffDtdu2XeTCprb3Tzapwqn713Kb4EHm9KUwanmXpAEx0BmjETXabnMM4l9JbIYfTXqvtF1VrJnqeeetHnz/X/sGpUjBePKTRYacT3+mIiNEh0yGutlSSvVyIRW7m2gMcKqY0RZAzQh1y8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760530284; c=relaxed/simple;
	bh=gVrXmQZHsToURJRd7XQ2XaG6vS61FjEuNlHmCfaDJCQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AGDAPXxtBycG7ZFVzvCIOpmvlEvWEY8W96/IiKKsXx2z1DBBWYperbEqRTB3w2t4THz/p6uNCxDDu/MjLbQPYobLjNtIo364j0MSkpdOR53jwdMpL2tv2GodKv9ewWs/nuzJpHNcg///b08MDTrr6Zp6NMmkBe3ZQZGfUjzOqxU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VfDj9vXo; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VfDj9vXo"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 51F03C4CEF8;
	Wed, 15 Oct 2025 12:11:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760530284;
	bh=gVrXmQZHsToURJRd7XQ2XaG6vS61FjEuNlHmCfaDJCQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=VfDj9vXo9spjju2GGxwn4EZGaIBtCZrnROX1fDwomvmFQ8ymz9qvPUd5ZgEm0026D
	 I1gVZ/Clhhu/BtJ0aK0LXyNjqVcG0uMUEC3K7Ghom+/WR83lbp5E+I/oAXsO04cZ+2
	 OvE8f5WDb0uOGNeIKdzAweQphe1TxjsAh8W81v5DIJl2vlgA9Xo156k1WT6qSD7pb1
	 qwVEAwRg66zbKfDCadX5/lRDIUjYO5MitvzcSCMiljSxp8XuUjjFn7NcDDdMwJCAaF
	 lkovsggabxAno63C6J3Zt78QgswhEDJeoWYtY7eoyYNgUA62XkMVqJTyImagyXewV7
	 tu7S3aaBn+NWw==
Date: Wed, 15 Oct 2025 13:11:19 +0100
From: Mark Brown <broonie@kernel.org>
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>,
	Linus Torvalds <torvalds@linuxfoundation.org>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Konstantin Ryabitsev <konstantin@linuxfoundation.org>,
	users@kernel.org, tools@linux.kernel.org
Subject: Re: In defense of Link (was Re: [b4] initial "b4 dig" to supplant
 Link: trailers)
Message-ID: <aadb0515-4024-40c0-8024-fcdd029a3029@sirena.org.uk>
References: <CABgObfY5agTRsB-bCqCYbA0erFn5cVbujtTNBiCti8g_68nCWg@mail.gmail.com>
 <20251013081536-mutt-send-email-mst@kernel.org>
 <CAHk-=whSShtPG1_+02Cc4yDuEJxVqX=G8tAx0gW7UjA7cuBp-w@mail.gmail.com>
 <CAMuHMdWxMhM1J3zHC8OkN_fd8XsJPFA6jM_3JFU=ySKhnX6ESw@mail.gmail.com>
 <CANiq72ka1y0YXysRQtuqnzc0i5FSbrGjKwprrXQpozwDOV3khA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="1i4GkzuJqxu0ke3N"
Content-Disposition: inline
In-Reply-To: <CANiq72ka1y0YXysRQtuqnzc0i5FSbrGjKwprrXQpozwDOV3khA@mail.gmail.com>
X-Cookie: Long life is in store for you.


--1i4GkzuJqxu0ke3N
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 15, 2025 at 11:38:41AM +0200, Miguel Ojeda wrote:
> On Wed, Oct 15, 2025 at 9:37=E2=80=AFAM Geert Uytterhoeven <geert@linux-m=
68k.org> wrote:

> > FTR, I dislike the use of Cc: in patch bodies.

> Yeah, when they are added automatically as a big block (e.g. 10
> lines), it is not great.

> Personally, I use Cc: when I think someone should be explicitly pinged
> for a reason. That is, people that may want to provide comment but
> that wouldn't be Cc'd otherwise from `MAINTAINERS`, e.g. typically
> from external projects.

Ccing people makes sense but doesn't need something in the patch body,
and especially doesn't need to end up in the commit log.

--1i4GkzuJqxu0ke3N
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmjvj2YACgkQJNaLcl1U
h9CJuAf+JPpR/T/MolS8lAWaGoKYzkAz90ekZXtlbsf/Qzlbm+UqG+5nyG4wGmKF
D41CfllMS0TvJdIgtucLlULuNLvXqkRMlNFT1EjLjvQ+P7OENbiHjW8B8COl1gHo
o28CRcoWx9X+zubIqqEmLhTY+oMPbWhW0LZ44I/ANtICaEEuaB+gwJWN6ggbAQ1G
6fDJjEI0O9PrXKakGNq7a3wotLnpk9khalBYnTEz36UMmqGBhoCVCiSCgFqwjK0D
g+x6X5ESxrcRMq7tjwi8Ym7hgdyn3xi7DJOrReOd5TPBVz4vEaMcY9L+/A29AUjS
Z1i2caaL7azr2SEPYhBC0ODCfcc5Sg==
=oXES
-----END PGP SIGNATURE-----

--1i4GkzuJqxu0ke3N--
