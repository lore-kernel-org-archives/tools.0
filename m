Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 315A415B96F
	for <tools@linux.kernel.org>; Wed, 28 Feb 2024 15:15:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709133316; cv=none; b=lF8Vu/JXssrFfxMkfNKQL+w+7ovjqoNoMOclyH11xiZcPNvcOxLfl3lp+bv08wBRgnwVSMuiIgpxQ/XiUNPeKV+3XkhAMv6jK9zk5RfgcNWk/oyLxd3ZAb/Q2XIr3I3IN3cHpUY53lMFKVQqeN+c7gGTEFgMHV32ojZc2W+SymU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709133316; c=relaxed/simple;
	bh=OO6UMGw9oGEtPg1LEjzW4kAK7jOJy5Lo4TOaTYmff8w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sDBi6Cgj8DUMak3/kEjw5ELnmz/e0856MSK0cMr1Mgzc4nGsGVGVB21jTL3mmog4azeNlB3hJJ01Rh9M81Ivb7sR2Om4HwDa2ifBg34ZEIv2X1esLs8yngwn078ha9DT9vgAEEp+cPwaawo6atg5YETKzaq6lWCSRjtZbeTs+qQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix)
	id E7C86C43390; Wed, 28 Feb 2024 15:15:15 +0000 (UTC)
Received: from 1wt.eu (ded1.1wt.eu [163.172.96.212])
	by smtp.kernel.org (Postfix) with ESMTP id 3F479C433C7;
	Wed, 28 Feb 2024 15:15:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 3F479C433C7
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=1wt.eu
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=1wt.eu
Received: (from willy@localhost)
	by mail.home.local (8.17.1/8.17.1/Submit) id 41SFF79f030230;
	Wed, 28 Feb 2024 16:15:07 +0100
Date: Wed, 28 Feb 2024 16:15:07 +0100
From: Willy Tarreau <w@1wt.eu>
To: Hannes Reinecke <hare@suse.de>
Cc: Konstantin Ryabitsev <konstantin@linuxfoundation.org>, users@kernel.org,
        tools@kernel.org, workflows@vger.kernel.org,
        Jon Corbet <corbet@lwn.net>
Subject: Re: Toy/demo: using ChatGPT to summarize lengthy LKML threads (b4
 integration)
Message-ID: <Zd9N+28A9dfSzT67@1wt.eu>
References: <20240227-flawless-capybara-of-drama-e09653@lemur>
 <20240228050007.GB18047@1wt.eu>
 <4fa1cbc7-0f9d-47bf-8ff7-a9b17456431e@suse.de>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4fa1cbc7-0f9d-47bf-8ff7-a9b17456431e@suse.de>

On Wed, Feb 28, 2024 at 04:04:28PM +0100, Hannes Reinecke wrote:
> On 2/28/24 06:00, Willy Tarreau wrote:
> > Hi Konstantin,
> > 
> [ .. ]
> > And because of this I didn't find on what boundaries to cut the analysis,
> > If it's "since last time I read my email", it can only be done locally
> > and will be per-user. If it's a summary of a final thread, it's not
> > super interesting and it's better explained (IMHO) on LWN where the
> > hot topics are summarized and developed. If it's the list of threads
> > of the day, I've suspected that there are so many that it's unlikely
> > I'd read all of them every evening or every morning. I've been wondering
> > if an interesting approach would be to only summarize long threads,
> > since most short ones are a patch, a review and an ACK and do not need
> > to be summarized, but I think that most of us seeing a subject repeat
> > over many e-mails will just look at a few exchanges there to get an
> > idea of what's going on.
> > 
> [ snip ]
> 
> Out of personal interest I really have to chime in here.
> You are aware, though, that following this line of thought
> and improving the underlying model (which really shouldn't
> be too hard given the vast body of training data which is LKML)
> we will actually putting LWN and its editors out of business.

No, really, and I mentioned it in the first message, LWN provides good
explanations, links to articles, personal opinions, references etc. I
wouldn't put LWN and a chatbot on the same level at all! One has skilled
writers knowing their topic and explaining how stuff works and why
certain choices are made, the other one is basically the chatty coworker
that everyone prefers not to hear for too long.

Here it's "just" a rough summary of a conversation and it's not capable
of dealing with too large a context. I really love to read LWN to *learn*
some very interesting stuff. A summary like the ones Konstantin and I
shared is more aimed at letting you decide if you're interested in going
deepeer into that thread. And BTW my initial experiments were clearly on
this: "am I interested in reading that thread or should I skip it".

> I would be _VERY_ interesting having a discussion here with the
> relevant parties (Hello Jon!) to see which direction we as a
> community will want to go. Maybe Plumbers and/or Kernel Summit in Vienna
> would be a good place to start.

Most likely, yes.

Willy
