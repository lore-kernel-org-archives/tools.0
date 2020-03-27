Received: from wout1-smtp.messagingengine.com (wout1-smtp.messagingengine.com [64.147.123.24])
 by mx.groups.io with SMTP id smtpd.web12.9590.1585309707359514805
 for <tools@linux.kernel.org>;
 Fri, 27 Mar 2020 04:48:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kroah.com header.s=fm3 header.b=UD8GRMCF;
 spf=pass (domain: kroah.com, ip: 64.147.123.24, mailfrom: greg@kroah.com)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
	by mailout.west.internal (Postfix) with ESMTP id 62AD8751;
	Fri, 27 Mar 2020 07:48:26 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute1.internal (MEProxy); Fri, 27 Mar 2020 07:48:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kroah.com; h=
	date:from:to:cc:subject:message-id:references:mime-version
	:content-type:in-reply-to; s=fm3; bh=aYpOezadZjH5sRaxu+T47Cvz2Bs
	czGrhNZX2QerbL+w=; b=UD8GRMCFhTiqYl/6pMG7GefEoe/x4pmMv6twe4WlAQS
	tZmHwzM+4XFKtBAVal2J3gp++7yXwIlE0oRdGjcM7HsgdH6HdxGOVT0ZWOTM3v2O
	tyzk8k2hYNU6y/MVcCUf1tk1rOH+16VyuP3RWUzIEmYTf5G/Lr60MfdwPqaFaxFc
	jCPU4YJbGHCNNdStfJlFWB5N5mWRLBPZguyez5le+8SdVQ4w4XOCmCWIovaSPb3N
	2cRgxo5ZHk+AXH+f55s/WL0PbusPnqFkQL4ToSTFn1/Ad0R2/2VSi9ocFT7wa3Iy
	fTHDyyniezy9ZSpBC8o4zRElr1h55B4ouvfwDfhgjlA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to:x-me-proxy
	:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=aYpOez
	adZjH5sRaxu+T47Cvz2BsczGrhNZX2QerbL+w=; b=0UM3i+XOxUz7ArCCIvs58o
	b6tsvlQ9S1BminXilHlkagU3jfqhe7evzmK+jLvLv3bdTJ7giqWGjlq1ZyBvQi+X
	NNRLm0IO+98zZpvuNon0X824u4n5MFVFMjNFTYy5XVuXW8BMRJIEaSKHjt70lTuT
	t5S+HbcfwZRUZWl6lDDAIKZYjQR7Zwv/G4XHasJhsteDKAC+UlmFSkQR/a+FC0+b
	2VkIIlaipq0BSpdoBa1saVeFKK1mogfpEQHHQNYm7qDJRZYmVvvrhwGp0cw7yejQ
	C7W+3kQAnDdNs6w2Y1fXtmVFzhJwocyNi3nyDJLbhTQGUkEdKgcHjjduL7L1Xx7g
	==
X-ME-Sender: <xms:Ceh9XnBRnyohRCVaTfFjXRwPrDDhT9R0S-1HQkKDwU2rn3Rd949qeA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedugedrudehledgfedtucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvffukfhfgggtuggjsehttdertddttddvnecuhfhrohhmpefirhgvghcu
    mffjuceoghhrvghgsehkrhhorghhrdgtohhmqeenucffohhmrghinhepkhgvrhhnvghlrd
    horhhgnecukfhppeekfedrkeeirdekledruddtjeenucevlhhushhtvghrufhiiigvpedt
    necurfgrrhgrmhepmhgrihhlfhhrohhmpehgrhgvgheskhhrohgrhhdrtghomh
X-ME-Proxy: <xmx:Ceh9XqOnIkw-aVb5qgUl4NE8iwsGrXgNbOsQ5V-jUh1m-QE_Pj0HXA>
    <xmx:Ceh9XronDc5OxMr0bNHtOgyzP0am7x9mVDYn54UrRODT0WSmiKg-vg>
    <xmx:Ceh9Xuwz-9rrxk6kG4QVxaGBTrAGWjDEoJMxz-oVjeiZttPOEV1p9A>
    <xmx:Cuh9XtxvGJgUlrzFLV4vld01SBdayxF8lh17_eWjINYCXJmxSU9Pyg>
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl [83.86.89.107])
	by mail.messagingengine.com (Postfix) with ESMTPA id 8BAF830660E1;
	Fri, 27 Mar 2020 07:48:25 -0400 (EDT)
Date: Fri, 27 Mar 2020 12:48:24 +0100
From: "Greg KH" <greg@kroah.com>
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc: users@linux.kernel.org, tools@linux.kernel.org
Subject: Re: [kernel.org users] b4 can now explode a pull request into an mbox file with patches
Message-ID: <20200327114824.GB1738094@kroah.com>
References: <20200326221926.jfsbtvnb7bfjahov@chatter.i7.local>
MIME-Version: 1.0
In-Reply-To: <20200326221926.jfsbtvnb7bfjahov@chatter.i7.local>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Mar 26, 2020 at 06:19:26PM -0400, Konstantin Ryabitsev wrote:
> Hi, all:
> 
> While working on "pull-request exploder" stuff for achiving on 
> lore.kernel.org, I realized that this may be a useful set of features 
> for developers as well, as I imagine you sometimes want to comment on 
> something in a pull request and end up having to go hunting for the 
> proper commit, from/to/cc, etc information.
> 
> So, the master branch of b4 just landed initial "b4 pr" implementation, 
> which will let you do "b4 pr --explode <msgid>" to get an mbox file
> with that pull request converted into a patch series with various 
> headers set so it's convenient to fire off "mutt -f" and reply to the 
> exact bits that you want and send it to the proper places.
> 
> In more details:
> 
> b4 pr <msgid>
> 
>   - downloads that message
>   - parses the pull request
>   - checks that the remote tip is where the message says it should be
>   - makes sure the base-commit is present in the tree
>   - makes sure the tip commit isn't already in one of the branches
>   - checks if FETCH_HEAD already is at that commit
>   - if all looks good, performs a git fetch
>   - (optionally, can then do a checkout into a branch for you)
> 
> b4 pr --check <msgid>
> 
>   Runs all of the checks above, but doesn't perform the actual fetch.
>   Useful if you don't remember if you've already processed a pull
>   request or not.
> 
> b4 pr --explode <msgid>
> 
>   Runs basic sanity checks and then:
> 
>   - performs a git fetch
>   - runs a "git format-patch" for base-commit..FETCH_HEAD
>   - adds the same to/from/cc headers as in the pull request
>   - properly threads each patch below the pull request
>   - saves that into a <msgid>.mbox file
> 
> I mostly imagine that it's the --explode functionality that you'd be 
> interested in, but since that required writing most of the other 
> pull-request handling functionality, there's basic handling for that as 
> well.
> 
> Please let me know if that is useful.

Both sound really useful, thanks!

Now to just wait for someone to send me a pull request so I can try it
out, I just had caught up on all of them last night :)

greg k-h
