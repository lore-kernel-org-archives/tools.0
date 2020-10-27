Received: from wout4-smtp.messagingengine.com (wout4-smtp.messagingengine.com [64.147.123.20])
 by mx.groups.io with SMTP id smtpd.web10.13578.1603803853410431193
 for <tools@linux.kernel.org>;
 Tue, 27 Oct 2020 06:04:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kroah.com header.s=fm2 header.b=gYrCM/vL;
 spf=pass (domain: kroah.com, ip: 64.147.123.20, mailfrom: greg@kroah.com)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
	by mailout.west.internal (Postfix) with ESMTP id 7229CFD7;
	Tue, 27 Oct 2020 09:04:12 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute4.internal (MEProxy); Tue, 27 Oct 2020 09:04:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kroah.com; h=
	date:from:to:cc:subject:message-id:references:mime-version
	:content-type:in-reply-to; s=fm2; bh=ZlFd18L5fLBndb5ofGuWOcStfeg
	FL1dkP0EHOzQTM+o=; b=gYrCM/vLLNeTUYocYIf9cVfVBBHkYH0Q/mrP/oYvVl8
	9wn4RHk8M2hy1KLCLrdffOv2Sq6hQKox9erttERXpiL3zhRislpUVEiNEaa86Z8T
	2VQW5cYFLK7wawaSzYpnm/L6E31lfIKUYVLb5r3imw1Y+cgiOWzxFQs4OmR1go0Y
	F86yuARFG/it/yj/Z2S9alZHxafe4gw89T98IqCetMdOq/VSM+H1ENUGeMQqBaSa
	hU9K3Nj4s1b/JmAKX6mmJb8E6dNn8IeIa9xsL7zgc3zHBboMptqabEf7RQsXq9+8
	PlXMfO9VuZF/kMG/+Ib7rW67SV4yecsaSDrh71eFscg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to:x-me-proxy
	:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=ZlFd18
	L5fLBndb5ofGuWOcStfegFL1dkP0EHOzQTM+o=; b=kvGsobEJQqk3rePkQ42MHb
	zo/4F+COY1LE4D9I0Pv57Me0RxGcYgOXZ/UpHM2dbLBTxqNy5brjmZuxACPSkXvz
	yuhnGif3FLXXHWaYEidnTUSvX1yG3T6ZZb/nFDS42vdAWVqMiFt5tFuZM7yVvWiR
	dNx/GTCiY8SeOGFopfPjZF3Nz7ZSC6pdbmuN9w8j/Ylgu45azQlem+F6aR8E8SAu
	eHa94p0IsjCwGrqJRLq0SGYDs0xWjrd2PK1yEoB1fg9CtmqKxxTtILxaMve2dq3J
	j/oJgsXZXfUHIUBpHAEiBeTIVCfS1fAe2T5fjV5u8vxj1eg4e3R/IBgXu+FGc/AQ
	==
X-ME-Sender: <xms:yxqYX0gMtr-jATHi2nJ-wPhhAtWNUqPtSIJuffQvhFIYPoPTiHdZtg>
    <xme:yxqYX9AG4jmOlENmg0TpuhmPDpcXOAXIE8v14QDDCu4_Cq8fQ-ojJx8T2gNsa1sON
    J3syFmxQcAIZA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedujedrkeelgdegjecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpeffhffvuffkfhggtggujgesthdtredttddtvdenucfhrhhomhepifhrvghgucfm
    jfcuoehgrhgvgheskhhrohgrhhdrtghomheqnecuggftrfgrthhtvghrnhepueelledthe
    ekleethfeludduvdfhffeuvdffudevgeehkeegieffveehgeeftefgnecuffhomhgrihhn
    pehkvghrnhgvlhdrohhrghenucfkphepkeefrdekiedrjeegrdeigeenucevlhhushhtvg
    hrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehgrhgvgheskhhrohgrhhdr
    tghomh
X-ME-Proxy: <xmx:yxqYX8EefFaF1FHX7kxyBLEtNWgsMDG-8qqIsJ4ium1wYsnnaHa80g>
    <xmx:yxqYX1TqSVNhoGu8nXANKAe5eP9n_vxu6Unpl7rTlLCFLQD2myJj8A>
    <xmx:yxqYXxwCtPiq20cSXNW78Q6-8WbUoTZkvya8gv8j2hvDYthDNsTTOg>
    <xmx:zBqYX_byS7a0VrL8BjPD5RTe0WgPu2i9cd_0_kIfZvqyBZ-CLFoK1Q>
Received: from localhost (83-86-74-64.cable.dynamic.v4.ziggo.nl [83.86.74.64])
	by mail.messagingengine.com (Postfix) with ESMTPA id 67A703064680;
	Tue, 27 Oct 2020 09:04:11 -0400 (EDT)
Date: Tue, 27 Oct 2020 14:05:07 +0100
From: "Greg KH" <greg@kroah.com>
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc: tools@linux.kernel.org, users@linux.kernel.org
Subject: Re: [tools] b4 crash on staging driver patchset
Message-ID: <20201027130507.GA745673@kroah.com>
References: <20201027122315.GA669512@kroah.com>
 <20201027125155.u7ttdwpdsz722rkw@chatter.i7.local>
MIME-Version: 1.0
In-Reply-To: <20201027125155.u7ttdwpdsz722rkw@chatter.i7.local>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Oct 27, 2020 at 08:51:55AM -0400, Konstantin Ryabitsev wrote:
> On Tue, Oct 27, 2020 at 01:23:15PM +0100, Greg KH wrote:
> > Hi Konstantin,
> > 
> > On the latest tip of the 'b4' tree, I get the following crash with this
> > patch series:
> > 
> > $ b4 am -t https://lore.kernel.org/r/20201019160604.1609180-1-Jerome.Pouiller@silabs.com
> 
> Ah, good find -- we need to fix the horrible base64 encoding legacy crud 
> before we try to attest a message. There's a fix for it in the latest 
> master.

Thanks for the quick fix, works for me!

greg k-h
