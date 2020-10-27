Received: from wout1-smtp.messagingengine.com (wout1-smtp.messagingengine.com [64.147.123.24])
 by mx.groups.io with SMTP id smtpd.web08.12890.1603801342010310497
 for <tools@linux.kernel.org>;
 Tue, 27 Oct 2020 05:22:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kroah.com header.s=fm2 header.b=jX2pPTsv;
 spf=pass (domain: kroah.com, ip: 64.147.123.24, mailfrom: greg@kroah.com)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
	by mailout.west.internal (Postfix) with ESMTP id 28A6BE91;
	Tue, 27 Oct 2020 08:22:21 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute4.internal (MEProxy); Tue, 27 Oct 2020 08:22:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kroah.com; h=
	date:from:to:cc:subject:message-id:mime-version:content-type; s=
	fm2; bh=eM/BbTwLj7SPLXhO35eogzx2+7jF9nVBIFqXXT0/Z90=; b=jX2pPTsv
	sh1rICHppVNL7ka6PeGd89VTabvJJEy3l85vwflUjh8bpnXPCfO9MFJaT7Vd6iLW
	EndsyetpOu8Y4tdfjQ860GVsl+nDcpOXOgyCt9RDGU64PvURRSZgrn0hDpTI2fOl
	31Nr/A8N4OVBeuSixt847T631zaNnv1jdi4OTWdudR49Sbg66qM9EdQdr8KVUXfM
	zf2+n2fEnyqne0uzx0djBFsbMnjpAW7riPAP2PmO5T1MzHxhjz4v5rI7z3iONo2E
	VxmeqW9t3dYmck8uuOiSkiWAb5M23rWMRdc7gpv1eAOUZO1gyEXoQg8jqIa2TDlj
	Ha9GJakOKDyl0g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-type:date:from:message-id
	:mime-version:subject:to:x-me-proxy:x-me-proxy:x-me-sender
	:x-me-sender:x-sasl-enc; s=fm1; bh=eM/BbTwLj7SPLXhO35eogzx2+7jF9
	nVBIFqXXT0/Z90=; b=AfcNRj4IWav1g3p0m3bP/2ohFCqSTkkmC9vq4fhG0kopm
	uJHKMn81i108bNk5vtOH3ajxYyTj30tByyLSt50rj7/sSWUr4bK7TOsrAeVQBhwK
	8RFzEa/FAvbaDpfok3lytUxebIh4As9ohT8ltFF2ooDxjLBaMXIz11Ywyiv8G5ZD
	igJSSr809oCJ3or+/ZJjE/0ZOAM1ASeRCln/2RQQyddk4LBt8Te+V97BpaPsjxJ6
	e1IrfcDGuwlZqn9RJJRoIx/AcaNc7qFG8QNjCXHEyFJJVcrYf/rLp7a6ly8rjyg0
	8pijDPVatt9Lpfk3P2TWpH77r+BqXp9Ln4Mh4qqRg==
X-ME-Sender: <xms:_BCYX8e2Pyw0XWHMb1CA5sYJ0REaRD5UgvjuZI_A6HeC_FNqSJdmsw>
    <xme:_BCYX-O4wW7cKJRKHCv3Cbkv95zYeK8WP57M1A-OPUa7BlxR5aT1RaAV1vM_9ID97
    04PL4jg3-npfQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedujedrkeelgdeflecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpeffhffvuffkgggtugesthdtredttddtvdenucfhrhhomhepifhrvghgucfmrhho
    rghhqdfjrghrthhmrghnuceoghhrvghgsehkrhhorghhrdgtohhmqeenucggtffrrghtth
    gvrhhnpedvledthfehhffhffejudejieeuleeigfeihfduudeivedtteeuudetffevkeef
    hfenucffohhmrghinhepkhgvrhhnvghlrdhorhhgnecukfhppeekfedrkeeirdejgedrie
    egnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepghhr
    vghgsehkrhhorghhrdgtohhm
X-ME-Proxy: <xmx:_BCYX9gCPHcbzQNh6d9XpyauuGbWJLkaYtxjHU1VA8LcyvUCifkHMQ>
    <xmx:_BCYXx-yHuN_tUz-6TljPfepefdGdvOGbet_Gphtc4EnXXZkxvlPqQ>
    <xmx:_BCYX4t18ZrrBkLj9hUAP_tSien0DVWl9kTUsSEhS_UGgYV9nU3hcw>
    <xmx:_BCYX-2iBV4wW0_Hb-Oib82b6mFWK4HiaZAmb4A9lND9HvFwGkLDPA>
Received: from localhost (83-86-74-64.cable.dynamic.v4.ziggo.nl [83.86.74.64])
	by mail.messagingengine.com (Postfix) with ESMTPA id 255163064684;
	Tue, 27 Oct 2020 08:22:20 -0400 (EDT)
Date: Tue, 27 Oct 2020 13:23:15 +0100
From: "Greg KH" <greg@kroah.com>
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc: users@linux.kernel.org, tools@linux.kernel.org
Subject: b4 crash on staging driver patchset
Message-ID: <20201027122315.GA669512@kroah.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Konstantin,

On the latest tip of the 'b4' tree, I get the following crash with this
patch series:

$ b4 am -t https://lore.kernel.org/r/20201019160604.1609180-1-Jerome.Pouiller@silabs.com
Looking up https://lore.kernel.org/r/20201019160604.1609180-1-Jerome.Pouiller%40silabs.com
Grabbing thread from lore.kernel.org/driverdev-devel
Analyzing 3 messages in the thread
---
Writing ./20201019_jerome_pouiller_staging_wfx_fix_use_of_uninitialized_pointer.mbx
Traceback (most recent call last):
  File "/mnt/fast_disk/linux/tools/b4/b4/command.py", line 238, in <module>
    cmd()
  File "/mnt/fast_disk/linux/tools/b4/b4/command.py", line 221, in cmd
    cmdargs.func(cmdargs)
  File "/mnt/fast_disk/linux/tools/b4/b4/command.py", line 40, in cmd_am
    b4.mbox.main(cmdargs)
  File "/mnt/fast_disk/linux/tools/b4/b4/mbox.py", line 509, in main
    mbox_to_am(threadmbox, cmdargs)
  File "/mnt/fast_disk/linux/tools/b4/b4/mbox.py", line 114, in mbox_to_am
    am_mbx = lser.save_am_mbox(mbx, noaddtrailers=cmdargs.noaddtrailers,
  File "/mnt/fast_disk/linux/tools/b4/b4/__init__.py", line 522, in save_am_mbox
    latt.validate(lmsg.msg)
AttributeError: 'NoneType' object has no attribute 'validate'

Any hints?

thanks,

greg k-h
