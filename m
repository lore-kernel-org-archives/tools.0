Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22D696D38
	for <tools@linux.kernel.org>; Tue,  5 Oct 2021 13:50:44 +0000 (UTC)
Received: by mail-wr1-f48.google.com with SMTP id k7so37313128wrd.13
        for <tools@linux.kernel.org>; Tue, 05 Oct 2021 06:50:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=AVeRmzpXCHMWPMXhChZz/3lUJWRFf6iJxZa2xpL+PLU=;
        b=W3UNa7A+/QwRKxegLc/eR1wdEHWzlCIz5CSpj7mRRsO2m7YeGOYsn8g+brzVTa58HW
         vitBmGKosHz6aYneaNzAX1n3ksZx+P3c8ffnYopnYibkd8jAFZ163KCD8Ox5HnT6gWBQ
         kyeaMHxSdTFryNyWFCT4NzrusAq2IcgxSwJwp00v7qvJdF7dTsTQCc3gug5yHvnWPoW0
         UBbGLnPGDsn2OAW0GLFcxEJq8HBx4Vo36qrxUIH5wqhUmQMocsUwjNQhWUwTtumRKcoE
         kp6+vymxtUQhhK9+jL+d8kauaoZNNhLNYQeTbLIhNizw88IN6ROXuUb6bR1hNJfdbYji
         t9OA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=AVeRmzpXCHMWPMXhChZz/3lUJWRFf6iJxZa2xpL+PLU=;
        b=mDntLLMFLi8MbHRS/1spye7cggtHTsJ2qyg0EYhPCrVHsoipQGRdnHsQc3F/ogRQX1
         fPcp06/9+CPrV3nz/dfUlnUS0YPSpKVK3tyMHPIUM7iKnWN0YoL9az0zG8oR8H3BRwhU
         lWeCOCFoMeMgyALkFQtRqMCXuldiKXvTQQIrAVJrQb4IrUs+WdPRAPLX5vPrfJAyvDJs
         ndVpYO2mOeiDDEK76jXKanON6Buck3Bduz6UNm6H3hVNODZwsobQGsQdgaEXJjnZv5bX
         HPO+msgkmiKqeLeDHLN02iWidH4qpAQ7J/A46XcnllR9o/uj97z8yArLPlZy+gcl1bpg
         b1KA==
X-Gm-Message-State: AOAM530ShkfU0st3lpA9qlws7t1H9qtu2hmLMW8h/HdUMEEAOf8eTBjt
	j1jFo2OCFfrSDaHYe5HOzry3DA==
X-Google-Smtp-Source: ABdhPJwwwGMETbv9RvowMuADg7Kvw0WfsZwuhoxMUuDHJjM/O83OXOcs5NbMl0jofLs3awnFU5cHRQ==
X-Received: by 2002:adf:8b84:: with SMTP id o4mr17734507wra.108.1633441842291;
        Tue, 05 Oct 2021 06:50:42 -0700 (PDT)
Received: from google.com ([95.148.6.175])
        by smtp.gmail.com with ESMTPSA id g1sm2697456wmk.2.2021.10.05.06.50.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Oct 2021 06:50:41 -0700 (PDT)
Date: Tue, 5 Oct 2021 14:50:40 +0100
From: Lee Jones <lee.jones@linaro.org>
To: Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Konstantin Ryabitsev <konstantin@linuxfoundation.org>,
	Rob Herring <robh@kernel.org>, users@linux.kernel.org,
	tools@linux.kernel.org
Subject: Re: Acked-by missed when applying
Message-ID: <YVxYMAjIbEEUKs3I@google.com>
References: <CAF2Aj3icJtU+wacosM-LO2aqMChWL69T6bf7dK3xqPMSk6Ux3w@mail.gmail.com>
 <CAL_JsqKdfMBfrFgu6bmj1HLhwwNFAErj-_dMSizX+dZ0h_B47g@mail.gmail.com>
 <YVxJhOU239wRw+no@google.com>
 <20211005125328.najo7q5f7pwxdrfy@meerkat.local>
 <20211005153735.7a50b3c6@coco.lan>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20211005153735.7a50b3c6@coco.lan>

On Tue, 05 Oct 2021, Mauro Carvalho Chehab wrote:

> Em Tue, 5 Oct 2021 08:53:28 -0400
> Konstantin Ryabitsev <konstantin@linuxfoundation.org> escreveu:
> 
> > On Tue, Oct 05, 2021 at 01:48:04PM +0100, Lee Jones wrote:
> > > > > Can you think of a reason why `b4` missed Greg's Ack here?  
> > > > 
> > > > Because you applied the first v2 patch, not the second v2 threaded to
> > > > the 1st one that Greg acked.  
> > > 
> > > Not sure I understand.
> > > 
> > > This is the thread of the patch I merged:
> > > 
> > > https://i.imgur.com/k4hD9kO.png
> > > 
> > > Greg's Ack is located in the 5th message down.  
> > 
> > If you look at the thread overview, you'll notice that there are two messages
> > with identical subjects, sent 3 weeks apart:
> > 
> > 2021-09-02 12:47 [PATCH v2] mfd: hi6421-spmi-pmic: cleanup drvdata
> > 
> > and
> > 
> > 2021-09-28  6:58 [PATCH v2] mfd: hi6421-spmi-pmic: cleanup drvdata
> > 
> > As far as b4 is treating things internally, the second v2 (from Sep 28)
> > starts a new thread, so any trailers sent to the Sep-02 version will not
> > apply to the Sep-29 version and vice versa.
> 
> The patch is actually identical (and I guess it is also identical
> to version 1). I ended forgetting that I had already submitted it during
> the merge window. So, I ended forgetting to either increase its version
> number or to add a RESEND to it.
> 
> Sorry for the mess.

If it wasn't you, it would have been someone else.

Thanks for highlighting issue.

Hopefully it can be resolved trivially.

-- 
Lee Jones [李琼斯]
Senior Technical Lead - Developer Services
Linaro.org │ Open source software for Arm SoCs
Follow Linaro: Facebook | Twitter | Blog
