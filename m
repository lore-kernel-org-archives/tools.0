Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6788F29CA
	for <tools@linux.kernel.org>; Tue,  5 Oct 2021 13:22:11 +0000 (UTC)
Received: by mail-wr1-f46.google.com with SMTP id t2so13762244wrb.8
        for <tools@linux.kernel.org>; Tue, 05 Oct 2021 06:22:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=0Nq4pjk7vhbGAJRrUdmghqTPrtjjDg4uCReSwZD4fi4=;
        b=sbnu3UfMoH79BrhrvnRiUVHYPQ9dIosHjzvF/E6soqnwhOghK+ceM41mthnu6aPdLm
         /NIB7iSKJVoFdW1+4LkrpCQEaiivpvBniueJA484MQtfy72TtqaJ/HrzP6N8mJBdPbXf
         rTTO1NprCLyHzNdQl2jpTQS4vIjnEdSYaAjRYLu1BCNbw1NWTQ/g5XHdKN9rAKqjFYMi
         2DGt75UPLGAHKqxi8+NiduS48T8ufs7qgt34i/UFjTrj3nvARQR0mIy1fXWXpD15/HUG
         3CuzBR8eNspJTsSQ5GNVxey7vty2H/IqbXPVMKf5kpoaIkRM/yyJEmBAvnOmYqQJfkEd
         M1zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=0Nq4pjk7vhbGAJRrUdmghqTPrtjjDg4uCReSwZD4fi4=;
        b=czOPCrzzQYwGQr4ERfDFz7cUT5Zk12urK6a1PtvkRh+UbJvOP2u+ZOLZwSL+ULbJNC
         15h4yk4QRT+5hLcxr9Jti/CNlNYiuBxHmL7c/UsX9CHsyWHsW3hqcB4Ji9/X2m/X7u/E
         Q3vIQyAu9enfWux87AlGvsSc+JlPPtAR6La364t87kd7tsFmU0XWMah2sRJH25Pxjg4p
         FIBAoo116jGgq7mVbUxWlZ2kszo5fbHF+jkqx2PzhhbUq3D6c7+W7D0AnwdAnCWEMGjh
         3kAmKeA6BbLYgPWmnV5+cwVC6DSsn5wt/ubPG72xnPwo6iVjqZjTj46D0sjb0WwKBEKF
         mlXQ==
X-Gm-Message-State: AOAM531MorhLKHUusHXWQZs3LlNoZLVr/EbqqLD3D0EVN9L0l1A/htLb
	h+Vtb6vbq3l7atKorMIkKBFlQg==
X-Google-Smtp-Source: ABdhPJymNDNgVZLWjDFWED9H970QlHWHyJaWUZPl+LqdwIDEYEjdnrwRsDT3GBjPM4ZSRAmy0ezqrA==
X-Received: by 2002:adf:8b93:: with SMTP id o19mr21425853wra.63.1633440129737;
        Tue, 05 Oct 2021 06:22:09 -0700 (PDT)
Received: from google.com ([95.148.6.175])
        by smtp.gmail.com with ESMTPSA id p18sm6451304wrt.96.2021.10.05.06.22.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Oct 2021 06:22:09 -0700 (PDT)
Date: Tue, 5 Oct 2021 14:22:07 +0100
From: Lee Jones <lee.jones@linaro.org>
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc: Rob Herring <robh@kernel.org>, users@linux.kernel.org,
	tools@linux.kernel.org
Subject: Re: Acked-by missed when applying
Message-ID: <YVxRf64H7CYGCkJ9@google.com>
References: <CAF2Aj3icJtU+wacosM-LO2aqMChWL69T6bf7dK3xqPMSk6Ux3w@mail.gmail.com>
 <CAL_JsqKdfMBfrFgu6bmj1HLhwwNFAErj-_dMSizX+dZ0h_B47g@mail.gmail.com>
 <20211005124536.ynz4ps5etrppfqxi@meerkat.local>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20211005124536.ynz4ps5etrppfqxi@meerkat.local>

On Tue, 05 Oct 2021, Konstantin Ryabitsev wrote:

> On Tue, Oct 05, 2021 at 07:22:00AM -0500, Rob Herring wrote:
> > On Tue, Oct 5, 2021 at 3:02 AM Lee Jones <lee.jones@linaro.org> wrote:
> > >
> > > Good morning Konstantin,
> > >
> > > Can you think of a reason why `b4` missed Greg's Ack here?
> > 
> > Because you applied the first v2 patch, not the second v2 threaded to
> > the 1st one that Greg acked.
> 
> Should we issue a warning in such cases? E.g:
> 
> WARNING: Identically numbered patches found, will use the latest by date.
>          Download and edit the mailbox manually for any other outcome.

Definitely.  Thanks.

-- 
Lee Jones [李琼斯]
Senior Technical Lead - Developer Services
Linaro.org │ Open source software for Arm SoCs
Follow Linaro: Facebook | Twitter | Blog
