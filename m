Received: from mail-qk1-f193.google.com (mail-qk1-f193.google.com [209.85.222.193])
 by mx.groups.io with SMTP id smtpd.web11.2400.1588184688144199821
 for <tools@linux.kernel.org>;
 Wed, 29 Apr 2020 11:24:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=CAwnrpeH;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.222.193, mailfrom: konstantin@linuxfoundation.org)
Received: by mail-qk1-f193.google.com with SMTP id b188so3021715qkd.9
        for <tools@linux.kernel.org>; Wed, 29 Apr 2020 11:24:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=AmqIGhWR1y3o+5lld+GkdDu7tcBAXsTy/b1dEpRX8bo=;
        b=CAwnrpeHZZZy12fKNgjBIBSm8NDOUYEfTvMwCG+Abj+fYwxcCn+LPHg3IuCgN2qsKu
         adhSkpTBB00gwgAFtaU9nA6Ft1QCqL9FX2/voo/CtnRPaZAzLX3KPDOuyixNkqv2PlPv
         oeq3uOBIIgCBZjQZOAVtMZMM/cj6igkOAFHRQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=AmqIGhWR1y3o+5lld+GkdDu7tcBAXsTy/b1dEpRX8bo=;
        b=m9yArX/tQuIGBZYuEE9Kyzm79LfszUDV5XlyO0FTtoTYlHJihc/IyGQGd/C2ih7WOD
         AatAP84tkAJHN6vFaE3jXGDZWgkbiq6UWXcxcUZmVWvZ8FRmY/AvMSLZA+FVSVaKB9/v
         cQFuLqw14g04f00g2PewReGxOW4hjoRuq8TuZkEw8O28obWvOm0LKFy63SOuvLEnR2jJ
         pcoADbiXytR5QnNt9WpKOjZhuPzmCwT6LiNzEvpaKUI2L2JchLibcUFL9hiLEesZXWQc
         dV3D6XpmNmYsNIgCiTr2roS+ToPcj4V+8xjDZRfJBEiF2zAlE/LBOc5D7FjDgA5NX92v
         rpdA==
X-Gm-Message-State: AGi0Pub46HxuaT8GJLGmVm+pOeHM/z8Zga7nJzA70jAotdhG3HXEakwn
	Prl515u6r33NQhfq20oYAoKHLQ==
X-Google-Smtp-Source: APiQypICFH8NE8GiR7zEw7DR5aInaapsWITkSt4LkvjNS37aZFkZ1LHoursNedzvWFgVzikH+YLKaw==
X-Received: by 2002:a37:a517:: with SMTP id o23mr33729141qke.134.1588184687280;
        Wed, 29 Apr 2020 11:24:47 -0700 (PDT)
Return-Path: <konstantin@linuxfoundation.org>
Received: from i7.mricon.com (107-179-243-71.cpe.teksavvy.com. [107.179.243.71])
        by smtp.gmail.com with ESMTPSA id s28sm7007763qks.49.2020.04.29.11.24.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Apr 2020 11:24:46 -0700 (PDT)
Received: by i7.mricon.com (sSMTP sendmail emulation); Wed, 29 Apr 2020 14:24:44 -0400
Date: Wed, 29 Apr 2020 14:24:44 -0400
From: "Konstantin Ryabitsev" <konstantin@linuxfoundation.org>
To: Jason Gunthorpe <jgg@ziepe.ca>
Cc: Mark Brown <broonie@kernel.org>, Junio C Hamano <gitster@pobox.com>,
	users@linux.kernel.org, tools@linux.kernel.org
Subject: Re: [kernel.org users] What is a useful way to show changes between series?
Message-ID: <20200429182444.ma62hhym3ndxpgol@chatter.i7.local>
References: <20200428192938.aue3v6kxsm47day5@chatter.i7.local>
 <20200428193550.GX26002@ziepe.ca>
 <20200428194419.i2gamyjgbilp2x73@chatter.i7.local>
 <20200429101309.GE4201@sirena.org.uk>
 <CAPc5daUXCRv5CN9cVdGTgAWinTEFB0RnMF27MA5D4dOMiCCk1A@mail.gmail.com>
 <20200429175049.GP4201@sirena.org.uk>
 <20200429175844.GH26002@ziepe.ca>
MIME-Version: 1.0
In-Reply-To: <20200429175844.GH26002@ziepe.ca>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

On Wed, Apr 29, 2020 at 02:58:44PM -0300, Jason Gunthorpe wrote:
> > Ah, indeed I think that is exactly what I'm looking for!  Sadly it 
> > is
> > not documented in the git format-patch man page so I hadn't seen it,
> 
> So if we use this, should we set the --base to be a linux-next tag?
> 
> Is that reliable enough?
> 
> Can't relly use Linus's tree, and if people randomly choose their
> upstream's then it defeats the whole point :(

One option I can think of is for git.kernel.org to provide a lookup API 
that would consume the commit-id and spit out the tree and branch where 
this object exists, working down the list of preferred trees:

1. torvalds/linux.git
2. next/linux-next.git
3. stable/linux.git
4. everyone else on kernel.org
5. select remote trees that we can start mirroring

This should help make this information a lot more useful for automation, 
I expect.

-K
