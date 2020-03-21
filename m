Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
 by mx.groups.io with SMTP id smtpd.web10.380.1584752072874701342
 for <tools@linux.kernel.org>;
 Fri, 20 Mar 2020 17:54:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=WIGrpe+O;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.214.180, mailfrom: konstantin@linuxfoundation.org)
Received: by mail-pl1-f180.google.com with SMTP id f16so3224877plj.4
        for <tools@linux.kernel.org>; Fri, 20 Mar 2020 17:54:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=yhIRv5qV4DeALbwqzdU4XzpaCfBJ6paJJcVznhZ8kPE=;
        b=WIGrpe+Oud40TRf2j+RIRWa0sJwOL+wqiFTqtN8aoxC9DqKXWZgnFpcAj+4qOcfzIP
         ucRfXgjA6tXF4m3yR2R5dhikFWkSG3IQb140S6J5xK2hqz/gVwwsEKQgMrrhg+kxCD9m
         yR2Uu1FaZ1gW3KWPBbFVCwSIfZ8PCg+mYZ+qE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=yhIRv5qV4DeALbwqzdU4XzpaCfBJ6paJJcVznhZ8kPE=;
        b=B43NZ0kaBynuc7LlwhE58aVV9YWiT4VAXUOs6csNarxi1aQLLp4ltJkbLcAmWNDwWD
         z3c8a6w/gOo4Y12vD7tmUu7BXD/fkxBpRErpYzNHiPo6DYicl7SZhl6EXVVmVZkEjYdd
         NJKR/mva2Cixt/MRV7gVDpe4QdUpFylRMySrEqnfs1NMNE0PmSVB3uufY0dtd/TOCmJ6
         yxF1UJV9EXhNepqdDrqPs68IDNkj9ChzLvYWWHpIMLfQZKI66vmWrPo9HTMd6FjqxW5G
         ITQFdIJvptobAn1dY3SbyxgTxYXNkMA5AkCe2UPLmlJJ9u/mMUXJcw5jmXphWWTwVy87
         5VQQ==
X-Gm-Message-State: ANhLgQ3Kh7gSLk9lbNyqFzPhZd8y0Z0t8XvCoh2wxwlDETP7T8wlWZS/
	EEX8oWAO0+mvrAFFz4XD2lRHGg==
X-Google-Smtp-Source: ADFU+vvDA21FBPV7OEhnu9uQGfkpGZUBwuQG0WdEcGopS4xjQLrd3AUPEQNdDyn5NxR1cqXxPOTVrg==
X-Received: by 2002:a17:90a:71c5:: with SMTP id m5mr469107pjs.193.1584752072194;
        Fri, 20 Mar 2020 17:54:32 -0700 (PDT)
Return-Path: <konstantin@linuxfoundation.org>
Received: from chatter.i7.local ([23.129.64.188])
        by smtp.gmail.com with ESMTPSA id k2sm6101593pgj.16.2020.03.20.17.54.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Mar 2020 17:54:31 -0700 (PDT)
Date: Fri, 20 Mar 2020 20:54:19 -0400
From: "Konstantin Ryabitsev" <konstantin@linuxfoundation.org>
To: "Luck, Tony" <tony.luck@intel.com>
Cc: users@linux.kernel.org, tools@linux.kernel.org
Subject: Re: Another glitch in "b4"
Message-ID: <20200321005419.nk2g2hkzli4d32dc@chatter.i7.local>
References: <20200321001533.GA6137@agluck-desk2.amr.corp.intel.com>
MIME-Version: 1.0
In-Reply-To: <20200321001533.GA6137@agluck-desk2.amr.corp.intel.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

On Fri, Mar 20, 2020 at 05:15:33PM -0700, Luck, Tony wrote:
> $ b4 am 20200320131345.635023594@linutronix.de
> Looking up https://lore.kernel.org/r/20200320131345.635023594@linutronix.de

This one is already fixed in the master. You can grab the repo directly 
from https://git.kernel.org/pub/scm/utils/b4/b4.git and set your alias 
to the "b4.sh" wrapper in there. That should let you run it directly 
from the checkout.

I plan to push 0.3.4 into pip tomorrow.

-K
