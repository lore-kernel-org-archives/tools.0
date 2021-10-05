Received: from mail-qk1-f182.google.com (mail-qk1-f182.google.com [209.85.222.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB32A3FFB
	for <tools@linux.kernel.org>; Tue,  5 Oct 2021 12:53:30 +0000 (UTC)
Received: by mail-qk1-f182.google.com with SMTP id x12so2366439qkf.9
        for <tools@linux.kernel.org>; Tue, 05 Oct 2021 05:53:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=Je2G4ojRNzWlj1XN8zUMgdVFvSF7NB/M0qZD7yYk1FY=;
        b=QEzWpMwWAQiLSFYU1VK5w2+L1q5iceZ5TvkHsS/nwUkXTEBMjW/ThueMblmcZqcZi9
         necA7APwgjxJzDGjbxm5LNO2x+rIMF0c3uPEN+dZJF+Gyto1MznJA51Wf266fLFxJ/FP
         VNVBNdcTWAkqiGGYc1ueKYDq71TpHcu+r6u9w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=Je2G4ojRNzWlj1XN8zUMgdVFvSF7NB/M0qZD7yYk1FY=;
        b=5PNTYHemEC5PBWgE2b5hIga+krD+w0tIrbJ2aeBweOmYijmnFPL9N2v2Hc824wKHG4
         wEnjo2TXDW71wm5aPXfDgHsstDEGX61bev7Jx2f8uWRLBD2l73NrBBOgcai2YubzBBKQ
         jLEMItuBMzCDSNXddrvOCl3ANpelmFPyxzQ9rfrQ5FWMCkUI7RNItKD6LOhOnzU8+bSl
         UCpefK0ZyKXcPv6lh/WjZhCEuJ5JwLrHjYgsXdzfdLIPAO88VFw/sNcV04npTGerzSnS
         0in7Ge2veHeNsb55o/fZ43npVlWwOIuCHNtvAPgumWCHXD963D7yXUS37369ZP03v+FH
         N5Fg==
X-Gm-Message-State: AOAM531wzVJTn/EVYFWYTnitnoIaBWb7J0frWTNBUqhomEZW/XBzQRGV
	zLC++cD5ev14V/6h5CIVp89qv0cRWHS9UQ==
X-Google-Smtp-Source: ABdhPJxspxVe7MVSIjPFofAkeZbPkq9n8ybriqT5AuSIbsY5ElHdcZwFuAadEp4D0TDUxOTMyHOarw==
X-Received: by 2002:a37:444d:: with SMTP id r74mr14353526qka.405.1633438409745;
        Tue, 05 Oct 2021 05:53:29 -0700 (PDT)
Received: from meerkat.local (bras-base-mtrlpq5031w-grc-32-216-209-220-181.dsl.bell.ca. [216.209.220.181])
        by smtp.gmail.com with ESMTPSA id h27sm1801519qtu.11.2021.10.05.05.53.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Oct 2021 05:53:29 -0700 (PDT)
Date: Tue, 5 Oct 2021 08:53:28 -0400
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: Lee Jones <lee.jones@linaro.org>
Cc: Rob Herring <robh@kernel.org>, users@linux.kernel.org,
	tools@linux.kernel.org
Subject: Re: Acked-by missed when applying
Message-ID: <20211005125328.najo7q5f7pwxdrfy@meerkat.local>
References: <CAF2Aj3icJtU+wacosM-LO2aqMChWL69T6bf7dK3xqPMSk6Ux3w@mail.gmail.com>
 <CAL_JsqKdfMBfrFgu6bmj1HLhwwNFAErj-_dMSizX+dZ0h_B47g@mail.gmail.com>
 <YVxJhOU239wRw+no@google.com>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <YVxJhOU239wRw+no@google.com>

On Tue, Oct 05, 2021 at 01:48:04PM +0100, Lee Jones wrote:
> > > Can you think of a reason why `b4` missed Greg's Ack here?
> > 
> > Because you applied the first v2 patch, not the second v2 threaded to
> > the 1st one that Greg acked.
> 
> Not sure I understand.
> 
> This is the thread of the patch I merged:
> 
> https://i.imgur.com/k4hD9kO.png
> 
> Greg's Ack is located in the 5th message down.

If you look at the thread overview, you'll notice that there are two messages
with identical subjects, sent 3 weeks apart:

2021-09-02 12:47 [PATCH v2] mfd: hi6421-spmi-pmic: cleanup drvdata

and

2021-09-28  6:58 [PATCH v2] mfd: hi6421-spmi-pmic: cleanup drvdata

As far as b4 is treating things internally, the second v2 (from Sep 28)
starts a new thread, so any trailers sent to the Sep-02 version will not
apply to the Sep-29 version and vice versa.

-K
