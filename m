Received: from mail-qk1-f177.google.com (mail-qk1-f177.google.com [209.85.222.177])
 by mx.groups.io with SMTP id smtpd.web11.7897.1613570903504132670
 for <tools@linux.kernel.org>;
 Wed, 17 Feb 2021 06:08:23 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=TbpaSS6b;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.222.177, mailfrom: konstantin@linuxfoundation.org)
Received: by mail-qk1-f177.google.com with SMTP id r77so12717665qka.12
        for <tools@linux.kernel.org>; Wed, 17 Feb 2021 06:08:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=date:from:to:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=8JOw9Qr0OznVfIq1xaeZaewpi6IvT92rOYqgVVYbefc=;
        b=TbpaSS6byQXrUXDNfI64kz0N0fO2jXVB7j+akEKlcy+3+uuwYrP5quStpltxOwM6WJ
         G/DUoq564bAQLzs/wlyQhEg7mrfaSKeRjGYV+0NxpEfGqS7QRGAGFeyVR7DvG6Kaj1lD
         KStaLyFy7czOAwWTso9TFeJZrFkIVClZQT/mI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=8JOw9Qr0OznVfIq1xaeZaewpi6IvT92rOYqgVVYbefc=;
        b=hKbtoaDojQyoCK/9shuqQWRmVnp3NpxaUTXPOubQhUCYmudbEbfPNOHXaeuThjppYd
         YgcRNLY/hPQJgo8Iy6URkXSVt85Bk9+Zcpm0JmK8Hi2xk4zrNUq6fYN3wdBQD+xkwKHk
         xVhRbMFhIW55d9AKTsYym+tDqozS9bKocPSmETFzlyWwf0pRPb1+8Tv0yGfHAV+JtmAs
         1h5I8SKf3MFx8pbB3JXWrkzE3kaGJIilLk8SzzfncK1ucZZJ7vRXgbbrNQVsn0De3NUe
         S3JdxkAUnirfPpcNn0OnVLswWHKGBP9WFULSiqGZim65serj2UfHjV+NyCFPZnuc/A8o
         VW0A==
X-Gm-Message-State: AOAM532gXAjqKQzkmyUcG5Q6OVxBzFIF6rSqGOGOQKE7pynzT0j8RXD+
	iMBGxozMXBntAfKSrjYZyFFLpgh/7R8GCQ==
X-Google-Smtp-Source: ABdhPJz1q3tm4+guG2ounZj4LwPKRnji/vgi9Uu9fXunbQMIclnQNJxiWmCto1h/oqmRugw77XfedQ==
X-Received: by 2002:a37:6788:: with SMTP id b130mr16262491qkc.197.1613570897097;
        Wed, 17 Feb 2021 06:08:17 -0800 (PST)
Return-Path: <konstantin@linuxfoundation.org>
Received: from chatter.i7.local (bras-base-mtrlpq5031w-grc-32-216-209-220-18.dsl.bell.ca. [216.209.220.18])
        by smtp.gmail.com with ESMTPSA id l66sm1664707qkd.21.2021.02.17.06.08.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Feb 2021 06:08:16 -0800 (PST)
Date: Wed, 17 Feb 2021 09:08:14 -0500
From: "Konstantin Ryabitsev" <konstantin@linuxfoundation.org>
To: tools@linux.kernel.org, foxboron@archlinux.org
Subject: Re: [tools] [b4] Sign gzipped tarball instead of .tar
Message-ID: <20210217140814.yoifhqws2mdth5ec@chatter.i7.local>
References: <20210217134333.vqhg6xoz2bhmzpks@anathema>
MIME-Version: 1.0
In-Reply-To: <20210217134333.vqhg6xoz2bhmzpks@anathema>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

On Wed, Feb 17, 2021 at 02:43:33PM +0100, Morten Linderud wrote:
> Yo!
> 
> Currently packaging up b4 for Arch Linux and encountered a slight issue with the
> release tarballs for the project.
> 
> The siganture says it needs to be compared against the tarball of the project,
> however the kernel.org and googlesource.com only allows one to download the
> gzipped tarball. To recreat the release artifact one would need to clone and
> create the archive to have anything to compare against.

Or run:
xz -cd b4-0.6.2.tar.xz | gpg2 --verify b4-0.6.2.tar.sign -

You can get .xz archives here:
https://www.kernel.org/pub/software/devel/b4/

> This doesn't work that well since we preferably include the sources
> declaratively and not work out a tarball from the source checkout during
> packaging. This also has the effect of most distros packaging the release
> straight from pypi or from git with no release authentication.
> 
> Could the gzipped release tarballs be signed instead? Another alternative would
> be to sign the release tags of b4.

FYI, all software released on kernel.org provides a signature against the
uncompressed .tar archive. This is done to allow providing a single signature
file for multiple compressed versions (.gz, .xz) and allow for recompressing
things in the future with better algorithms or higher compression ratios.

Regards,
-K
