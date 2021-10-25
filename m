Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3BCC2CA4
	for <tools@linux.kernel.org>; Mon, 25 Oct 2021 19:37:37 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 26D73611AF;
	Mon, 25 Oct 2021 19:37:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1635190657;
	bh=Lxt9pkeeywjntTCFm0iUjnqvgBE2o41WVEbbTKOA8tM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=qKV7nZffjGXC9ON65UZWzZWTqrfxovvJoju1CkJ4dimujJelMLer0HmT6N8Y6y2nO
	 yhciPoI31kRAu8zpNkjd86PyMjARS/eWFubBcWtEgCThRWLdEDYTbc2TjHJp/Tg7mh
	 +IKqV5N0VNSvEcyz4QB+gAdBnrfO8CkI/n4SbZkNb8HV8Rmtd4vBvtVKY61KXt0mqB
	 EI/0ToRrTOzFZb+KHKJxrzLfxmViYeREqVIMMWmJxxj9y0usZIYysKRZpYUqYJYKbM
	 HlP7icEFGd8yUUuY23aLZKafnTQPC/T1OdEzPp1Ol+TZ/SmV44V5b9WrhKIzKMJ0wF
	 8V7DBxVdR0GrA==
Date: Mon, 25 Oct 2021 20:37:34 +0100
From: Mark Brown <broonie@kernel.org>
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc: tools@linux.kernel.org
Subject: Re: b4: shazam and ty flag changes
Message-ID: <YXcHfu5mTWkiHY6L@sirena.org.uk>
References: <20211020151043.dwbug4k5yeifqbhe@meerkat.local>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="8SNJ9tiA18TYTbeZ"
Content-Disposition: inline
In-Reply-To: <20211020151043.dwbug4k5yeifqbhe@meerkat.local>
X-Cookie: Kiss me twice.  I'm schizophrenic.


--8SNJ9tiA18TYTbeZ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Oct 20, 2021 at 11:10:43AM -0400, Konstantin Ryabitsev wrote:

>   - there's initial implementation to send out thanks-mail directly instead of
>     simply writing out .thanks files. It will look at any existing [sendemail]
>     git configuration already used by git-send-email, but only currently
>     supports the more popular subset of possible configuration parameters,
>     specifically:

>         sendemail.smtpServer
>         sendemail.smtpServerPort
>         sendemail.smtpEncryption
>         sendemail.smtpUser
>         sendemail.smtpPass
>         sendemail.from

git send-email also takes smtp. versions of all those parameters which
was what I was using, presumably it's renamed at some point.  If I
replicate them with sendemail I'm getting

	(535, b'5.7.8 Error: authentication failed: authentication failure')

when trying to send via mail.kernel.org as I usually do.

--8SNJ9tiA18TYTbeZ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmF3B34ACgkQJNaLcl1U
h9BqAAf/ZDdf12uZAfhHp8B/y1pvE83jiu2Fh3ywo2sjBBpw5w9xBjfVlqzDh/aO
725grz9Y8W5w+rBEeCT1E7NGSG55Ok7qw/VuZusYap7YLKZi/3zKc1t2vALqexYe
cSOf7ZUWfeyiWxPZNwQZyikfsjQTJ8HH3zOWjkRuVGqIs0epjG8n00Qlmtn7sFEe
xQtaxyNoUHv8A9eD50j9mpfQAVHZTBXd/BJKHSEcxrzZlO7wAOv7mNK0G4TKNO0S
2ZCEGJEN3nTHJWxVBE1jpZ8OIMohe3ZoBs4iVpbtSXTdDOt2hprCEZu1L756BUkP
pK+4rPPxecO3VXn9o14cMA8Dhypw3g==
=7ONE
-----END PGP SIGNATURE-----

--8SNJ9tiA18TYTbeZ--
