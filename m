Received: from mail-qk1-f193.google.com (mail-qk1-f193.google.com [209.85.222.193])
 by mx.groups.io with SMTP id smtpd.web12.868.1591639607961480112
 for <tools@linux.kernel.org>;
 Mon, 08 Jun 2020 11:06:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=MSHhip0F;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.222.193, mailfrom: konstantin@linuxfoundation.org)
Received: by mail-qk1-f193.google.com with SMTP id q8so18167734qkm.12
        for <tools@linux.kernel.org>; Mon, 08 Jun 2020 11:06:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=21bsPfrXjGFw2VuXmkt7cqDsSWCv/TUWbJcKkKGzUbQ=;
        b=MSHhip0FkmYMU4Ti/LnbAlrE0+GYT3EI9ATPYQInXGKg/slIh5RQCCOCg/rSnLurD5
         HqZceK7tHy3TAM/dMnjiX0c1vnFTtQeglV7h3ebNrGlJ/hyqqBo45bh9K6fuoWp7fAac
         CZuh6mGVbbX8gAW2SF5fnemO/S4yLyRIkitDY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=21bsPfrXjGFw2VuXmkt7cqDsSWCv/TUWbJcKkKGzUbQ=;
        b=fa70Jbkjv3t2SEiR3xQDQztvDRhzq4iHu5vf0i9uSIPVAlpjpy5JvzQfGri3NUG5DN
         9HoA3d7tvWaLa2aWfb2TSXQtV/BLhfmRTvjKZflvaGfeUm320rIEtup5fGw3qMORupTo
         cQK+mj/nZ1LatKc91jkclZTh5TjN+Uo7s8Oc3vNZvxVikFE6y7HEfIzi7a93gZtWW71T
         /5a86AId2l6jw94i60dtFU2HN+wzewOfP3MPfh1Mx/oMgc0AU+y9Qt9G7RSXIPEKZyIt
         aENlddmxZbq7a9BKGduEvr9Aj1Y3osITtZii1iZBe7ScTZWCC6XzdOZSL/xSDtFCjXcB
         ADNA==
X-Gm-Message-State: AOAM531Jozh06uFb1b5gMtyDxnLmPeCWPGA/eCrve6AZA10d5aI/UPAw
	3z7t6f+ggpRz+ns9Qmy6EVTIPg==
X-Google-Smtp-Source: ABdhPJy5LvTgDLQEA7jZHjVzspIKRTGHjf666N0bui2HhiA7gkvy3l68z4AZcGT6rRrrwbyPhIteMg==
X-Received: by 2002:a37:a304:: with SMTP id m4mr24462087qke.8.1591639607003;
        Mon, 08 Jun 2020 11:06:47 -0700 (PDT)
Return-Path: <konstantin@linuxfoundation.org>
Received: from i7.mricon.com (107-179-243-71.cpe.teksavvy.com. [107.179.243.71])
        by smtp.gmail.com with ESMTPSA id d140sm7709772qkc.22.2020.06.08.11.06.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Jun 2020 11:06:45 -0700 (PDT)
Received: by i7.mricon.com (sSMTP sendmail emulation); Mon, 08 Jun 2020 14:06:43 -0400
Date: Mon, 8 Jun 2020 14:06:43 -0400
From: "Konstantin Ryabitsev" <konstantin@linuxfoundation.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: James Bottomley <James.Bottomley@hansenpartnership.com>,
	users@linux.kernel.org, tools@linux.kernel.org
Subject: Re: [kernel.org users] b4 version 0.5.0 is available
Message-ID: <20200608180643.hrskvxo5c6mhpnp4@chatter.i7.local>
References: <20200525203341.z4dollmzbo7exnhc@chatter.i7.local>
 <CAHk-=wipQzNyLxEh2mr2=Y9brLx_y0G0aKrVcjG2Ad3ba+_41Q@mail.gmail.com>
 <1591637447.3500.15.camel@HansenPartnership.com>
 <CAHk-=wg2Omjpkd3+GkuCfJWucexf4ukbhWGQveQ5geMzry=8Qg@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAHk-=wg2Omjpkd3+GkuCfJWucexf4ukbhWGQveQ5geMzry=8Qg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

On Mon, Jun 08, 2020 at 10:59:19AM -0700, Linus Torvalds wrote:
> > That's an akpm problem: you can see it here on lore:
> >
> > https://lore.kernel.org/linux-mm/20200608044004.04xI8ALrc%25akpm@linux-foundation.org/
> >
> > Lore says it can't find the cover letter because the In-reply-to has
> > the wrong message id.  This broke threading on my system as well.
> 
> Ok, that explains the cover letter missing.
> 
> But what about the "patches 1-3 aren't picked up if I picked the
> message ID of patch 4" issue?

That's a b4 problem -- I have a fix for it in master/stable-0.5.y and I 
will release 0.5.1 in the near future with that fix.

Gotta say, Andrew's patchbombs have been a great fuzzing tool thus far.

-K
