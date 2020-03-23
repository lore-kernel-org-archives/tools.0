Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
 by mx.groups.io with SMTP id smtpd.web10.26.1584983326625949024
 for <tools@linux.kernel.org>;
 Mon, 23 Mar 2020 10:08:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=dZvslru/;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.47, mailfrom: konstantin@linuxfoundation.org)
Received: by mail-wr1-f47.google.com with SMTP id s1so18065037wrv.5
        for <tools@linux.kernel.org>; Mon, 23 Mar 2020 10:08:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=W91bMZ7BCPlKXtvR0ZZrSFWYlDaQtO9uHGVl0UyNfsk=;
        b=dZvslru/cs9wHxHH43aDHL1HoooGGcuTOl3+A8Ufy6xZ23VY1JH4KkXp5TDxJBUD+Z
         9/jIBee4FpPoHiRzKKXIWpwzKKeeCODlvMXInQjXJr/nP008cBq/RL0K1X83iW9GBYHO
         Lbco/ir7FolNcNmPiGtsTQBgX9mRVRwpRtNAU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=W91bMZ7BCPlKXtvR0ZZrSFWYlDaQtO9uHGVl0UyNfsk=;
        b=pJJa+dAH+iXQAGZ1YAUpkEMymMBZMre3we3jvIjIxxgjCs+fqUf/UhaIwhUt7IhArp
         5zadNTdC3ptTi0APXA1ABo9x5atu7RaSmk6lroKKwgM5QUlYrG2LPlXXVNZ0Y6KG0b+9
         ncKoJR9ASPPQw8msbA3V89Cq+BGdlWrWD/2EwRA/F0pH0UJwgKbUMNCT70L4xHo10mKr
         eAePLxXnVLcXah6z45KGSN37qFyyCkC6I4Lp/B1VwDeiPzp9stxgmVUPB9+dv/NQNu2A
         jRt4W1vGpdeW2FRsQlqy7B3ox8wx55yulAubDWo6zZLbJdCX6y2XJFMmCYMOHFJG01rx
         R60Q==
X-Gm-Message-State: ANhLgQ0IyNJz4e5qb/pOsIT4lhFtk/FI1Q8dZCYpaiwd2YCvxxYlezS4
	TbIaj+Yj+wP6YP4S+X6ruLE8yQ==
X-Google-Smtp-Source: ADFU+vtpqivsWEx0W46mMki27l3Z9kGvL6PbOdnsfE3dAtWJWuV9JhLjtw7kU7+uposdcZuzR0d9jg==
X-Received: by 2002:a5d:4003:: with SMTP id n3mr16448036wrp.176.1584983325064;
        Mon, 23 Mar 2020 10:08:45 -0700 (PDT)
Return-Path: <konstantin@linuxfoundation.org>
Received: from chatter.i7.local (tor-exit-13.zbau.f3netze.de. [185.220.100.240])
        by smtp.gmail.com with ESMTPSA id n1sm24392450wrj.77.2020.03.23.10.08.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Mar 2020 10:08:44 -0700 (PDT)
Date: Mon, 23 Mar 2020 13:08:39 -0400
From: "Konstantin Ryabitsev" <konstantin@linuxfoundation.org>
To: Jason Gunthorpe <jgg@ziepe.ca>
Cc: James Bottomley <James.Bottomley@hansenpartnership.com>,
	users@linux.kernel.org, tools@linux.kernel.org
Subject: Re: [kernel.org users] Pip dependency problem with b4
Message-ID: <20200323170839.gbddtnlkywsrtz7g@chatter.i7.local>
References: <1584974859.3780.10.camel@HansenPartnership.com>
 <20200323150003.owxg3xhwtgc7pzap@chatter.i7.local>
 <1584975825.3780.15.camel@HansenPartnership.com>
 <20200323151333.samun53vkbsj7fzt@chatter.i7.local>
 <20200323165652.GA20941@ziepe.ca>
MIME-Version: 1.0
In-Reply-To: <20200323165652.GA20941@ziepe.ca>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

On Mon, Mar 23, 2020 at 01:56:52PM -0300, Jason Gunthorpe wrote:
> > I've added python_requires='>=3.6' to the proper place, so 0.3.4 
> > will do the right thing.
> 
> Unrelated, but when using pip to install b4 into a virtual env
> directly from git (not via some pip cloud) it blows up as setup.py
> imports b4, and b4 imports all kinds of stuff..

Well, this page is a hoot:
https://packaging.python.org/guides/single-sourcing-package-version/

Anyway, I switched to using to what is hopefully the least terrible way 
of doing it.

-K
