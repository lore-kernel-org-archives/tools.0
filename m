Received: from mail-lf1-f68.google.com (mail-lf1-f68.google.com [209.85.167.68])
 by mx.groups.io with SMTP id smtpd.web10.782.1591639179821737535
 for <tools@linux.kernel.org>;
 Mon, 08 Jun 2020 10:59:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linux-foundation.org header.s=google header.b=C/lnDoXE;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.167.68, mailfrom: torvalds@linuxfoundation.org)
Received: by mail-lf1-f68.google.com with SMTP id u16so10792230lfl.8
        for <tools@linux.kernel.org>; Mon, 08 Jun 2020 10:59:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=oarZw2vwgj9FwsPSk5aOpHnNvtxfBXjLKiRS4tNFsTA=;
        b=C/lnDoXESlhm/HLZc0ycGSeMGFnCEYdviw0pWpKjFYZD2/wX3IuvwBAcBOIXxe98os
         b64/S1tKxcNyh1dz+aqmZ5dVCSeB2NnSWoxlsBIUc6j+JGxiOutDRom572N+ymu5xkJj
         cpcRoPYIBzmKHyL46nGg4sbISqdhy+IHtb16I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=oarZw2vwgj9FwsPSk5aOpHnNvtxfBXjLKiRS4tNFsTA=;
        b=h7rLniR/ltEPAgjKfP7DwvVrSSaAAe6YESTMB5gSimj6JfmTTgVrvY6QSFXaPsnPC/
         zQF7O2iv54Sgi+kLDSSslzIFlX+XPJo60JH2msijobbktT+F9PC3T9oUYgqeA6CEGTSp
         fmNVtuebgTM4LUo7/660QxR11tSEwx98P5UfUVtbOl1ePQAJ5i/Nh6HlFjxi/FAPwSPY
         XVtGO6PQEclaVT4Y1I1+LMeD6q7tKUg4G84xn97ruNhPWhzqY/kVjOc3FHB+xz+l3eqk
         Ju0EkJBYmYU1KPTsGIZO2bI35LXYIEAkLP1P9cc4DLRPnrGzQZHad9TrYNuD1SYUVD1s
         lw1Q==
X-Gm-Message-State: AOAM531I94ruH3RLieSpeKz6inXaMH/qZ23N7u41JDgdbH4nH56P29In
	AAKXAwmxV2/ZOn3LsZ+qXUWgVryHjCQ=
X-Google-Smtp-Source: ABdhPJz3lhn7bkXrA7dyfLdwPQKA/eyyglHRSJshKgo+bZKW1XSM0w4Gx/vZLYXs53y9pG2ItpXEyg==
X-Received: by 2002:ac2:54ba:: with SMTP id w26mr13332224lfk.54.1591639176923;
        Mon, 08 Jun 2020 10:59:36 -0700 (PDT)
Return-Path: <torvalds@linuxfoundation.org>
Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com. [209.85.208.181])
        by smtp.gmail.com with ESMTPSA id u9sm4425477ljd.9.2020.06.08.10.59.35
        for <tools@linux.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 08 Jun 2020 10:59:36 -0700 (PDT)
Received: by mail-lj1-f181.google.com with SMTP id n23so21652621ljh.7
        for <tools@linux.kernel.org>; Mon, 08 Jun 2020 10:59:35 -0700 (PDT)
X-Received: by 2002:a2e:b5d7:: with SMTP id g23mr10984399ljn.70.1591639175499;
 Mon, 08 Jun 2020 10:59:35 -0700 (PDT)
MIME-Version: 1.0
References: <20200525203341.z4dollmzbo7exnhc@chatter.i7.local>
 <CAHk-=wipQzNyLxEh2mr2=Y9brLx_y0G0aKrVcjG2Ad3ba+_41Q@mail.gmail.com> <1591637447.3500.15.camel@HansenPartnership.com>
In-Reply-To: <1591637447.3500.15.camel@HansenPartnership.com>
From: "Linus Torvalds" <torvalds@linuxfoundation.org>
Date: Mon, 8 Jun 2020 10:59:19 -0700
X-Gmail-Original-Message-ID: <CAHk-=wg2Omjpkd3+GkuCfJWucexf4ukbhWGQveQ5geMzry=8Qg@mail.gmail.com>
Message-ID: <CAHk-=wg2Omjpkd3+GkuCfJWucexf4ukbhWGQveQ5geMzry=8Qg@mail.gmail.com>
Subject: Re: [kernel.org users] b4 version 0.5.0 is available
To: James Bottomley <James.Bottomley@hansenpartnership.com>
Cc: Konstantin Ryabitsev <konstantin@linuxfoundation.org>, users@linux.kernel.org, 
	tools@linux.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Mon, Jun 8, 2020 at 10:30 AM James Bottomley
<James.Bottomley@hansenpartnership.com> wrote:
>
>
> That's an akpm problem: you can see it here on lore:
>
> https://lore.kernel.org/linux-mm/20200608044004.04xI8ALrc%25akpm@linux-foundation.org/
>
> Lore says it can't find the cover letter because the In-reply-to has
> the wrong message id.  This broke threading on my system as well.

Ok, that explains the cover letter missing.

But what about the "patches 1-3 aren't picked up if I picked the
message ID of patch 4" issue?

lore seems to thread the series fine, and sees it all.

               Linus
