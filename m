Received: from mail-qt1-f182.google.com (mail-qt1-f182.google.com [209.85.160.182])
 by mx.groups.io with SMTP id smtpd.web10.586.1608577554214029210
 for <tools@linux.kernel.org>;
 Mon, 21 Dec 2020 11:05:54 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ziepe.ca header.s=google header.b=G3nLtZe1;
 spf=pass (domain: ziepe.ca, ip: 209.85.160.182, mailfrom: jgg@ziepe.ca)
Received: by mail-qt1-f182.google.com with SMTP id j26so7336807qtq.8
        for <tools@linux.kernel.org>; Mon, 21 Dec 2020 11:05:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=pSe6mO90WlkTWPziACjouoYu+9yN1ZaglZ76F9e9OuM=;
        b=G3nLtZe1EWXJwlvGsEJbtd02H4VwTEx/Tn8e2H0MYilkbp9Oy7DtVHCWigsK6Vw8y/
         8n9Pgb89pX2k1wYlouFgIKhoicoinB4UkGHTcol99wNCIVV7mfPqrlk/eMsQfNDRvv0q
         TjXztVA1Nr+hAZsK30R0iGTr2dosxM2+9EHH+DaQ61vx0ymP41FFpxaP2yDQJHTMUwCY
         Ln3QQ8AMU7bpcbMJ5Dy0kk0vdaoJs1YJz7f2UXwtbOuR46CuoYjZQXxVccjVqp1QM6Kq
         71sbAiblTe+JJ9HRFd1HY5ymGfz79wj3eFSXFNWrVefQ/6TSxtnfifAcU6r+hdbzARhT
         5rHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=pSe6mO90WlkTWPziACjouoYu+9yN1ZaglZ76F9e9OuM=;
        b=bkMKrh1GeyZhUyINRx3/7cxDCcjW4bBQLOsIPEqR36Gmolp+Co0jPKWnlxVTbZsCXD
         9fl3QkFwXYcRg3cuZSW9oGtZmckQy7qu0qCZYpt6xMf6lnVZgZWJ8LVRlXu8wjjXwVva
         N9NJC679a6VdVw55LMEsE0fzT3y1dmKmJZLbgENB4742rwWv/GTMf7NN08cgV/z71mRf
         HU+HR+j9Ls4ideD61m/fd1qozUNZvu2b+X7sHMLx/MjwSqNRimXxczfrXeoixB7T1EKt
         gmFMdNMVbfI4BX7ALbdPTGdKTcQWt2l1nkJL4sS9hJrlgw57tuo50THW9kio9HnSniJh
         oBLw==
X-Gm-Message-State: AOAM5301HtlKaWn5PDLdKnUPdDR0SFDVYXaWRLqZfIfVmMhOJQY3u6me
	ZOrGpy4suETajTK2H1dTSP/tnQ==
X-Google-Smtp-Source: ABdhPJw9uHKFPliwlqX7zNMvT6Zq9GgO8WqITgpdngwyowGIMEj9Jtos+tZvpLqfzP6Q9wKp0PrYvQ==
X-Received: by 2002:aed:30d1:: with SMTP id 75mr17623629qtf.61.1608577553381;
        Mon, 21 Dec 2020 11:05:53 -0800 (PST)
Return-Path: <jgg@ziepe.ca>
Received: from ziepe.ca (hlfxns017vw-142-162-115-133.dhcp-dynamic.fibreop.ns.bellaliant.net. [142.162.115.133])
        by smtp.gmail.com with ESMTPSA id b15sm4511299qta.75.2020.12.21.11.05.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Dec 2020 11:05:52 -0800 (PST)
Received: from jgg by mlx with local (Exim 4.94)
	(envelope-from <jgg@ziepe.ca>)
	id 1krQVE-00E7Ao-7q; Mon, 21 Dec 2020 15:05:52 -0400
Date: Mon, 21 Dec 2020 15:05:52 -0400
From: "Jason Gunthorpe" <jgg@ziepe.ca>
To: Jakub Kicinski <kuba@kernel.org>
Cc: James Bottomley <James.Bottomley@HansenPartnership.com>, toke@toke.dk,
	Konstantin Ryabitsev <konstantin@linuxfoundation.org>,
	users@linux.kernel.org, tools@linux.kernel.org,
	Jens Axboe <axboe@kernel.dk>,
	Arnaldo Carvalho de Melo <acme@kernel.org>
Subject: Re: [kernel.org users] b4: encouraging using the cover letter in merge commits?
Message-ID: <20201221190552.GS5487@ziepe.ca>
References: <877dpeol5w.fsf@toke.dk>
 <bdffc35910338117c6ed66f6dfac2dc13d6ed03a.camel@HansenPartnership.com>
 <87y2hum0t0.fsf@toke.dk>
 <fc05bad0b5517500e62b271b8896f142060b235e.camel@HansenPartnership.com>
 <20201219092126.5633d02f@kicinski-fedora-pc1c0hjn.dhcp.thefacebook.com>
MIME-Version: 1.0
In-Reply-To: <20201219092126.5633d02f@kicinski-fedora-pc1c0hjn.dhcp.thefacebook.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Sat, Dec 19, 2020 at 09:21:26AM -0800, Jakub Kicinski wrote:
> On Sat, 19 Dec 2020 09:03:36 -0800 James Bottomley wrote:
> > > I agree that the cover letter is useful more often than not and
> > > ideally it would be included in most cases. In netdev/bpf land the
> > > maintainers do this by always creating a merge commit when applying a
> > > multi-part series; here's Daniel applying one of mine, for instance:
> > > 
> > > https://git.kernel.org/pub/scm/linux/kernel/git/netdev/net-next.git/commit/?id=4e083fdfa39db29bbc7725e229e701867d0da183
> > > 
> > > I personally think this practice is pretty nice, and so I was hoping
> > > that supporting this workflow in b4 could be a way to encourage other
> > > maintainers to take up the practice as well :)  
> > 
> > I've got to say that creating a spurious merge for the cover letter
> > looks even more tortuous than creating an empty commit.  What
> > advantages does this have over the existing link tag practice which is
> > the one that we now use instead of the empty commit?
> 
> May be a chicken and an egg problem in case of other subsystems.
> 
> DaveM started creating those merge commits long before Links were 
> a thing (let alone lore). That gave netdev developers the ability 
> to provide a high level description of their work, reasons, goals 
> in the cover letter, rather than one of the commit messages. For
> a series with changes finely split for ease of review it's often
> awkward to pick on which commit to put that information.
> 
> Obviously the cover letter information may be made available via 
> the Link, but there's obvious value in seeing the information in 
> the repo, after all we don't replace commit messages with links.

My biggest problem with the cover letters is while the are in the
repository, someplace, I've never actually found one while hunting
around in the git history for clues, eg with 'git blame' or 'git log
log -p'

In fact more often than not I find the netdev cover letters through
hunting in lore, not through git.

Is there some git sequence to make it visible?

The Link header is a nicer because no matter how I end up at a commit
I can go back to an email discussion..

Jason
