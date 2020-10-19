Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com [66.111.4.28])
 by mx.groups.io with SMTP id smtpd.web10.8683.1603091961716067352
 for <tools@linux.kernel.org>;
 Mon, 19 Oct 2020 00:19:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kroah.com header.s=fm2 header.b=x7EYEiAb;
 spf=pass (domain: kroah.com, ip: 66.111.4.28, mailfrom: greg@kroah.com)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
	by mailout.nyi.internal (Postfix) with ESMTP id 02DD55C0102;
	Mon, 19 Oct 2020 03:19:21 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute4.internal (MEProxy); Mon, 19 Oct 2020 03:19:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kroah.com; h=
	date:from:to:cc:subject:message-id:mime-version:content-type; s=
	fm2; bh=qxyqpiyKTC1Al2pkMDrK8OKVTkPtm/vIyx/PV1uckGY=; b=x7EYEiAb
	uxdFPF5+G8xzwaE9zPyf69/SxtYAjDbbC6mqiX0sKkXzlwebBJP4rWJH8sYQdO03
	WQxaOq/oCZ2Eh42aLhfy4AwN5OncSt41PICvHOkfTf4DJEq/DmYEfTBPuE4X5K6O
	RhjlbxjriSz2k5MA2M8QHqAMeppDxRxC+vNNVNiZLSKoXrHTey0LYJcTo43lLQHH
	J2q8pYKLMYen6pmTUly1/CIoFrD1w+6LODYq05+hBUcIxOK7nkVKnNvfuNc9RH6v
	5pASc/B+bFeprgzBJHfRTmQ/uN6JxGYvaJuHa4v90V6BWOrQMNlcWznY1vN4zpwz
	J9dnytE6R2EA3Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-type:date:from:message-id
	:mime-version:subject:to:x-me-proxy:x-me-proxy:x-me-sender
	:x-me-sender:x-sasl-enc; s=fm1; bh=qxyqpiyKTC1Al2pkMDrK8OKVTkPtm
	/vIyx/PV1uckGY=; b=mJEzNkKBnacZoBWMcvBmknK6c1WP4nrAmoUOoEnkbg/T6
	otWfJriKGMOVw30/VPYulirzE/OFBgqiAq+xrvq4tElmgkvw6R/LC3YY7eScGuNi
	ynIds0Ix4lmc7RMcK4ZcbBhhoEChGjAloka0eG9kiLJiW2VBN3iSc7qbtqHmre3L
	sePdORjs5e7avKix3oxNivkHaHEqmuSrz0uAjr6We24cqhvX581Fr1B1zu7092zH
	nbmMfpHVL/v+8U7ncomOHVR9zO5nyFIGEbPFQlxXjHZsk2gxm6uVEa9J1Dp5HpCm
	nbqBnVTb9p9VS0No6+huHGt1aZvKCYm/nkyMSJW0g==
X-ME-Sender: <xms:-D2NXyMNaaVIgs9Mgw22Ttf61voHvmwq7UP2Ll1cNrNt6964LwcgCw>
    <xme:-D2NXw8mwo2EmA6P-eTB4S4X7DfBIGz9bpycjXagiTY0K10QUQK0DKJ7FOlZGapGS
    x3fGgNimCI0wA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedujedrjedtgdduudejucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvffukfggtggusehttdertddttddvnecuhfhrohhmpefirhgvghcumfhr
    ohgrhhdqjfgrrhhtmhgrnhcuoehgrhgvgheskhhrohgrhhdrtghomheqnecuggftrfgrth
    htvghrnhepvdeltdfhhefhhfffjedujeeiueeliefgiefhudduieevtdetueduteffveek
    fefhnecuffhomhgrihhnpehkvghrnhgvlhdrohhrghenucfkphepkeefrdekiedrjeegrd
    eigeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehg
    rhgvgheskhhrohgrhhdrtghomh
X-ME-Proxy: <xmx:-D2NX5QGENmVFvS-Fnk4LF7yz0kMD-e47HWul0bOd8kFNhALxs0W2Q>
    <xmx:-D2NXysxD3_3nrwqFVbemRxyKFPvNIcdNQ3xeucGalgd2V3jNLoIaQ>
    <xmx:-D2NX6dVjJm2_3V5mlWOj1rkBUCv8YgfVPmISXo_s13DLA0FokxC_g>
    <xmx:-D2NX7rQN8uHm3Pf-qGRh6ul-H2OCCR3A48NIlmI3ATg_svyQMkPgQ>
Received: from localhost (83-86-74-64.cable.dynamic.v4.ziggo.nl [83.86.74.64])
	by mail.messagingengine.com (Postfix) with ESMTPA id 54A0F328005D;
	Mon, 19 Oct 2020 03:19:20 -0400 (EDT)
Date: Mon, 19 Oct 2020 09:20:06 +0200
From: "Greg KH" <greg@kroah.com>
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc: users@linux.kernel.org, tools@linux.kernel.org,
	Johan Hovold <johan@kernel.org>, Sasha Levin <sashal@kernel.org>
Subject: b4 seems to be dropping "cc: stable" on patches.
Message-ID: <20201019072006.GB3219053@kroah.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Konstantin,

It looks like 'b4' is dropping the cc: stable lines of patches.

Or at least it currently does this for me when I do the following:

$ b4 am -t https://lore.kernel.org/r/20200921135951.24045-3-johan@kernel.org
Looking up https://lore.kernel.org/r/20200921135951.24045-3-johan%40kernel.org
Grabbing thread from lore.kernel.org/linux-usb
Analyzing 22 messages in the thread
---
Writing ./v2_20200921_johan_usb_cdc_acm_handle_broken_union_descriptors.mbx
  [PATCH v2 1/4] Revert "cdc-acm: hardening against malicious devices"
    + Acked-by: Oliver Neukum <oneukum@suse.com>
  [PATCH v2 2/4] USB: cdc-acm: handle broken union descriptors
    + Tested-by: Daniel Caujolle-Bert <f1rmb.daniel@gmail.com>
    + Acked-by: Oliver Neukum <oneukum@suse.com>
  [PATCH v2 3/4] USB: cdc-acm: use common data-class define
    + Acked-by: Oliver Neukum <oneukum@suse.com>
  [PATCH v2 4/4] USB: cdc-acm: clean up no-union-descriptor handling
    + Acked-by: Oliver Neukum <oneukum@suse.com>
---
Total patches: 4
---
Cover: ./v2_20200921_johan_usb_cdc_acm_handle_broken_union_descriptors.cover
 Link: https://lore.kernel.org/r/20200921135951.24045-1-johan@kernel.org
 Base: not found
       git am ./v2_20200921_johan_usb_cdc_acm_handle_broken_union_descriptors.mbx

If you look at the mbox, the "cc: stable" is now gone from the
signed-off-by area of the patch.

Johan just noticed this in this discussion of a patch that was "auto
selected" for stable backporting:
	https://lore.kernel.org/linux-usb/20201019070218.GO26280@localhost/

And as I've been using b4 for a few weeks now to apply patches, I don't
know where else this has dropped things :(

I can reproduce this on the current b4 git tree, at commit c0910ee77a2a
("Fix header encoding introduced by earlier fix") as of this moment.

thanks,

greg k-h
