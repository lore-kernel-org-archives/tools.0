Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by mx.groups.io with SMTP id smtpd.web10.16176.1608416238085233091
 for <tools@linux.kernel.org>;
 Sat, 19 Dec 2020 14:17:18 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kernel.org header.s=k20201202 header.b=jyR3trfF;
 spf=pass (domain: kernel.org, ip: 198.145.29.99, mailfrom: acme@kernel.org)
Date: Sat, 19 Dec 2020 19:17:30 -0300
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1608416237;
	bh=VHsBvfK2ojcIqwpUm9ZsgMVTe96yEIKlpDPQU9lJ/fk=;
	h=From:To:Cc:Subject:References:In-Reply-To:From;
	b=jyR3trfF/Cg6Xjpyn6IFX5htB36ksqI6it9dT/kKDZnmi44GxHZszcGmsCdUP1+j6
	 gqpcseou0OINS1qor+3RB2GedlvrBVY8ByoiSBrR10sW0E3Jc0X8P0wpM2baCBof5d
	 BuKqamCpUuAjkoNrOx7Bl//fw1WWzW7g2j/WHdDkEpl98g/nQdjm0Wnoj+iW7BcvpQ
	 0M/CVipt02xdIU5VCdx/n9mwI9Ruz+7VkLTHpgUH43KNJ/X0ui7CIrXq6RlmSw78gC
	 QbS5UL+JzMKV4r9lFgPmilrzJoUzNGV155cLv4aIe5QF06RcJcsUJDy5D3o1Irbzmy
	 yxjHm4q8Q2mZQ==
From: "Arnaldo Carvalho de Melo" <acme@kernel.org>
To: James Bottomley <James.Bottomley@hansenpartnership.com>
Cc: Jonathan Corbet <corbet@lwn.net>, toke@toke.dk,
	Konstantin Ryabitsev <konstantin@linuxfoundation.org>,
	users@linux.kernel.org, tools@linux.kernel.org,
	Jens Axboe <axboe@kernel.dk>
Subject: Re: [kernel.org users] b4: encouraging using the cover letter in merge commits?
Message-ID: <20201219221730.GD363602@kernel.org>
References: <87y2hum0t0.fsf@toke.dk>
 <fc05bad0b5517500e62b271b8896f142060b235e.camel@HansenPartnership.com>
 <20201219114529.42058976@lwn.net>
 <b6094139488f2b725eb6ef632afa04f349980949.camel@HansenPartnership.com>
 <20201219115716.416fa2df@lwn.net>
 <12042294a3996c27d4f595f26bc1f54c1a4543a2.camel@HansenPartnership.com>
 <20201219204832.GA363602@kernel.org>
 <e700a8744c3b32070977bf672cd6788e12d6b7d5.camel@HansenPartnership.com>
 <20201219214351.GC363602@kernel.org>
 <f680b34d8bb711ce37627253d21478b02cdc5bee.camel@HansenPartnership.com>
MIME-Version: 1.0
In-Reply-To: <f680b34d8bb711ce37627253d21478b02cdc5bee.camel@HansenPartnership.com>
X-Url: http://acmel.wordpress.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Em Sat, Dec 19, 2020 at 01:57:06PM -0800, James Bottomley escreveu:
> On Sat, 2020-12-19 at 18:43 -0300, Arnaldo Carvalho de Melo wrote:
> > Em Sat, Dec 19, 2020 at 01:01:43PM -0800, James Bottomley escreveu:
> > > On Sat, 2020-12-19 at 17:48 -0300, Arnaldo Carvalho de Melo wrote:
> > > > Em Sat, Dec 19, 2020 at 11:03:59AM -0800, James Bottomley
> > > > escreveu:
> > > > > On Sat, 2020-12-19 at 11:57 -0700, Jonathan Corbet wrote:
> > > [...]
> > > > > > We're getting into minor details, though.  If The Community
> > > > > > were to decide somehow that link tags are The Preferred Way,
> > > > > > I would not kick and scream too hard before going along with
> > > > > > it.  Unless I were in one of my screaming moods at the time,
> > > > > > of course.
> > > > > 
> > > > > I'm not really seeking a preferred way, I'm just asking why
> > > > > people who now use the link tag and linear series should
> > > > > change.  As long as we can agree the link tag is fine and
> > > > > there's really no additional information that needs capturing,
> > > > > I think we can leave it to maintainer discretion whether they
> > > > > prefer merge per series or linear.
> > > > 
> > > > My question is: is the information in the cover letter useful? 
> > > 
> > > I think it is but it's not vital to understanding individual
> > > commits, which should be properly described.
> > 
> > Agreed.
> >  
> > > > If it is, why not have it preserved in the main repo?
> > > 
> > > Because the link tag supplies it and works with current linear
> > > workflows.  To mandate storing the cover letter, people using
> > > linear workflows have to move to a new method.
> > 
> > But that points to outside the main repository.

> infrastructure which dereferences msgid links is that we can use it.
 
> If this is an argument about having all the information in the repo, I
> really don't think it's worth it.

Not all the information, just the cover letters.

> All the nuance is stored in the email trail, so simply pointing at it
> seems far easier.  Also, however carefully you harvest the cover
> letter and relevant details into the merge commit, you'll always miss
> something sometimes.  I think even net admits this by doing both cover
> letter and link tag.

I'm not arguing about harvesting all the details, just the cover
letters.
 
> > > >  The owner of such repositories asks us to describe what is in
> > > > the series, sign it, and then this gets dropped?
  
> > > Um, well we don't have people sign the cover letter.  We just have
> > > it describe the current series and its history.  Plus it doesn't
> > > get dropped ... it's in the email history, pointed to by the link
> > > tag, which is often a lot richer than the bare cover letter anyway.

> > I agree the link tag is valuable, but it points to outside the repo.
  
> > > The main point is we have two pieces of information:  The precise
> > > description of what each commit does, which should be in the
> > > tree.  And
 
> > I often have this problem with submitters: things that should be at
> > individual commits are grouped in the cover letter, makes my life
> > harder, as I'll end up having more work to do to move that to where
> > it belong: individual commits.
 
> Well, we tend to make them do a rewrite.  Although I have to confess a

I have to learn, if for nothing else to teach a 5yo not to do like his
father ;-\

I want to make things progress, to avoid making these requests for doing
what is reasonable to do over and over again to downstreamers, so I end
up doing more work than I should.

But if cover letters were somehow preserved, I would just trow my hands
up and say: at least it is preserved in the repository history...

> lot of it, after upteen iterations of commit messages which reproduce
> the C code in slightly different English each time, becomes "get the
> series into shape and we'll write the commit text for you" (or in the
> case of SCSI, Martin will rewrite the commit message for you ...).
 
I can empathise with Martin.

> But the danger of having the cover letter is precisely that you are
> less apt to be strict about the commit message, which can be confusing
> for someone else when looking for a bug because they'll be going on the
> commit text.

I'm not trying to be strict, I'm trying to preserve information, trying
to be strict is making me lose a lot of time trying to herd a lot of
cats.
 
> > But we are digressing, assuming what is in the cover letter is not
> > what should be in individual commits but has value, why not have it
> > preserved upstream?
 
> Because on its own it's incomplete and we have other mechanisms to keep
> the full historical record.

I agree that link tags points to the relevant discussion, and I hope
that where that is preserved is available as long as the main repo is
available, but that is only a hope, as it is disjoint from the main
repository, keeping such valuable information in the main repository is
still important IMHO.

Its not like having cover letters in the main repository will cause
major disruption or excessive overhead.

Best regards,

- Arnaldo
