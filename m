Received: from mail-qk1-f177.google.com (mail-qk1-f177.google.com [209.85.222.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5436A187C
	for <tools@linux.kernel.org>; Tue, 19 Jul 2022 13:00:42 +0000 (UTC)
Received: by mail-qk1-f177.google.com with SMTP id n2so9673521qkk.8
        for <tools@linux.kernel.org>; Tue, 19 Jul 2022 06:00:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=SmJJFBNNTJIo+Ah91i/pFPLvKsW7aX0KcvzJnMUg6z4=;
        b=UQJDtjWn7u6cpuGJZCDH3XOZpRFa/rv0ldAcq0E2plWN93IKlh416zDM+vV1YgDp58
         a5VRo/92DzRH0wf44oaAiKB/sghU1NHbmgA0HQlzZiYB366Xc/QoOoCUxvz+lwZQxwTb
         Eb7bgS0rnK+DgsrBwEMqIta53mauzjv3T7c5bwghaoaTvPsnKSU1CFDc0Q9S0hhCmKUs
         lvgrWEX9RvVBYd+UAYB+1hi3GimAscnS4yvGm5ys4L1+RqyMkVvO0vU8gVkBovTR82iL
         TUUbrGs/npHj0DnUxyDYkpDw90WzvNsS3AoPlo+99hL4XnHHjEFuyjgATT6eP+G6+Nry
         KxhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=SmJJFBNNTJIo+Ah91i/pFPLvKsW7aX0KcvzJnMUg6z4=;
        b=tFpunQG6XPoGqTkSoElnKwEAN1VE+MOr8AO5MACnSxftxx9qghH5NAkVp7i5a3lUGG
         jy7/i6kAaffgM2MR/cfh/KkIY9HVByDum8Dj5KN3jD9K18nk6BqIyBOYogjwyRtBQ8NK
         xSg/36+jansPDyS1mtFi9jbDvj8gkJd9tHhRNcSlCSE1ltycRFXRHa5YVYPWOut+seA7
         Jzf+gpbJLqYSeYxqxFpmmZKypg4QhplAYKMABkvSXxUucuoHLhf16oS2InOOZr6hv48e
         Zdik1zEMxJSMf3MRNKla+mFIiowtZzc48cq/0nGcUjh5OZfqso8CJf4k9dUJZVOu5S27
         qnEw==
X-Gm-Message-State: AJIora9M0nH1fcolv1Dmc9Ss3lTAGlIAMlzNXOcaXr6fC3p74O3mU7c3
	BOs73G4esqqNmANe//difI7ZPg==
X-Google-Smtp-Source: AGRyM1tzvyHl6L5JaLYIKaAaEYa9xTNcmtb9giqMSrmypwN142kILQ2KDOUaI49spcwg0tIQoXwuEw==
X-Received: by 2002:a05:620a:4116:b0:6b6:31e:b7ed with SMTP id j22-20020a05620a411600b006b6031eb7edmr853466qko.529.1658235640907;
        Tue, 19 Jul 2022 06:00:40 -0700 (PDT)
Received: from ziepe.ca (hlfxns017vw-142-162-113-129.dhcp-dynamic.fibreop.ns.bellaliant.net. [142.162.113.129])
        by smtp.gmail.com with ESMTPSA id k7-20020a05620a414700b006b5e5ebfff8sm6302055qko.62.2022.07.19.06.00.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Jul 2022 06:00:40 -0700 (PDT)
Received: from jgg by mlx with local (Exim 4.94)
	(envelope-from <jgg@ziepe.ca>)
	id 1oDmq7-000kx5-Mr; Tue, 19 Jul 2022 10:00:39 -0300
Date: Tue, 19 Jul 2022 10:00:39 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Konstantin Ryabitsev <konstantin@linuxfoundation.org>,
	James Bottomley <James.Bottomley@hansenpartnership.com>,
	users@linux.kernel.org, tools@linux.kernel.org
Subject: Re: b4 submit ready for beta testing
Message-ID: <20220719130039.GH5049@ziepe.ca>
References: <4c4652b0e333bd81b91f71346ac6142322682eff.camel@HansenPartnership.com>
 <20220716145638.ubuwwc7xtjw6ugy7@meerkat.local>
 <6ad8ce3aa0d14d8a09a3c117affe19928a44f639.camel@HansenPartnership.com>
 <20220717160218.a5ccu4chbaoj3uxv@meerkat.local>
 <20220718181732.GC5049@ziepe.ca>
 <CAMuHMdWgjimmGRxP6kLK_mzv3Fo=5S6SjYj5sbk24eSHLWKZHg@mail.gmail.com>
 <20220718231012.GE5049@ziepe.ca>
 <CAMuHMdUQiMwcC=r5NUZzniLC1qLkfcsB0rj+VnGm15+-ztjRqA@mail.gmail.com>
 <20220719123434.GF5049@ziepe.ca>
 <CAMuHMdVfrbnBmh=MCoX5S5y0JaMhZ7o8Do3bFORk1a_sF7MDOA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMuHMdVfrbnBmh=MCoX5S5y0JaMhZ7o8Do3bFORk1a_sF7MDOA@mail.gmail.com>

On Tue, Jul 19, 2022 at 02:47:09PM +0200, Geert Uytterhoeven wrote:
> Hi Jason,
> 
> On Tue, Jul 19, 2022 at 2:34 PM Jason Gunthorpe <jgg@ziepe.ca> wrote:
> > On Tue, Jul 19, 2022 at 09:02:40AM +0200, Geert Uytterhoeven wrote:
> > > > If I use a tag I have to remember to update the tag after every
> > > > rebase. It is much more likely to break down.
> > >
> > > Why would you have to update the tag? The tag would represent what
> > > was sent out, i.e. the tag name would include the revision number.
> > > After rebase, you have to recreate the cover letter (with an
> > > increased revision number), using the previous tag description as
> > > a template.
> >
> > Using a tag as 'what was sent out' might make sense - but that is a
> > different problem.
> >
> > In many cases the cover letter is part of the series, and complex
> > series often have very big cover letters explaining what is going on
> > that take alot of effort to make and review in a "team based" flow.
> >
> > Fundamentally, the cover letter needs to be source controlled while it
> > is being authored just like anything else.
> 
> Makes sense.
> 
> So during development, you want the cover letter to be a real file,
> using a specific file naming convention.
> When sending out the series, you need some machinery to detect the
> cover letter file, and turn it into the 0000-cover-letter.txt file instead?

Here we've always used empty commits for this, for years and years
now. 

I'm puzzled why people are saying this is non-standard, it is well
supported by git and works well with all the review and web tools. The
only missing bit in git is a git format-patch flag to process it
automatically into to the cover letter email.

Adding dummy files to store the cover commit instead of using the
commit blob just seems worse. You get needless rebase conflicts for
instance when working on multi-series projects.

Jason
