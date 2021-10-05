Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EC673FFB
	for <tools@linux.kernel.org>; Tue,  5 Oct 2021 13:12:13 +0000 (UTC)
Received: by mail-wr1-f53.google.com with SMTP id o20so19224993wro.3
        for <tools@linux.kernel.org>; Tue, 05 Oct 2021 06:12:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=w1dofEzJvkOhzpapC6mcakmAes60ZjF/rehDtVHZPrs=;
        b=B4b11+X20TErx+A0snoqITunqtoOYzzeTeQQOASPCL72EEoH4xBxhrsLlnTZfQzAlv
         Hdz0gssyIryTWUpRSsEXiFoVPkOgPi904a0Wpuk+zqURtYu+fbF1Ny1r0ksUEfHZWQWD
         CysPzwu91POCullnR1MfGx1Rr955MPx1qBpfQJfV8rWPKu2cI+45Nc10ukzkoF4liLmA
         Og8rcHm4VOheyhHy2Vf/k6MATc4ID27F8Vf6rNRvu8TYkOStFCqWN2A+UtE8erqo1yNM
         emGXwDLvNCA9US99fY8ayoIqzFG8SI1IVCVlmWo/H982S6B8IOYpnH7FYPJJQ0BczAhl
         fBsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=w1dofEzJvkOhzpapC6mcakmAes60ZjF/rehDtVHZPrs=;
        b=bOeACNnf7kPEhaeM1HzPS0YNfR6PCZU06C6llBmJTXxmc7k+Fc8eTGkcls38906H+v
         Q7LBTrBB8xyX4PiFsOd9oF/Okxd/dh3oCAkcflhAdjjp5q9Z7HueIgr+xTBsEkySaE2x
         uYWig6NWbTffGCXA2BrK2WQVB1IPqDza1rt7owkJRWKOpMMDicitRpy0flsYj/LZ7nzr
         r4JJCGGNSNElsSvt+runBa0nnt8AoUlqNxqICctw10xmZ0KAn2MLNR4SgYfjbYqdMDTQ
         y3YPbq8AsvlbsPgiAp8atD+LhnLRw2JnplIw1yB/3zEFq6xQx1Km39GxmnqVP0rll5Ht
         2Ymw==
X-Gm-Message-State: AOAM533dC47obetRh/0nnX7FQL9xiEYW4MdcuhF6nEUYE1TzSQz8zo1E
	qndebgsT/XJzRzzXjH6jUalrSg==
X-Google-Smtp-Source: ABdhPJyzePiiOSGN/C/1RnYjBtxQoR0ZJT+cyo81oAfGXuYeP7vKUIi3tnrgTP3Yx1lWVIHc5ksRow==
X-Received: by 2002:a5d:6084:: with SMTP id w4mr18277942wrt.176.1633439531350;
        Tue, 05 Oct 2021 06:12:11 -0700 (PDT)
Received: from google.com ([95.148.6.175])
        by smtp.gmail.com with ESMTPSA id j4sm17962257wrt.67.2021.10.05.06.12.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Oct 2021 06:12:10 -0700 (PDT)
Date: Tue, 5 Oct 2021 14:12:09 +0100
From: Lee Jones <lee.jones@linaro.org>
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc: Rob Herring <robh@kernel.org>, users@linux.kernel.org,
	tools@linux.kernel.org
Subject: Re: Acked-by missed when applying
Message-ID: <YVxPKVm0K5ctruEg@google.com>
References: <CAF2Aj3icJtU+wacosM-LO2aqMChWL69T6bf7dK3xqPMSk6Ux3w@mail.gmail.com>
 <CAL_JsqKdfMBfrFgu6bmj1HLhwwNFAErj-_dMSizX+dZ0h_B47g@mail.gmail.com>
 <YVxJhOU239wRw+no@google.com>
 <20211005125328.najo7q5f7pwxdrfy@meerkat.local>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20211005125328.najo7q5f7pwxdrfy@meerkat.local>

On Tue, 05 Oct 2021, Konstantin Ryabitsev wrote:

> On Tue, Oct 05, 2021 at 01:48:04PM +0100, Lee Jones wrote:
> > > > Can you think of a reason why `b4` missed Greg's Ack here?
> > > 
> > > Because you applied the first v2 patch, not the second v2 threaded to
> > > the 1st one that Greg acked.
> > 
> > Not sure I understand.
> > 
> > This is the thread of the patch I merged:
> > 
> > https://i.imgur.com/k4hD9kO.png
> > 
> > Greg's Ack is located in the 5th message down.
> 
> If you look at the thread overview, you'll notice that there are two messages
> with identical subjects, sent 3 weeks apart:
> 
> 2021-09-02 12:47 [PATCH v2] mfd: hi6421-spmi-pmic: cleanup drvdata
> 
> and
> 
> 2021-09-28  6:58 [PATCH v2] mfd: hi6421-spmi-pmic: cleanup drvdata
> 
> As far as b4 is treating things internally, the second v2 (from Sep 28)
> starts a new thread, so any trailers sent to the Sep-02 version will not
> apply to the Sep-29 version and vice versa.

Oh I see.

That's not obvious from Mutt or LORE:

  https://i.imgur.com/vFNfGYw.png

Thanks Rob, Konstantin for the explanation.

-- 
Lee Jones [李琼斯]
Senior Technical Lead - Developer Services
Linaro.org │ Open source software for Arm SoCs
Follow Linaro: Facebook | Twitter | Blog
