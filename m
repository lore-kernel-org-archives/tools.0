Received: from mail-qk1-f195.google.com (mail-qk1-f195.google.com [209.85.222.195])
 by mx.groups.io with SMTP id smtpd.web10.12251.1584741705630625058
 for <tools@linux.kernel.org>;
 Fri, 20 Mar 2020 15:01:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=LDWm9hAH;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.222.195, mailfrom: konstantin@linuxfoundation.org)
Received: by mail-qk1-f195.google.com with SMTP id o10so2961725qki.10
        for <tools@linux.kernel.org>; Fri, 20 Mar 2020 15:01:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=fKusGiIbDaXSNmqLC8AR9Qzen2HjrxHd0h9uk7ByDCc=;
        b=LDWm9hAHeuZ3gW/LAK9G41mzMWqhHm6N42mhFd9yUdCbDWoDQFlxX+BkdCjokTHQVF
         4OcxmBEaL8QPd+1jMTn5mdDDhO9uX/KLChsEEt/xZFoKXPdfbYaFseEPT9++Kho4lVak
         97yRuIocwiEG4TADBifhN/Gt0J9nVkJxyVlNU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=fKusGiIbDaXSNmqLC8AR9Qzen2HjrxHd0h9uk7ByDCc=;
        b=PMjBIO0IkhmkPCntxTNsc6P+PBY3X7lR1SBrsrKmV0D5nQN9eFMbyp1fEi6dsfUQh3
         N9x2vSPjX9ZLMH/d8PD3Z0Uctsx4Or4IC+s3bAY+CCnxmsHqhUBRibH3BuHujwrtC49Z
         hlRDWf1kbMGGXx/VB7UgO7xOEZgiyXCMQRmhx/jv3fqvDW8IvwB+3uGfi0dPXjm5gwvW
         FAxcuno41VZzFLaRk771QfKegGZcIwqm0GJtaaRtgv8y2dkgP64OPILB8v/k6nfIn69D
         a8c8qR8jae2HKGoTjGk5UR2i0RzirzCDYtazlwHZdUWXCmnM9FI981WjmXuCdpzy+zA6
         uNtg==
X-Gm-Message-State: ANhLgQ0uG8AEJxW988Fan4kO7LsR5fswD6yFi7MCeD8Dm23osZhIaOV0
	/J3VU3OlZ22C+V9WMhfSvuA43Q==
X-Google-Smtp-Source: ADFU+vtDCewIDLYoCKWuvmhgLNYvwraqbVzuBQgvk/ApLDby65Ha0qeszJLSKTetG7Izksw3Sw+3Ag==
X-Received: by 2002:ae9:c213:: with SMTP id j19mr10020931qkg.443.1584741703859;
        Fri, 20 Mar 2020 15:01:43 -0700 (PDT)
Return-Path: <konstantin@linuxfoundation.org>
Received: from chatter.i7.local (67-211-133-100.wybo.fttp.ntelos.net. [67.211.133.100])
        by smtp.gmail.com with ESMTPSA id t43sm5784114qtc.14.2020.03.20.15.01.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Mar 2020 15:01:43 -0700 (PDT)
Date: Fri, 20 Mar 2020 18:01:38 -0400
From: "Konstantin Ryabitsev" <konstantin@linuxfoundation.org>
To: Johannes Berg <johannes@sipsolutions.net>
Cc: users@linux.kernel.org, tools@linux.kernel.org
Subject: Re: [kernel.org users] B4 and gmail integration features
Message-ID: <20200320220138.axvbfnlmzaajvkwh@chatter.i7.local>
References: <20200320214532.wvmym643l3dw24qh@chatter.i7.local>
 <516a16778778f90f7d2f7d5a7ef392118fc90f28.camel@sipsolutions.net>
MIME-Version: 1.0
In-Reply-To: <516a16778778f90f7d2f7d5a7ef392118fc90f28.camel@sipsolutions.net>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

On Fri, Mar 20, 2020 at 10:49:13PM +0100, Johannes Berg wrote:
> On Fri, 2020-03-20 at 17:45 -0400, Konstantin Ryabitsev wrote:
> > 
> > 3. Optionally, also send a "thanks, applied" templated reply after you 
> >    do "b4 am"
> 
> I've always thought that somehow this ought to be delayed somehow, since
> I may apply a patch just to look at it, or to run tests, etc. and then
> really only make up my mind when I push it out ...

How about we just "remember to thank" and have a separate command "b4 
thank" which will interactively verify patch/series before actually 
sending out the "thanks, applied"?

-K
