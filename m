Received: from mail-qt1-f194.google.com (mail-qt1-f194.google.com [209.85.160.194])
 by mx.groups.io with SMTP id smtpd.web11.60.1589404378764861760
 for <tools@linux.kernel.org>;
 Wed, 13 May 2020 14:12:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=fWN9MduQ;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.160.194, mailfrom: konstantin@linuxfoundation.org)
Received: by mail-qt1-f194.google.com with SMTP id o19so1089478qtr.10
        for <tools@linux.kernel.org>; Wed, 13 May 2020 14:12:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=yE6S/RCp3TwFEo3tdfR8E3OnLVpUEsuT5Cnmz+KCKi8=;
        b=fWN9MduQcIqVGESa9A/MRhjjoI7MfledzN1Z2d2zO4cKvReDT1exqlUbFZt5Sm0OBE
         O0K/kJQFYoyTEm7Bomh0zbAgXdm34IuVOoh9J+heCjSGNgp+9r+A4mIQ2VHXtmt3fRwn
         4etH78AO2ltW+63Y1yNsZb0JWNgVQeiliCdoE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=yE6S/RCp3TwFEo3tdfR8E3OnLVpUEsuT5Cnmz+KCKi8=;
        b=hegEG6PHLBDIO2H0mU+PA7W0+PfDkOq5vD0Ijx7T52aPSyHKp0R8mFTWkX2abvyqX2
         AONb4r1Ksirhqn12r45MIliUlOIg45rDs/S7Uo1pb3idm/+Ie6yN5btx7nFPS4Y43754
         vBwN/rnYITueDG2yrezkHMIsUVZPEuIbhppf+9kc+oyRCA4g3GXCRcp6xDt5ueWQe+/a
         Ljqut5Wv5sSDP8HZjT0/W8zdoVCMQP6rQMfy8Xt1HU+Ac9GrzTEGjxTqSdz2Jvh8pdjz
         dzgH2aSkI7flbZ0+aLaF4v5rm9r2+HFzGl7k2Tsa5m2kUsXSyIvtdr8E9cWCxrJHU87D
         BTGA==
X-Gm-Message-State: AOAM531UsDvBIJIQkT4P5Jd1a2nCahdpexEE03YkDg4nqW1B/1Rac8KY
	5kIpZOyhCjH8PGTVYfTRrFFqag==
X-Google-Smtp-Source: ABdhPJw977ufZ+mGVVnZZgEUmmNDhLfWtp1pcPURbUJxR6uZfUmOig/rcaxgCG6W3vEHAWm/nfxu8w==
X-Received: by 2002:ac8:44a8:: with SMTP id a8mr1134165qto.1.1589404377851;
        Wed, 13 May 2020 14:12:57 -0700 (PDT)
Return-Path: <konstantin@linuxfoundation.org>
Received: from i7.mricon.com (107-179-243-71.cpe.teksavvy.com. [107.179.243.71])
        by smtp.gmail.com with ESMTPSA id i24sm730753qtm.85.2020.05.13.14.12.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 May 2020 14:12:57 -0700 (PDT)
Received: by i7.mricon.com (sSMTP sendmail emulation); Wed, 13 May 2020 17:12:55 -0400
Date: Wed, 13 May 2020 17:12:55 -0400
From: "Konstantin Ryabitsev" <konstantin@linuxfoundation.org>
To: Bjorn Helgaas <helgaas@kernel.org>
Cc: tools@linux.kernel.org
Subject: Re: b4 am issue
Message-ID: <20200513211255.6o6tycjedbzuojvu@chatter.i7.local>
References: <20200513180155.GA332206@bjorn-Precision-5520>
MIME-Version: 1.0
In-Reply-To: <20200513180155.GA332206@bjorn-Precision-5520>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

On Wed, May 13, 2020 at 01:01:55PM -0500, Bjorn Helgaas wrote:
> Hi Konstantin,
> 
> $ b4 --version
> 0.4.2
> 
> $ b4 am -om/ https://lore.kernel.org/r/f4bbacd3af453285271c8fc733652969e11b84f8.1588821160.git.sathyanarayanan.kuppuswamy@linux.intel.com

Thanks for the report -- I committed a fix to master and stable-0.4.y.

I've started running b4 in a loop on stuff in lkml, so hopefully I'll be 
finding more corner-cases that I'm still missing.

Best,
-K
