Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by mx.groups.io with SMTP id smtpd.web10.8450.1608618638943219566
 for <tools@linux.kernel.org>;
 Mon, 21 Dec 2020 22:30:39 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kernel.org header.s=k20201202 header.b=Fgox6j7M;
 spf=pass (domain: kernel.org, ip: 198.145.29.99, mailfrom: leon@kernel.org)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 76B382255F;
	Tue, 22 Dec 2020 06:30:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1608618638;
	bh=qiPV5psswwC0ZCuu6W0Gc3ZV79CfDLfCveygZiuJgdU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Fgox6j7MLv8k6n5DVQTdSeq96w0BtnLeBTzYT3dOW8y7+UesR9LTYTOHn3Wj7mC8q
	 7DCoccn/HvPj2+n1rVWnrMkmdZ0j8Y0Eplyox39LysHTT9pDYKWbStdeNixnggiSfS
	 8Xpo8D3iN0WUZBGBHSlvsicYhHzV78VEfbBWAz0dHQrSb2cxVMJdQhrUsJKZDu7u+C
	 uI4FUlDDk3kpJB1KXggVstj4Lzm8GZsBdzs9r6c8cRKtdPLMkIZ/mnibh/JGdaFLiN
	 Ggi/EGYm01YoQlilPAwJ6csezTol8X4Zo4E3WUURVuYpxVBGqGyEuY0+qseDCn4y+H
	 yc4muh9A8QwQA==
Date: Tue, 22 Dec 2020 08:30:34 +0200
From: "Leon Romanovsky" <leon@kernel.org>
To: Arnaldo Carvalho de Melo <acme@kernel.org>
Cc: Jason Gunthorpe <jgg@ziepe.ca>, Jakub Kicinski <kuba@kernel.org>,
	James Bottomley <James.Bottomley@hansenpartnership.com>,
	toke@toke.dk, Konstantin Ryabitsev <konstantin@linuxfoundation.org>,
	users@linux.kernel.org, tools@linux.kernel.org,
	Jens Axboe <axboe@kernel.dk>
Subject: Re: [kernel.org users] b4: encouraging using the cover letter in merge commits?
Message-ID: <20201222063034.GC3128@unreal>
References: <877dpeol5w.fsf@toke.dk>
 <bdffc35910338117c6ed66f6dfac2dc13d6ed03a.camel@HansenPartnership.com>
 <87y2hum0t0.fsf@toke.dk>
 <fc05bad0b5517500e62b271b8896f142060b235e.camel@HansenPartnership.com>
 <20201219092126.5633d02f@kicinski-fedora-pc1c0hjn.dhcp.thefacebook.com>
 <20201221190552.GS5487@ziepe.ca>
 <20201221213012.GB433286@kernel.org>
MIME-Version: 1.0
In-Reply-To: <20201221213012.GB433286@kernel.org>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Dec 21, 2020 at 06:30:12PM -0300, Arnaldo Carvalho de Melo wrote:
> Em Mon, Dec 21, 2020 at 03:05:52PM -0400, Jason Gunthorpe escreveu:
> > On Sat, Dec 19, 2020 at 09:21:26AM -0800, Jakub Kicinski wrote:
> > > On Sat, 19 Dec 2020 09:03:36 -0800 James Bottomley wrote:
> > > > > I agree that the cover letter is useful more often than not and
> > > > > ideally it would be included in most cases. In netdev/bpf land the
> > > > > maintainers do this by always creating a merge commit when applying a
> > > > > multi-part series; here's Daniel applying one of mine, for instance:
> > > > >
> > > > > https://git.kernel.org/pub/scm/linux/kernel/git/netdev/net-next.git/commit/?id=4e083fdfa39db29bbc7725e229e701867d0da183
> > > > >
> > > > > I personally think this practice is pretty nice, and so I was hoping
> > > > > that supporting this workflow in b4 could be a way to encourage other
> > > > > maintainers to take up the practice as well :)
> > > >
> > > > I've got to say that creating a spurious merge for the cover letter
> > > > looks even more tortuous than creating an empty commit.  What
> > > > advantages does this have over the existing link tag practice which is
> > > > the one that we now use instead of the empty commit?
> > >
> > > May be a chicken and an egg problem in case of other subsystems.
> > >
> > > DaveM started creating those merge commits long before Links were
> > > a thing (let alone lore). That gave netdev developers the ability
> > > to provide a high level description of their work, reasons, goals
> > > in the cover letter, rather than one of the commit messages. For
> > > a series with changes finely split for ease of review it's often
> > > awkward to pick on which commit to put that information.
> > >
> > > Obviously the cover letter information may be made available via
> > > the Link, but there's obvious value in seeing the information in
> > > the repo, after all we don't replace commit messages with links.
>
> > My biggest problem with the cover letters is while the are in the
> > repository, someplace, I've never actually found one while hunting
> > around in the git history for clues, eg with 'git blame' or 'git log
> > log -p'
>
> Well, they don't get merged, this is the point of this thread :-\

In the netdev flow, the cover letters are merged.
See commit 28f53159e121 ("Merge branch 'vsock-add-flags-field-in-the-vsock-address'")

Thanks
