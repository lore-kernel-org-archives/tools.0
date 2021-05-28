Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D4166D0E
	for <tools@linux.kernel.org>; Fri, 28 May 2021 19:15:08 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id A75FD611CA
	for <tools@linux.kernel.org>; Fri, 28 May 2021 19:15:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1622229308;
	bh=s2CDRo4NJ0eL+OtAW7w4V1BnZB15R6UeCvaMcjFb4iU=;
	h=From:Date:Subject:To:From;
	b=O3R1INSW74Et/l8KfBjPC6cCD8kUtiakEKHN8tsOhCPEKddS+snLbx5lULJKPPOag
	 tSKOAhxqO3A2x3SDmoeS6j8Dr7NWmGuYIIYnCKLEyecNVg41lE8ro/RIAYPFZHr4Vx
	 YnS1mCwDyv2gUQU8nIkhhmQe6KSCgCASICs0CaQzsg7IrfxUwIXmCB++Jo8wRxLpHN
	 F/oy2byzs96A4mYJS1t6/lMB2jXALKzkeLzibOTNdhEXiYugbYAFaeCIMxNgsVR4jx
	 oQIdEbTcAgvjUUYi+PBlu/mUbnT5DlW13abdY/bXciGuvFKdQSCcE9sszEhk8Lp9Yp
	 x8ijJPoorMElg==
Received: by mail-qv1-f54.google.com with SMTP id u33so2436128qvf.9
        for <tools@linux.kernel.org>; Fri, 28 May 2021 12:15:08 -0700 (PDT)
X-Gm-Message-State: AOAM532lG8n2mEXgRUC5Euf46Be26fXpPHTMs2Tz5YcQaCPsW8VEnyc3
	0tlub0D92fjO8WYUWZOd5k+r6f0oy4VXaFMFLFI=
X-Google-Smtp-Source: ABdhPJyIXYXdafsJkjxnisYqufRtG2a8CBC/MfVR4zHHqWVBCOtT0YnsRqjdbIr1Nn9+6AO3/4QBfjAXboRZ48Piri4=
X-Received: by 2002:ad4:5343:: with SMTP id v3mr5607249qvs.45.1622229307890;
 Fri, 28 May 2021 12:15:07 -0700 (PDT)
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
From: Luis Chamberlain <mcgrof@kernel.org>
Date: Fri, 28 May 2021 12:14:56 -0700
X-Gmail-Original-Message-ID: <CAB=NE6UdvJ3QdimXxbWVJr0+vTU+rkqjChtN-bgDyQ8VY83-TA@mail.gmail.com>
Message-ID: <CAB=NE6UdvJ3QdimXxbWVJr0+vTU+rkqjChtN-bgDyQ8VY83-TA@mail.gmail.com>
Subject: grokmirror and pi-piper for all emails on a list
To: tools@linux.kernel.org
Content-Type: text/plain; charset="UTF-8"

Dearly super-duper admins,

I just read for the first time:

https://people.kernel.org/monsieuricon/subscribing-to-lore-lists-with-grokmirror

And I am extremely excited. After trying it, it seems to work great!
Just one thing, say I want to actually get all emails on the archive
to be run through .procmail, how do I do that? So that it would seem I
subscribed to a mailing list from the very beginning? It would be cool
if I could do that per mailing list. For instance, I want to enable
that for all my mailing lists except lkml.

  Luis
