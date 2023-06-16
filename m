Received: from mail-qk1-f175.google.com (mail-qk1-f175.google.com [209.85.222.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28F2B13AC6
	for <tools@linux.kernel.org>; Fri, 16 Jun 2023 16:57:01 +0000 (UTC)
Received: by mail-qk1-f175.google.com with SMTP id af79cd13be357-7622a5f0998so89413585a.0
        for <tools@linux.kernel.org>; Fri, 16 Jun 2023 09:57:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1686934620; x=1689526620;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=1kGMSJfP+JZX2EgBLYoCaPoihD/58E1lmiNjLJP7bUs=;
        b=CCQCK+KDMF5BDLkz5xNj21XkjZWihMUBzJMcf+PakgD1r1WUFRXgw2sKElUXt2jXUp
         shDrFCd9HfS9tgaLHRMtCFeb2Ow7cL/3ivTcBpTZZjJ47bLeeUcJrlx6IzDgbykU4wtB
         OB1dCeXZuTpmwMozbrUM03xDDBI8BMfbmGlSQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686934620; x=1689526620;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1kGMSJfP+JZX2EgBLYoCaPoihD/58E1lmiNjLJP7bUs=;
        b=BiHtlkqFTascn349Xl2TW3MTwVGG/fUZZC7AiYEOkSpUxSE03jbIVaOoZXoLLQrnFJ
         0AJMjjt/eOw1nmdRapNMtQi88tmReL8jTijRXI9nUbgpbfbW21tOfx1RYYQ8QaEZMiPP
         18SqRKEVNgELwegBjbBYKelqKTsMdvxlgsnyHbYu6o/VUMWFCBha4H3IUTfpwmRTjk1n
         +XK0ySV7Y+/h+az6G8XLkvMzYY5lx/R2f3fnnOhu6daNSiTVRot/wb1SsBCNt4wtT46V
         1u1e+4n/HcYECC5GHIEt6411rOjaRKDSDA+RkslXvQYtii2DiPCTwO47y9U7ivb6GkCj
         Hy3w==
X-Gm-Message-State: AC+VfDw6uYRYXxuijWZQ7DxzDkadjvwwr+40wjuFkISosjd6gk4g5UoN
	TcV8yh8GPk+/DZLVuzKdnRURWg==
X-Google-Smtp-Source: ACHHUZ5jXkw1otOjU7RksbeAuWYo4ucB5RAbCsXZTOYs1FxtL0dYkcxt5B1tnVnOXE5RXgoFDexu9g==
X-Received: by 2002:a05:620a:2b82:b0:75e:d260:cdca with SMTP id dz2-20020a05620a2b8200b0075ed260cdcamr2474691qkb.41.1686934620695;
        Fri, 16 Jun 2023 09:57:00 -0700 (PDT)
Received: from nitro.local ([204.48.95.97])
        by smtp.gmail.com with ESMTPSA id i1-20020a05620a150100b007620b79eccesm2564949qkk.2.2023.06.16.09.56.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Jun 2023 09:57:00 -0700 (PDT)
Date: Fri, 16 Jun 2023 12:56:58 -0400
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: Ashok Raj <ashok.raj@intel.com>
Cc: tools@linux.kernel.org, Vishal Verma <vishal.l.verma@intel.com>
Subject: Re: br prep for fist time, but always shows a different branch as
 base?
Message-ID: <20230616-pepper-root-rub-c211f6@meerkat>
References: <ZIwBJr6g2amew28Q@a4bf019067fa.jf.intel.com>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <ZIwBJr6g2amew28Q@a4bf019067fa.jf.intel.com>

On Thu, Jun 15, 2023 at 11:28:54PM -0700, Ashok Raj wrote:
> Hi Konstatin,
> 
> I'm using the latest b4 from git. I aliased b4 to point to that version.
> 
> tried to create a new branch with v6.4-rc6 as base as below. But the
> tracking shows another branch in my tree, but that's not my base branch.

Unless you have changed your cover letter strategy (and most people don't),
it's safe to ignore whatever it says as "base-branch" in the tracking json. I
will probably add a check to automatically remove that, since it's just a
source of confusion for most people and serves no purpose in the default
configuration.

-K
