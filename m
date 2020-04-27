Received: from mail-qk1-f195.google.com (mail-qk1-f195.google.com [209.85.222.195])
 by mx.groups.io with SMTP id smtpd.web11.1512.1588012855014634525
 for <tools@linux.kernel.org>;
 Mon, 27 Apr 2020 11:40:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=IAhV8OeK;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.222.195, mailfrom: konstantin@linuxfoundation.org)
Received: by mail-qk1-f195.google.com with SMTP id g74so19061652qke.13
        for <tools@linux.kernel.org>; Mon, 27 Apr 2020 11:40:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=abRiCYmPLXfPi/zHp/OuaDGWJ2XgAAnxfJZZPg34zx0=;
        b=IAhV8OeKSHwCV/RBnJBit1ajTVQaYUBVlvYDuRioaOIM6eq5H9eoV4/Jnk1dmzs4HM
         Ukun/YB7+cF03/H+hTGobh+BILnz7bshLSY77Zq2aVvvrTmOXt95iZx2Y46Nj2q1j/F3
         +vuE2/VhGT21AALGdDh2/vARV+ZDFM/6U2P00=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=abRiCYmPLXfPi/zHp/OuaDGWJ2XgAAnxfJZZPg34zx0=;
        b=KiGHeLJ+HrCLF7lvQD/eaX324LvbfHdeIvoq0+XAOW4y4QelvNwugTNWg++C5pd2al
         V14Y0zQDa6u22QSHb+5Zh8dYrvwsR3iYAIMb7hatI8Jv3QekK7KSIIxusZgtZPinYrJy
         42E205KoxdiIgzZq+OkZLLD2mSmFsfz0dDlDX68/tFyskYMhMxjAmGLYe4B5VW9eknJP
         mXiOjiVhm/eHTlV1HWs8y5D63Xc7Upr1dalmoqqksVWILjkj39I7/ltsBhIXY1IncKIV
         4hhL8rwejLwwEVr39rNKFhMTKSsChOO7l5j7sRN6HTkVX6Eu2/srF+ROoTPLjjbd02dT
         F4bA==
X-Gm-Message-State: AGi0Pua/i5EYVtM2c2KSe+SkJJwKtadN0Wqggpc+Cdi4jglHFsAQaEua
	kKuBDZQPODszStYzOAratoMnxA==
X-Google-Smtp-Source: APiQypK3K9ojiyfiHT1tAQeaLlCCkiuYWBE45pASdipzLfkHVsDjCPlwaVuzD+DRHmt3s7fGJU/ZTA==
X-Received: by 2002:ae9:d847:: with SMTP id u68mr23101774qkf.322.1588012853864;
        Mon, 27 Apr 2020 11:40:53 -0700 (PDT)
Return-Path: <konstantin@linuxfoundation.org>
Received: from i7.mricon.com (107-179-243-71.cpe.teksavvy.com. [107.179.243.71])
        by smtp.gmail.com with ESMTPSA id w27sm11671842qtc.18.2020.04.27.11.40.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Apr 2020 11:40:53 -0700 (PDT)
Received: by i7.mricon.com (sSMTP sendmail emulation); Mon, 27 Apr 2020 14:40:51 -0400
Date: Mon, 27 Apr 2020 14:40:51 -0400
From: "Konstantin Ryabitsev" <konstantin@linuxfoundation.org>
To: "Martin K. Petersen" <martin.petersen@oracle.com>
Cc: users@linux.kernel.org, tools@linux.kernel.org
Subject: Re: [tools] b4 v0.4.0 available with new features
Message-ID: <20200427184051.ol7znhab6khqvjas@chatter.i7.local>
References: <20200424170442.ad3b3j5f5vkbcmvb@chatter.i7.local>
 <yq1lfmkbgoi.fsf@oracle.com>
MIME-Version: 1.0
In-Reply-To: <yq1lfmkbgoi.fsf@oracle.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

On Fri, Apr 24, 2020 at 07:35:41PM -0400, Martin K. Petersen wrote:
> 
> Hi Konstantin!
> 
> > ## b4 ty
> >
> > Allows you to automate a lot of "thanks, applied" and "thanks, merged"
> > feedback for series and pull requests that were fetched with "b4 am"
> > and "b4 pr".
> 
> I just merged a bunch of one-liners and the "thank you" quote ends up
> being:
> 
>     > Fix the following coccicheck warning:
>     > 
>     > drivers/scsi/foo/bar/baz.c
>     > 
>     > Link: https://lore.kernel.org/r/...
>     > Reported-by: ...
>     > Reviewed-by: ...
>     > Signed-off-by: ...
>     > Signed-off-by: ...
> 
> It would be nice if the quoting function could ignore the trailers
> portion of the mail and not just stuff below "---".

Yep, good point. The latest master and stable-0.4.y should do a better 
job at making these quotes. Tested on:

https://lore.kernel.org/kernel-hardening/20200229231120.1147527-1-nivedita@alum.mit.edu/

The reply generated was:

-----
On Sat, 29 Feb 2020 18:11:20 -0500, Arvind Sankar wrote:
> This currently leaks kernel physical addresses into userspace.

Applied to mricon/linux.git master, thanks!
...

-----

(Note: The reply quote is generated during the "b4 am" run, so the 
changes will only be seen on newly fetched patches/series.)

Best,
-K
