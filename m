Received: from mail-qk1-f173.google.com (mail-qk1-f173.google.com [209.85.222.173])
 by mx.groups.io with SMTP id smtpd.web08.8936.1607436547899634082
 for <tools@linux.kernel.org>;
 Tue, 08 Dec 2020 06:09:08 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=ab4fXPtI;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.222.173, mailfrom: konstantin@linuxfoundation.org)
Received: by mail-qk1-f173.google.com with SMTP id 1so16027395qka.0
        for <tools@linux.kernel.org>; Tue, 08 Dec 2020 06:09:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=fO1rfroL1Rk2s6iYsSBvrYTF+Ii/S7pGbnZOgIw8E4A=;
        b=ab4fXPtI93nuXCjpWz3Pi537ZfmqhGSMYZxQZalZBRWPiXvoVLc5N1RjEC7UZBIkhk
         429JWVzzjAaTc+X3O+VPrMOtYz9UO1DcncuS0NmPY+k4nb+v3zPdRjYg2NL4PPHcCdzl
         JuXNzOriPI3LvbMPkAEMetGeYsNiP63inNZmw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=fO1rfroL1Rk2s6iYsSBvrYTF+Ii/S7pGbnZOgIw8E4A=;
        b=OVUvF//8OOwuJiYa75Yfl9DxwwDVIXbRkHuGuVvLw76I6PjDvZjSvkDpUZFJL1M8MM
         sMUTJtxwWw+oShm/uh7kYJ6UA0+yyiWuVdAzyCRJg7nXjGQalcmFrOYlF0w9l6J1cMA2
         u4W68r4QNXM7wsgdqQMHtGPdc9x+1Wy3LCwCs7ZCw+UtnVXcn3KsV3qv2LATVBHhOmEZ
         gQAQsn57zFbAWjFLyfTODv3IV5N4byqRZbKnAzkmUOqJWDiGR8BpKsPCYChnl6g/TjrD
         X1CPdQ0k3d4WVAWnYXLxRpUdUMfxM4wzEp6ffYaaEFHBkMK65ACJiSPR0isLK1z4gvuS
         bOuA==
X-Gm-Message-State: AOAM532k+8UvWYVFywlCb5IK+yUEaniHAs3QB8WqPo3cOIFcICoV+PGz
	Saku1ofLEC785wRT8Amn1sbprA==
X-Google-Smtp-Source: ABdhPJxYUYTZ7LJVSh9akJtCHjwQ0y/IEEfqUW5XWM2QXAlJJ0z5V00TELywa2pigzFH0ltg2RkHTA==
X-Received: by 2002:ae9:ef12:: with SMTP id d18mr31043315qkg.473.1607436547026;
        Tue, 08 Dec 2020 06:09:07 -0800 (PST)
Return-Path: <konstantin@linuxfoundation.org>
Received: from chatter.i7.local ([89.36.78.230])
        by smtp.gmail.com with ESMTPSA id q32sm9879181qtc.65.2020.12.08.06.09.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Dec 2020 06:09:06 -0800 (PST)
Date: Tue, 8 Dec 2020 09:09:04 -0500
From: "Konstantin Ryabitsev" <konstantin@linuxfoundation.org>
To: Mark Brown <broonie@kernel.org>
Cc: Rob Herring <robh@kernel.org>, tools@linux.kernel.org,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	users@linux.kernel.org
Subject: Re: [kernel.org users] [tools] b4 ty : wrong patch number when cherrypicking
Message-ID: <20201208140904.rnw3hrwwze26kv5e@chatter.i7.local>
References: <20201030173744.GA995986@piout.net>
 <1642D74B05A23708.27950@linux.kernel.org>
 <20201124182241.sojck3t76qjm5a2s@chatter.i7.local>
 <CAL_JsqJ8s6ry-nkSujEO1Pvxre=rW4p72U-_aadkQ-2Zc93sWA@mail.gmail.com>
 <20201208135926.fax4p7zqxpqgq3wo@chatter.i7.local>
 <20201208140348.GE6686@sirena.org.uk>
MIME-Version: 1.0
In-Reply-To: <20201208140348.GE6686@sirena.org.uk>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

On Tue, Dec 08, 2020 at 02:03:48PM +0000, Mark Brown wrote:
> > Well, the goal is to make it extremely obvious for the submitter 
> > that only a subset of their patch series got applied -- so I would 
> > argue that
> > Gmail thread-breaking only helps here.
> 
> > Overall, this would be an very rare situation, so I doubt anyone would 
> > care enough to get annoyed.
> 
> This is actually a pretty common situation - the two most frequent
> situations are people doing cleanup work who decide to thread a bunch of
> patches to different subsystems with no interdependencies together and
> people adding new drivers that cross multiple subsystems (eg, a driver
> plus DTS updates adding it to some platform or a MFD with several
> subfunctions).

Okay, good to know. I'm still sticking with "(subset)" in the subject, 
as this hopefully avoids more problems than it causes.

-K
