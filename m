Received: from bedivere.hansenpartnership.com (bedivere.hansenpartnership.com [96.44.175.130])
 by mx.groups.io with SMTP id smtpd.web08.13286.1608404641609619403
 for <tools@linux.kernel.org>;
 Sat, 19 Dec 2020 11:04:01 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@hansenpartnership.com header.s=20151216 header.b=ksCjUEPx;
 spf=pass (domain: hansenpartnership.com, ip: 96.44.175.130, mailfrom: james.bottomley@hansenpartnership.com)
Received: from localhost (localhost [127.0.0.1])
	by bedivere.hansenpartnership.com (Postfix) with ESMTP id 2369B12807D2;
	Sat, 19 Dec 2020 11:04:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
	d=hansenpartnership.com; s=20151216; t=1608404641;
	bh=5tyAXzCdpUzscUyaX1K4noq8Tnk8wCfYzhbhIMTWVGo=;
	h=Message-ID:Subject:From:To:Date:In-Reply-To:References:From;
	b=ksCjUEPxY9coWBy63ymGRluwh8ZDBdc/1+z1Ux1QeFahPv3mFIfJaJoS4p1yya575
	 PN7cRSBYvg3bHziuimzzTfCN1mrC7g2UAf+vcuCQWmY7dgWnB0nLQ+dDWoRa5Wpexh
	 mqiB+CkVj71G23QHWSDt+leOTUdvBXuxRfV7Wg/Y=
Received: from bedivere.hansenpartnership.com ([127.0.0.1])
	by localhost (bedivere.hansenpartnership.com [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id PKQFLaC7P9fU; Sat, 19 Dec 2020 11:04:01 -0800 (PST)
Received: from jarvis.int.hansenpartnership.com (c-73-35-198-56.hsd1.wa.comcast.net [73.35.198.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by bedivere.hansenpartnership.com (Postfix) with ESMTPSA id 9BCC8128079B;
	Sat, 19 Dec 2020 11:04:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
	d=hansenpartnership.com; s=20151216; t=1608404641;
	bh=5tyAXzCdpUzscUyaX1K4noq8Tnk8wCfYzhbhIMTWVGo=;
	h=Message-ID:Subject:From:To:Date:In-Reply-To:References:From;
	b=ksCjUEPxY9coWBy63ymGRluwh8ZDBdc/1+z1Ux1QeFahPv3mFIfJaJoS4p1yya575
	 PN7cRSBYvg3bHziuimzzTfCN1mrC7g2UAf+vcuCQWmY7dgWnB0nLQ+dDWoRa5Wpexh
	 mqiB+CkVj71G23QHWSDt+leOTUdvBXuxRfV7Wg/Y=
Message-ID: <12042294a3996c27d4f595f26bc1f54c1a4543a2.camel@HansenPartnership.com>
Subject: Re: [kernel.org users] b4: encouraging using the cover letter in merge commits?
From: "James Bottomley" <James.Bottomley@HansenPartnership.com>
To: Jonathan Corbet <corbet@lwn.net>
Cc: toke@toke.dk, Konstantin Ryabitsev <konstantin@linuxfoundation.org>, 
 users@linux.kernel.org, tools@linux.kernel.org, Jens Axboe
 <axboe@kernel.dk>,  Arnaldo Carvalho de Melo <acme@kernel.org>
Date: Sat, 19 Dec 2020 11:03:59 -0800
In-Reply-To: <20201219115716.416fa2df@lwn.net>
References: <877dpeol5w.fsf@toke.dk>
	 <bdffc35910338117c6ed66f6dfac2dc13d6ed03a.camel@HansenPartnership.com>
	 <87y2hum0t0.fsf@toke.dk>
	 <fc05bad0b5517500e62b271b8896f142060b235e.camel@HansenPartnership.com>
	 <20201219114529.42058976@lwn.net>
	 <b6094139488f2b725eb6ef632afa04f349980949.camel@HansenPartnership.com>
	 <20201219115716.416fa2df@lwn.net>
User-Agent: Evolution 3.34.4 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Sat, 2020-12-19 at 11:57 -0700, Jonathan Corbet wrote:
> On Sat, 19 Dec 2020 10:49:21 -0800
> "James Bottomley" <James.Bottomley@HansenPartnership.com> wrote:
> 
> > However, the link tag does preserve the cover letter and all the
> > series information, why do you think it doesn't?
> 
> The information is essentially there, though one step further removed
> from the repository.  But it documents the series as posted, not as
> applied; one expects the two to be the same most of the time, but
> that's not always the case.

But if it's not the case the change is supposed to be documented in the
commit in square brackets.  I suppose the one interesting case is when
a commit gets dropped from a series, but that should be somewhere in
the link tag email trail.

> We're getting into minor details, though.  If The Community were to
> decide somehow that link tags are The Preferred Way, I would not kick
> and scream too hard before going along with it.  Unless I were in one
> of my screaming moods at the time, of course.

I'm not really seeking a preferred way, I'm just asking why people who
now use the link tag and linear series should change.  As long as we
can agree the link tag is fine and there's really no additional
information that needs capturing, I think we can leave it to maintainer
discretion whether they prefer merge per series or linear.

James


