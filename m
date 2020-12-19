Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
 by mx.groups.io with SMTP id smtpd.web12.13104.1608403531589044697
 for <tools@linux.kernel.org>;
 Sat, 19 Dec 2020 10:45:32 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@lwn.net header.s=20201203 header.b=LLKHbKz4;
 spf=pass (domain: lwn.net, ip: 45.79.88.28, mailfrom: corbet@lwn.net)
Received: from lwn.net (localhost [127.0.0.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id 73EE29AC;
	Sat, 19 Dec 2020 18:45:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 73EE29AC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1608403530; bh=BPBD2QfXrEXeUbKzbB9F4oA0iuKDoE/L6FSsA9RXcQE=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=LLKHbKz4kh+aeJm7LVQ+UerQ0tAnsMcxzUI8A+WjtRjthZt0bFZTZOYlm7mvlbNzV
	 kWpe4ALnGQnIKg0xB8NXVurVj10xLX3R80B/0Dej2J2GXBYtZ+D8rG/Ye7p1y8zCdw
	 mHsD/KY+OejdRpayBHcNwlZ5XNj+TglqoxKa2IE4P9MC8EdRNC2deeM5YSr+bdaon0
	 MVNMx5lUvCBpVevSgE0v/3geiFZ5dRi6UJe6Z2lBrNicfF0h0XokTrSFzs1a7BvTMv
	 WJyDpdjAfaTakd1cFSK5+8fds8Lv0Q+iVQiGRMUGv2Wi1EXJa0jkFX1Pl23tHgzaxX
	 Sm2ngrl4VxgJw==
Date: Sat, 19 Dec 2020 11:45:29 -0700
From: "Jonathan Corbet" <corbet@lwn.net>
To: "James Bottomley" <James.Bottomley@HansenPartnership.com>
Cc: toke@toke.dk, Konstantin Ryabitsev <konstantin@linuxfoundation.org>,
 users@linux.kernel.org, tools@linux.kernel.org, Jens Axboe
 <axboe@kernel.dk>, Arnaldo Carvalho de Melo <acme@kernel.org>
Subject: Re: [kernel.org users] b4: encouraging using the cover letter in merge commits?
Message-ID: <20201219114529.42058976@lwn.net>
In-Reply-To: <fc05bad0b5517500e62b271b8896f142060b235e.camel@HansenPartnership.com>
References: <877dpeol5w.fsf@toke.dk>
	<bdffc35910338117c6ed66f6dfac2dc13d6ed03a.camel@HansenPartnership.com>
	<87y2hum0t0.fsf@toke.dk>
	<fc05bad0b5517500e62b271b8896f142060b235e.camel@HansenPartnership.com>
Organization: LWN.net
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Sat, 19 Dec 2020 09:03:36 -0800
"James Bottomley" <James.Bottomley@HansenPartnership.com> wrote:

> I've got to say that creating a spurious merge for the cover letter
> looks even more tortuous than creating an empty commit.  What
> advantages does this have over the existing link tag practice which is
> the one that we now use instead of the empty commit?

I do that too when I have a significant series with information in the
cover that seems like it should be preserved; it's easy enough to do.  I
like the merge commit because it clearly ties the cover letter with the
series of patches it describes; an empty commit or link tag wouldn't do
that.

jon
