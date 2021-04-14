Received: from mail-qk1-f180.google.com (mail-qk1-f180.google.com [209.85.222.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 932A46D32
	for <tools@linux.kernel.org>; Wed, 14 Apr 2021 17:24:52 +0000 (UTC)
Received: by mail-qk1-f180.google.com with SMTP id x11so22165517qkp.11
        for <tools@linux.kernel.org>; Wed, 14 Apr 2021 10:24:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google;
        h=date:from:to:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=GsJ/wvfHVQcxTb6uelpQfRjhGg+Cqzo5x4AgvyVDZlY=;
        b=PLw/nLDDOQ7qSvcXXqzSCSkCc/23oO5Euga1rOxnNEWHM3zUfUZwj39wMlomcPrG6y
         USFx5WUGKdLTaJfroXtE/vvXftuddyp2Xq8j43i+AopSOsjdW+3PJxnPCu2Dt8WvsZON
         2+VCAviod55SxXLDZFcI2VaadPjkXDx+g2KBYDVYpa2bZUOkmhpeSrbtP/AlxJKKA2yg
         kom7NSWySOE53MfwJOrhtobzdoC7afjkVkgtfyBKPYK6NR3aYcJ2DhxYNdnHLIXzTREO
         56C5bf7Ei7U61FFZwaKCQxJHlApzljH1twyw28s2P2/yPxq7Ryj9DH+LO8eaVBcNkTpO
         VKpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=GsJ/wvfHVQcxTb6uelpQfRjhGg+Cqzo5x4AgvyVDZlY=;
        b=frm6HriOPQ2CV3tG4lOW8ZO3wgK9D2ltPCij42im3PNDEs0W3wnqfVXeVgpnfU/47n
         Ny7XcFyhQVlAoqAiapK/Hy9QcDrMgwDqXjzBBQpkOaeZUuwiHaD8kgUGRtt/NorL3drJ
         3FgxeU/oeZuI4ANFTlc6F7zUJ7Z25W4W2UKOYx1kmVG5zDtYpykNymfd2mJ2RHv9XSZ2
         MYDCbkmclo4Wc/znqqjONhj7W4oRcvj0dDtAaOhyybSXnfHVMq94yfKf/y++4gupvlHe
         OdYMsKE+j/FE2hsnwcOaez5swVQUZuY940CuNYFa5LpftoQPBzONoIksSY6ydJFSFYtp
         TdVQ==
X-Gm-Message-State: AOAM531SvqUIkO8WWf/F0vJM7c4tpyspkUG4Qtt9VTEaynts0fuZuNjZ
	MU54e5nn4yN7bjBwT0asihTdpw==
X-Google-Smtp-Source: ABdhPJw5eF0jjIX2bnk5Rjbdj/9gF/AJoyvgmBfClZpCzB+bvwjiIkwi/DPKFpXuNdm7CeG1mYMs/w==
X-Received: by 2002:a05:620a:40ce:: with SMTP id g14mr20426476qko.190.1618421090487;
        Wed, 14 Apr 2021 10:24:50 -0700 (PDT)
Received: from ziepe.ca (hlfxns017vw-142-162-115-133.dhcp-dynamic.fibreop.ns.bellaliant.net. [142.162.115.133])
        by smtp.gmail.com with ESMTPSA id q23sm15789qtl.25.2021.04.14.10.24.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Apr 2021 10:24:50 -0700 (PDT)
Received: from jgg by mlx with local (Exim 4.94)
	(envelope-from <jgg@ziepe.ca>)
	id 1lWjFx-006C4Y-FD; Wed, 14 Apr 2021 14:24:49 -0300
Date: Wed, 14 Apr 2021 14:24:49 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: James Bottomley <James.Bottomley@hansenpartnership.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Steven Rostedt <rostedt@goodmis.org>,
	"Jason A. Donenfeld" <Jason@zx2c4.com>, Alex Elder <elder@ieee.org>,
	users@linux.kernel.org, tools@linux.kernel.org
Subject: Re: RFC: Superseded-by: follow-up trailer
Message-ID: <20210414172449.GP227011@ziepe.ca>
References: <CAHmME9pFqm00ibpqhQQ9_P61F7mU12yrcOvdNSDYDz8ot8HJDg@mail.gmail.com>
 <20210413172901.1465307c@gandalf.local.home>
 <20210413214031.fenjvgh5helyuqdz@nitro.local>
 <YHaaMaa2uaa6HM9c@hirez.programming.kicks-ass.net>
 <20210414114950.GM227011@ziepe.ca>
 <2f6c16aea7593e25d51ed54501d462443d4b9012.camel@HansenPartnership.com>
 <20210414143618.GN227011@ziepe.ca>
 <20210414145619.packpzwjauqj4fug@nitro.local>
 <20210414155733.GO227011@ziepe.ca>
 <20210414170751.cpdciflb4vqtkvau@nitro.local>
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210414170751.cpdciflb4vqtkvau@nitro.local>

On Wed, Apr 14, 2021 at 01:07:51PM -0400, Konstantin Ryabitsev wrote:
> On Wed, Apr 14, 2021 at 12:57:33PM -0300, Jason Gunthorpe wrote:
> > > The best workflow I can recommend here is:
> > > 
> > > 1. create a new branch from the latest upstream, e.g. myfoo_v1
> > > 2. "b4 am/git am" your own v1 (this has an added bonus of rebasing it)
> > > 3. create a new branch from myfoo_v1 as myfoo_v2
> > > 4. make any changes to myfoo_v2
> > 
> > This isn't workable - it assumes the user will only change the patches
> > after all the tags have been sent because it resets the whole branch
> > to the as-sent condition.
> > 
> > Usually I would make changes to the series as the discussion evolves
> > and resync the tags only before resending the next version.
> 
> Okay, this is fair. Is this any better:
> 
> 1. "b4 am" learns a --newrev flag that populates "Obsoletes:" trailers 
>    for your own patches it grabs from the list
> 2. when you're ready to start working on the new version, you run "b4 am
>    "git am" it to a new branch (similar to what I described above)
> 3. b4 additionally learns a command to grab new trailers from the list by
>    matching the Obsoletes: message-ids and auto-amending commits with any new
>    trailers
> 
> This would allow you to start working on a new revision whenever you're ready
> for it and give b4 a precise match it can rely on when tracking new trailers.

While I understand the interest in exact matching patches, I'm not
super keen on adding more headers to every patch - this feels alot
like the gerrit change-id header that everone hates, just in another
format.

Jason
