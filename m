Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by mx.groups.io with SMTP id smtpd.web11.2411.1608585232329792064
 for <tools@linux.kernel.org>;
 Mon, 21 Dec 2020 13:13:53 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: suse.cz, ip: 195.135.220.15, mailfrom: mkubecek@suse.cz)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id D6020ACE0;
	Mon, 21 Dec 2020 21:13:49 +0000 (UTC)
Received: by lion.mk-sys.cz (Postfix, from userid 1000)
	id 3A6CE60563; Mon, 21 Dec 2020 22:13:49 +0100 (CET)
Date: Mon, 21 Dec 2020 22:13:49 +0100
From: =?UTF-8?B?TWljaGFsIEt1YmXEjWVr?= <mkubecek@suse.cz>
To: Jason Gunthorpe <jgg@ziepe.ca>
Cc: Jakub Kicinski <kuba@kernel.org>,
	James Bottomley <James.Bottomley@HansenPartnership.com>,
	toke@toke.dk, Konstantin Ryabitsev <konstantin@linuxfoundation.org>,
	users@linux.kernel.org, tools@linux.kernel.org,
	Jens Axboe <axboe@kernel.dk>,
	Arnaldo Carvalho de Melo <acme@kernel.org>
Subject: Re: [kernel.org users] b4: encouraging using the cover letter in merge commits?
Message-ID: <20201221211349.3iz76dmx76v4dmhc@lion.mk-sys.cz>
References: <877dpeol5w.fsf@toke.dk>
 <bdffc35910338117c6ed66f6dfac2dc13d6ed03a.camel@HansenPartnership.com>
 <87y2hum0t0.fsf@toke.dk>
 <fc05bad0b5517500e62b271b8896f142060b235e.camel@HansenPartnership.com>
 <20201219092126.5633d02f@kicinski-fedora-pc1c0hjn.dhcp.thefacebook.com>
 <20201221190552.GS5487@ziepe.ca>
MIME-Version: 1.0
In-Reply-To: <20201221190552.GS5487@ziepe.ca>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Dec 21, 2020 at 03:05:52PM -0400, Jason Gunthorpe wrote:
> My biggest problem with the cover letters is while the are in the
> repository, someplace, I've never actually found one while hunting
> around in the git history for clues, eg with 'git blame' or 'git log
> log -p'
> 
> In fact more often than not I find the netdev cover letters through
> hunting in lore, not through git.
> 
> Is there some git sequence to make it visible?
> 
> The Link header is a nicer because no matter how I end up at a commit
> I can go back to an email discussion..

If you have a commit in merged branch, the corresponding merge commit
should be the last shown by

  git rev-list --ancestry-path --merges --topo-order --pretty=full \
      ${id}..${branch}

Or first if you also add "--reverse". Unfortunately "-n 1" cannot be
used to show just that merge commit as it would be applied to the list
before "--reverse".

In a script, you could either postprocess the output with sed or count
the merge commits first:

  count=$(git rev-list --ancestry-path --merges --topo-order \
      "${id}..${branch}" | wc -l)
  git rev-list --ancestry-path --merges --topo-order --skip $[count - 1] \
      --pretty=full "${id}..${branch}"

Michal
