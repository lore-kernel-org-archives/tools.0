Received: from mail-qv1-f54.google.com (mail-qv1-f54.google.com [209.85.219.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE1ED3203
	for <tools@linux.kernel.org>; Tue, 19 Jul 2022 15:34:04 +0000 (UTC)
Received: by mail-qv1-f54.google.com with SMTP id t7so1133754qvz.6
        for <tools@linux.kernel.org>; Tue, 19 Jul 2022 08:34:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=i7XXqR3uanZ4atwxqlt9SB2Z5bC2RJE4ITOs/mBjxfA=;
        b=QdgDgdP/eQre1HNL2iLAoMDFJroYoBMLjYkCu0jd/NuSFNOBIXiPlkEtoR7JKUFcgy
         R0m60+dRvuDJsjumFRpMUalvguXrWRQTQv8Fn2GnxU9pntMrRC8iqWF9nLoJeYPvm5QV
         3vKCubTSW/SQm6zAKlXjLuDr6hkfv0oRZLrwchvWfFPO9R+EV61KQT6Xsfy1OSWDPcI+
         Ksm8C4i0mzj0Xa2atipH8inLXeVlFIOPMquACJnsliqInk5R/GoXst1yu0KOJYEHA/HX
         6B3sQFerrGfw+k+0B+bZu3H0bru5Cd6clCxe0wmcJKJPEkgYKfTvV80YVDAbiUbR2yf9
         tJrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=i7XXqR3uanZ4atwxqlt9SB2Z5bC2RJE4ITOs/mBjxfA=;
        b=g1gqIp/Uex/ZfAqSN9ruWipAKB5cCywzsvcnPJBc72emhRvTuUCSJFJA+RvTrCJBZ9
         lidnwpgasxZLzQ4v6lVxarvR9bqxUVL1UwR/sotxC18N9DXotDNwYRV9H3ZjXG4Vfg5k
         iZJADpKfH5d7hJx5Mz55HQ/c+jQJLUcocBqKNe4xhDniEFzjOuwnHyZB33Azd3jOG8YQ
         AodSKCHagSlGyTKxEDHlQOTrHboCTL2xkHJvwfAE4rNkOMvl/IBdnqqlKb4kQEk/gI8O
         3ipRR83j1xxW5mnObQzP08wNhUYyO++CYZ/HSpFNABgfpSkrzingVJicAQwM8GDRSOYa
         OptQ==
X-Gm-Message-State: AJIora9jLJDQxjGxtqqb7a3ptUyjEgqwOYclD6pQAkDQlkrPlJ0RvW38
	H4eyFj9C1TkBcGMT5dEayToi4g==
X-Google-Smtp-Source: AGRyM1usppu2DGvieSVnfIYz/GVNA7HMOjl5AHt/mMyem8D+zLYvCe9G9AUcZaTmGNrixbtji5AC8g==
X-Received: by 2002:a0c:8143:0:b0:473:6748:6da4 with SMTP id 61-20020a0c8143000000b0047367486da4mr25359774qvc.33.1658244843876;
        Tue, 19 Jul 2022 08:34:03 -0700 (PDT)
Received: from ziepe.ca (hlfxns017vw-142-162-113-129.dhcp-dynamic.fibreop.ns.bellaliant.net. [142.162.113.129])
        by smtp.gmail.com with ESMTPSA id x20-20020a05620a0b5400b006a6ab259261sm14065180qkg.29.2022.07.19.08.34.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Jul 2022 08:34:03 -0700 (PDT)
Received: from jgg by mlx with local (Exim 4.94)
	(envelope-from <jgg@ziepe.ca>)
	id 1oDpEY-000miP-LC; Tue, 19 Jul 2022 12:34:02 -0300
Date: Tue, 19 Jul 2022 12:34:02 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: James Bottomley <James.Bottomley@HansenPartnership.com>
Cc: Konstantin Ryabitsev <konstantin@linuxfoundation.org>,
	users@linux.kernel.org, tools@linux.kernel.org
Subject: Re: b4 submit ready for beta testing
Message-ID: <20220719153402.GJ5049@ziepe.ca>
References: <20220716142954.voq4ucnl5wkq7h2b@nitro.local>
 <4c4652b0e333bd81b91f71346ac6142322682eff.camel@HansenPartnership.com>
 <20220716145638.ubuwwc7xtjw6ugy7@meerkat.local>
 <6ad8ce3aa0d14d8a09a3c117affe19928a44f639.camel@HansenPartnership.com>
 <20220717160218.a5ccu4chbaoj3uxv@meerkat.local>
 <20220718181732.GC5049@ziepe.ca>
 <d99a81d4f725eda056722b17c8749e8b96735e75.camel@HansenPartnership.com>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d99a81d4f725eda056722b17c8749e8b96735e75.camel@HansenPartnership.com>

On Tue, Jul 19, 2022 at 09:01:36AM -0400, James Bottomley wrote:
> On Mon, 2022-07-18 at 15:17 -0300, Jason Gunthorpe wrote:
> > On Sun, Jul 17, 2022 at 12:02:18PM -0400, Konstantin Ryabitsev wrote:
> > 
> > > Perhaps, but I also have other reasons to like using an empty
> > > commit for this. For example, it makes it very easy to mark where
> > > exactly our series starts.
> > 
> > It is a good point, but it is backwards to how alot of people have
> > been doing things already for a long time..
> > 
> > Putting the commit last makes it work a lot more like the usual
> > merge-commit approach to preserve the cover letter. Particularly if
> > you open the branch in any of the web viewers for git, or gitk you
> > get a very nice view of the cover letter explaining the branch
> > followed by the usual code in reverse patch order.
> > 
> > It would be nice to use merge commits to mark the series boundary,
> > but IMHO, the tooling is poor for this.
> 
> The problem with empty commit is that a lot of the projects I
> contribute to can be pains about only taking one or two commits in a
> series, which means I use rebase to figure out the exactness of what
> they've done and drop included commits.  I can't keep this behaviour
> and work with empty commits.

Why not? rebase works fine with empty commits.

Jason
