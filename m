Received: from mail-wr1-f67.google.com (mail-wr1-f67.google.com [209.85.221.67])
 by mx.groups.io with SMTP id smtpd.web11.18825.1585332936568434899
 for <tools@linux.kernel.org>;
 Fri, 27 Mar 2020 11:15:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=bvKTakg7;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.67, mailfrom: konstantin@linuxfoundation.org)
Received: by mail-wr1-f67.google.com with SMTP id u10so12551357wro.7
        for <tools@linux.kernel.org>; Fri, 27 Mar 2020 11:15:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=CIOtaG55QL1nRZrxr33sKWcJ6BTtQLQEhs2XR67Lytw=;
        b=bvKTakg7j6LYXyfBIX3NCELvCHnL1Ec2/lJaeL/Pp2mBq3p+lIcU5LzKJd1HCPzQrr
         EvP+JkQuy1Xsp64QjppMuEOy3U65tiR2l/4GdFtaDcGpT1mM+IJmOrSqYC5BXtpzUa6j
         R5ukB7G8mfD/oTgsYUgndVyeelxdFyGmcf0fY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=CIOtaG55QL1nRZrxr33sKWcJ6BTtQLQEhs2XR67Lytw=;
        b=o40nsc2TpLVJw0GXg9ra2hPILKHP3GpuxJoxlug7izbCPjWwbTQ2cGYc6OA7AzDyGE
         JqJpFN1TWxDgUzM2nEyeaK1R1v1RXK//bFUScLhuezXnqhudxVZ4dFX7c7m4NUugmHp+
         PT2QgMwVrYtzEPQNxBJeDE3OYH+yp5tkng9ONzf6+kbUFpPyET7oeA55KolylhSTiDcL
         yNVxtbII2L+HHm6KhOS7X3tRRHIIgapxRms6dUkDlyD1xvvwUUye3E/0uxsx7rkCcm9X
         Dja4WVl1V6+WksAKHUn2y9TZwDLXZm1FdcrNcj6sXY+ehuYnPN+LPn5tvMq6udSfnfrq
         K4eQ==
X-Gm-Message-State: ANhLgQ39Q1cesMIE0Oc2ZizfD2hsMGH/+kAMxLrGtGt22sl4O67MdefA
	4oOSpl8wYu/E93OZ7VoQ6A3Amw==
X-Google-Smtp-Source: ADFU+vuso+c/J9aPQG9VMTwfLMLWSyjMTwV22d0mWg76NVneEMCPZzzDKSPC3l+pEmBw0NQD9FVJfA==
X-Received: by 2002:adf:aac5:: with SMTP id i5mr609089wrc.285.1585332934971;
        Fri, 27 Mar 2020 11:15:34 -0700 (PDT)
Return-Path: <konstantin@linuxfoundation.org>
Received: from chatter.i7.local (tor-exit-13.zbau.f3netze.de. [185.220.100.240])
        by smtp.gmail.com with ESMTPSA id m11sm9222620wmf.9.2020.03.27.11.15.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Mar 2020 11:15:33 -0700 (PDT)
Date: Fri, 27 Mar 2020 14:15:26 -0400
From: "Konstantin Ryabitsev" <konstantin@linuxfoundation.org>
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
Cc: Rob Herring <robh@kernel.org>, users@linux.kernel.org,
	tools@linux.kernel.org
Subject: Re: [kernel.org users] b4 v0.3.4 released
Message-ID: <20200327181526.e46zqg4bne2rplbm@chatter.i7.local>
References: <20200323222041.uzfcexg2wy74jqdd@chatter.i7.local>
 <CAL_JsqLJkDx3HQEN-0ih0Jp4i2h7xKYrsfqAiYcW_hV-9GtLKA@mail.gmail.com>
 <CAL_JsqKBskO3oyEP0g9nTyWL4V614w21Hwigs5YpFpgLnUVktg@mail.gmail.com>
 <15FFE6D3B979AF4C.32445@linux.kernel.org>
 <20200326163225.qkitq6dkmqj2fw5l@chatter.i7.local>
 <CAHmME9oP4epS5UvrrnvLDcSEZAHXgrrGHkbZ7ddryKO56KFosg@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAHmME9oP4epS5UvrrnvLDcSEZAHXgrrGHkbZ7ddryKO56KFosg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

On Thu, Mar 26, 2020 at 02:18:26PM -0600, Jason A. Donenfeld wrote:
> Looks like the auto project detection has issues:

It's not really auto-project detection. We use public-inbox itself to 
look for "any list where this message-id shows up". Currently, it does 
no thread completion matching and there is no way to set preference. I 
hope that we'll be able to implement these features in the future.

For now, I plan to use the following approach:

- when a thread is incomplete, look at other mailing lists where it was 
  sent (in to: and cc:)
- grab https://lore.kernel.org/lists.txt
- try to see if we have archives for any of those other lists
- try to backfill missing messages from other lists

This is not great, but it should hopefully help with this problem until 
public-inbox gains ability to return a thread collected from multiple 
lists (it should be able to do that once cross-list search becomes 
available).

> (Also: lore still calls linux-kernel "lkml" which is a bit confusing.)

I know, and I'll have some mechanism in place so both work soon.

-K
