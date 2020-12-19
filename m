Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by mx.groups.io with SMTP id smtpd.web12.14712.1608410899719688795
 for <tools@linux.kernel.org>;
 Sat, 19 Dec 2020 12:48:19 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kernel.org header.s=k20201202 header.b=OAzPGpig;
 spf=pass (domain: kernel.org, ip: 198.145.29.99, mailfrom: acme@kernel.org)
Date: Sat, 19 Dec 2020 17:48:32 -0300
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1608410899;
	bh=tjSHQEHKAloxK0xUFa0w00kk+4kj5CkgPeLcF0+e2/s=;
	h=From:To:Cc:Subject:References:In-Reply-To:From;
	b=OAzPGpig5Eni+RFlEmzmIneiafcNoDJRwLSNvEW3zGnE//WmbEpN/Yuq732VhrOX3
	 8pEBNhUsgFYK7TqsmfdLbwb9LQC//purydIbH/vkPQr0L9WFKJFqzn/7vcNebWXtmI
	 u8McRkvcnEpoNfmK8g8NNbFWEOgtHI90QnpO9kQNrGVVJNUpujcIZ5CAsZ5Ni8TSp/
	 V/RfsGxqq02dH9ibkJBcKHPKc3KV2k0NTERgOOKX5wRuS3HMNhf3rhBtaNIN9dA4qA
	 jx9HqorD3NBoGyNa96oF+CMTygDahhA4FBZ6DnZ1Eh/9I8zIypcWyf9C/k/SMXaozo
	 l7ACCJGDyTXog==
From: "Arnaldo Carvalho de Melo" <acme@kernel.org>
To: James Bottomley <James.Bottomley@hansenpartnership.com>
Cc: Jonathan Corbet <corbet@lwn.net>, toke@toke.dk,
	Konstantin Ryabitsev <konstantin@linuxfoundation.org>,
	users@linux.kernel.org, tools@linux.kernel.org,
	Jens Axboe <axboe@kernel.dk>
Subject: Re: [kernel.org users] b4: encouraging using the cover letter in merge commits?
Message-ID: <20201219204832.GA363602@kernel.org>
References: <877dpeol5w.fsf@toke.dk>
 <bdffc35910338117c6ed66f6dfac2dc13d6ed03a.camel@HansenPartnership.com>
 <87y2hum0t0.fsf@toke.dk>
 <fc05bad0b5517500e62b271b8896f142060b235e.camel@HansenPartnership.com>
 <20201219114529.42058976@lwn.net>
 <b6094139488f2b725eb6ef632afa04f349980949.camel@HansenPartnership.com>
 <20201219115716.416fa2df@lwn.net>
 <12042294a3996c27d4f595f26bc1f54c1a4543a2.camel@HansenPartnership.com>
MIME-Version: 1.0
In-Reply-To: <12042294a3996c27d4f595f26bc1f54c1a4543a2.camel@HansenPartnership.com>
X-Url: http://acmel.wordpress.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Em Sat, Dec 19, 2020 at 11:03:59AM -0800, James Bottomley escreveu:
> On Sat, 2020-12-19 at 11:57 -0700, Jonathan Corbet wrote:
> > On Sat, 19 Dec 2020 10:49:21 -0800
> > "James Bottomley" <James.Bottomley@HansenPartnership.com> wrote:
> > 
> > > However, the link tag does preserve the cover letter and all the
> > > series information, why do you think it doesn't?
> > 
> > The information is essentially there, though one step further removed
> > from the repository.  But it documents the series as posted, not as
> > applied; one expects the two to be the same most of the time, but
> > that's not always the case.
> 
> But if it's not the case the change is supposed to be documented in the
> commit in square brackets.  I suppose the one interesting case is when
> a commit gets dropped from a series, but that should be somewhere in
> the link tag email trail.
> 
> > We're getting into minor details, though.  If The Community were to
> > decide somehow that link tags are The Preferred Way, I would not kick
> > and scream too hard before going along with it.  Unless I were in one
> > of my screaming moods at the time, of course.
> 
> I'm not really seeking a preferred way, I'm just asking why people who
> now use the link tag and linear series should change.  As long as we
> can agree the link tag is fine and there's really no additional
> information that needs capturing, I think we can leave it to maintainer
> discretion whether they prefer merge per series or linear.

My question is: is the information in the cover letter useful? If it is,
why not have it preserved in the main repo? The owner of such
repositories asks us to describe what is in the series, sign it, and
then this gets dropped?

- Arnaldo
