Received: from mail-qt1-f170.google.com (mail-qt1-f170.google.com [209.85.160.170])
 by mx.groups.io with SMTP id smtpd.web11.10466.1607533893574167962
 for <tools@linux.kernel.org>;
 Wed, 09 Dec 2020 09:11:33 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=bNUOJwqV;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.160.170, mailfrom: konstantin@linuxfoundation.org)
Received: by mail-qt1-f170.google.com with SMTP id 7so1454391qtp.1
        for <tools@linux.kernel.org>; Wed, 09 Dec 2020 09:11:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=n2tKjTCJ4OKcxZpq+GiIyTEUJ2mHYYyERK5xBHiKhg8=;
        b=bNUOJwqVaZgLym15ALa0cf6akNQ1MsIfDiSsJZU5hHPYSnxo1fttq65tw9WHesTUdT
         KRoiBsceoJrGvRR7x43tkwlmWNEvj7xoSO7/8XfeSP6fliiLesXp298O5XjcMBj7gbd3
         EfQeFcHrv462NJ8u6U4FIERDrIHIJH2JKyx8s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=n2tKjTCJ4OKcxZpq+GiIyTEUJ2mHYYyERK5xBHiKhg8=;
        b=R9v5elqR0huQuO5VoEsK8IytKabBEKY00zy3Ow+pSOxity4ORcNTjVdsjVKZ14OxBB
         RciblXYorTpi5+QKd0YliL3mtbEKcwpy1SiPYT9V7/mG9t3ZfCMxtkWOIfuAKQMsHuCK
         OL46x9Lb5oVxl9OpSPBBpTWnHKMbGvPRqzHH0Efe1IQkapEWsFBYqSTDT5Xc/iEN7q19
         uGVHdC8WrHvVG19XdV78M2/TV2U9CBsDj5EIOl1LTmvCMIK0NI1qi8IyH05i2vKSudWP
         7U2pFjgnLUwaGuT4fT865EYA+x/l27j2G0xigLCnDO0/TX2j4UpQDs6q4OoaTeMjsGq7
         Hikw==
X-Gm-Message-State: AOAM530yCc0LimeNNv6/EGzkvbkQEBSf/NdqjTNeWeIJJkTH+mw1z5pE
	TEALZfmRAwlIi5aHdYaH6w/fvg==
X-Google-Smtp-Source: ABdhPJzoK5O5QsgeKvZ2HmzazQfVpYYUddF39wVjZRB+/UCZikguLx/TM2tDD1lCv0EPYKkrWlrPMA==
X-Received: by 2002:aed:2827:: with SMTP id r36mr4061470qtd.337.1607533832697;
        Wed, 09 Dec 2020 09:10:32 -0800 (PST)
Return-Path: <konstantin@linuxfoundation.org>
Received: from chatter.i7.local ([89.36.78.230])
        by smtp.gmail.com with ESMTPSA id x185sm797388qkb.87.2020.12.09.09.10.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Dec 2020 09:10:32 -0800 (PST)
Date: Wed, 9 Dec 2020 12:10:30 -0500
From: "Konstantin Ryabitsev" <konstantin@linuxfoundation.org>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, tools@linux.kernel.org
Subject: Re: b4 strips BiugLink
Message-ID: <20201209171030.hztkqs5ych62dvck@chatter.i7.local>
References: <CACRpkdZrth39GdKc0OFF9cDNHq2hBOXq1f-uU=TOOT8GaogoMQ@mail.gmail.com>
 <20201209131924.bai7b4tj2wb7sbon@chatter.i7.local>
 <CACRpkdYA9T9msayNQrd5X+oXnr5_MtGQTEmUkpsAF+LALEdt8w@mail.gmail.com>
 <20201209165356.GT4077@smile.fi.intel.com>
MIME-Version: 1.0
In-Reply-To: <20201209165356.GT4077@smile.fi.intel.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

On Wed, Dec 09, 2020 at 06:53:56PM +0200, Andy Shevchenko wrote:
> > > Okay, there is a fix in master and stable-0.6.y that adds BugLink 
> > > to the
> > > list.
> > 
> > Wow that's quick!
> > 
> > Thanks a lot Konstantin!
> 
> Thanks!
> 
> Btw, can b4 print a warning if it cuts an (unknown) tag?

I can actually improve on the algorithm. We only need to be cautious 
about stuff sent as follow-ups -- anything that is part of the commit 
message already doesn't need to be scrutinized.

I'll put in a fix that just accepts trailers seen in patch series itself 
without checking.

-K
