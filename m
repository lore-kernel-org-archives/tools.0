Received: from wout1-smtp.messagingengine.com (wout1-smtp.messagingengine.com [64.147.123.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2E5E173
	for <tools@linux.kernel.org>; Thu, 10 Jun 2021 06:46:02 +0000 (UTC)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
	by mailout.west.internal (Postfix) with ESMTP id DD8CB22B3;
	Thu, 10 Jun 2021 02:46:01 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute5.internal (MEProxy); Thu, 10 Jun 2021 02:46:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kroah.com; h=
	date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-transfer-encoding:in-reply-to; s=fm1; bh=G
	oqySpQoiEpecr912HvxowNuWoPiJrAt3CSr/O0omI0=; b=gGb1maoV1w5W6nwl2
	LN8APRZ46UPkWSQZkLArSGPXoWhT66UVUaSwtvPBBCu6ftHpp+bmAEn1rBBSZWzq
	PbPMbasZtd4ZNUvAWfcCbW3IJOaK6scIGYUjJ0gAyZ5NrN8s66IISp/Rh/95tYfq
	SuGEaw0zTSeyFXOErmcnX3X5Q8a2BdHI6sHL7smv+rx77+M9jvXW1c1XZlm42hMs
	GGZRWLgfUQ8FugjCc22omZB5ELEvjOvat66w2yg70qxpI7XOqu19lcVDTlok0QYR
	ByPAR1uVRejmqBqjowiAg4R/JQisdmPKZoSWQRkgJsjqy3daMue2M5/2qfSPBgiR
	qZzPw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-transfer-encoding:content-type
	:date:from:in-reply-to:message-id:mime-version:references
	:subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm3; bh=GoqySpQoiEpecr912HvxowNuWoPiJrAt3CSr/O0om
	I0=; b=bXaVVeNscPwGcup3eX1L6Gs+w53/ncV7cbjU5kEFkL5cmRN/YSuLk6/JM
	ovGUc6yRgM5zTYsL6Np2SYfPc1mUe7f0DsstW/xbWJEi79CeykrQqm2Om//R6t2B
	tZQIJST55yjhkUhuw9aG164bnGBul9PuQTu8L2Ystfo+vBjs4CXBKF+mKn7bRW22
	8FOgNzKdzfHxTWLGoGVUd1pwdq73jr2cSPyf4ff45bBCAl8KbVviL23J2Eq71oon
	zhDhhBR3rbU2YooRTMSWWYkv1tl+ihb38tGuz9baSTdBWWjVg6ZYoAyOLUrPxzFX
	fLOWgoBJNriRt3lbP+Pu7Y6T64Tlw==
X-ME-Sender: <xms:KbXBYLCCntsMw0QGwe9SpIVuLWuVdRbnyC5MuGps0jrRwN_p-t21dA>
    <xme:KbXBYBjhHU4ZcwEUt8dFLVS-G3S2FQcCn9OhTBaga4B4XvzlIlh9vjrrQUJjHqJyk
    7GqOH7ekms1nA>
X-ME-Received: <xmr:KbXBYGm_dGRp-MtEOTJ93X__eVSYmR7yUd3qBTOH7XJHqqUm4bUT_KBrX97kBkWSFLzEhJZrBFMapnLOQP5bZucj39gCNUwC>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrfeduvddguddtkecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
    enucfjughrpeffhffvuffkfhggtggugfgjsehtkeertddttdejnecuhfhrohhmpefirhgv
    ghcumffjuceoghhrvghgsehkrhhorghhrdgtohhmqeenucggtffrrghtthgvrhhnpeevie
    efheehieekudelueeuveduhfekhfefieeiueelfeeuiefftdefueetheevieenucffohhm
    rghinhepkhgvrhhnvghlrdhorhhgpdhlihhnrghrohdrohhrghenucevlhhushhtvghruf
    hiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehgrhgvgheskhhrohgrhhdrtgho
    mh
X-ME-Proxy: <xmx:KbXBYNxBXXEXrjsWX3BdclJvmmpWSkldS5XewawaKhZF_oFeIeAkfQ>
    <xmx:KbXBYAR39Mh7W-JlbJqvlIYgXkB5AvHHXE-RnGfiUcu5j16arraFDw>
    <xmx:KbXBYAbhmuNeDak4HFpRp9VUxqsKOuiXssqh1MXZ06bMcOEXDGG6Ww>
    <xmx:KbXBYLfgzSnHLPMw0QqcJTRQ-3atTccT87EiDTk05zqzRUzEkPjzPQ>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 10 Jun 2021 02:46:00 -0400 (EDT)
Date: Thu, 10 Jun 2021 08:45:58 +0200
From: Greg KH <greg@kroah.com>
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc: tools@linux.kernel.org
Subject: Re: b4 crash when trying to apply patches with latest version from
 git
Message-ID: <YMG1JnbI+AJWCxV+@kroah.com>
References: <YMB3XJ/NgtCO+YCx@kroah.com>
 <20210609154351.gl66xtd2bcb2prv2@nitro.local>
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210609154351.gl66xtd2bcb2prv2@nitro.local>

On Wed, Jun 09, 2021 at 11:43:51AM -0400, Konstantin Ryabitsev wrote:
> On Wed, Jun 09, 2021 at 10:10:04AM +0200, Greg KH wrote:
> > On the latest version of b4 from git, a06304fcd63f ("Perform an encoding
> > bug avoidance dance"), I get the following traceback:
> > 
> > Looking up https://lore.kernel.org/r/20210607170054.220975-1-rui.silva%40linaro.org
> > Analyzing 3 messages in the thread
> > Checking attestation on all messages, may take a moment...
> > ---
> >   ✓ [PATCH v3] MAINTAINERS: usb: add entry for isp1760
> >     + Acked-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com> (✓ DKIM/ideasonboard.com)
> >   ---
> >   ✓ Signed: DKIM/linaro.org
> > Traceback (most recent call last):
> >   File "/mnt/fast_disk/linux/tools/b4/b4/command.py", line 259, in <module>
> >     cmd()
> >   File "/mnt/fast_disk/linux/tools/b4/b4/command.py", line 242, in cmd
> >     cmdargs.func(cmdargs)
> >   File "/mnt/fast_disk/linux/tools/b4/b4/command.py", line 51, in cmd_am
> >     b4.mbox.main(cmdargs)
> >   File "/mnt/fast_disk/linux/tools/b4/b4/mbox.py", line 598, in main
> >     make_am(msgs, cmdargs, msgid)
> >   File "/mnt/fast_disk/linux/tools/b4/b4/mbox.py", line 133, in make_am
> >     b4.save_git_am_mbox([x[1] for x in am_msgs], sys.stdout.buffer)
> >   File "/mnt/fast_disk/linux/tools/b4/b4/mbox.py", line 133, in <listcomp>
> >     b4.save_git_am_mbox([x[1] for x in am_msgs], sys.stdout.buffer)
> >   File "/usr/lib/python3.9/email/message.py", line 391, in __getitem__
> >     return self.get(name)
> >   File "/usr/lib/python3.9/email/message.py", line 468, in get
> >     name = name.lower()
> > AttributeError: 'int' object has no attribute 'lower'
> > 
> > 
> > Any thoughts?
> 
> Thank you, this is fixed in master now.

Thanks for this, and the other, quick fix.  I've verified they work now
properly.

greg k-h
