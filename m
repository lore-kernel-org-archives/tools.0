Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by mx.groups.io with SMTP id smtpd.web08.3197.1608572115464841142
 for <tools@linux.kernel.org>;
 Mon, 21 Dec 2020 09:35:15 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kernel.org header.s=k20201202 header.b=oScbMfAt;
 spf=pass (domain: kernel.org, ip: 198.145.29.99, mailfrom: broonie@kernel.org)
Date: Mon, 21 Dec 2020 17:34:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1608572114;
	bh=VN/rKdCemvePVe91r+JcTwN/0XQnUWvRYb08qYnpxH0=;
	h=From:To:Cc:Subject:References:In-Reply-To:From;
	b=oScbMfAty1TgsriKFaQe4cz8dmfOdCRFdhPD2elPKYbaTvacoY1kbjZXfpoNeMTNk
	 CTX5KazHlj5JmQoQtbewfNtZtISDnSsQ7UspTaafYgZal1IZPfalogUJultKZ0udv7
	 rHheF0wvmDrBvKhAQnd6l7EYC/8d3jLzTmg17agcUGx+94pPPCFkTdxlDaSpOsCz1j
	 KcQdPxvo/C1ViFJBERKdbK2RxRnIFk3AKTPO0G1HhngRlvjTuMGGTkz5it5MnQXoA4
	 fICTVE2MSJugWi4jt6V0iiqWF7ptegQkgF64jsyWpXpYbAwNJEY1de7R/dwqEOQ7z+
	 JtSkc3n3tVBDQ==
From: "Mark Brown" <broonie@kernel.org>
To: tools@linux.kernel.org, James.Bottomley@HansenPartnership.com
Cc: toke@toke.dk, Konstantin Ryabitsev <konstantin@linuxfoundation.org>,
	users@linux.kernel.org, Jens Axboe <axboe@kernel.dk>,
	Arnaldo Carvalho de Melo <acme@kernel.org>
Subject: Re: [tools] [kernel.org users] b4: encouraging using the cover letter in merge commits?
Message-ID: <20201221173459.GB4521@sirena.org.uk>
References: <877dpeol5w.fsf@toke.dk>
 <bdffc35910338117c6ed66f6dfac2dc13d6ed03a.camel@HansenPartnership.com>
 <87y2hum0t0.fsf@toke.dk>
 <fc05bad0b5517500e62b271b8896f142060b235e.camel@HansenPartnership.com>
MIME-Version: 1.0
In-Reply-To: <fc05bad0b5517500e62b271b8896f142060b235e.camel@HansenPartnership.com>
X-Cookie: Remember: use logout to logout.
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Groupsio-MsgNum: 322
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="CUfgB8w4ZwR/yMy5"
Content-Disposition: inline

--CUfgB8w4ZwR/yMy5
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Sat, Dec 19, 2020 at 09:03:36AM -0800, James Bottomley wrote:

> I've got to say that creating a spurious merge for the cover letter
> looks even more tortuous than creating an empty commit.  What
> advantages does this have over the existing link tag practice which is
> the one that we now use instead of the empty commit?

My scripting will apply serieses as branches and then record the cover
letter in the merge, I don't do this so much for recording the cover as
for the benefit of my testing - I tend to queue up things to apply and
then later have automation run through and check things before actually
merging them (anything without a cover latter gets dropped into a single
series together).  Each series gets branched off separately and then
gets merged into the branch once I'm happy with the testing.  By
splitting things out like this I'm helping ensure that if a patch has
problems it only causes issues on the individual series and there's less
stuff to to pick through and redo in case of problems.

--CUfgB8w4ZwR/yMy5
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl/g3MIACgkQJNaLcl1U
h9BdHwf/Ra+5kLodPxHMIpnI3zVzcoWgk5T5S2VsmChfQY3xhBNpuKCipcvi29hN
QR1DxTYefgopwrgfRAv5m7TGnpsyeTwXFY6R17wdDTqR+ILpE+X9VDVrwU6Oqjvm
74nqOccZVXxEFhmdKkO4qUKmif4WhG3ek2tgXd8WTo81ryGVccykNjA1My+uS+dE
b/aYVNsNMJKoDucNyBvF6ji44BgLxIZVbIquqS4xD9EMKiwYDBrS3hbJ/yYgnaSC
en1Erfy2aMsN9gsnGZaQh5pDrjPvbqxsqFDsKPMyInZBLc6y1ZIUQUMu4kOEKDtc
NRN8zATnl8flHOuxTPZ5WCV6fC2lIg==
=affy
-----END PGP SIGNATURE-----

--CUfgB8w4ZwR/yMy5--
