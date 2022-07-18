Received: from mail-qt1-f169.google.com (mail-qt1-f169.google.com [209.85.160.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F55833CC
	for <tools@linux.kernel.org>; Mon, 18 Jul 2022 18:17:34 +0000 (UTC)
Received: by mail-qt1-f169.google.com with SMTP id e5so9381031qts.1
        for <tools@linux.kernel.org>; Mon, 18 Jul 2022 11:17:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=0fcaNf1DVwLAa1+CioM5nmifldMFVmTJsYtqY6kKPk4=;
        b=mPVrZ29k1g8YZcdwjgmlohSeoBEEUPfSXmtQbhwzbJRgsJtGuE+XW05HvHCAbBmjDZ
         LwvydB8raoHInpc0p/oRt3QIPwTTm4ngjaUaBBwOUxi92o1UuTsasva+7BzIQToiT6rQ
         R9VQrjaC6ZYgqlrW1uvC9Eut5R+3q8hL5fAIqgaP0PsUs6O5koYrME2haUW7gthgFpfR
         AkjDfQYWdHxiQUgy4XZ7wDKDRr3xzOM9GZlpS+/jrpSMu4iV67WNP5U82MDGXYawVZHo
         pmcVAkErzoL0VLsSIdBqDBlws9rNnmaKvTmhC/BnCOyB+qilArruylm90W+uHRrsq4Gt
         iN9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=0fcaNf1DVwLAa1+CioM5nmifldMFVmTJsYtqY6kKPk4=;
        b=H+mZGf1wVuLL8wQQ75ICrmiTCtPayqRF/AlzyNxvOdrQhZwpp3TzFmSBWIlCfrQEG6
         3h0dTIUHt3cf0qzuKVBP3RL1mJoP1pRo9i456Kcfqtp0e1RWp3xSo2C8ZhQmlQEYuJp4
         DLXdceOBCvgpe99g8ZxmuB/NjX/vnKMN9lcc5UB75jC1JsObZ5UpprSK4UfPqu/rv1Ko
         dPvcBSa3XtpG9NQpYBd20Ee+viAKsNuoShJVdijygC+kpupEmpdiG80K6vWt+Qo+Cnwh
         3bysDkHY3yNgIq89vheBZNJj8oGA+OeEItgGUjT6Gb45YNhPg0reW27wQymmixUBKM0+
         7RVQ==
X-Gm-Message-State: AJIora9so1D+tPTe4ouhVLtDqNiDO5Pzb2/DrxtRkGyASkmyihl0qsjp
	WKWn6d62+kuZzLhcGeMTN4DEyQ==
X-Google-Smtp-Source: AGRyM1vRwlowZO8y8u2b5kQ7kWOcnWRAOfW26KFyCKGdHPSx2ZBDYalN9WyOn2i2vN193L1Rc7YvPA==
X-Received: by 2002:a05:622a:50d:b0:31e:ea35:8ab5 with SMTP id l13-20020a05622a050d00b0031eea358ab5mr7042852qtx.427.1658168253499;
        Mon, 18 Jul 2022 11:17:33 -0700 (PDT)
Received: from ziepe.ca (hlfxns017vw-142-162-113-129.dhcp-dynamic.fibreop.ns.bellaliant.net. [142.162.113.129])
        by smtp.gmail.com with ESMTPSA id j11-20020a05620a288b00b006b5ad8e5c3asm12388144qkp.68.2022.07.18.11.17.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Jul 2022 11:17:33 -0700 (PDT)
Received: from jgg by mlx with local (Exim 4.94)
	(envelope-from <jgg@ziepe.ca>)
	id 1oDVJE-000J9q-Dk; Mon, 18 Jul 2022 15:17:32 -0300
Date: Mon, 18 Jul 2022 15:17:32 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc: James Bottomley <James.Bottomley@hansenpartnership.com>,
	users@linux.kernel.org, tools@linux.kernel.org
Subject: Re: b4 submit ready for beta testing
Message-ID: <20220718181732.GC5049@ziepe.ca>
References: <20220716142954.voq4ucnl5wkq7h2b@nitro.local>
 <4c4652b0e333bd81b91f71346ac6142322682eff.camel@HansenPartnership.com>
 <20220716145638.ubuwwc7xtjw6ugy7@meerkat.local>
 <6ad8ce3aa0d14d8a09a3c117affe19928a44f639.camel@HansenPartnership.com>
 <20220717160218.a5ccu4chbaoj3uxv@meerkat.local>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220717160218.a5ccu4chbaoj3uxv@meerkat.local>

On Sun, Jul 17, 2022 at 12:02:18PM -0400, Konstantin Ryabitsev wrote:

> Perhaps, but I also have other reasons to like using an empty commit for this.
> For example, it makes it very easy to mark where exactly our series
> starts.

It is a good point, but it is backwards to how alot of people have
been doing things already for a long time..

Putting the commit last makes it work a lot more like the usual
merge-commit approach to preserve the cover letter. Particularly if
you open the branch in any of the web viewers for git, or gitk you get
a very nice view of the cover letter explaining the branch followed by
the usual code in reverse patch order.

It would be nice to use merge commits to mark the series boundary, but
IMHO, the tooling is poor for this.

Jason
