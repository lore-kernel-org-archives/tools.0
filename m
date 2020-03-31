Received: from mail-wm1-f67.google.com (mail-wm1-f67.google.com [209.85.128.67])
 by mx.groups.io with SMTP id smtpd.web11.1237.1585620380424716778
 for <tools@linux.kernel.org>;
 Mon, 30 Mar 2020 19:06:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=ZLnNwXZW;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.67, mailfrom: konstantin@linuxfoundation.org)
Received: by mail-wm1-f67.google.com with SMTP id c81so824059wmd.4
        for <tools@linux.kernel.org>; Mon, 30 Mar 2020 19:06:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=rFSd6AmePtaAqjx2BjOga9toOx0sOuRisdKABByKTJE=;
        b=ZLnNwXZW2581XOZMz5Kpfg31YLqxr3lc4tXEFV9z71DKz5rWqsScS4WQ2YmuorqSVn
         mU4qq6nTvV2whip8bt89bfZhl04HWvynve9UJb0qubn5gaT+Cz5m3gwCSJgNMKmj5aRG
         s66S9wIdBKj+W+ocGNYp7YZUTb+Sw85fw/hLw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=rFSd6AmePtaAqjx2BjOga9toOx0sOuRisdKABByKTJE=;
        b=m4B1g5XCLEs7zHVxlVImdM+VMTFG9MW8twKGYOX2tqwpTyiDtWItsaGvB6deE2EhBb
         2h2yM/GczScJ8VMTWKdf1eaDlU/MCgeH5evBAAwZN09NzMhJ52f2b0PHBEZ/YN1ObTsY
         vME0OzpKny+0QJAUCLksKOwZNwJr8PCV/lviBvzsjw+KQU6+zwnG/dwoXJU21x9RjoNz
         pg3emQJQmp29BwRHYWl73J+JMFAPrx3w5jyx8swobpPNWr8bowFY6SvJwTT+dWSvqeGK
         PkuYVHC5jrV5sdC3vF1jFivD0QiknKXKUQnS9fIRaDFiwhyE8y9H0spCjVxmoeeDwUIk
         W6YA==
X-Gm-Message-State: ANhLgQ14EFTd9hw7xmF7VrIQLgXLG/2DqQJKtr9ig/KsWxylgZ547YVU
	sdA9njRqSrPqFJgfhhd2KRcs7LepynzzJw==
X-Google-Smtp-Source: ADFU+vuk/XyUwpL8s6XxdE21Wv85XmohHwSsGH7HcjbWMT26I34jjccxn6DUTouLHZoIbSbG59ReqQ==
X-Received: by 2002:a1c:8193:: with SMTP id c141mr932721wmd.14.1585620378478;
        Mon, 30 Mar 2020 19:06:18 -0700 (PDT)
Return-Path: <konstantin@linuxfoundation.org>
Received: from chatter.i7.local (slc-exit.privateinternetaccess.com. [173.244.209.5])
        by smtp.gmail.com with ESMTPSA id o14sm1772981wmh.22.2020.03.30.19.06.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Mar 2020 19:06:17 -0700 (PDT)
Date: Mon, 30 Mar 2020 22:06:12 -0400
From: "Konstantin Ryabitsev" <konstantin@linuxfoundation.org>
To: tools@linux.kernel.org
Cc: users@linux.kernel.org
Subject: Re: [tools] [kernel.org users] b4 can now explode a pull request into an mbox file with patches
Message-ID: <20200331020612.ngzwzaalvwt2cyre@chatter.i7.local>
References: <20200326221926.jfsbtvnb7bfjahov@chatter.i7.local>
 <20200327114824.GB1738094@kroah.com>
MIME-Version: 1.0
In-Reply-To: <20200327114824.GB1738094@kroah.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

On Fri, Mar 27, 2020 at 12:48:24PM +0100, Greg KH wrote:
> > I mostly imagine that it's the --explode functionality that you'd be 
> > interested in, but since that required writing most of the other 
> > pull-request handling functionality, there's basic handling for that 
> > as well.
> > 
> > Please let me know if that is useful.
> 
> Both sound really useful, thanks!
> 
> Now to just wait for someone to send me a pull request so I can try it
> out, I just had caught up on all of them last night :)

The latest 0.4.0-dev master branch will also verify the signature at the 
tip of FETCH_HEAD once it is fetched, so once the merge window closes 
and you start processing pull requests again, you may find this useful.

E.g.:

$ b4 pr -b pstore-v5.7 202003292120.2BDCB41@keescook
Looking up https://lore.kernel.org/r/202003292120.2BDCB41@keescook
Grabbing thread from lore.kernel.org
Looking at: [GIT PULL] pstore updates for v5.7-rc1
  Fetching https://git.kernel.org/pub/scm/linux/kernel/git/kees/linux.git tags/pstore-v5.7-rc1
  ---
  [✓] Attestation-by: Kees Cook <keescook@chromium.org> (pgp: 8972F4DFDC6DC026)
---
Fetched into branch pstore-v5.7

Best,
-K
