Received: from mail-qk1-f177.google.com (mail-qk1-f177.google.com [209.85.222.177])
 by mx.groups.io with SMTP id smtpd.web12.9191.1588867068907162234
 for <tools@linux.kernel.org>;
 Thu, 07 May 2020 08:57:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=TfxXFigt;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.222.177, mailfrom: konstantin@linuxfoundation.org)
Received: by mail-qk1-f177.google.com with SMTP id f83so6589166qke.13
        for <tools@linux.kernel.org>; Thu, 07 May 2020 08:57:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=date:from:to:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=yhfLogHzkxCFckgnXuN7uqzN8TR3Z6fHfeBxXhAXMqc=;
        b=TfxXFigthxNfZq0Z6FRfsjFtag4uo9rPW1B+d1BWWz3gsZAzqevh1uFaxwMeJeo76M
         Eo9BPKZ8LkCGX14pBf+avOtSBpVwG2zXVnzC1SPdHdkAOHwaDcxAgyzLx75ac3wD+BgZ
         kM30s2ov7THPC5b9ryU0pAmBoE3AGLk1XPkEc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=yhfLogHzkxCFckgnXuN7uqzN8TR3Z6fHfeBxXhAXMqc=;
        b=JZRPlvOXGb1iQguIiJERSN4WQZVDzhPOFnT9TgU19O8E9x/qY16KPnkT7hLWk/aNDO
         ug7Bnp+dp8ORJR9vwMgJFn1xsZSXHpdvlRu6IKymW0B+EF0cV4QQKWOA0Gdl2o6ARIOr
         qxl1mvBA0zo/M6U1lWGoXpQ19FHEEv42u7ytLiSCiEL43MmKawsW9sdijZBGQwtbE2Z8
         2Lj1OOCrejdtKFwS8AYocNXOa+zWTnnizJCvLE+YA3RiG1q41GP43OZJhBgEXnIvuDM6
         /TN2RbYFP/FI3dg6/VvvpM+KrFnbL0+0fxmqwCaCirTFr8FWtOqPU6fFYBzQ1JcA0P36
         Lp7g==
X-Gm-Message-State: AGi0Puamd9y6ZFW3DbNwSeQr6bdn1CTlYmwSG8ibA2dSPRXmgpuA9nNB
	PgUGai2YPJzRyv8on864+/5/J3r9pX0=
X-Google-Smtp-Source: APiQypJ/4OtU+oylw15xsUK3OkESaO9wwNxEHZTg7WoUUp2cjZ9PTRC/3jFDmgaCdf3F/koMUku23w==
X-Received: by 2002:a05:620a:1456:: with SMTP id i22mr2282013qkl.309.1588867067598;
        Thu, 07 May 2020 08:57:47 -0700 (PDT)
Return-Path: <konstantin@linuxfoundation.org>
Received: from i7.mricon.com (107-179-243-71.cpe.teksavvy.com. [107.179.243.71])
        by smtp.gmail.com with ESMTPSA id g11sm4375722qkk.106.2020.05.07.08.57.45
        for <tools@linux.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 May 2020 08:57:46 -0700 (PDT)
Received: by i7.mricon.com (sSMTP sendmail emulation); Thu, 07 May 2020 11:57:45 -0400
Date: Thu, 7 May 2020 11:57:45 -0400
From: "Konstantin Ryabitsev" <konstantin@linuxfoundation.org>
To: tools@linux.kernel.org
Subject: Re: [tools] [b4] some issues with b4 ty $fromname
Message-ID: <20200507155745.rgdivy34t4oxwd4y@chatter.i7.local>
References: <20200507125054.GA19511@e121166-lin.cambridge.arm.com>
MIME-Version: 1.0
In-Reply-To: <20200507125054.GA19511@e121166-lin.cambridge.arm.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

On Thu, May 07, 2020 at 01:50:54PM +0100, Lorenzo Pieralisi wrote:
> Hi,
> 
> I have just run into a name formatting issue with b4 ty command, email
> message generated (as an example) attached ($fromname garbled), I am
> sure it is a pretty trivial set-up issue with email encoding and my
> python environment, please let me know if that's something easy to fix
> and thank you very much for this very useful tool.

Thanks for the report -- this is now fixed in master and stable-0.4.y.  
Note: this data is recorded at "b4 am" time, so fixes will only show up 
for new series/patches you fetch with "b4 am".

Best regards,
-K
