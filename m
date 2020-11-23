Received: from mail-qv1-f48.google.com (mail-qv1-f48.google.com [209.85.219.48])
 by mx.groups.io with SMTP id smtpd.web09.39559.1606154465094854187
 for <tools@linux.kernel.org>;
 Mon, 23 Nov 2020 10:01:05 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=LH0NIDL5;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.219.48, mailfrom: konstantin@linuxfoundation.org)
Received: by mail-qv1-f48.google.com with SMTP id u23so9233822qvf.1
        for <tools@linux.kernel.org>; Mon, 23 Nov 2020 10:01:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=lMoX7dAR71YjK5WLFvZf3wg4yiRrbGQBeOvVsxuffM8=;
        b=LH0NIDL5baLKxnbncvgqeOL+r/RtDG3MLIFh6JSvhHj4N0hvrwfAGYvMXR/hpBUblC
         ixYEQ8yqfxImHi6Rf5QDQydASark7hXTJ+aOkyYpwtbEmR9y/zHD/HMAas3lJFNhu84M
         IZFNc9XooqbadvRjP+6ZHnhj8LrWW6YzU/Lkw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=lMoX7dAR71YjK5WLFvZf3wg4yiRrbGQBeOvVsxuffM8=;
        b=RGroEoOu0b5ow2xpNrFH90iHaxaBid8PB6raNClzAZFHJBEFLv0OFi81Jly/qh4e97
         WlLPwHg7JpY3vRSDMT8Z+12/+EB5e16bpmH7ClHNrbWHWxXpBVKWilQxqR2kf8FZ/ZAB
         +vwrNGcF7k3cA41Srg0smKxBICQJ5LrnXBzBTMghKLFRPKCW396uTzOFUEFuOSGEeXJ/
         mD3tndnJzwBBpSROtee+DjMfXJMZp+jwAEoc026aziNKMuZHiGtVubI4fwQZiBwsOba7
         Y8XBAEztr2fYakSOmKkAg1oGimbes2qRHSfpi79LUiAY71PBKjukPugNCl9DNiL1z56U
         WSbw==
X-Gm-Message-State: AOAM533eKS3iE/qQ44VL8C5XsCtCCl5dV4+iaPCnE0U51Egh7L3VJ65e
	sGLipfsimradI1Ox2qp2byCqfQ==
X-Google-Smtp-Source: ABdhPJyHSKLV0pLAS8IRFRJHFNF5Mhj0Cgyb6u66zx9filEXs7VkJcQ5RFRSxYjnesjTqf9DfMOrIQ==
X-Received: by 2002:ad4:5886:: with SMTP id dz6mr587877qvb.10.1606154464128;
        Mon, 23 Nov 2020 10:01:04 -0800 (PST)
Return-Path: <konstantin@linuxfoundation.org>
Received: from chatter.i7.local ([89.36.78.230])
        by smtp.gmail.com with ESMTPSA id q20sm9750067qtn.80.2020.11.23.10.01.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2020 10:01:03 -0800 (PST)
Date: Mon, 23 Nov 2020 13:01:01 -0500
From: "Konstantin Ryabitsev" <konstantin@linuxfoundation.org>
To: Mark Brown <broonie@kernel.org>
Cc: tools@linux.kernel.org
Subject: Re: [tools] Exception with b4 am
Message-ID: <20201123180101.wdlniyuswy75b4fe@chatter.i7.local>
References: <20201123124139.GB6322@sirena.org.uk>
 <20201123144920.qijmi23rxdibswtb@chatter.i7.local>
 <20201123165052.GH6322@sirena.org.uk>
MIME-Version: 1.0
In-Reply-To: <20201123165052.GH6322@sirena.org.uk>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

On Mon, Nov 23, 2020 at 04:50:52PM +0000, Mark Brown wrote:
> On Mon, Nov 23, 2020 at 09:49:20AM -0500, Konstantin Ryabitsev wrote:
> > On Mon, Nov 23, 2020 at 12:41:39PM +0000, Mark Brown wrote:
> 
> > > I get the traceback below unless I remove python3-dkim:
> 
> > Right, looks like Debian pulls in an older dnspython version. The latest 
> > commit I just pushed should work with either.
> 
> That fixes the immediate issue but there's more issues with old Python
> stuff:

Thanks for testing it out again. I believe I have a better fix in place 
now, if you're willing to try it out one more time.

-K
