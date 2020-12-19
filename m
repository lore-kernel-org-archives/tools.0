Received: from bedivere.hansenpartnership.com (bedivere.hansenpartnership.com [96.44.175.130])
 by mx.groups.io with SMTP id smtpd.web12.14893.1608411710964910591
 for <tools@linux.kernel.org>;
 Sat, 19 Dec 2020 13:01:51 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@hansenpartnership.com header.s=20151216 header.b=KskAF27h;
 spf=pass (domain: hansenpartnership.com, ip: 96.44.175.130, mailfrom: james.bottomley@hansenpartnership.com)
Received: from localhost (localhost [127.0.0.1])
	by bedivere.hansenpartnership.com (Postfix) with ESMTP id 3E31412807D2;
	Sat, 19 Dec 2020 13:01:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
	d=hansenpartnership.com; s=20151216; t=1608411705;
	bh=JQGQoT88Cf5FEUiN7PVVbHVIsBo8WYT9dmffqzqEXLk=;
	h=Message-ID:Subject:From:To:Date:In-Reply-To:References:From;
	b=KskAF27hFvWb6RoolNmqXzAa2hXggp2W4iuCcoETgPU+Ri1qL0v7wn8cn9/0wdlQz
	 XljkGktGtjvBxP+Ivp+pp6KMrsScB3cyN8clyns59qS9p1LttL5jsItjfU2f3KcVe4
	 nWhQLQ9JELYiD+VdaVxcEjK/H0ODtwos8PnCRKwU=
Received: from bedivere.hansenpartnership.com ([127.0.0.1])
	by localhost (bedivere.hansenpartnership.com [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 8kvaR-7xtKzy; Sat, 19 Dec 2020 13:01:45 -0800 (PST)
Received: from jarvis.int.hansenpartnership.com (c-73-35-198-56.hsd1.wa.comcast.net [73.35.198.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by bedivere.hansenpartnership.com (Postfix) with ESMTPSA id 900CB128079B;
	Sat, 19 Dec 2020 13:01:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
	d=hansenpartnership.com; s=20151216; t=1608411704;
	bh=JQGQoT88Cf5FEUiN7PVVbHVIsBo8WYT9dmffqzqEXLk=;
	h=Message-ID:Subject:From:To:Date:In-Reply-To:References:From;
	b=m5MASSezO1nhDvlicNenC6VnEqOGTnMUr6SN1R5feG4VGPi7KIx60z2ZO7Ruh3xKx
	 7EWis4FcSOB0XUf2JVQ9VcIccEC62WpGO13i/BXYk+3lAMRLgFxVfEbN959FnqfNu6
	 lCrzXGDWT3SRQi/PtKXTpesId/80IzCVvGgy/lCg=
Message-ID: <e700a8744c3b32070977bf672cd6788e12d6b7d5.camel@HansenPartnership.com>
Subject: Re: [kernel.org users] b4: encouraging using the cover letter in merge commits?
From: "James Bottomley" <James.Bottomley@HansenPartnership.com>
To: Arnaldo Carvalho de Melo <acme@kernel.org>
Cc: Jonathan Corbet <corbet@lwn.net>, toke@toke.dk, Konstantin Ryabitsev
	 <konstantin@linuxfoundation.org>, users@linux.kernel.org, 
	tools@linux.kernel.org, Jens Axboe <axboe@kernel.dk>
Date: Sat, 19 Dec 2020 13:01:43 -0800
In-Reply-To: <20201219204832.GA363602@kernel.org>
References: <877dpeol5w.fsf@toke.dk>
	 <bdffc35910338117c6ed66f6dfac2dc13d6ed03a.camel@HansenPartnership.com>
	 <87y2hum0t0.fsf@toke.dk>
	 <fc05bad0b5517500e62b271b8896f142060b235e.camel@HansenPartnership.com>
	 <20201219114529.42058976@lwn.net>
	 <b6094139488f2b725eb6ef632afa04f349980949.camel@HansenPartnership.com>
	 <20201219115716.416fa2df@lwn.net>
	 <12042294a3996c27d4f595f26bc1f54c1a4543a2.camel@HansenPartnership.com>
	 <20201219204832.GA363602@kernel.org>
User-Agent: Evolution 3.34.4 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Sat, 2020-12-19 at 17:48 -0300, Arnaldo Carvalho de Melo wrote:
> Em Sat, Dec 19, 2020 at 11:03:59AM -0800, James Bottomley escreveu:
> > On Sat, 2020-12-19 at 11:57 -0700, Jonathan Corbet wrote:
[...]
> > > We're getting into minor details, though.  If The Community were
> > > to decide somehow that link tags are The Preferred Way, I would
> > > not kick and scream too hard before going along with it.  Unless
> > > I were in one of my screaming moods at the time, of course.
> > 
> > I'm not really seeking a preferred way, I'm just asking why people
> > who now use the link tag and linear series should change.  As long
> > as we can agree the link tag is fine and there's really no
> > additional information that needs capturing, I think we can leave
> > it to maintainer discretion whether they prefer merge per series or
> > linear.
> 
> My question is: is the information in the cover letter useful? 

I think it is but it's not vital to understanding individual commits,
which should be properly described.

> If it is, why not have it preserved in the main repo?

Because the link tag supplies it and works with current linear
workflows.  To mandate storing the cover letter, people using linear
workflows have to move to a new method.

>  The owner of such repositories asks us to describe what is in the
> series, sign it, and then this gets dropped?

Um, well we don't have people sign the cover letter.  We just have it
describe the current series and its history.  Plus it doesn't get
dropped ... it's in the email history, pointed to by the link tag,
which is often a lot richer than the bare cover letter anyway.

The main point is we have two pieces of information:  The precise
description of what each commit does, which should be in the tree.  And
the historical record of how the patch series got to where it was
committed, which is in the email archives.  The the cover letter is
usually not an accurate synopsis of this, which is why I prefer link
tags to the full history, but my preference isn't strong enough to
overrule people who want to store the cover letter.

James


