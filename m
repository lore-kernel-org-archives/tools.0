Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by mx.groups.io with SMTP id smtpd.web10.12146.1608398488502403534
 for <tools@linux.kernel.org>;
 Sat, 19 Dec 2020 09:21:28 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kernel.org header.s=k20201202 header.b=nOwcylPU;
 spf=pass (domain: kernel.org, ip: 198.145.29.99, mailfrom: kuba@kernel.org)
Date: Sat, 19 Dec 2020 09:21:26 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1608398488;
	bh=yoklJJspiSgOPlrRrV4lCvv4W/SPxMv7PWg4tyC7/HU=;
	h=From:To:Cc:Subject:In-Reply-To:References:From;
	b=nOwcylPUv84uP/ZddkOj8CgtCzbOhZx+AyF0saHV6Kd0siFzg4/q0o+Ocopl68xRx
	 3tbHTxxun3kU3kdPMYtmen1gpVKtT2QbpI4US2x3+uCLr2IDBT0ACw0KcOHcAn27mO
	 Vrn1dFvj2AJZitlGLBoJnf/MhBm7VX074JqVgeikjNOyevQ00uWQui8zdbGPn0eLOL
	 MPc2m2P9JzlTJ3ZRp3EUSC77KUhcs5iUG+DzopKMQpbIMpf6a0ifSkv1KuOGMYRMft
	 wwL3CEMfiu0qxZlJ0Ul0Y+LyUhFPwfr17gQ69dJAvhC3/jEMRrkqef1HKoDvQ8hPkj
	 Uk6xlbPCVNEZA==
From: Jakub Kicinski <kuba@kernel.org>
To: "James Bottomley" <James.Bottomley@HansenPartnership.com>
Cc: toke@toke.dk, Konstantin Ryabitsev <konstantin@linuxfoundation.org>,
 users@linux.kernel.org, tools@linux.kernel.org, Jens Axboe
 <axboe@kernel.dk>, Arnaldo Carvalho de Melo <acme@kernel.org>
Subject: Re: [kernel.org users] b4: encouraging using the cover letter in merge commits?
Message-ID: <20201219092126.5633d02f@kicinski-fedora-pc1c0hjn.dhcp.thefacebook.com>
In-Reply-To: <fc05bad0b5517500e62b271b8896f142060b235e.camel@HansenPartnership.com>
References: <877dpeol5w.fsf@toke.dk>
	<bdffc35910338117c6ed66f6dfac2dc13d6ed03a.camel@HansenPartnership.com>
	<87y2hum0t0.fsf@toke.dk>
	<fc05bad0b5517500e62b271b8896f142060b235e.camel@HansenPartnership.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Sat, 19 Dec 2020 09:03:36 -0800 James Bottomley wrote:
> > I agree that the cover letter is useful more often than not and
> > ideally it would be included in most cases. In netdev/bpf land the
> > maintainers do this by always creating a merge commit when applying a
> > multi-part series; here's Daniel applying one of mine, for instance:
> > 
> > https://git.kernel.org/pub/scm/linux/kernel/git/netdev/net-next.git/commit/?id=4e083fdfa39db29bbc7725e229e701867d0da183
> > 
> > I personally think this practice is pretty nice, and so I was hoping
> > that supporting this workflow in b4 could be a way to encourage other
> > maintainers to take up the practice as well :)  
> 
> I've got to say that creating a spurious merge for the cover letter
> looks even more tortuous than creating an empty commit.  What
> advantages does this have over the existing link tag practice which is
> the one that we now use instead of the empty commit?

May be a chicken and an egg problem in case of other subsystems.

DaveM started creating those merge commits long before Links were 
a thing (let alone lore). That gave netdev developers the ability 
to provide a high level description of their work, reasons, goals 
in the cover letter, rather than one of the commit messages. For
a series with changes finely split for ease of review it's often
awkward to pick on which commit to put that information.

Obviously the cover letter information may be made available via 
the Link, but there's obvious value in seeing the information in 
the repo, after all we don't replace commit messages with links.

We obviously have scripts to do this, we pull the relevant info 
out of patchwork:

https://git.kernel.org/pub/scm/linux/kernel/git/dborkman/pw.git/ 
