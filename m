Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74EA64C6C
	for <tools@linux.kernel.org>; Fri, 23 May 2025 13:30:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748007039; cv=none; b=IVLAwiTjPc8hq9TJmysdOFnS8JcTicwPozZ/aczBSlaWc3SgX8KP53kYJ2CRU4jgMa8O5LWr3Pi3nnHTE3O1tt6pVpkmBdQ+6juPx/pLzZPpx3tJ49l2gBg2Ixj0DdxJ3vETvULv9+2N8xm9GWAsOIerUi8ReeZChcd04VteDLA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748007039; c=relaxed/simple;
	bh=pJIb/PBP7mZLeRvzrD81uddqtxS6gRukoc44pziHgHs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KfMho8qDmfU/FXx0c10fEpQ2hZahrP1V6gU0ioyje/T7yIJtfRXHbjPel/VJe160luYxPJqLY+mQkiEnbH+qyaWyO2l4+axnDQUN4ZPn2S3Y9NuPRmQBZcpDlTrIG1W0HNS7gW01qbTN5fmZA+Q4daUWdPlZi4cgRVKGke2gYCg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=hHR2UlGB; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="hHR2UlGB"
Received: by smtp.kernel.org (Postfix)
	id 055AEC4CEEF; Fri, 23 May 2025 13:30:39 +0000 (UTC)
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 8A82CC4CEE9
	for <tools@kernel.org>; Fri, 23 May 2025 13:30:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 8A82CC4CEE9
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-ad5394be625so714043166b.2
        for <tools@kernel.org>; Fri, 23 May 2025 06:30:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1748007034; x=1748611834; darn=kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=r5ZCypfjmC4YM/G1NtM8A/jliUH3QnwMVtIdpgs8w7c=;
        b=hHR2UlGBvLDC0sjgPVMR+HvSpWXnHnSFqexrif6mJh/AAKSyiMx5gl+jVxFdGx8QBq
         AXSrWqzdNYibJSml6tNaBnEYxhnSrumihr7IC+v0kBO1AVob6eSRgg6uvwIgTdU/OhTV
         2XAKFBVW6sBZazhcO08kExFEgGRohzeszsrQ/cPBPojCdf+j5cIuTwVk3AvVYsbzMwPr
         wXkrm/VwK0pxKhBghzjRu5hjC+892AHqRvsDHLKFxiOHPDWFDqQitB2idLB5P4Kvhnyi
         gD06ue5rwLp7s4z4uU0VOrHQJK085YYOPLTLGs2IgndcKmA8z2XD8Ui7TejU+AuswvDr
         uKCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748007034; x=1748611834;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=r5ZCypfjmC4YM/G1NtM8A/jliUH3QnwMVtIdpgs8w7c=;
        b=XJKxwiA9pA4Jjv0o3F+yS6JDyRcRGU5qfxQSZ4Evr0Tt7vazGXuerD6l4ndjAiKaLy
         rY4M1ZlbYhBVL+Z3pDDcVC+dNWajHv0k3IQewTi6WPGZbqmoV13J+S4jkBDgF/VCx0d7
         qm6EMI9VoWTtktPPYo2W0gMQ9UvXGUw+kgHNSNFjyqfZ9hY8aiTzcuJElcWUhDPPNlUu
         7iRNqyAZ9ioUbQrlD5DSSLmaW/AIDuDykSWhOUhs0cFgBVFQ2B+e8D+THR4Zh7YtrPqQ
         GL8p9edYFuI+0bdO6BjLZ6yNvJpU991izFKoeGu9lBcba0mL8poBGPTCe1T4LmHn5uA/
         t7UA==
X-Gm-Message-State: AOJu0YzMlZPPe+XA3koFhxudCXBmlSAuUC7sJ7YiOBIPfX9OwGepAsvM
	ynlb1GtNsXx15EHqDdQQkVfeX7fh6ISbWmB8y3InOEsedInV7WGJuXQRUGx6b1CYMdA7WrWLy/a
	PvJqm
X-Gm-Gg: ASbGncuAF3umhxz/wGUk/hiH1TxMieObUyKMgaVjRPXrnTVuDPU3fTz8PIf6NiioJGD
	wsismRv3qqyWn3CaGXaIRDdSiyrzqDLg2R3Cce20Dwroo7/JYyQNesFNO8Al8qbu/VDB5kA4lMA
	3CuhIawTaphjVUlsMrOrw/rlQUK/wLd6I2Tq3sKMoW+VqsXYbTv3pOiaERaB8JtLxlxZ8awklZ3
	K+UsC4Srb6Xs0ncim/MHKEjfbNBj3wZOB0NqWL5qDJlcRWDt7iEJOhqfFL6q41x2b7XehI0U3nB
	hv4PKQwsCtIAsGZq+l51iaKPdWwsUVngJZmmOws+8c/mlJox/E0hLGrB
X-Google-Smtp-Source: AGHT+IFCBqA9Hvtqml6VDExy5kzQKk+uXynWmgilb/RijkqDHTM4xjOEFysxUV+BDbgKZpn5K5THIQ==
X-Received: by 2002:a17:907:7f8e:b0:ad2:53b1:d60f with SMTP id a640c23a62f3a-ad536bdfe89mr2119788466b.34.1748007033607;
        Fri, 23 May 2025 06:30:33 -0700 (PDT)
Received: from localhost ([2a02:8071:b783:6940:36f3:9aff:fec2:7e46])
        by smtp.gmail.com with UTF8SMTPSA id a640c23a62f3a-ad52d047749sm1227304966b.8.2025.05.23.06.30.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 May 2025 06:30:32 -0700 (PDT)
Date: Fri, 23 May 2025 15:30:31 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc: tools@kernel.org
Subject: Re: [PATCH wotmate v4 0/6] Cleanup, a fix and txt representation for
 trust path finding
Message-ID: <5l6vn4jjqf5pli7rmxn3s6lei2xxdw6yodos5qm7zhxv6acc32@bzrmqj4iwnuh>
References: <20250519101429.1558947-8-u.kleine-koenig@baylibre.com>
 <20250520-resourceful-salamander-of-opposition-131c63@lemur>
 <fekxcrrrgoxu3ugecdyzc5nrlzfoa776dlyzjc6ger2mjmhry7@p3itqnu7tm34>
 <gnl4wd5opraaqx2iimdss22vwqqraex2jxo4rxxwblifooagjy@bdpwayn336en>
 <20250522-melodic-tunneling-crab-863ab6@lemur>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="642dsyvv5kldzltw"
Content-Disposition: inline
In-Reply-To: <20250522-melodic-tunneling-crab-863ab6@lemur>


--642dsyvv5kldzltw
Content-Type: text/plain; protected-headers=v1; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH wotmate v4 0/6] Cleanup, a fix and txt representation for
 trust path finding
MIME-Version: 1.0

Hello Konstantin,

On Thu, May 22, 2025 at 09:27:31AM -0400, Konstantin Ryabitsev wrote:
> On Wed, May 21, 2025 at 11:12:28AM +0200, Uwe Kleine-K=F6nig wrote:
> > > Looking at your change to the pgpkeys repo you still got rid of many
> > > SHA-1 signatures due to commit b088af1f40a5 ("export-keyring: Default=
 to
> > > store \"clean\" public keys") as cleaning implies pruning weak
> > > signatures. The effect is only limited because the linter check preve=
nts
> > > several keys from being updated. So because e.g. Greg's key
> > > (38DBBDC86092693E) uses a SHA-1 protected User ID, it doesn't lose
> > > Linus' signature.
> >=20
> > One side effect of how SHA-1 signatures got thrown away is that the
> > graphs (both svg and txt) were generated with these SHA-1 signatures but
> > they didn't make it into the updated keys. For example
> > 8972F4DFDC6DC026.txt currently looks as follows:
>=20
> I just pushed a big update that adds a --use-weak-algos flag to two comma=
nds.
> It also adds a bunch of typing data, so we can use linters a bit better.

Would have been nice to split it into (at least) three commits, but
*shrug*

> > 	from  79BE3E4300411886  Linus Torvalds <torvalds@kernel.org>
> > 	   1  8972F4DFDC6DC026  Kees Cook <kees@outflux.net>
> >=20
> > But keys/8972F4DFDC6DC026.asc doesn't have a signature by
> > 79BE3E4300411886 any more. So if you run
> >=20
> > 	korg-update-pgpkeys empty
> >=20
> > once more, this signature isn't available any more
>=20
> I think I fixed things up now to avoid this problem. It looks noisy, but =
for
> the end-users it won't make much difference, since their gnupg will be
> ignoring those signatures anyway.

I looked into the pgpkeys repo changes and while I didn't check all
changes, the ones I checked look sane. Thanks!

> > I'll prepare a patch for that later (maybe tomorrow).
>=20
> Please grab the latest master! I think this is already in there, but feel=
 free
> to build on top of that.

Will do. I don't know yet how to address the shortcomings I'm still
seeing. The procedure is probably:

 - import keys/*.asc
 - do updates (add new key material or gpg --refresh)
 - clean all keys
 - generate graphs from all signatures still in the gpg keyring
 - update valid keys and write out graphs

Then the split into make-sqlitedb.py and export-keyring.py doesn't make
much sense and maybe we can also strip out the sqlite stuff completely?!
(I wonder if sqlite is a sensible option already now, I wouldn't have
considered that at all but just pickled the signature info into a file.)

Best regards
Uwe

--642dsyvv5kldzltw
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmgweG0ACgkQj4D7WH0S
/k5kqQgAqotj5SOlxf/E8Cd9m2bav4eLPZEiFxG2nEClkfnd0TyMpSEIhrYvPujx
WAOSF4FTGKhCZVDdZnMLSkd5CTjVQIRtqiI0+mupPb8zkEzqirrOvUAMNVdPPh/V
CV+duTdEl9DyK3fSBFD6ft+wvI9eY1P9qQ5abgL+gvUZupbAQzQ6NtAGFLeKT7me
hqNVC6OtdXsbrXFXoPD7tOjH47puuOFMSWGv8GQ47JamO5Ba2NwKaRYvyiTXrYb0
4beRxq7/WyXaqV0n/iGNSYRrug/yMdD14S/O5GtuNnC7jcAN7Ep/V3uYxvU7GVvA
ooN4GQ+/UDT7IrJUbeCexlXi+R9/jw==
=YB9W
-----END PGP SIGNATURE-----

--642dsyvv5kldzltw--
