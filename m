Received: from mail-qv1-f51.google.com (mail-qv1-f51.google.com [209.85.219.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DEE4746F
	for <tools@linux.kernel.org>; Wed, 20 Jul 2022 19:55:33 +0000 (UTC)
Received: by mail-qv1-f51.google.com with SMTP id i7so3604277qvr.8
        for <tools@linux.kernel.org>; Wed, 20 Jul 2022 12:55:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=SlM/+7u3M9Ro0QJT1i/24rYMKsL2zS/Dwzy+pBDySR4=;
        b=S5s6i+4px+yu76KPDXxTd1gGOledT/9XylOpSZknlqqBlje47NhDJMvdk5S5l4MtDA
         aWjubImxvG9hS7zFyM1ZoXX96/bosZRUS0cXUUTW/FuHz4oCcOi3iB9FbcKkPDhHA8Se
         Yt320R6LeqHKWUrr6Fsn5MyKa+36j8i68iFMaZtMtUSg4cDmOIeaTIQ27B8bHnAGbfOu
         sn5n22xSIPWzKSnEMYlos5Lhl7kZop/zl7hZeyhI/p3KXE9LGPizohc/csoRZ4dNiUnx
         sz4Isnt8vh+xplTGmMzt0lGcZL/QetDO5lV7U36wW2LyOMY6x/ntr6wXkA6hilLGaQuF
         2dWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=SlM/+7u3M9Ro0QJT1i/24rYMKsL2zS/Dwzy+pBDySR4=;
        b=DLt23mm7F4oAMMi6hrFZp1YNh0EC7S4BVA7KR/6ks6xsWdWgumrOMEy2J+TIb8/el0
         wlTKxvQpzmjFFvMP7QZYsA8ZfBFrUxWHeDVNg6XgeUrUwiKKZF2wmGT79qCJ9OFVd1wM
         yBg/5EswIffX1JKSK/9eG6LJenOnea1dZWgiCWm4Aw3g14dwFmYVmiG/maUINOY/jYml
         BaHEWxpddIqpUT133+FCYsNSK4DZDOXnRMOBqOGVwDZHtdedwUMRC0ft62pzImr56SE4
         H3pY9k2iEdFvbxRVfViUbQNlGqm1K7a2lSnVFFRNpSwTOSQL2oHYyTQIEV+GreTPHMLy
         9mjg==
X-Gm-Message-State: AJIora88fInnbFn4INszrq4EDpKCo4oU5oExKx7iL0aMDrR7JLP8JBBo
	5wNsTM1BzBcj9QEasM2trSlcOw==
X-Google-Smtp-Source: AGRyM1sTUrJkxcv4ljDMcyDT86QGVSsfdR076vGl5XuEnrmBzOrLlvIlPvYyBguWU5Q4jHnhTBMBHQ==
X-Received: by 2002:a05:6214:1948:b0:472:fad3:9663 with SMTP id q8-20020a056214194800b00472fad39663mr31056687qvk.37.1658346932896;
        Wed, 20 Jul 2022 12:55:32 -0700 (PDT)
Received: from ziepe.ca (hlfxns017vw-142-162-113-129.dhcp-dynamic.fibreop.ns.bellaliant.net. [142.162.113.129])
        by smtp.gmail.com with ESMTPSA id x27-20020a05620a0b5b00b006b5e43466ebsm43660qkg.59.2022.07.20.12.55.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Jul 2022 12:55:32 -0700 (PDT)
Received: from jgg by mlx with local (Exim 4.94)
	(envelope-from <jgg@ziepe.ca>)
	id 1oEFn9-001fPH-JO; Wed, 20 Jul 2022 16:55:31 -0300
Date: Wed, 20 Jul 2022 16:55:31 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc: users@linux.kernel.org, tools@linux.kernel.org
Subject: Re: b4 submit ready for beta testing
Message-ID: <20220720195531.GN5049@ziepe.ca>
References: <20220716142954.voq4ucnl5wkq7h2b@nitro.local>
 <20220720184835.uhnkucai54alhgo6@nitro.local>
 <20220720192456.GM5049@ziepe.ca>
 <20220720194014.uvuij422zypbjxrf@nitro.local>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220720194014.uvuij422zypbjxrf@nitro.local>

On Wed, Jul 20, 2022 at 03:40:14PM -0400, Konstantin Ryabitsev wrote:
> On Wed, Jul 20, 2022 at 04:24:56PM -0300, Jason Gunthorpe wrote:
> > > 1. Pluggable cover letter strategies
> > >    The goal is to support 3 different cover-letter strategies:
> > > 
> > >    "commit": same as first implementation with the cover letter stored in an
> > >    empty commit at the beginning of the series.
> > 
> > How about an 'end of the series' option if we are doing lots of
> > choices?
> 
> Like, in a tip commit? Wouldn't that make it super awkward to add more
> commits?

No more difficult than amending a commit lower down in the stack. Just
use rebase and fix all sins. If you are using a git commit based
workflow then you are going to be rebasing *constantly* before the
series is ready to send.
 
> 1. I clearly mark where the series starts, which is super non-trivial with
>    git. With other strategies like branch-description we use the "base branch"
>    to find the fork-point, but even there are common situations that can mess
>    things up, e.g.:

So you intend to keep the first commit in the other strategies too?
Seems odd.

> 2. I have a place to store tracking information (the json bits) from the
>    moment the branch is created, which is handy.

Hum, I admit I don't know what that is about, the scripting I use
doesn't rely on json bits. It only relies on the user telling what the
fork point is for the cases it is ambiguous

Jason
