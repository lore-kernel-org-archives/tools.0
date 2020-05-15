Received: from mail-qv1-f42.google.com (mail-qv1-f42.google.com [209.85.219.42])
 by mx.groups.io with SMTP id smtpd.web12.20027.1589567766089156150
 for <tools@linux.kernel.org>;
 Fri, 15 May 2020 11:36:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=Gb4QYQh8;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.219.42, mailfrom: konstantin@linuxfoundation.org)
Received: by mail-qv1-f42.google.com with SMTP id 59so1556069qva.13
        for <tools@linux.kernel.org>; Fri, 15 May 2020 11:36:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=e+noCSEpkiZOVF7EuKwRK+q8MA6U7Uxe72yClTGUYG4=;
        b=Gb4QYQh8hQA6Nqeh+DZInFAa5TG0yFSk4BJmHIOTkGJdYpxM/H+lD7mCbFARlfTIXA
         B6076/HRkrNq/cy3lLnBTquI7oep0c3xCjQtzbSTMdkPp2zm9CHPoyfkqjIrUDqKHAPh
         uGy6Bz2SpkVFRfi03OF3jwwWyYXHBN3/AU0uQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=e+noCSEpkiZOVF7EuKwRK+q8MA6U7Uxe72yClTGUYG4=;
        b=QMPKPGzTPXUOu49XvlK2pbcCS2QZaeEMC6X0oEZXkBIe8uFtUXjpRw+MtOL6CPMDej
         1P1ngkxMVCkoqcR1HmD72PYogRddb1Z/vA1Z5Pvo8R7KZQXjsmoFkWnvwM95C3OCSnYE
         Fe9fw8qyVK+skQLLlo4A2Xz0CZej8PjxWgVNVklOTgVfil+UtC7kL6tS5wY4tMr5ihbC
         m15gBHUbSVj5kECLHhIUibg6iAo9Jc0/EIUSI0iOtu1TlxeI/UKPxV9wCico4FnRUnZr
         TQY/l1FNEjhBu8QePgItAL7ZxV9wLGgJWvvJc1X4ey6TE7qQ+YTfAxNPJUDxqGwwszJD
         uGqw==
X-Gm-Message-State: AOAM531kM8yjmZQwdrcSv3s52E3/WIVlqHI6G2+nz/RRE072YWsvVKVp
	WSE5jZgN+mZktPfhTGCAkdLatw==
X-Google-Smtp-Source: ABdhPJwmU7NTYNHV9r7ykVz3bweoJF5Z/Gj6nLcUFKB2wwTVzmBb20FbuhhotftlogqtWrMfIzPHLA==
X-Received: by 2002:a0c:f44a:: with SMTP id h10mr4718527qvm.111.1589567765199;
        Fri, 15 May 2020 11:36:05 -0700 (PDT)
Return-Path: <konstantin@linuxfoundation.org>
Received: from i7.mricon.com (107-179-243-71.cpe.teksavvy.com. [107.179.243.71])
        by smtp.gmail.com with ESMTPSA id w22sm2580699qth.87.2020.05.15.11.36.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 May 2020 11:36:04 -0700 (PDT)
Received: by i7.mricon.com (sSMTP sendmail emulation); Fri, 15 May 2020 14:36:02 -0400
Date: Fri, 15 May 2020 14:36:02 -0400
From: "Konstantin Ryabitsev" <konstantin@linuxfoundation.org>
To: Mark Brown <broonie@kernel.org>
Cc: tools@linux.kernel.org
Subject: Re: b4 ty not remembering fetched patches
Message-ID: <20200515183602.ivwwyxafxojmc7mp@chatter.i7.local>
References: <20200515181918.GO5066@sirena.org.uk>
MIME-Version: 1.0
In-Reply-To: <20200515181918.GO5066@sirena.org.uk>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

On Fri, May 15, 2020 at 07:19:18PM +0100, Mark Brown wrote:
> Hi Konstantin,
> 
> When I run 
> 
> 	b4 am -t 20200515104758.6934-1-Sergey.Semin@baikalelectronics.ru
> 
> a mailbox is generated (incomplete due to issues with vger spam
> filtering) but the fetched patches are not recorded in the b4 ty
> database (as showing by b4 ty -l).  This happens even if only patches
> that are present on the list are requested on the command line.

Right, this was intentional due to trying to be over-cautious. If we 
don't have the complete thread, then we probably shouldn't be tracking 
if this incomplete thread was applied or not -- at least that was my 
thinking. What is your thoughts on that?

Of course, if we're specifically selecting a subset of that thread, we 
shouldn't be applying that logic. I'll see if I can add that caveat in.

Thanks,
-K
