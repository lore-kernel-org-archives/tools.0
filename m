Received: from mail-qt1-f173.google.com (mail-qt1-f173.google.com [209.85.160.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E27B29CA
	for <tools@linux.kernel.org>; Wed, 14 Apr 2021 15:57:35 +0000 (UTC)
Received: by mail-qt1-f173.google.com with SMTP id f12so15819310qtf.2
        for <tools@linux.kernel.org>; Wed, 14 Apr 2021 08:57:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google;
        h=date:from:to:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=v668ObNfUOST6E9xqfp0etK+5qn5LhMsykzGCglmaRY=;
        b=hER3pTTzgzPuJV9BuEH+g9zkAMgnjaeaz0JHhJeGZMeHte2Dk6IOxilF3WJTHeGY0N
         yQLhtGRO72A5V3C6SiJoezcHAd1n66H9UIxQC3GQDpE5yeEcrpdvAtdGXzd4JlMBDNPJ
         dSYSeWGGjOivcmraxap0PD3+h8LhWvca8vyOoZt7bQjuUmndoXd33YYRMwxhSUGkDkNV
         oXOoYIHU4Y9omgyYqrApybJdCso7FeCDxkWzA1SP4h1Bn3rVXRV36+gzXOh7Xy9O0aTw
         ysMxzRhgLX17uDYXgb2lcOgmzgCd7pQ3BaTNuO0yhpujYOImYyK/y/JY9Of0c/HGyTb4
         3k1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=v668ObNfUOST6E9xqfp0etK+5qn5LhMsykzGCglmaRY=;
        b=DKSWglWD2id3Y8+P8R1meFM+Oalyv3+YAxQFOlW8UQ7zYEHpbHEtlZc7h9QV73boJ6
         vx06nifWL5NYAnKDWzPYRdU2rLuZPMfHD2hhX9OE2gmZa9Lwbe4l/g9/VEjkjKO9dP5R
         uablJc1zSmTaTYw7kvHVYSzmz2tMX7NWNQuSQoTrsYQJ/sXBEwQygzdRBNNUI1lgoY42
         xNUmj2sLI8reR7DKQXY9+0RxahYEpEhxH37Daxvc+s8V8qZPPC0pReBiaVgAHGGnVBRO
         GwSCysrZ4l3tqn76pruS5VZdwrpOGwxjWA2pkr66ZH3NrD38Y10Ri7Kbz6J0RK2JttP5
         7xiQ==
X-Gm-Message-State: AOAM532FXS2H8WAMm0jMtXd6AmdEDRRJVvuGjH9qYWna8CT313pcLlZN
	BkAIngyPNgOvjGgZLAUyiAj5fA==
X-Google-Smtp-Source: ABdhPJxithOVDSmx6NX59QS4hKNbnnnzuxzfbsmvlnJdCkO1jTWEUciBsCIbvbiP/jKrxZZOZ/AMLQ==
X-Received: by 2002:ac8:7247:: with SMTP id l7mr25319205qtp.280.1618415855002;
        Wed, 14 Apr 2021 08:57:35 -0700 (PDT)
Received: from ziepe.ca (hlfxns017vw-142-162-115-133.dhcp-dynamic.fibreop.ns.bellaliant.net. [142.162.115.133])
        by smtp.gmail.com with ESMTPSA id 81sm11680259qkl.121.2021.04.14.08.57.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Apr 2021 08:57:34 -0700 (PDT)
Received: from jgg by mlx with local (Exim 4.94)
	(envelope-from <jgg@ziepe.ca>)
	id 1lWhtV-0069Yh-Nu; Wed, 14 Apr 2021 12:57:33 -0300
Date: Wed, 14 Apr 2021 12:57:33 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: James Bottomley <James.Bottomley@hansenpartnership.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Steven Rostedt <rostedt@goodmis.org>,
	"Jason A. Donenfeld" <Jason@zx2c4.com>, Alex Elder <elder@ieee.org>,
	users@linux.kernel.org, tools@linux.kernel.org
Subject: Re: RFC: Superseded-by: follow-up trailer
Message-ID: <20210414155733.GO227011@ziepe.ca>
References: <20210413204932.yovoa7njwc56jo5v@nitro.local>
 <fd732fc9-83a9-5502-fba5-f08317bdcaf3@ieee.org>
 <CAHmME9pFqm00ibpqhQQ9_P61F7mU12yrcOvdNSDYDz8ot8HJDg@mail.gmail.com>
 <20210413172901.1465307c@gandalf.local.home>
 <20210413214031.fenjvgh5helyuqdz@nitro.local>
 <YHaaMaa2uaa6HM9c@hirez.programming.kicks-ass.net>
 <20210414114950.GM227011@ziepe.ca>
 <2f6c16aea7593e25d51ed54501d462443d4b9012.camel@HansenPartnership.com>
 <20210414143618.GN227011@ziepe.ca>
 <20210414145619.packpzwjauqj4fug@nitro.local>
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210414145619.packpzwjauqj4fug@nitro.local>

On Wed, Apr 14, 2021 at 10:56:19AM -0400, Konstantin Ryabitsev wrote:
> On Wed, Apr 14, 2021 at 11:36:18AM -0300, Jason Gunthorpe wrote:
> 
> I think submitter tooling is a separate discussion that should happen in a
> different thread, which I'll start shortly (it slots into my auto-pr-exploder
> work). I'll just comment on the below:

I'm nervous asking submitters to change their workflows without
providing any tooling to help :(

> >  For v2:
> >  - Pull in all tags from the mailing list and update the git commits
> >    (b4 downloads the tags but doesn't automate fixing the local git
> >    branch)
> 
> The best workflow I can recommend here is:
> 
> 1. create a new branch from the latest upstream, e.g. myfoo_v1
> 2. "b4 am/git am" your own v1 (this has an added bonus of rebasing it)
> 3. create a new branch from myfoo_v1 as myfoo_v2
> 4. make any changes to myfoo_v2

This isn't workable - it assumes the user will only change the patches
after all the tags have been sent because it resets the whole branch
to the as-sent condition.

Usually I would make changes to the series as the discussion evolves
and resync the tags only before resending the next version.

Jason
