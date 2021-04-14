Received: from mail-qt1-f178.google.com (mail-qt1-f178.google.com [209.85.160.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 339816D24
	for <tools@linux.kernel.org>; Wed, 14 Apr 2021 17:07:55 +0000 (UTC)
Received: by mail-qt1-f178.google.com with SMTP id c6so15987697qtc.1
        for <tools@linux.kernel.org>; Wed, 14 Apr 2021 10:07:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=date:from:to:cc:subject:message-id:mail-followup-to:references
         :mime-version:content-disposition:in-reply-to;
        bh=wZrmQ4LODSeLpcEKW6/Np+nWqKqQAxI6tLLhKab7keQ=;
        b=h61zOBLoRUPrXrXCldXv4fVQOhgD3uQP+nlhpK0Jhr0FLuRXqCNiAWdcBNIRPXSzrr
         YxfJr03lIR8oFcI/xOjYEcOn4tGl+wa4YYCEg+haaNfoE2GSlKz8po/t0wHuE6/PdMtm
         0KTTuQlWOQsG8nK1JLMNQUTQld5o5hqqKhfpo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id
         :mail-followup-to:references:mime-version:content-disposition
         :in-reply-to;
        bh=wZrmQ4LODSeLpcEKW6/Np+nWqKqQAxI6tLLhKab7keQ=;
        b=kkeBlKe2U/DaanMCH/53Feu+SE0lPMJ3vKpq5FGQ/lrf028K4GpCmYAn+fdWm+zVVL
         7i2jLOwMsNCyuctmGSwkOjZ9VFSua1i5WVPsMPlDPqQadHXLH/sRUiaqvQX8g3no5jx9
         EGrLheiCJL0ka5kh7IMvwc+n2kaOeXajrx6KsunrlW7glmv6KsolwNqlsii8NLyZz25c
         EDXyQXjBfYGmIsXMQJ57vV1Arun9WRSdQOhN46VBFiCY15iPFr5LxOs2KqJyiD1XxURY
         ME/imJBpUTQ0hd4URaju6BDjwjdpbHdk1ayHNdu7oDEEqpvd4BzLsF/VJ4Cn91Q8KZTX
         fRxg==
X-Gm-Message-State: AOAM533ukZL2ryYaCYTKsUhctyLbY4Lo48uOKwrCMSJCJzH+ASSjjn0k
	hzNFrXjshIPqcsC28xO3mHTuGw==
X-Google-Smtp-Source: ABdhPJx2svzfDv6iDr6eSONINnBzEVzz9tdhTh6k1BXq3WgzGhpNfVlgyaoOLupKBM9iOKFxyDesUQ==
X-Received: by 2002:ac8:6bd5:: with SMTP id b21mr16205053qtt.269.1618420074126;
        Wed, 14 Apr 2021 10:07:54 -0700 (PDT)
Received: from nitro.local ([89.36.78.230])
        by smtp.gmail.com with ESMTPSA id k26sm12906519qkg.120.2021.04.14.10.07.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Apr 2021 10:07:53 -0700 (PDT)
Date: Wed, 14 Apr 2021 13:07:51 -0400
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: Jason Gunthorpe <jgg@ziepe.ca>
Cc: James Bottomley <James.Bottomley@hansenpartnership.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Steven Rostedt <rostedt@goodmis.org>,
	"Jason A. Donenfeld" <Jason@zx2c4.com>, Alex Elder <elder@ieee.org>,
	users@linux.kernel.org, tools@linux.kernel.org
Subject: Re: RFC: Superseded-by: follow-up trailer
Message-ID: <20210414170751.cpdciflb4vqtkvau@nitro.local>
Mail-Followup-To: Jason Gunthorpe <jgg@ziepe.ca>,
	James Bottomley <James.Bottomley@hansenpartnership.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Steven Rostedt <rostedt@goodmis.org>,
	"Jason A. Donenfeld" <Jason@zx2c4.com>, Alex Elder <elder@ieee.org>,
	users@linux.kernel.org, tools@linux.kernel.org
References: <fd732fc9-83a9-5502-fba5-f08317bdcaf3@ieee.org>
 <CAHmME9pFqm00ibpqhQQ9_P61F7mU12yrcOvdNSDYDz8ot8HJDg@mail.gmail.com>
 <20210413172901.1465307c@gandalf.local.home>
 <20210413214031.fenjvgh5helyuqdz@nitro.local>
 <YHaaMaa2uaa6HM9c@hirez.programming.kicks-ass.net>
 <20210414114950.GM227011@ziepe.ca>
 <2f6c16aea7593e25d51ed54501d462443d4b9012.camel@HansenPartnership.com>
 <20210414143618.GN227011@ziepe.ca>
 <20210414145619.packpzwjauqj4fug@nitro.local>
 <20210414155733.GO227011@ziepe.ca>
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20210414155733.GO227011@ziepe.ca>

On Wed, Apr 14, 2021 at 12:57:33PM -0300, Jason Gunthorpe wrote:
> > The best workflow I can recommend here is:
> > 
> > 1. create a new branch from the latest upstream, e.g. myfoo_v1
> > 2. "b4 am/git am" your own v1 (this has an added bonus of rebasing it)
> > 3. create a new branch from myfoo_v1 as myfoo_v2
> > 4. make any changes to myfoo_v2
> 
> This isn't workable - it assumes the user will only change the patches
> after all the tags have been sent because it resets the whole branch
> to the as-sent condition.
> 
> Usually I would make changes to the series as the discussion evolves
> and resync the tags only before resending the next version.

Okay, this is fair. Is this any better:

1. "b4 am" learns a --newrev flag that populates "Obsoletes:" trailers 
   for your own patches it grabs from the list
2. when you're ready to start working on the new version, you run "b4 am
   --newrev" that prepares a mbox file with Obsoletes: trailers, and you
   "git am" it to a new branch (similar to what I described above)
3. b4 additionally learns a command to grab new trailers from the list by
   matching the Obsoletes: message-ids and auto-amending commits with any new
   trailers

This would allow you to start working on a new revision whenever you're ready
for it and give b4 a precise match it can rely on when tracking new trailers.

-K
