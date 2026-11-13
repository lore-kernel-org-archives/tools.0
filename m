Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794603585;
	b=KY+zP6fM3u67PSBXlnebxr/7D8bKQ/g4y94lA6IACRG35eT1epaiS68X/l0esyTlyzc5
	 eTKknfMi4B8WNF8gdfwd9pR5ZeLmltNTwzY/5dfUvcAGIcfpLzaDm3CA+YNhE9N4m89GS
	 qeZBjBogjyPqTkUy5ydG7NCCiggOEqMrHwmMiXTu/zOZuAtwrpztVuzsLrRtv12WxEYlA
	 OSIqR+8hr5Yi0C5zttMM/BPnBBJeUvHDaUvBbU4ls5N7D43FQe6FWx04neyKZP4EEe37o
	 7tTiCTvvufoYEhPI4ev3Ayn9pKNs0Gmt4KOX50GmgltDLQKjA2tWfmlCvMZK7LeEMsQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794603585;
	h=Received:Delivered-To:Received:DKIM-Signature:Received:Date:From:To:
	 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Cookie;
	bh=12KMI6HZne8Ji+BbB6pG8tQQgcczKyPmIYl6Bpd6BL8=;
	b=u5sKXBzFF0u+nWfr7NWiz6jVIbBB1QuG18E1I+2k+irlAcxIrzJ1U1Fb5l58zYIi39UY
	 /7PFwaW4Bl8CHGbTLE8QTdnn0QJuv0EEH0znJPkMAdz2FHYiNgyWph/5vQ2jTQKwqPFZ7
	 WJFhwzbTS7452MoX2h51i6+Hu+6fXL4chpStAMst9hHOSZx/bgZfaUVVw5iUbJvFxuOAz
	 Jtgm++zDXHQ758GjBZNjhM2y5eygl7CFnjoLGlmo2FWFBOMcnPg9oCshcR5rzQj9wajps
	 sgMNeIHY/ayG4f0nB6QbRmSbJHS2xdZt0b3ebsrVJ7nFdllPxoNO9QOkLPOHJfboxGA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ICP6BMyT;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 610D4606A333
	for <tools@linux.kernel.org>; Fri, 13 Nov 2026 20:59:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ICP6BMyT
Received: by smtp.kernel.org (Postfix)
	id 090B61F000C9; Fri, 13 Nov 2026 20:59:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B1D511F000C6;
	Fri, 13 Nov 2026 20:59:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794603584;
	bh=12KMI6HZne8Ji+BbB6pG8tQQgcczKyPmIYl6Bpd6BL8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=ICP6BMyTO5Jva4GHkeSXsqbpDGCP6sfzyiIG6bMdgEL5bRvrg2rr0Du2ryOmG3TK1
	 Nbb7e3EE23XFr2T6PU8kk3sU14VmLKZhDlGagQwYqoy6MUjc/Voqhzi5xs/MkJ2Rsg
	 fUK/S305bXHD05sMEysKtnyz76IGGdgjiNFy0buMWZDOUuFiZ7aM/G04wTy1SzPCTv
	 caj35LbRtcCS3vG7wsgO7xJNI8OSlURTAYUNy5Ou/4GyT+AZ5Yg79O9dzC38B3bNeb
	 x3d9wiw9Pl26X1Ztb3jg6LRXJR3gR0pc+wWGbmkZqLkNCl2i+CFygywYuG+qUUTTGE
	 fG86B7MCzVesQ==
Received: by traversing.sirena.org.uk (Postfix, from userid 1000)
	id 0B11E31BC8FB; Fri, 13 Nov 2026 20:59:34 +0000 (GMT)
Date: Fri, 13 Nov 2026 20:59:33 +0000
From: Mark Brown <broonie@kernel.org>
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc: tools@kernel.org
Subject: Re: [PATCH b4] review: Add a batch mode for agent reviews
Message-ID: <04b9c054-666d-48ea-91ec-20cd932b88d5@sirena.org.uk>
References: <20261111-batch-agent-v1-1-7296d20c2a43@kernel.org>
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Post: <mailto:tools@linux.kernel.org>
List-Help: <mailto:tools+help@linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
List-Owner: <mailto:tools+owner@linux.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="g7AJ999MC0kqVzbn"
Content-Disposition: inline
In-Reply-To: <20261111-batch-agent-v1-1-7296d20c2a43@kernel.org>
X-Cookie: Whoever dies with the most toys wins.


--g7AJ999MC0kqVzbn
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Nov 11, 2026 at 12:47:17PM +0000, Mark Brown wrote:
> Agent reviews can take quite some time to run which is not ideal for
> interactive use. Add a command 'b4 review batch agent' which runs an agent
> review for everything that is currently in reviewing state, allowing users
> to ingest a batch of patches then review them all non-interactively.
> Allow this to be limited to a specific agent in case the user is working
> with multiple agents and wants to use them all.

*sigh*, I realise I missed a git add on the new file - I'll resend on
Monday unless you say you totally hate the idea before then.

--g7AJ999MC0kqVzbn
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQReagvpf3TrrA7BoYYv73Ows9A4iQUCavd6MgAKCRAv73Ows9A4
ifsbAP4pdy0/CwnyyOCpfxpsDBgI/H5chgk68dvV4+qWwrP6sgEAjqoZFOR2+isj
iydQMg/EAGy1QbyThuWxljBCWyfrJg0=
=KkUk
-----END PGP SIGNATURE-----

--g7AJ999MC0kqVzbn--
