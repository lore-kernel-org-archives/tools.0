Received: from mail-qt1-f178.google.com (mail-qt1-f178.google.com [209.85.160.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 313D83203
	for <tools@linux.kernel.org>; Tue, 19 Jul 2022 15:32:50 +0000 (UTC)
Received: by mail-qt1-f178.google.com with SMTP id a9so11247995qtw.10
        for <tools@linux.kernel.org>; Tue, 19 Jul 2022 08:32:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=WH4T1BXtBlFKhiMsWysBqR895IQKKMPicE0BTh2wpxQ=;
        b=d8ZGYhrWcysFQNxyctXh2I3AIPEOQKD8xZHXgGk5tSweM9UaKnGU6n6tsz6z+A6Xcv
         1uEjRhsqErZNRv5nSqiO9taNFUqEqdKLrMPChylKMDwAxkWZFbdpIbfsMKVVDBPsqPW9
         nle2U+zXbJlaTzqqrCexCUcEKvnQLaDVdVu4P1qk56p5SoBsgmuXqNut7c6d8igVLECH
         lWsRibvyPzjITaHYfL18TW9fpSAIIPUOJ50X6QKcnGjeTImh7WyoJHK6lLiNSg9igozS
         S2m3FzjBPIpcs9MXxNVibHZGVoBsWTSuEanG4mxHd9SJIF8q1DMYo7o9knjXOw7jnoTJ
         0Fug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=WH4T1BXtBlFKhiMsWysBqR895IQKKMPicE0BTh2wpxQ=;
        b=gSh4Q8McWtpGNW0w/mpH9XKCO6xZFKI/ELJSLQZyjv5FiMcIfI7/Uf/keRtD4oawD0
         4lHVl4/UgvLbuun+hGn02cUWUvUOdO01Y0l8cvql3q7rSpjE/O8Ojr8sXc5VaQ69Cvyf
         M8keN8jEoku04BjoiK0T7JbtmIBeRL9wkKy5D00hxnNjEA0R8V6yPXa72GA8fR9Vhnw9
         B82+1LEmi4kFDOWUlQdj1vRMVr4tqNq5ZTosHJ78l4jqbuMxfjuAG8PvK0UkA2+hX4fU
         0jP//fArvexFd9fcTAzp9yGWXY8tkPOl+K1Cw3OVtaxTgWrXsjfWPiM+Mk+/+mFpxsJv
         bhhQ==
X-Gm-Message-State: AJIora/5kTBCdp8aA44unA3FBrVEhuzazkxJhO13tvpdUD2qTR8EKqBn
	wZemcKeQTv8OYObGM20i6N3rmw==
X-Google-Smtp-Source: AGRyM1uyEU+Wn2zWTqqSDv0RXJnOK6DrL+jolrU2wxF6RkLdEFGsYa44IiBngLHgqP8Q1FfjcNWBcw==
X-Received: by 2002:ac8:5c09:0:b0:31f:bd:fd30 with SMTP id i9-20020ac85c09000000b0031f00bdfd30mr2047408qti.67.1658244768889;
        Tue, 19 Jul 2022 08:32:48 -0700 (PDT)
Received: from ziepe.ca (hlfxns017vw-142-162-113-129.dhcp-dynamic.fibreop.ns.bellaliant.net. [142.162.113.129])
        by smtp.gmail.com with ESMTPSA id m6-20020a05620a290600b006b5c492aafesm13045951qkp.86.2022.07.19.08.32.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Jul 2022 08:32:48 -0700 (PDT)
Received: from jgg by mlx with local (Exim 4.94)
	(envelope-from <jgg@ziepe.ca>)
	id 1oDpDL-000mhG-6S; Tue, 19 Jul 2022 12:32:47 -0300
Date: Tue, 19 Jul 2022 12:32:47 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Maxime Ripard <maxime@cerno.tech>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>,
	Konstantin Ryabitsev <konstantin@linuxfoundation.org>,
	James Bottomley <James.Bottomley@hansenpartnership.com>,
	users@linux.kernel.org, tools@linux.kernel.org
Subject: Re: b4 submit ready for beta testing
Message-ID: <20220719153247.GI5049@ziepe.ca>
References: <6ad8ce3aa0d14d8a09a3c117affe19928a44f639.camel@HansenPartnership.com>
 <20220717160218.a5ccu4chbaoj3uxv@meerkat.local>
 <20220718181732.GC5049@ziepe.ca>
 <CAMuHMdWgjimmGRxP6kLK_mzv3Fo=5S6SjYj5sbk24eSHLWKZHg@mail.gmail.com>
 <20220718231012.GE5049@ziepe.ca>
 <CAMuHMdUQiMwcC=r5NUZzniLC1qLkfcsB0rj+VnGm15+-ztjRqA@mail.gmail.com>
 <20220719123434.GF5049@ziepe.ca>
 <CAMuHMdVfrbnBmh=MCoX5S5y0JaMhZ7o8Do3bFORk1a_sF7MDOA@mail.gmail.com>
 <20220719130039.GH5049@ziepe.ca>
 <20220719135949.jlw3pfe3qz7xk53h@houat>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220719135949.jlw3pfe3qz7xk53h@houat>

On Tue, Jul 19, 2022 at 03:59:49PM +0200, Maxime Ripard wrote:

> > I'm puzzled why people are saying this is non-standard, it is well
> > supported by git and works well with all the review and web tools. The
> > only missing bit in git is a git format-patch flag to process it
> > automatically into to the cover letter email.
> 
> So, I definitely haven't been around for as long as you, but I still
> have been using git daily for the last 15 years. It's literally the
> first time I'm hearing about someone using that workflow.

To be fair, I didn't encounter this until I started to have to work
with gerrit, maybe 5 years ago.

It seems common enough, eg I can find other communities using gerrit
documenting this methodology:

https://fabric-documentations.readthedocs.io/en/latest/Gerrit/best-practices.html#creating-a-cover-letter-for-a-topic

If you are working alone you can get by with tags or the branch
description, but as we discussed it really doesn't scale into a team
environment because the data falls outside the natural source control.

> I'm sure that it works great for you and others using that workflow, but
> it's far from widely used still. I wouldn't call it non-standard
> because, well, there's pretty much no standard when it comes to how you
> should use git, but if we're targeting outsiders we shouldn't go too far
> off the typical workflow.

I think this thread shows exactly that there is no typical workflow
here.

IMHO Konstantin shoul decide if the goal if this b4 feature is to
support everyone's unique idea of a work flow, or to implement a
reasonable broadly useful workflow that is simple to use and
understand.

And I think it is a legitimate point that it would be nice if 'git
format-email' could be taught to natively handle whatever cover-letter
storage b4 wants to use.

Jason
