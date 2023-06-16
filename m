Received: from mail-qk1-f177.google.com (mail-qk1-f177.google.com [209.85.222.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF1FE13AC6
	for <tools@linux.kernel.org>; Fri, 16 Jun 2023 16:55:00 +0000 (UTC)
Received: by mail-qk1-f177.google.com with SMTP id af79cd13be357-762389a65a3so53010985a.1
        for <tools@linux.kernel.org>; Fri, 16 Jun 2023 09:55:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1686934499; x=1689526499;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=FVqGjsopmFL5w1uFHD/FAJFsP1yfYyb/2n2s3z4foGQ=;
        b=YCWuArOdQmZupvo/4zrTyxCfnPEf6Yd6lypZOG8oFesTjMJZVhLk3AxN1EaLMfwSyG
         gpURiRkT9ANxPZcuk8B9qSwDlCt7JfxoWz6Dr+iyD7TY3Bz2i94Sf4VaG6Ul1WXZFDQV
         HZTohQXqr7bT7Ef05V9lEbZKmx2bNqmHE0YSY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686934499; x=1689526499;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FVqGjsopmFL5w1uFHD/FAJFsP1yfYyb/2n2s3z4foGQ=;
        b=NLOW5OYOnQ3COZP4wSzkKuPaXuvpOAFmmNcs9A1IuMN50NUXA4sxcl1Y3l0RbLyOsc
         obKfIhQb0UHDoavNicjbhSMtXvDcy7zDjPTV6tqcDtPpj1LdrBjKsLVgNuFoSJoHeGAW
         +BPpin+5qYkbumgHp/QHzN9htXWBQM1D3UNOSxL/hZLmk4w9lg9JreYmyjNstg+2Z4BJ
         TtergLbx24EBoE7CZKe3cgPw1DwhW2/ybkxqTaLP2llAU2SXbiyura9zxNc4950yEdyJ
         PGZzp67ZmrPstCHO0ags5y+Gm1+VN5kYo0Jo7UUyQR4hrp4OOGNdNOzyJJQg65XgyNDJ
         saNw==
X-Gm-Message-State: AC+VfDylh2V3w5YwwvihF6AGLP+f51FUecN14Ies6PGIrsG4Tk01jhn7
	0wdoy3GdsE72lqiayvJzVhLDtQ==
X-Google-Smtp-Source: ACHHUZ53kHbauVx+l07sglNK881MO38+WlyIqySNVFIa7BcM4aj4gCQyKL59W7q61iw8UGhG2mwmiA==
X-Received: by 2002:ad4:5b81:0:b0:5df:4d41:954d with SMTP id 1-20020ad45b81000000b005df4d41954dmr3167705qvp.3.1686934499161;
        Fri, 16 Jun 2023 09:54:59 -0700 (PDT)
Received: from nitro.local ([204.48.95.97])
        by smtp.gmail.com with ESMTPSA id a10-20020a0ce34a000000b0062febc332f0sm2438861qvm.130.2023.06.16.09.54.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Jun 2023 09:54:58 -0700 (PDT)
Date: Fri, 16 Jun 2023 12:54:56 -0400
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: Erik Schilling <erik.schilling@linaro.org>
Cc: tools@linux.kernel.org
Subject: Re: [BUG b4] resending drops previously configured prefixes
Message-ID: <20230616-farce-lot-parody-edfe0d@meerkat>
References: <CTDVYQ01B09D.1FUED4Y6IQUKI@fedora>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CTDVYQ01B09D.1FUED4Y6IQUKI@fedora>

On Fri, Jun 16, 2023 at 09:11:35AM +0200, Erik Schilling wrote:
> If I sent the original series with a prefix, then resend will send
> with [PATCH RESEND] but will no longer contain the original prefix.
> 
> I am not sure how one would fix it the best way, it looks like prefixes
> are not tracked as part of the history. Maybe they should? I might drop
> a WIP but still want to be able to reproduce a past version... But maybe
> it would also just be enough to resend with the currently configured
> prefix (+ RESEND)?

I'll check and make sure that we always send the latest configured prefixes.

bugbot assign to me

-K
