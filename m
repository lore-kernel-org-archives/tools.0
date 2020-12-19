Received: from bedivere.hansenpartnership.com (bedivere.hansenpartnership.com [96.44.175.130])
 by mx.groups.io with SMTP id smtpd.web12.15628.1608415028116277674
 for <tools@linux.kernel.org>;
 Sat, 19 Dec 2020 13:57:08 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@hansenpartnership.com header.s=20151216 header.b=eUvS6sdl;
 spf=pass (domain: hansenpartnership.com, ip: 96.44.175.130, mailfrom: james.bottomley@hansenpartnership.com)
Received: from localhost (localhost [127.0.0.1])
	by bedivere.hansenpartnership.com (Postfix) with ESMTP id A1E1B1280711;
	Sat, 19 Dec 2020 13:57:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
	d=hansenpartnership.com; s=20151216; t=1608415027;
	bh=hQKqG30fmxJVwgIXNKyUPTkmP7xDfgvtw3fN0RCR5JI=;
	h=Message-ID:Subject:From:To:Date:In-Reply-To:References:From;
	b=eUvS6sdlsU6k9wMHOU0YSfKcIi7gu82mGZ4XOr8mBwz3lx+t7srILvLpbGG08vZkM
	 2fxa8lN1DdOODiJCCQ/3hFwcgZKL4B2KQb4AoPT7ycijo/hwlRKV4c4O1VA4xRaoyr
	 MotSK4Jt7Al0aWwDVJS4JiiR0nvg4eFvGEeuBTX4=
Received: from bedivere.hansenpartnership.com ([127.0.0.1])
	by localhost (bedivere.hansenpartnership.com [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id rLFtagN4xYM7; Sat, 19 Dec 2020 13:57:07 -0800 (PST)
Received: from jarvis.int.hansenpartnership.com (c-73-35-198-56.hsd1.wa.comcast.net [73.35.198.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by bedivere.hansenpartnership.com (Postfix) with ESMTPSA id 125671280710;
	Sat, 19 Dec 2020 13:57:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
	d=hansenpartnership.com; s=20151216; t=1608415027;
	bh=hQKqG30fmxJVwgIXNKyUPTkmP7xDfgvtw3fN0RCR5JI=;
	h=Message-ID:Subject:From:To:Date:In-Reply-To:References:From;
	b=eUvS6sdlsU6k9wMHOU0YSfKcIi7gu82mGZ4XOr8mBwz3lx+t7srILvLpbGG08vZkM
	 2fxa8lN1DdOODiJCCQ/3hFwcgZKL4B2KQb4AoPT7ycijo/hwlRKV4c4O1VA4xRaoyr
	 MotSK4Jt7Al0aWwDVJS4JiiR0nvg4eFvGEeuBTX4=
Message-ID: <f680b34d8bb711ce37627253d21478b02cdc5bee.camel@HansenPartnership.com>
Subject: Re: [kernel.org users] b4: encouraging using the cover letter in merge commits?
From: "James Bottomley" <James.Bottomley@HansenPartnership.com>
To: Arnaldo Carvalho de Melo <acme@kernel.org>
Cc: Jonathan Corbet <corbet@lwn.net>, toke@toke.dk, Konstantin Ryabitsev
	 <konstantin@linuxfoundation.org>, users@linux.kernel.org, 
	tools@linux.kernel.org, Jens Axboe <axboe@kernel.dk>
Date: Sat, 19 Dec 2020 13:57:06 -0800
In-Reply-To: <20201219214351.GC363602@kernel.org>
References: <877dpeol5w.fsf@toke.dk>
	 <bdffc35910338117c6ed66f6dfac2dc13d6ed03a.camel@HansenPartnership.com>
	 <87y2hum0t0.fsf@toke.dk>
	 <fc05bad0b5517500e62b271b8896f142060b235e.camel@HansenPartnership.com>
	 <20201219114529.42058976@lwn.net>
	 <b6094139488f2b725eb6ef632afa04f349980949.camel@HansenPartnership.com>
	 <20201219115716.416fa2df@lwn.net>
	 <12042294a3996c27d4f595f26bc1f54c1a4543a2.camel@HansenPartnership.com>
	 <20201219204832.GA363602@kernel.org>
	 <e700a8744c3b32070977bf672cd6788e12d6b7d5.camel@HansenPartnership.com>
	 <20201219214351.GC363602@kernel.org>
User-Agent: Evolution 3.34.4 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Sat, 2020-12-19 at 18:43 -0300, Arnaldo Carvalho de Melo wrote:
> Em Sat, Dec 19, 2020 at 01:01:43PM -0800, James Bottomley escreveu:
> > On Sat, 2020-12-19 at 17:48 -0300, Arnaldo Carvalho de Melo wrote:
> > > Em Sat, Dec 19, 2020 at 11:03:59AM -0800, James Bottomley
> > > escreveu:
> > > > On Sat, 2020-12-19 at 11:57 -0700, Jonathan Corbet wrote:
> > [...]
> > > > > We're getting into minor details, though.  If The Community
> > > > > were to decide somehow that link tags are The Preferred Way,
> > > > > I would not kick and scream too hard before going along with
> > > > > it.  Unless I were in one of my screaming moods at the time,
> > > > > of course.
> > > > 
> > > > I'm not really seeking a preferred way, I'm just asking why
> > > > people who now use the link tag and linear series should
> > > > change.  As long as we can agree the link tag is fine and
> > > > there's really no additional information that needs capturing,
> > > > I think we can leave it to maintainer discretion whether they
> > > > prefer merge per series or linear.
> > > 
> > > My question is: is the information in the cover letter useful? 
> > 
> > I think it is but it's not vital to understanding individual
> > commits, which should be properly described.
> 
> Agreed.
>  
> > > If it is, why not have it preserved in the main repo?
> > 
> > Because the link tag supplies it and works with current linear
> > workflows.  To mandate storing the cover letter, people using
> > linear workflows have to move to a new method.
> 
> But that points to outside the main repository.

Yes, but I don't see this as a problem.  The whole point of having
infrastructure which dereferences msgid links is that we can use it.

If this is an argument about having all the information in the repo, I
really don't think it's worth it.  All the nuance is stored in the
email trail, so simply pointing at it seems far easier.  Also, however
carefully you harvest the cover letter and relevant details into the
merge commit, you'll always miss something sometimes.  I think even net
admits this by doing both cover letter and link tag.

> > >  The owner of such repositories asks us to describe what is in
> > > the series, sign it, and then this gets dropped?
>  
> > Um, well we don't have people sign the cover letter.  We just have
> > it describe the current series and its history.  Plus it doesn't
> > get dropped ... it's in the email history, pointed to by the link
> > tag, which is often a lot richer than the bare cover letter anyway.
> 
> I agree the link tag is valuable, but it points to outside the repo.
>  
> > The main point is we have two pieces of information:  The precise
> > description of what each commit does, which should be in the
> > tree.  And
> 
> I often have this problem with submitters: things that should be at
> individual commits are grouped in the cover letter, makes my life
> harder, as I'll end up having more work to do to move that to where
> it belong: individual commits.

Well, we tend to make them do a rewrite.  Although I have to confess a
lot of it, after upteen iterations of commit messages which reproduce
the C code in slightly different English each time, becomes "get the
series into shape and we'll write the commit text for you" (or in the
case of SCSI, Martin will rewrite the commit message for you ...).

But the danger of having the cover letter is precisely that you are
less apt to be strict about the commit message, which can be confusing
for someone else when looking for a bug because they'll be going on the
commit text.

> But we are digressing, assuming what is in the cover letter is not
> what should be in individual commits but has value, why not have it
> preserved upstream?

Because on its own it's incomplete and we have other mechanisms to keep
the full historical record.

James


