Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by mx.groups.io with SMTP id smtpd.web11.15468.1608414217643329884
 for <tools@linux.kernel.org>;
 Sat, 19 Dec 2020 13:43:37 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kernel.org header.s=k20201202 header.b=N30Hopmn;
 spf=pass (domain: kernel.org, ip: 198.145.29.99, mailfrom: acme@kernel.org)
Date: Sat, 19 Dec 2020 18:43:51 -0300
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1608414217;
	bh=/vh5wxtljVJR6fRRkIFykrkt+MU8oVPvbWpzJdM4q1o=;
	h=From:To:Cc:Subject:References:In-Reply-To:From;
	b=N30Hopmnid9u6WdJhn94iMpObgxCA8etbIDjC8F1Z/hu2l7BSoh05PFj0j8+k/f06
	 gXqcWo0FoBF2C6/pGNc27Jf1wyAb8jEXABr4aU7GL8B/4AOzxLBFQldusWgwS44UBh
	 2lSdx9R8fnZXndrw1PFdW4AO0djnt3PEKCmDl6WE+6MbF3PfshFiBDgano5hcI/dJu
	 j8eBilWQNX++7kz095FQvePxA9yH3r1lnoMsn1BOR4tilLrWq0L/Nz6EgidH4ZJGzX
	 bzoe3z9ZfLZqMkgX6AaNoKl7hbAwnWx+JIIIXE63M68xS+LjNKeWtQXOKFflndyoQY
	 bE4kjAwU3oJ5Q==
From: "Arnaldo Carvalho de Melo" <acme@kernel.org>
To: James Bottomley <James.Bottomley@hansenpartnership.com>
Cc: Jonathan Corbet <corbet@lwn.net>, toke@toke.dk,
	Konstantin Ryabitsev <konstantin@linuxfoundation.org>,
	users@linux.kernel.org, tools@linux.kernel.org,
	Jens Axboe <axboe@kernel.dk>
Subject: Re: [kernel.org users] b4: encouraging using the cover letter in merge commits?
Message-ID: <20201219214351.GC363602@kernel.org>
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
MIME-Version: 1.0
In-Reply-To: <e700a8744c3b32070977bf672cd6788e12d6b7d5.camel@HansenPartnership.com>
X-Url: http://acmel.wordpress.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Em Sat, Dec 19, 2020 at 01:01:43PM -0800, James Bottomley escreveu:
> On Sat, 2020-12-19 at 17:48 -0300, Arnaldo Carvalho de Melo wrote:
> > Em Sat, Dec 19, 2020 at 11:03:59AM -0800, James Bottomley escreveu:
> > > On Sat, 2020-12-19 at 11:57 -0700, Jonathan Corbet wrote:
> [...]
> > > > We're getting into minor details, though.  If The Community were
> > > > to decide somehow that link tags are The Preferred Way, I would
> > > > not kick and scream too hard before going along with it.  Unless
> > > > I were in one of my screaming moods at the time, of course.
> > > 
> > > I'm not really seeking a preferred way, I'm just asking why people
> > > who now use the link tag and linear series should change.  As long
> > > as we can agree the link tag is fine and there's really no
> > > additional information that needs capturing, I think we can leave
> > > it to maintainer discretion whether they prefer merge per series or
> > > linear.
> > 
> > My question is: is the information in the cover letter useful? 
> 
> I think it is but it's not vital to understanding individual commits,
> which should be properly described.

Agreed.
 
> > If it is, why not have it preserved in the main repo?
> 
> Because the link tag supplies it and works with current linear
> workflows.  To mandate storing the cover letter, people using linear
> workflows have to move to a new method.

But that points to outside the main repository.
 
> >  The owner of such repositories asks us to describe what is in the
> > series, sign it, and then this gets dropped?
 
> Um, well we don't have people sign the cover letter.  We just have it
> describe the current series and its history.  Plus it doesn't get
> dropped ... it's in the email history, pointed to by the link tag,
> which is often a lot richer than the bare cover letter anyway.

I agree the link tag is valuable, but it points to outside the repo.
 
> The main point is we have two pieces of information:  The precise
> description of what each commit does, which should be in the tree.  And

I often have this problem with submitters: things that should be at
individual commits are grouped in the cover letter, makes my life
harder, as I'll end up having more work to do to move that to where it
belong: individual commits.

But we are digressing, assuming what is in the cover letter is not what
should be in individual commits but has value, why not have it preserved
upstream?

- Arnaldo

> the historical record of how the patch series got to where it was
> committed, which is in the email archives.  The the cover letter is
> usually not an accurate synopsis of this, which is why I prefer link
> tags to the full history, but my preference isn't strong enough to
> overrule people who want to store the cover letter.
> 
> James
> 
> 

-- 

- Arnaldo
