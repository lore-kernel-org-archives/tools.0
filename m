Received: from mail-qk1-f174.google.com (mail-qk1-f174.google.com [209.85.222.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE3A16D38
	for <tools@linux.kernel.org>; Wed, 14 Apr 2021 18:58:40 +0000 (UTC)
Received: by mail-qk1-f174.google.com with SMTP id e13so12707347qkl.6
        for <tools@linux.kernel.org>; Wed, 14 Apr 2021 11:58:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=jPf/Os1qbp7a4PEw216XRlJ3LV0pqLVHjrK5MrCYPTs=;
        b=SPowRYbedtoVXtB4xdoGHtTr14km/CfMzsaY25z2ijYm9DWBTcOuu+HaKuAF9DSiPW
         SkUb07ma3SXitRkbKhKqR3R8yD4lG7mzRBNwGA6/IoP3BlLxUSPdtq5HxTgGOk5bAReg
         VCO+ZuIK7xbiz/xKJl5oR9WJWrqCQ2GNmCFSJL9wfQxQRDJeimtahl1KECwFhTkoi7gS
         lt2Z2mLsV2jKq73dJHQU0Q8Z4tUFX2Yvubx6ppAKwaDZdh2o2cgyKAwstejgf+hiMrxj
         e7+mGK2mhDj5NFsA9AxjzysMFWzU2cnc0pYhZseOw9NUSbJ9VV9+CY2FnVN8ISaHxfWa
         9dxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=jPf/Os1qbp7a4PEw216XRlJ3LV0pqLVHjrK5MrCYPTs=;
        b=m0WS4j99XvQZglrovAcu0aU3fyygkPl4ApIDDjCZdTsiU9+wIrDYYBITPFKsyFocLl
         /T+YqIkAAhV3C+4a/OtRGTBDff5QrqK7UwlHxMrHMhakIq4OVN2l/f8DjRedh3BOlnBN
         tr9guF+2s/8ha/tkF9eXCDSMUXsiIifh++LzqiACEKeDEaFtsaWLaThxT+KMUu5MPDlx
         BL3WxJGVO4vibh9c3fleeX4hJlI/tdu/O3UvXknh5ZL4WoRTTOPR3nirzv9n0O9RVxxQ
         Y8v8nPBjF2OKxawpJsNPtQ+AGsNfRajOepbrYzEsLKRwJ8BSADbUx7fu0S4qPG7JegVU
         uVNg==
X-Gm-Message-State: AOAM533MtpCllnnQTGhKyTuE6jWnC6y095lt2nsrYAB//f7vgi2o9e2U
	1VJfqS8WhzBSZ6obU3xBKi9dNeicVIn1ZA==
X-Google-Smtp-Source: ABdhPJy2EZzGoK700UU8RhlWZpljtjxeNVFOSd1DuWftTKVJFNTyceSYvbsU2Zh3JsWTV/8Hq7v6ww==
X-Received: by 2002:a37:6788:: with SMTP id b130mr15472510qkc.166.1618426719594;
        Wed, 14 Apr 2021 11:58:39 -0700 (PDT)
Received: from ziepe.ca (hlfxns017vw-142-162-115-133.dhcp-dynamic.fibreop.ns.bellaliant.net. [142.162.115.133])
        by smtp.gmail.com with ESMTPSA id 7sm239891qkl.107.2021.04.14.11.58.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Apr 2021 11:58:39 -0700 (PDT)
Received: from jgg by mlx with local (Exim 4.94)
	(envelope-from <jgg@ziepe.ca>)
	id 1lWkik-006Dze-Cn; Wed, 14 Apr 2021 15:58:38 -0300
Date: Wed, 14 Apr 2021 15:58:38 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Mark Brown <broonie@kernel.org>
Cc: James Bottomley <James.Bottomley@hansenpartnership.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Steven Rostedt <rostedt@goodmis.org>,
	"Jason A. Donenfeld" <Jason@zx2c4.com>, Alex Elder <elder@ieee.org>,
	users@linux.kernel.org, tools@linux.kernel.org
Subject: Re: RFC: Superseded-by: follow-up trailer
Message-ID: <20210414185838.GQ227011@ziepe.ca>
References: <20210413214031.fenjvgh5helyuqdz@nitro.local>
 <YHaaMaa2uaa6HM9c@hirez.programming.kicks-ass.net>
 <20210414114950.GM227011@ziepe.ca>
 <2f6c16aea7593e25d51ed54501d462443d4b9012.camel@HansenPartnership.com>
 <20210414143618.GN227011@ziepe.ca>
 <20210414145619.packpzwjauqj4fug@nitro.local>
 <20210414155733.GO227011@ziepe.ca>
 <20210414170751.cpdciflb4vqtkvau@nitro.local>
 <20210414172449.GP227011@ziepe.ca>
 <20210414184659.GF4535@sirena.org.uk>
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210414184659.GF4535@sirena.org.uk>

On Wed, Apr 14, 2021 at 07:46:59PM +0100, Mark Brown wrote:
> On Wed, Apr 14, 2021 at 02:24:49PM -0300, Jason Gunthorpe wrote:
> > On Wed, Apr 14, 2021 at 01:07:51PM -0400, Konstantin Ryabitsev wrote:
> 
> > > 3. b4 additionally learns a command to grab new trailers from the list by
> > >    matching the Obsoletes: message-ids and auto-amending commits with any new
> > >    trailers
> 
> > > This would allow you to start working on a new revision whenever you're ready
> > > for it and give b4 a precise match it can rely on when tracking new trailers.
> 
> > While I understand the interest in exact matching patches, I'm not
> > super keen on adding more headers to every patch - this feels alot
> > like the gerrit change-id header that everone hates, just in another
> > format.
> 
> The big issue people generally have with the gerrit change IDs is that
> they're only meaningful in the context of a gerrit instance that knows
> about that particular change ID, usually one on some corporate network,
> and no tooling other than gerrit uses them.  Message IDs are much more
> generally useful.

Well, IMHO, a chain of "obsoletes" is a fairly hacky way to create a
stable ID for a single commit to assist tooling. The gerrit idea of
applying a stable id to every commit is much more useful. If we had
that lore could index those stable IDs and the problem Konstantin is
chasing here becomes fairly simple to resolve by searching the index
for other messages related to the stable ID.

In turn if lore indexes the stable ID then storing the stable ID in
the commits becomes useful because lore can turn up everything related
to it, not just the single message that was used to make the commit.

Jason

