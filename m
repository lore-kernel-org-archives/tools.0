Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
 by mx.groups.io with SMTP id smtpd.web10.4127.1584669900206160640
 for <tools@linux.kernel.org>;
 Thu, 19 Mar 2020 19:05:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=L4LOj80f;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.48, mailfrom: konstantin@linuxfoundation.org)
Received: by mail-wr1-f48.google.com with SMTP id b2so5632439wrj.10
        for <tools@linux.kernel.org>; Thu, 19 Mar 2020 19:04:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=6USm+syvoO9pCCA/eJfB16+aF9E1p1JNOnwhDgX6C54=;
        b=L4LOj80ftaMC7UmhWES03qYhq1YE3uQtYEnYDurtFt8/ns6aP4fIe7zAbfFAldtrXO
         8x24+SUSLq7mYVas37543cQ8PuAnWz37br8L81eJiTY8Kd2jyEi0ce1yZeIzUBWMkpUz
         whrdoUsxsK7MEI7zEj1XyeQEd/Mlv0SUpgbgA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=6USm+syvoO9pCCA/eJfB16+aF9E1p1JNOnwhDgX6C54=;
        b=Ke4HFww8jP8vYWBd16ld0wFcIWibrCMCNyorw2W2XuulSsZom4+R9Co77nNSISFxmx
         rH9IJSSvO170BwVHq6g14Sm17vQmjOJFAcN+6PkbgCmr/4wveLUFuT5x16vvdZNUExgE
         BNskK67IojzRLDlJQsoUx2aVFUHmjZiR3A+UT8nusiY0tyYNPCCPUvn2muRP+DtavwZw
         V3FUE9MRzHnvGloKRO73kNB3DrLX0yMnA7DuseMEBiQynyttZZbYmYOknfU2JxFGBPQS
         OUUaGKY5J3oRYJt77PgslhMFh413huB/kh/s1bipSrwdFzag6ECXPLS7c8l6lKIsD2U6
         VYOQ==
X-Gm-Message-State: ANhLgQ2UnGi0lALH0O9A0ryFmTb94pempxqPmykJ9a1RaNTi8AstC5le
	UUfiWcXR8PyXkR1LROhIayTjqw==
X-Google-Smtp-Source: ADFU+vsIAemjBCIRRzxYe5Oe1Rmz9/HJkhPjb321sKw8gQR4ydtoDWb7W7BdI/zsyX7TD3QOTc60jw==
X-Received: by 2002:a5d:6a4b:: with SMTP id t11mr7736982wrw.52.1584669898621;
        Thu, 19 Mar 2020 19:04:58 -0700 (PDT)
Return-Path: <konstantin@linuxfoundation.org>
Received: from chatter.i7.local (tor-exit-3.zbau.f3netze.de. [185.220.100.254])
        by smtp.gmail.com with ESMTPSA id x206sm5710395wmg.17.2020.03.19.19.04.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Mar 2020 19:04:57 -0700 (PDT)
Date: Thu, 19 Mar 2020 22:04:54 -0400
From: "Konstantin Ryabitsev" <konstantin@linuxfoundation.org>
To: Geoff Levand <geoff@infradead.org>
Cc: tools@linux.kernel.org
Subject: Re: b4: string index out of range
Message-ID: <20200320020454.i5ahey34x3qb2kin@chatter.i7.local>
References: <c7640104-264e-26e9-e1f1-1795dd8c428d@infradead.org>
MIME-Version: 1.0
In-Reply-To: <c7640104-264e-26e9-e1f1-1795dd8c428d@infradead.org>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

On Thu, Mar 19, 2020 at 04:18:48PM -0700, Geoff Levand wrote:
> Hi Konstantin,
> 
> Just FYI, I got this 'string index out of range' error when
> running the latest b4 with the 'am' sub-command. The 'mbox'
> sub-command seems to be ok'ish, but when I look inside the
> .mbx-thread file it seems some patches are missing.

The backtrace is fixed in the latest master and was really a bug. If you 
like, you can run b4 straight out of the git checkout if you check the 
README.rst for instructions on how to do that.

Unfortunately, the patches do seem to be missing. The good news is that 
only one of them is missing from the LKML list, but the bad news is that 
it's missing from all archives I checked (lkml.org, lkml.iu.edu, etc).  
If you have a local copy of patch 12/15, you can do:

b4 mbox -n out.mbx 20200318204302.693307984@linutronix.de -p lkml
cat patch12.msg >> out.mbx-thread
b4 am 20200318204302.693307984@linutronix.de -m out.mbx-thread

Hope this helps.

Best,
-K
