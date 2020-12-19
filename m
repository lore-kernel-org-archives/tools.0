Received: from bedivere.hansenpartnership.com (bedivere.hansenpartnership.com [96.44.175.130])
 by mx.groups.io with SMTP id smtpd.web11.11966.1608399162900079971
 for <tools@linux.kernel.org>;
 Sat, 19 Dec 2020 09:32:43 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@hansenpartnership.com header.s=20151216 header.b=HEGdrgF6;
 spf=pass (domain: hansenpartnership.com, ip: 96.44.175.130, mailfrom: james.bottomley@hansenpartnership.com)
Received: from localhost (localhost [127.0.0.1])
	by bedivere.hansenpartnership.com (Postfix) with ESMTP id 0A4DD1280734;
	Sat, 19 Dec 2020 09:32:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
	d=hansenpartnership.com; s=20151216; t=1608399159;
	bh=ThHjdTqdj4YRlyDqz360D2zKl4mxD0hC60z1mRO0o3M=;
	h=Message-ID:Subject:From:To:Date:In-Reply-To:References:From;
	b=HEGdrgF65EfzPm1xPRaETntuj2piOkV+/x1770Gxu7jtmQgw/uTgn+M2MCC9N/q7Z
	 Ru5mU8BcAiHNB+D9SJKL4Lfz8VTdbH8JkZKMFnVwJLar4rKFZiZ8Zuvan5adQALrLj
	 SBQB+n4P94i3WXi9tNfx+1PV3NEq2AbSdMVUk+Uw=
Received: from bedivere.hansenpartnership.com ([127.0.0.1])
	by localhost (bedivere.hansenpartnership.com [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id pH1J0uBGVqzx; Sat, 19 Dec 2020 09:32:39 -0800 (PST)
Received: from jarvis.int.hansenpartnership.com (c-73-35-198-56.hsd1.wa.comcast.net [73.35.198.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by bedivere.hansenpartnership.com (Postfix) with ESMTPSA id 8A57512806C0;
	Sat, 19 Dec 2020 09:32:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
	d=hansenpartnership.com; s=20151216; t=1608399158;
	bh=ThHjdTqdj4YRlyDqz360D2zKl4mxD0hC60z1mRO0o3M=;
	h=Message-ID:Subject:From:To:Date:In-Reply-To:References:From;
	b=OWleKiXIF5ugH/ZpYXkmXDiwTYsU+iPpgNRzhpqTULMEMFmGm4Q7U5nA7QOgyHsfI
	 nFU0Q36GOlXLJOl8yUT4TSqeIy+reReZOcb87w07SIJLjuoJmdXY2bNA/7OWZKkyV7
	 sWyXrdNAd+Vch2++JBjIbGLkYc+F4LjBglPZHe1E=
Message-ID: <df817703aa55c027fe87b4e0316e2aa70483e7fc.camel@HansenPartnership.com>
Subject: Re: [kernel.org users] b4: encouraging using the cover letter in merge commits?
From: "James Bottomley" <James.Bottomley@HansenPartnership.com>
To: Jakub Kicinski <kuba@kernel.org>
Cc: toke@toke.dk, Konstantin Ryabitsev <konstantin@linuxfoundation.org>, 
 users@linux.kernel.org, tools@linux.kernel.org, Jens Axboe
 <axboe@kernel.dk>,  Arnaldo Carvalho de Melo <acme@kernel.org>
Date: Sat, 19 Dec 2020 09:32:37 -0800
In-Reply-To: <20201219092126.5633d02f@kicinski-fedora-pc1c0hjn.dhcp.thefacebook.com>
References: <877dpeol5w.fsf@toke.dk>
	 <bdffc35910338117c6ed66f6dfac2dc13d6ed03a.camel@HansenPartnership.com>
	 <87y2hum0t0.fsf@toke.dk>
	 <fc05bad0b5517500e62b271b8896f142060b235e.camel@HansenPartnership.com>
	 <20201219092126.5633d02f@kicinski-fedora-pc1c0hjn.dhcp.thefacebook.com>
User-Agent: Evolution 3.34.4 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Sat, 2020-12-19 at 09:21 -0800, Jakub Kicinski wrote:
> On Sat, 19 Dec 2020 09:03:36 -0800 James Bottomley wrote:
> > > I agree that the cover letter is useful more often than not and
> > > ideally it would be included in most cases. In netdev/bpf land
> > > the
> > > maintainers do this by always creating a merge commit when
> > > applying a
> > > multi-part series; here's Daniel applying one of mine, for
> > > instance:
> > > 
> > > https://git.kernel.org/pub/scm/linux/kernel/git/netdev/net-next.git/commit/?id=4e083fdfa39db29bbc7725e229e701867d0da183
> > > 
> > > I personally think this practice is pretty nice, and so I was
> > > hoping
> > > that supporting this workflow in b4 could be a way to encourage
> > > other
> > > maintainers to take up the practice as well :)  
> > 
> > I've got to say that creating a spurious merge for the cover letter
> > looks even more tortuous than creating an empty commit.  What
> > advantages does this have over the existing link tag practice which
> > is
> > the one that we now use instead of the empty commit?
> 
> May be a chicken and an egg problem in case of other subsystems.
> 
> DaveM started creating those merge commits long before Links were 
> a thing (let alone lore). That gave netdev developers the ability 
> to provide a high level description of their work, reasons, goals 
> in the cover letter, rather than one of the commit messages. For
> a series with changes finely split for ease of review it's often
> awkward to pick on which commit to put that information.

To be clear I wasn't questioning why net does this.  The proposal was
that we should all start doing this and my push back was that the link
tag we've already evolved covers it.

> Obviously the cover letter information may be made available via 
> the Link, but there's obvious value in seeing the information in 
> the repo, after all we don't replace commit messages with links.

The current linear workflow doesn't group commits, which is why the
link makes more sense because it has the grouping most trees lack.  So
I think the proposal is actually that everyone should start grouping
series with merge tags as well?

When I'm digging around in the tree, it's usually for bisection
reasons, so the series information isn't relevant but the individual
commit messages are.  I understand the series information is
historically important, which is why the link tag, but I don't see any
reason why it must be present in the actual tree as opposed to easily
accessible via a link tag.

James

> We obviously have scripts to do this, we pull the relevant info 
> out of patchwork:
> 
> https://git.kernel.org/pub/scm/linux/kernel/git/dborkman/pw.git/ 



