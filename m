Received: from mail-qt1-f195.google.com (mail-qt1-f195.google.com [209.85.160.195])
 by mx.groups.io with SMTP id smtpd.web09.682.1603820730948213923
 for <tools@linux.kernel.org>;
 Tue, 27 Oct 2020 10:45:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=bEDu69BP;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.160.195, mailfrom: konstantin@linuxfoundation.org)
Received: by mail-qt1-f195.google.com with SMTP id z33so1626593qth.8
        for <tools@linux.kernel.org>; Tue, 27 Oct 2020 10:45:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=16BLEeMu6vwPox33GoZSpsvKNdO32wuSzkx/tYwHoKc=;
        b=bEDu69BPWAoIM2rE0GQtol/93XuYIc8t3KiteDhzDAB3JOpVcfUzpQoNl6rPI6HtJX
         Q9H/b0SkqH3pDBNC1SGZMR0wejiCxIxWPPmXn5geLpCyeuAeZmWcHxnFepYZt3VCk4LP
         hNT59FE54e/Zng4ysoQc+cYtexp9kaQHYqEP0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=16BLEeMu6vwPox33GoZSpsvKNdO32wuSzkx/tYwHoKc=;
        b=KEYg2myF3JZNW3dSkdUzbBaU5/AHpU/FCCQBcHAbPmcvsIpyoMm8GMpR/CyiM+Sq97
         Ovx1fOwzb/kHi3G3GUJnf1WnA2DRGBZ0SDGrJkWJhtDgZxICYO6vJJrDXWQXSjq31/gu
         KQmss/e4pU/bAKDhZ9CMWCMy3p361s8XFvcOuBd1WYA2RUi2dJrVla9jf4TZPt3343MJ
         LxC5k3j8d+BpxFte1zICINawzrJdi3NPsX4WAbJUIwhaYkY42ve077t3b/nHA5r0J0U6
         Bf3jeGleyKNW/qsF8F5VO43/OxWwpSCCbif8QqytC0cGWydN7Co53URiWfjMJArkha6X
         gwFw==
X-Gm-Message-State: AOAM532U4WXcUts/c+csCRvI7SMD4fkPyh7oiI+NkbEhm3q9f8cjcWS6
	DA9w3L/CbSHc1sUgumhfxCuRqA==
X-Google-Smtp-Source: ABdhPJwoMu9EM074AOj4+jKMNKIukka36Wn+aJrGljRK/Sm9Hqa24OxxCQ8eA8CfdQ+gSlSwCWs4ow==
X-Received: by 2002:aed:2c47:: with SMTP id f65mr3209338qtd.328.1603820729976;
        Tue, 27 Oct 2020 10:45:29 -0700 (PDT)
Return-Path: <konstantin@linuxfoundation.org>
Received: from chatter.i7.local ([89.36.78.230])
        by smtp.gmail.com with ESMTPSA id 9sm1146044qkv.110.2020.10.27.10.45.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2020 10:45:29 -0700 (PDT)
Date: Tue, 27 Oct 2020 13:45:27 -0400
From: "Konstantin Ryabitsev" <konstantin@linuxfoundation.org>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: users@linux.kernel.org, tools@linux.kernel.org
Subject: Re: b4 not fetching proper patch
Message-ID: <20201027174527.6mt2gcsfxc2q4u5m@chatter.i7.local>
References: <20201027173116.GA158870@piout.net>
MIME-Version: 1.0
In-Reply-To: <20201027173116.GA158870@piout.net>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

On Tue, Oct 27, 2020 at 06:31:16PM +0100, Alexandre Belloni wrote:
> Hello,
> 
> I'm not sure this is worth fixing but I though I would report it anyway:
> 
> I want to apply just this patch:
> https://lore.kernel.org/linux-rtc/20200924105256.18162-2-u.kleine-koenig@pengutronix.de/
> 
> However b4 am -p linux-rtc -c -t -s -l -P _ -o - 20200924105256.18162-2-u.kleine-koenig@pengutronix.de
> ends up with:
> 
> Grabbing thread from lore.kernel.org/linux-rtc
> Checking for newer revisions on https://lore.kernel.org/linux-rtc/
> Analyzing 20 messages in the thread
> Will use the latest revision: v2
> You can pick other revisions using the -vN flag
> ---
> Specified msgid is not present in the series, cannot cherry-pick
> 
> The issue here is that this series has been sent as a reply to another
> series labeled v2 that it supersedes and b4 insists in using this v2.

Oooh, gosh, yeah:

-> [PATCH v2 N/3]
 \-> [PATCH N/2]
  \-> [PATCH v2 N/2]


I'm sorry, it's one of those times when it's never going to be clear 
what's been intended. :)

That said, it's a legitimate bug -- if the msgid we're cherry-picking is 
not in the latest series revision, we should automatically select the 
revision containing the requested msgid. You can still get the patch you 
need in this particular case if you pass -v1 to the command you used, 
but it should work without forcing the -v1.

I'll poke to see what can be done.

-K
