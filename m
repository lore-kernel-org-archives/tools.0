Received: from mail-qk1-f182.google.com (mail-qk1-f182.google.com [209.85.222.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 477DB6D28
	for <tools@linux.kernel.org>; Wed, 14 Apr 2021 14:56:23 +0000 (UTC)
Received: by mail-qk1-f182.google.com with SMTP id s5so12910176qkj.5
        for <tools@linux.kernel.org>; Wed, 14 Apr 2021 07:56:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=date:from:to:cc:subject:message-id:mail-followup-to:references
         :mime-version:content-disposition:in-reply-to;
        bh=y+DFxLWafXZNuhh6WQqJCyiz0mMmxvLmS5SDnVFL9EE=;
        b=b2lvngag02RCU4NxUs/SzxQi1fzk60YGwjgY++5hu/9aR/w9KkQkiQu2HWCH5WruCJ
         uv9JjWufCfub/G5mXpmxTbchhVCLYpqIY7qUvJHTf+mU4U1fEEzOVGLD60HTK3KSg4+1
         aaWA77QSvgvdkJt2CrLzhu9BnslGiagtBMCxQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id
         :mail-followup-to:references:mime-version:content-disposition
         :in-reply-to;
        bh=y+DFxLWafXZNuhh6WQqJCyiz0mMmxvLmS5SDnVFL9EE=;
        b=hjFOWjgwjFSYvDy54FqrDojB/iliqb+MSTOPMA8uUJF46/GOtRm6l53Uked+AfgIOQ
         LADeAgusp3fVmGeTx7TUce2TFNfwX/ogN1AuUqKPh7KfpKuprZs8fsnvI67whLQrVvjN
         SbJBLlBwHw4aX2mggcfWBsrOLq2Msr3OtiyzkjSWhR2RfewhAtSgjKIL14Lw7U8fpKv/
         g6nhsiaoLfd9Q8279sG9mV4bjj6121C+mOOKRQ5LgV0HcClo+cicW7W6uER7sSQYmRuR
         blhdPgaG8g+WCFh//+sXfjmV3pivJHCsp08bKOjMBgCYsnF/biYss/N/Yo0nB98mzD+7
         Gw3A==
X-Gm-Message-State: AOAM533eUha+885INPKoE8T3MoHphQk7BnwfCBqkp601eOPZyayiKzN/
	RnOUUScA2jkqbN1HVzvCYRcV3w==
X-Google-Smtp-Source: ABdhPJyHqM4yXL36dWmmTyfSkQ5UgdY4sNHLwN4q3uIzAwSSN7IMzIciJXTguoGNuSaYD96yfHn5Nw==
X-Received: by 2002:a37:f509:: with SMTP id l9mr15525481qkk.172.1618412182265;
        Wed, 14 Apr 2021 07:56:22 -0700 (PDT)
Received: from nitro.local ([89.36.78.230])
        by smtp.gmail.com with ESMTPSA id q65sm12430622qkb.51.2021.04.14.07.56.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Apr 2021 07:56:21 -0700 (PDT)
Date: Wed, 14 Apr 2021 10:56:19 -0400
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: Jason Gunthorpe <jgg@ziepe.ca>
Cc: James Bottomley <James.Bottomley@hansenpartnership.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Steven Rostedt <rostedt@goodmis.org>,
	"Jason A. Donenfeld" <Jason@zx2c4.com>, Alex Elder <elder@ieee.org>,
	users@linux.kernel.org, tools@linux.kernel.org
Subject: Re: RFC: Superseded-by: follow-up trailer
Message-ID: <20210414145619.packpzwjauqj4fug@nitro.local>
Mail-Followup-To: Jason Gunthorpe <jgg@ziepe.ca>,
	James Bottomley <James.Bottomley@hansenpartnership.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Steven Rostedt <rostedt@goodmis.org>,
	"Jason A. Donenfeld" <Jason@zx2c4.com>, Alex Elder <elder@ieee.org>,
	users@linux.kernel.org, tools@linux.kernel.org
References: <20210413204932.yovoa7njwc56jo5v@nitro.local>
 <fd732fc9-83a9-5502-fba5-f08317bdcaf3@ieee.org>
 <CAHmME9pFqm00ibpqhQQ9_P61F7mU12yrcOvdNSDYDz8ot8HJDg@mail.gmail.com>
 <20210413172901.1465307c@gandalf.local.home>
 <20210413214031.fenjvgh5helyuqdz@nitro.local>
 <YHaaMaa2uaa6HM9c@hirez.programming.kicks-ass.net>
 <20210414114950.GM227011@ziepe.ca>
 <2f6c16aea7593e25d51ed54501d462443d4b9012.camel@HansenPartnership.com>
 <20210414143618.GN227011@ziepe.ca>
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20210414143618.GN227011@ziepe.ca>

On Wed, Apr 14, 2021 at 11:36:18AM -0300, Jason Gunthorpe wrote:

I think submitter tooling is a separate discussion that should happen in a
different thread, which I'll start shortly (it slots into my auto-pr-exploder
work). I'll just comment on the below:

>  For v2:
>  - Pull in all tags from the mailing list and update the git commits
>    (b4 downloads the tags but doesn't automate fixing the local git
>    branch)

The best workflow I can recommend here is:

1. create a new branch from the latest upstream, e.g. myfoo_v1
2. "b4 am/git am" your own v1 (this has an added bonus of rebasing it)
3. create a new branch from myfoo_v1 as myfoo_v2
4. make any changes to myfoo_v2

This lets you easily run range-diff between myfoo_v1 and myfoo_v2 and lets you
reuse the cover letter you retrieved for v1 as part of "b4 am".

-K
