Received: from wout2-smtp.messagingengine.com (wout2-smtp.messagingengine.com [64.147.123.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E08B570
	for <tools@linux.kernel.org>; Wed,  9 Jun 2021 08:10:09 +0000 (UTC)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
	by mailout.west.internal (Postfix) with ESMTP id 8DF4E8A2;
	Wed,  9 Jun 2021 04:10:08 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute4.internal (MEProxy); Wed, 09 Jun 2021 04:10:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kroah.com; h=
	date:from:to:cc:subject:message-id:mime-version:content-type
	:content-transfer-encoding; s=fm1; bh=nyndYvhR68TYFdHDw4QFuRew2Q
	Diyw9NnIN0hUcX4Jw=; b=sLlpl5e5Fk2USdCJTYLyr++/DOU3pmE7Z/2gfsXo4I
	pipsHM0HB0nUBXO1obJgiLl/irLEDk+FamtxKagy5tLxmW163EgDDM9h//wZT6dY
	veKDOfD75oaAERyinj09CBP/yWTxuC6SFwpxit5RpeiIUq2/mSsa+AEYtlIwHBEu
	+LdXVTD9PksK8KM7yJpNKgaPexBYVFuNb0dXrwz0YRb+7A9T+P1UamcFBIAthurc
	2FKzyixd7RVwQ1IBO1uXKki/tTb0bj80Uiw75SpyJTzy6wVeZW1dFhWjpYrc1swy
	5Sa/rrzr8zwRHjGKBJ6EZ0lt0W6zsHzor7jWC27IlIdg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-transfer-encoding:content-type
	:date:from:message-id:mime-version:subject:to:x-me-proxy
	:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=nyndYv
	hR68TYFdHDw4QFuRew2QDiyw9NnIN0hUcX4Jw=; b=e5kshKCTJj+i1QvnGP5wtd
	OR50aO1lz2UgbYEOyjaH2WO2rWL7vPseS7rHdaGtR9RXHMV3y+N3NTx3sXI3AD0l
	9EDjEExKZkoqDFlreFyaqmo6Zm6LdM/8I3wUCvzYJYIFctiItDxCY1cx4lMziyvV
	7XQoefRCegwI8HUgbpJ1mRhITBaWAe4vUFggNwkiVeTTO/BZv1xewAzTthjXdKJc
	fLfkajx/XYeV0CRD57ouw/JkQ4/AI64Hm7GCmgYU33PEr7xWk/z+8EyA+bXudfQs
	H0nm8HGBd+mcJxcD6bFR5KhzEPDpRBeKHV6NDW5gpfGgvfW7XauAwdHXFkjX4b0g
	==
X-ME-Sender: <xms:YHfAYJwo1qbfGeCHvBFc4kA9T2d9zyZXnWaG6x0ybgMBnmCRd4n3ZA>
    <xme:YHfAYJSOcXEpHkdyLTgtMZNnYGE1rWSfDXSFr1ZjxliYPuvsJ8cIrzpo1njAWSmrq
    dBZqKIXKx-xjQ>
X-ME-Received: <xmr:YHfAYDUFQxPPWSD28ThxNNXC3C05o_aaFgjt5iAaO_UQV7o-Iw-Vmk5bBPYxqwBWi0_5quzsc4P3dIkunAco7mBs1Ee5h03d>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrfeduuddgtdduucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvffukfggtggugfesthekredttddtjeenucfhrhhomhepifhrvghgucfm
    jfcuoehgrhgvgheskhhrohgrhhdrtghomheqnecuggftrfgrthhtvghrnhepleetudejhe
    dtgefgheetudetfffgueehheevuefghffhieekvdefgfekieetfeeunecuffhomhgrihhn
    pehkvghrnhgvlhdrohhrghdplhhinhgrrhhordhorhhgnecuvehluhhsthgvrhfuihiivg
    eptdenucfrrghrrghmpehmrghilhhfrhhomhepghhrvghgsehkrhhorghhrdgtohhm
X-ME-Proxy: <xmx:YHfAYLhB9nGqx7cBH68TqPVYo_2UhQL7Jo-arcBF4b1DSqARZHBtHA>
    <xmx:YHfAYLAPySZtr6iUkeMiqPE4MN0ul-kCJh_ub0lSf3SV-O0O9GXKOg>
    <xmx:YHfAYEJq2r7qis0ckR81MJg6UoYaitL3CcsEMD7eDZhvljYYYqDjcw>
    <xmx:YHfAYONi5DHmS4aDAIoNJwElshg1FHZou7MXmD3Q8cC2Yf2OxyIr6Q>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 9 Jun 2021 04:10:07 -0400 (EDT)
Date: Wed, 9 Jun 2021 10:10:04 +0200
From: Greg KH <greg@kroah.com>
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc: tools@linux.kernel.org
Subject: b4 crash when trying to apply patches with latest version from git
Message-ID: <YMB3XJ/NgtCO+YCx@kroah.com>
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

On the latest version of b4 from git, a06304fcd63f ("Perform an encoding
bug avoidance dance"), I get the following traceback:

Looking up https://lore.kernel.org/r/20210607170054.220975-1-rui.silva%40linaro.org
Analyzing 3 messages in the thread
Checking attestation on all messages, may take a moment...
---
  ✓ [PATCH v3] MAINTAINERS: usb: add entry for isp1760
    + Acked-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com> (✓ DKIM/ideasonboard.com)
  ---
  ✓ Signed: DKIM/linaro.org
Traceback (most recent call last):
  File "/mnt/fast_disk/linux/tools/b4/b4/command.py", line 259, in <module>
    cmd()
  File "/mnt/fast_disk/linux/tools/b4/b4/command.py", line 242, in cmd
    cmdargs.func(cmdargs)
  File "/mnt/fast_disk/linux/tools/b4/b4/command.py", line 51, in cmd_am
    b4.mbox.main(cmdargs)
  File "/mnt/fast_disk/linux/tools/b4/b4/mbox.py", line 598, in main
    make_am(msgs, cmdargs, msgid)
  File "/mnt/fast_disk/linux/tools/b4/b4/mbox.py", line 133, in make_am
    b4.save_git_am_mbox([x[1] for x in am_msgs], sys.stdout.buffer)
  File "/mnt/fast_disk/linux/tools/b4/b4/mbox.py", line 133, in <listcomp>
    b4.save_git_am_mbox([x[1] for x in am_msgs], sys.stdout.buffer)
  File "/usr/lib/python3.9/email/message.py", line 391, in __getitem__
    return self.get(name)
  File "/usr/lib/python3.9/email/message.py", line 468, in get
    name = name.lower()
AttributeError: 'int' object has no attribute 'lower'


Any thoughts?

Let me roll back to the last "release" to see if that fixes this.  Yes,
v0.7.1 doesn't have this problem.

thanks,

greg k-h
