Received: from out3-smtp.messagingengine.com (out3-smtp.messagingengine.com [66.111.4.27])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5981270
	for <tools@linux.kernel.org>; Wed,  9 Jun 2021 12:49:17 +0000 (UTC)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
	by mailout.nyi.internal (Postfix) with ESMTP id 9D08E5C02F4;
	Wed,  9 Jun 2021 08:49:16 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute4.internal (MEProxy); Wed, 09 Jun 2021 08:49:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kroah.com; h=
	date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-transfer-encoding:in-reply-to; s=fm1; bh=y
	Yiz026D8mH5uMSOvE67Ia2KFgLNzDDyJa8+4+FrLD0=; b=hex6oQA+UCD7TZoo1
	lPu4gcq1mBVGlU2mxRiYVN91cYSMNE1bBjJbgIuQldNcYpu5nwpA2ym/io4mQUcW
	1502QlfHL/wTO4NRuWKUI6XREA+hYTBiGWPAu+2EyPtKDlSjgQpGTbdtfZ0xLt6H
	NZJkgokv4Iak2RD0TzTNkChJ+oeZ7bp1eEtApykqGQ8HiuameDTveMKN3K2d1OUm
	+cXD3WorY0uUaSOONh+F6F2VYSFYywLNgW54x6jCsJEPHwlLDqrS/AGsyzE1NvaC
	rkqGtxWBowoNwqJOKll8fKVb1+FucKV2tktTn1On3Spj2Q+5epnUn1o203K5QhHz
	1ZYAA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-transfer-encoding:content-type
	:date:from:in-reply-to:message-id:mime-version:references
	:subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm3; bh=yYiz026D8mH5uMSOvE67Ia2KFgLNzDDyJa8+4+FrL
	D0=; b=rDuFmDhNCNG7XX26LXHbccGvczHcBP6C6SG0FVI4TYI3yVD+FhjMs5kKa
	reVOWoqzVvAEcIKlLtnMVGPwEEb423qG6Ss9kJbVp9VRMGCuFrgBO16Qp9JzOqO6
	+EgHV67e5QrmV7B0KDS99EQy6AmOGUvelKTQRB28uCcg844RZUejStBu9tOxSdN3
	J1r6tHuRWFRuwt6OX5LDROa7LvFybjqJnLKXl2VOjdCjVIkyD6f05d2jbyUi0eqT
	v4fSok6xeRUoQAD7aqpIQ7YHf/iS2awBtg1zB49+AmpfanRpXyxlxuf5FQWjw+Jg
	ZaJ4szcvZXFVvRCLpJsXqwGKZMRZw==
X-ME-Sender: <xms:zLjAYEXLIUWOQu2aGmpGobQvMKRkGrWgxI6GNA8mfnsJwNhByesjVA>
    <xme:zLjAYImmlU01KCNt_0DSRDMcN1auyQDGjopnUL9MRiILiTefkGZkpRd1PgKrQ-AU6
    EOLRz2wCm6koA>
X-ME-Received: <xmr:zLjAYIZWA8iE58nZ9cDjIWffoZvmUkgtVbichPs1lbFRqNYGMYGr69iQ4BM2TKhSFrTFO6ChVxjXL3aB4ZdrcKScqqA6K9bM>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrfeduuddgheekucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvffukfhfgggtugfgjgesthekredttddtjeenucfhrhhomhepifhrvghg
    ucfmjfcuoehgrhgvgheskhhrohgrhhdrtghomheqnecuggftrfgrthhtvghrnhepveeife
    ehheeikeduleeuueevudfhkefhfeeiieeuleefueeiffdtfeeuteehveeinecuffhomhgr
    ihhnpehkvghrnhgvlhdrohhrghdplhhinhgrrhhordhorhhgnecuvehluhhsthgvrhfuih
    iivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepghhrvghgsehkrhhorghhrdgtohhm
X-ME-Proxy: <xmx:zLjAYDWnk2Wh0iRA3AIPPxo_UCEQGcohWewSvHhTDRAsdU7K-83bcw>
    <xmx:zLjAYOmTNz8k_BBlAf_6AcNF3h5X8bOFB9IsYxJMvlLjEFp_m7M8mg>
    <xmx:zLjAYIfsP8PwW0KgIjyLmoQQUg4XGW5e_KovNitY1wvD09hj8WoE_g>
    <xmx:zLjAYDzVf3--bSyDRWPqbHDbQRrX9Xm2j44YhVn8DZmZ1TiD-Fr98w>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 9 Jun 2021 08:49:15 -0400 (EDT)
Date: Wed, 9 Jun 2021 14:49:13 +0200
From: Greg KH <greg@kroah.com>
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc: tools@linux.kernel.org
Subject: Re: b4 crash when trying to apply patches with latest version from
 git
Message-ID: <YMC4yWAT3Ubux2gQ@kroah.com>
References: <YMB3XJ/NgtCO+YCx@kroah.com>
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <YMB3XJ/NgtCO+YCx@kroah.com>

On Wed, Jun 09, 2021 at 10:10:04AM +0200, Greg KH wrote:
> On the latest version of b4 from git, a06304fcd63f ("Perform an encoding
> bug avoidance dance"), I get the following traceback:
> 
> Looking up https://lore.kernel.org/r/20210607170054.220975-1-rui.silva%40linaro.org
> Analyzing 3 messages in the thread
> Checking attestation on all messages, may take a moment...
> ---
>   ✓ [PATCH v3] MAINTAINERS: usb: add entry for isp1760
>     + Acked-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com> (✓ DKIM/ideasonboard.com)
>   ---
>   ✓ Signed: DKIM/linaro.org
> Traceback (most recent call last):
>   File "/mnt/fast_disk/linux/tools/b4/b4/command.py", line 259, in <module>
>     cmd()
>   File "/mnt/fast_disk/linux/tools/b4/b4/command.py", line 242, in cmd
>     cmdargs.func(cmdargs)
>   File "/mnt/fast_disk/linux/tools/b4/b4/command.py", line 51, in cmd_am
>     b4.mbox.main(cmdargs)
>   File "/mnt/fast_disk/linux/tools/b4/b4/mbox.py", line 598, in main
>     make_am(msgs, cmdargs, msgid)
>   File "/mnt/fast_disk/linux/tools/b4/b4/mbox.py", line 133, in make_am
>     b4.save_git_am_mbox([x[1] for x in am_msgs], sys.stdout.buffer)
>   File "/mnt/fast_disk/linux/tools/b4/b4/mbox.py", line 133, in <listcomp>
>     b4.save_git_am_mbox([x[1] for x in am_msgs], sys.stdout.buffer)
>   File "/usr/lib/python3.9/email/message.py", line 391, in __getitem__
>     return self.get(name)
>   File "/usr/lib/python3.9/email/message.py", line 468, in get
>     name = name.lower()
> AttributeError: 'int' object has no attribute 'lower'
> 
> 
> Any thoughts?
> 
> Let me roll back to the last "release" to see if that fixes this.  Yes,
> v0.7.1 doesn't have this problem.

Hm, 0.7.1 is crashing for me now if I tell it to "try harder":

$ b4 am -t https://lore.kernel.org/r/20210607101634.4948-1-ricky_wu@realtek.com
Looking up https://lore.kernel.org/r/20210607101634.4948-1-ricky_wu%40realtek.com
Analyzing 6 messages in the thread
Checking attestation on all messages, may take a moment...
---
  [PATCH v2] misc: rtsx: separate aspm mode into MODE_REG and MODE_CFG
    + Fixes: 121e9c6b5c4c ("misc: rtsx: modify and fix init_hw function")
    + Reported-by: Chris Chiu <chris.chiu@canonical.com>
---
Total patches: 1
---
NOTE: some trailers ignored due to from/email mismatches:
    ! Trailer: Tested-by: Gordon Lack <gordon.lack@dsl.pipex.com>
     Msg From: Chris Chiu <chris.chiu@canonical.com>
NOTE: Rerun with -S to apply them anyway
---
 Link: https://lore.kernel.org/r/20210607101634.4948-1-ricky_wu@realtek.com
 Base: not found (applies clean to current tree)
       git am ./v2_20210607_ricky_wu_misc_rtsx_separate_aspm_mode_into_mode_reg_and_mode_cfg.mbx


So I add -S to the line and try again:

$ b4 am -t -S https://lore.kernel.org/r/20210607101634.4948-1-ricky_wu@realtek.com
Looking up https://lore.kernel.org/r/20210607101634.4948-1-ricky_wu%40realtek.com
Analyzing 6 messages in the thread
Checking attestation on all messages, may take a moment...
---
  [PATCH v2] misc: rtsx: separate aspm mode into MODE_REG and MODE_CFG
Traceback (most recent call last):
  File "/mnt/fast_disk/linux/tools/b4/b4/command.py", line 254, in <module>
    cmd()
  File "/mnt/fast_disk/linux/tools/b4/b4/command.py", line 237, in cmd
    cmdargs.func(cmdargs)
  File "/mnt/fast_disk/linux/tools/b4/b4/command.py", line 51, in cmd_am
    b4.mbox.main(cmdargs)
  File "/mnt/fast_disk/linux/tools/b4/b4/mbox.py", line 622, in main
    make_am(msgs, cmdargs, msgid)
  File "/mnt/fast_disk/linux/tools/b4/b4/mbox.py", line 92, in make_am
    am_msgs = lser.get_am_ready(noaddtrailers=cmdargs.noaddtrailers,
  File "/mnt/fast_disk/linux/tools/b4/b4/__init__.py", line 600, in get_am_ready
    msg = lmsg.get_am_message(add_trailers=add_trailers, trailer_order=trailer_order, copyccs=copyccs)
  File "/mnt/fast_disk/linux/tools/b4/b4/__init__.py", line 1476, in get_am_message
    self.fix_trailers(trailer_order=trailer_order, copyccs=copyccs)
  File "/mnt/fast_disk/linux/tools/b4/b4/__init__.py", line 1412, in fix_trailers
    if trailer[3] is not None:
IndexError: list index out of range


I guess it's a different error, but I hate reading python tracebacks so
I can't really tell...

thanks,

greg k-h

