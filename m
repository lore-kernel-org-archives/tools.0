Received: from mail-qt1-f176.google.com (mail-qt1-f176.google.com [209.85.160.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0AAC52FB3
	for <tools@linux.kernel.org>; Wed, 26 May 2021 19:58:30 +0000 (UTC)
Received: by mail-qt1-f176.google.com with SMTP id g17so1825007qtk.9
        for <tools@linux.kernel.org>; Wed, 26 May 2021 12:58:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=GihjwV3HqaEJX2VTGFvwe3l0MfKICErh2t0OGhV9mCg=;
        b=Tnf0zbngdP8uRyhhkXPH3RRk+uw9SyGK12zVR1n/HHQ1hyV4ze3zjlT0TQQJ9pVGOF
         RvtlMfGvOj3aw3pF/9Ftyj3Z8oJ+smdQVu/YsFa17gGdSMHrjI9IRelgDyeBhK4k14Lr
         4BaV/l2a5Ak1w1iguppxJtlX72mucm29Zo2rk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=GihjwV3HqaEJX2VTGFvwe3l0MfKICErh2t0OGhV9mCg=;
        b=Hl1HwOR+zZoPhiTOzdv9tNT1XxXRrJJ7EEeFMPCZXblsw4VcaDgRg+wtTuiHdbOPl8
         JGuPZ/eFtMmJ44TtZkhVlu4bOIIv2KLMWFfvo2wQlED5H1psQPxcylc4DoCn07dBuOR1
         HYxvXdUMGelhNcoftN24BdF8hErOA1h7n2IrDdi2jc0Bc3umb5reghWPK846BlmQ2LPH
         Cnc/qe86wtfZ/Z2csRguaeJwZaoDMJB4rm3GkodmSCaU12B1r/WGWEI+PrHRl7jI1Nko
         yK9kFSRcxpXz4RWDKeazsigKlf2YowZbbhVgJLpsIMKoGzhsPO3+Wz3Z9pwTc3AGB8GV
         xceQ==
X-Gm-Message-State: AOAM530zHtiHh5YMsdZwQWpNpVfYm0VMExOgVbCXiRnwgXNFlVG49z+T
	fQ0l0IKiSVkWmiNG1SPrM0zkodVFQ6Mstqbz0n4=
X-Google-Smtp-Source: ABdhPJyW3VcWydvKAlmuJ2GCWkSrECHp4fYHTG2Y3ZrXyX3uOr4twrEKgG/hmbT67SN2/M4Ncklfqw==
X-Received: by 2002:a05:622a:312:: with SMTP id q18mr39239052qtw.188.1622059110027;
        Wed, 26 May 2021 12:58:30 -0700 (PDT)
Received: from nitro.local ([89.36.78.230])
        by smtp.gmail.com with ESMTPSA id y1sm2266571qkp.21.2021.05.26.12.58.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 May 2021 12:58:29 -0700 (PDT)
Date: Wed, 26 May 2021 15:58:28 -0400
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: Jason Gunthorpe <jgg@ziepe.ca>
Cc: tools@linux.kernel.org, users@linux.kernel.org
Subject: Re: b4 v0.7.0 is available
Message-ID: <20210526195828.aquw3q7lwshtjfrc@nitro.local>
References: <20210526192558.pex7tuorwqvkzxe3@nitro.local>
 <20210526194117.GF1096940@ziepe.ca>
 <20210526195642.h4yzvykpopuckffz@nitro.local>
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20210526195642.h4yzvykpopuckffz@nitro.local>

On Wed, May 26, 2021 at 03:56:42PM -0400, Konstantin Ryabitsev wrote:
> The main difficulties with making it part of patchwork proper is mostly due to
> it breaking the end-to-end nature of attestation: if we change patchwork to
> perform the attestation check on the backend, we're back to trusting
> kernel.org infrastructure. That is specifically something we want to get away
> with. :)

From. Get away *from*.

Totally not a Freudian slip.

-K
