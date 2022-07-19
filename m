Received: from mail-qv1-f51.google.com (mail-qv1-f51.google.com [209.85.219.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A8E010FA
	for <tools@linux.kernel.org>; Tue, 19 Jul 2022 12:34:37 +0000 (UTC)
Received: by mail-qv1-f51.google.com with SMTP id u3so1638208qvm.9
        for <tools@linux.kernel.org>; Tue, 19 Jul 2022 05:34:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=igwQIC5EYKjULlpMeEUDsssj8qFh3y4jySfEPyguG3k=;
        b=mV+BdM0YTKixjBFx38PeuzwEGiR22NcuFradsy8tpGKf1hivKE0tkr6VdiY8W13Ifm
         65LzHmT9tOU5x0OpAxHuEik2OOJ/Tb6PKkl53O/CA3Q/p8unejjRfbdoUdZoXMHAZPII
         e01WSxPh7zGkfeqy9YP0l7+vbv24gdTqxEzdAKiK4kQcG5br0Az7JNc2df4Q7f/vY020
         9B1uF6jKaTnkjQ4c09bvQ3Z3c9qwhhfpQfgQE4C7DGLBuso+baeWxtwJXOZCnSCRev5o
         Hgr/F5daTbLJPZ2nZ2wopBbTzR9J2vvntcQAoFGGWLmAAUMjKFxxnDdbU2iitg15CSyT
         WcOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=igwQIC5EYKjULlpMeEUDsssj8qFh3y4jySfEPyguG3k=;
        b=6Ew/cwW9mBfdavtNHm7Kw6klqPSEYwuJm0bSaWMDMRJFSF0TW8khvUan7itZxxpSDq
         XTvRwUnpx3CTGl93UdLkzjdjm7jVxPQKty2RKSEzXFt2aHJyBnPPbKhU7f5jQdHCGFKw
         fRLxRQoRJaYqmOSlH9Y9gyBCXnirNikRon83nNKDGdDkG8kn22JHBxJHlCKGgXU65j5S
         0xZaFov1vfR3pb/kjFseU7qToDxVeGeZMAyo1EKAU+wvEeGAViCeLwheQCTUnmlyYa/V
         m+KzR9wJQlJmW8UfZf3HhduXfKCr6PPcjY1U2msl67dAvb/6RWbRKRg/Ioft6FXnCyeP
         shrQ==
X-Gm-Message-State: AJIora+wXDTLvDe8MiOumlZ2bhJVko9HJ4fotAlkRouAGZqx5HWwis0H
	fMw8P6Zl9wEonJ1Kp6IKPve08+OPuECHsA==
X-Google-Smtp-Source: AGRyM1vWv2C+IKjag8D756Kqk2QEt2/AFEWyP9oFGuLAMfGe1FTIYkkK5vytMCuP7zFMTMltrIDOIw==
X-Received: by 2002:a05:6214:4016:b0:473:2180:c03a with SMTP id kd22-20020a056214401600b004732180c03amr24991890qvb.83.1658234076312;
        Tue, 19 Jul 2022 05:34:36 -0700 (PDT)
Received: from ziepe.ca (hlfxns017vw-142-162-113-129.dhcp-dynamic.fibreop.ns.bellaliant.net. [142.162.113.129])
        by smtp.gmail.com with ESMTPSA id l67-20020a37bb46000000b006b53fe19c41sm13984520qkf.14.2022.07.19.05.34.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Jul 2022 05:34:35 -0700 (PDT)
Received: from jgg by mlx with local (Exim 4.94)
	(envelope-from <jgg@ziepe.ca>)
	id 1oDmQs-000kd3-JY; Tue, 19 Jul 2022 09:34:34 -0300
Date: Tue, 19 Jul 2022 09:34:34 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Konstantin Ryabitsev <konstantin@linuxfoundation.org>,
	James Bottomley <James.Bottomley@hansenpartnership.com>,
	users@linux.kernel.org, tools@linux.kernel.org
Subject: Re: b4 submit ready for beta testing
Message-ID: <20220719123434.GF5049@ziepe.ca>
References: <20220716142954.voq4ucnl5wkq7h2b@nitro.local>
 <4c4652b0e333bd81b91f71346ac6142322682eff.camel@HansenPartnership.com>
 <20220716145638.ubuwwc7xtjw6ugy7@meerkat.local>
 <6ad8ce3aa0d14d8a09a3c117affe19928a44f639.camel@HansenPartnership.com>
 <20220717160218.a5ccu4chbaoj3uxv@meerkat.local>
 <20220718181732.GC5049@ziepe.ca>
 <CAMuHMdWgjimmGRxP6kLK_mzv3Fo=5S6SjYj5sbk24eSHLWKZHg@mail.gmail.com>
 <20220718231012.GE5049@ziepe.ca>
 <CAMuHMdUQiMwcC=r5NUZzniLC1qLkfcsB0rj+VnGm15+-ztjRqA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMuHMdUQiMwcC=r5NUZzniLC1qLkfcsB0rj+VnGm15+-ztjRqA@mail.gmail.com>

On Tue, Jul 19, 2022 at 09:02:40AM +0200, Geert Uytterhoeven wrote:

> > If I use a tag I have to remember to update the tag after every
> > rebase. It is much more likely to break down.
> 
> Why would you have to update the tag? The tag would represent what
> was sent out, i.e. the tag name would include the revision number.
> After rebase, you have to recreate the cover letter (with an
> increased revision number), using the previous tag description as
> a template.

Using a tag as 'what was sent out' might make sense - but that is a
different problem.

In many cases the cover letter is part of the series, and complex
series often have very big cover letters explaining what is going on
that take alot of effort to make and review in a "team based" flow.

Fundamentally, the cover letter needs to be source controlled while it
is being authored just like anything else.

> It would be great if this could auto-insert a lore link to the previous
> revision ("Changes since v${n-1} [https://lore...]").  Git can store
> the commit hash into the Message-Id, but it also contains a timestamp,
> so you can't go easily from tag to Message-Id.

What I've found useful is a tool that automatically generates a git
range-diff between the current branch and the last posted and also
displays the lore link. This helps tremendously producing the change
log.

Jason
