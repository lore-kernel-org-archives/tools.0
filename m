Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com [66.111.4.29])
 by mx.groups.io with SMTP id smtpd.web11.13094.1603113390821650625
 for <tools@linux.kernel.org>;
 Mon, 19 Oct 2020 06:16:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kroah.com header.s=fm2 header.b=wr6k9WZ5;
 spf=pass (domain: kroah.com, ip: 66.111.4.29, mailfrom: greg@kroah.com)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
	by mailout.nyi.internal (Postfix) with ESMTP id 1C9F25C0139;
	Mon, 19 Oct 2020 09:16:30 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute4.internal (MEProxy); Mon, 19 Oct 2020 09:16:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kroah.com; h=
	date:from:to:cc:subject:message-id:references:mime-version
	:content-type:in-reply-to; s=fm2; bh=3t+ZaRrRQfD8Fkbx+w1qSJWSsTO
	iUZa9RvEZKb6WktM=; b=wr6k9WZ5zd3eMlsa+bWwNo1Fh2BFapk8O9u/u9zSYv9
	vVCQq7Prq9eLjHCYAwvS6e9BNfeyKuvZKR+a9iYRcXY2uC40MpAG6P7KC34e5AzB
	0WhwIiahxaPkHRvAADjTPRReoXTV9CQAjezubScJnLLU6U0yJ60mFYtmxn+HqnYG
	TtgSZ+9FjhmPCNjv1kc3gTW7s0WI2fR/PVNbALevLIvpzxg7F0TEJi2rjmnwtm9j
	qiZQUDAw4mC2eM+kBuhjPiBkevG4xZCEdzivNmN+RZU6hdwtlBI1qNZEZTMLbFlm
	h6Ie8DQtQJmXALYwpVHFmEh6N2jA67hg11jIWQoA4bQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to:x-me-proxy
	:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=3t+ZaR
	rRQfD8Fkbx+w1qSJWSsTOiUZa9RvEZKb6WktM=; b=NuHP85uuxe+Y5zsKxPOKk7
	L9kQY3M5icfe8fVJ/yuL9LK+SjaFBydqjZjO8Thqk1vUNVE/Qp9+JPMUsF9VoO7G
	3wHI7k3sBJbr9t3+rbHyGKaT7XpFf455s1QYnbtss09PXEgn1xVRuA27W1hiwa+1
	miz0UilmtIJrMs3TsIjC+ocf6NnsRwLaZmMke+uGsRxk0jmx63TSpOa9AQ0r504f
	dVDnb9svwkb5YAs6rvFLYRI2LUPfS5eLe8vlAfYIxAt48kNHZF+rj9MqhL5GROwz
	qZZ5/Gzw2tPKeBvo6Opru0w8dg8L7bat2Y1Z8tReZl7ms2C6/7h+8u61VPm8pLXQ
	==
X-ME-Sender: <xms:rZGNXyOutUZ1IFPOn7l6gR1RxR0RqDqHktXZU5kc3H1gZAV-OtavYg>
    <xme:rZGNXw-zCIBlPDqv--wC-CAGac-JtrH90W0SWKJS9c4gY9NvSZRRr4Gtu1pqz7W7l
    uNjDQd0kKG6lw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedujedrjedugdeigecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpeffhffvuffkfhggtggujgesthdtredttddtvdenucfhrhhomhepifhrvghgucfm
    rhhorghhqdfjrghrthhmrghnuceoghhrvghgsehkrhhorghhrdgtohhmqeenucggtffrrg
    htthgvrhhnpeefueevkedtuddtudeiudekueeftdejkeehhfeiveehhfeludffheffhfev
    hfdthfenucfkphepkeefrdekiedrjeegrdeigeenucevlhhushhtvghrufhiiigvpedtne
    curfgrrhgrmhepmhgrihhlfhhrohhmpehgrhgvgheskhhrohgrhhdrtghomh
X-ME-Proxy: <xmx:rZGNX5QPyF-Ja5f5NJXCY0Pc8uGuMyAg3KBdnc3DXdTxzRLx1EPMwg>
    <xmx:rZGNXysGgX95nmMGQwG_8Pi490lP632xWnxSIQU6n3Xuf9VUZAktIg>
    <xmx:rZGNX6cGYmsrvy5umTBrrfJZzh8z9tANP1WSRfA3OnD_oXafoiyGuw>
    <xmx:rpGNX7qhsiXAtnEmrEG-a11k_cWearGeUNHoHN3mgsjv6fV_qW-XFA>
Received: from localhost (83-86-74-64.cable.dynamic.v4.ziggo.nl [83.86.74.64])
	by mail.messagingengine.com (Postfix) with ESMTPA id 2DC593064682;
	Mon, 19 Oct 2020 09:16:29 -0400 (EDT)
Date: Mon, 19 Oct 2020 15:17:15 +0200
From: "Greg KH" <greg@kroah.com>
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc: users@linux.kernel.org, tools@linux.kernel.org,
	Johan Hovold <johan@kernel.org>, Sasha Levin <sashal@kernel.org>
Subject: Re: b4 seems to be dropping "cc: stable" on patches.
Message-ID: <20201019131715.GA3255086@kroah.com>
References: <20201019072006.GB3219053@kroah.com>
 <20201019124325.r5kx3yq3kqounke5@chatter.i7.local>
MIME-Version: 1.0
In-Reply-To: <20201019124325.r5kx3yq3kqounke5@chatter.i7.local>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Oct 19, 2020 at 08:43:25AM -0400, Konstantin Ryabitsev wrote:
> On Mon, Oct 19, 2020 at 09:20:06AM +0200, Greg Kroah-Hartman wrote:
> > Hi Konstantin,
> > 
> > It looks like 'b4' is dropping the cc: stable lines of patches.
> 
> Correct, sorry about that -- I was trying to tighten trailer recognition 
> to avoid hitting some of the false-positives I've seen and apparently 
> this affected Cc: and Link: trailers. :(
> 
> This is currently fixed.
> 
> > I can reproduce this on the current b4 git tree, at commit c0910ee77a2a
> > ("Fix header encoding introduced by earlier fix") as of this moment.
> 
> This is one of the dangers of the devel branch, unfortunately -- 
> sometimes it ends up with half-baked code.

Hey, someone has to test the stuff, might as well be people who rely on
it :)

Thanks for fixing this so quickly, much appreciated.

greg k-h
