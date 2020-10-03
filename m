Received: from mail-qk1-f182.google.com (mail-qk1-f182.google.com [209.85.222.182])
 by mx.groups.io with SMTP id smtpd.web11.1784.1601687836073505708
 for <tools@linux.kernel.org>;
 Fri, 02 Oct 2020 18:17:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=ZXky4eKh;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.222.182, mailfrom: konstantin@linuxfoundation.org)
Received: by mail-qk1-f182.google.com with SMTP id d20so4976709qka.5
        for <tools@linux.kernel.org>; Fri, 02 Oct 2020 18:17:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=yC8RXR1pakcQkcba/S5lUmXPrKt/J2Cck2xOCAzZTuw=;
        b=ZXky4eKh5aJoC9sssgZ0UVXsNRQImT8k69eFj8Qz6R6YgJ0kwu17FGnuCy0d1w7BuF
         cxLIi2XWNxYZPhIiNMuxXdB+fstNt//e7dG2cPXMJZVnb2pSlfVZGwSkCjVK2ROY03Jc
         OCGwVHZGhnXlunZNg6kMRnecWpeCTPaljr1sA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=yC8RXR1pakcQkcba/S5lUmXPrKt/J2Cck2xOCAzZTuw=;
        b=i8Rxlk1JuCzypW0KTCKLixs6c1gX3X06dYU0FaBwixMr+uHSwlsprNavIjELPLwLjL
         iiHz2iYwfy+f0WA9ASE5RX+WkaYfyzL7Vdby78Xux9LVWY9mfC1UJwicLqK8DBIfYS0s
         jDB5PeBHlJ+BDd7FxaZ9IIlU0w4oG78oSolupmWYe8W9E6dAAo9pqv7WbvmTmDMyaIpK
         Y62Nwad/kZYFc2Nlwr4WrqJuT3Y1/ldlJDg7ViaPusJb/aoli3cMjmbYP+9/Kwja4VE8
         w7/fLURqN/v1EskRSP1QtlN+StVaNidti+GGaxFShLcRgD6//Rvt56jcpmbLAMfHBC8D
         RMqg==
X-Gm-Message-State: AOAM533S6UF+Y3GP034DAGV3nnA/qrvM0KdGqaclIjmC+T/Vau/773qY
	kWe+WRQEoACeRmJueRWP+AcXEA==
X-Google-Smtp-Source: ABdhPJylQAorFSwePCDdEq88ktGFIKReg5P+07wTqItE9XzTIHf2FTLeML4FEfwWg82jM7GlGn5h4A==
X-Received: by 2002:a05:620a:45:: with SMTP id t5mr4854677qkt.41.1601687835154;
        Fri, 02 Oct 2020 18:17:15 -0700 (PDT)
Return-Path: <konstantin@linuxfoundation.org>
Received: from chatter.i7.local ([89.36.78.230])
        by smtp.gmail.com with ESMTPSA id 15sm2334491qka.96.2020.10.02.18.17.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Oct 2020 18:17:14 -0700 (PDT)
Date: Fri, 2 Oct 2020 21:17:12 -0400
From: "Konstantin Ryabitsev" <konstantin@linuxfoundation.org>
To: Mark Brown <broonie@kernel.org>
Cc: tools@linux.kernel.org
Subject: Re: Exception from b4 ty
Message-ID: <20201003011712.vwigxq5pqp4d3gid@chatter.i7.local>
References: <20201002211248.GI5527@sirena.org.uk>
MIME-Version: 1.0
In-Reply-To: <20201002211248.GI5527@sirena.org.uk>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

On Fri, Oct 02, 2020 at 10:12:48PM +0100, Mark Brown wrote:
> Hi,
> 
> Attempting to generate thanks with b4 ty -a using current git master I
> get a traceback:
> 

This is due to the earlier fix to set proper charsets. I need to 
remember not to rely on Python's as_bytes() mechanism -- we get much 
better control when we do as_string() and then do the encoding on our 
own.

The latest master/stable-0.5.y has the fix for this, I hope -- plus for 
the horrible header encoding.

-K
