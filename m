Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
 by mx.groups.io with SMTP id smtpd.web10.13480.1608404238044350529
 for <tools@linux.kernel.org>;
 Sat, 19 Dec 2020 10:57:18 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@lwn.net header.s=20201203 header.b=NXULm4fd;
 spf=pass (domain: lwn.net, ip: 45.79.88.28, mailfrom: corbet@lwn.net)
Received: from lwn.net (localhost [127.0.0.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id 3F93B99C;
	Sat, 19 Dec 2020 18:57:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 3F93B99C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1608404237; bh=MnaCDoqqNpaa7BEQqS7zPhRKCwKEMtPowd2Tcp8IOSY=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=NXULm4fdToIzubAAxbL8hW9YBqkNaChPHVC6MIfM8pdYwDOEsQcslzrigDMFRkCHi
	 UOMkxnwv9Czuy6yf/2W3FktPOC2QoJRFy67/fXepPk85ThXm8RpXm4mQzImc2HoYrT
	 rwAWJdRfm3jetd4TzaP/di/8nd7ViOs2etn0k/e9YyTAk4XQIBx8baczq66HxtvQ6i
	 vvsj9jx7sIvUlm8+bi+12cUJBYkSvjFLrTEY7NdMIa8EWU2PiYxKukpjBIYzo2VOqZ
	 QysCgRHQpsE5u2TdDW7rAfFIzTNvD+XOD0JJPtHkvV8TLjqnl/BVrqUBeP4seeS+wA
	 djG/jaNdGKFXQ==
Date: Sat, 19 Dec 2020 11:57:16 -0700
From: "Jonathan Corbet" <corbet@lwn.net>
To: "James Bottomley" <James.Bottomley@HansenPartnership.com>
Cc: toke@toke.dk, Konstantin Ryabitsev <konstantin@linuxfoundation.org>,
 users@linux.kernel.org, tools@linux.kernel.org, Jens Axboe
 <axboe@kernel.dk>, Arnaldo Carvalho de Melo <acme@kernel.org>
Subject: Re: [kernel.org users] b4: encouraging using the cover letter in merge commits?
Message-ID: <20201219115716.416fa2df@lwn.net>
In-Reply-To: <b6094139488f2b725eb6ef632afa04f349980949.camel@HansenPartnership.com>
References: <877dpeol5w.fsf@toke.dk>
	<bdffc35910338117c6ed66f6dfac2dc13d6ed03a.camel@HansenPartnership.com>
	<87y2hum0t0.fsf@toke.dk>
	<fc05bad0b5517500e62b271b8896f142060b235e.camel@HansenPartnership.com>
	<20201219114529.42058976@lwn.net>
	<b6094139488f2b725eb6ef632afa04f349980949.camel@HansenPartnership.com>
Organization: LWN.net
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Sat, 19 Dec 2020 10:49:21 -0800
"James Bottomley" <James.Bottomley@HansenPartnership.com> wrote:

> However, the link tag does preserve the cover letter and all the series
> information, why do you think it doesn't?

The information is essentially there, though one step further removed fro=
m
the repository.  But it documents the series as posted, not as applied;
one expects the two to be the same most of the time, but that's not alway=
s
the case.

We're getting into minor details, though.  If The Community were to decid=
e
somehow that link tags are The Preferred Way, I would not kick and scream
too hard before going along with it.  Unless I were in one of my screamin=
g
moods at the time, of course.

jon
