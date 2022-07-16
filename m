Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1E0515AB
	for <tools@linux.kernel.org>; Sat, 16 Jul 2022 17:14:40 +0000 (UTC)
Received: by mail-wr1-f42.google.com with SMTP id q9so10866577wrd.8
        for <tools@linux.kernel.org>; Sat, 16 Jul 2022 10:14:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=conchuod.ie; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=YJjBUOYLlnVWRsiBHTHPpptWVpaHHKD2h3StZTxO33w=;
        b=BE/EqxL71rBOeu+FxzJ19a4C8DRus2wBibOV9QSz6OCSV2O/JbVZvKhzqP9s1W1duR
         L6tkAD/BA43HpXbeDDQQWdIY7JjFfIyPPOrVOQAS9qIbbEjYIQlHT/CENjUukH3wB84/
         52hnNikGpjYuqmkbeirGaTVzUjD/96AmOK0Rcb+Y0vSa33KGxRMGEJHwaWsbkInilrkk
         3NONNJ8us3ttRwdZ4/yK6IAOCuraU5onVhDYpdYEuWWo+uW5W7BOobh6RGQHcXGEJbuS
         RKCHoX6lA1skgHVwS9ve/SUS1a721Uef1jez1us4F3/Jdq6xCnVadb5GVtMENqyIoROG
         PjIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=YJjBUOYLlnVWRsiBHTHPpptWVpaHHKD2h3StZTxO33w=;
        b=uBcs9Fqyi+ciYKW+EfcwtMp+6G1NXbFBLLYwabhViSR6YIMQ+V9n+fRUsZHYDKbqfe
         Xv+QAEgL6eIQffgyS1gYWRGRCrF8ow25NT35k1zkZ3mZxuOspbifLGFaGLxh9KSGPpHg
         DC7W48w82TLCO7szeg+Dt87WUeNLungCg/c+a1MvUYs1JU66KuJpLnkPV0W66bVozXtm
         mO2qGu31ebSy1gGidsmzLzCsv8jW8rEhy8oLH3jCyTm4C6bAQ5HCwJvA6EAgBs5v6/YS
         oQWyXWkYbJJWaQD6abWUtraeipiHRN95s1ZslTsjTW5lv6UeP5oScfa9l6jDjMtojU1r
         2k4Q==
X-Gm-Message-State: AJIora/FF2N+eaTHtRPj06ax/BbNeKei3nLee4SGuMZJ1fLyYmzC7kzH
	7zYH26y1U63+1+fdgwkH8H1syA==
X-Google-Smtp-Source: AGRyM1tJI0PXKsngoi7aK7PPVt5Zp8UoD544831ZOVzR+dfIP3xV0gZ9Z8gpCGfRDpQBr5bM6f5Lhw==
X-Received: by 2002:a05:6000:1707:b0:21d:cf03:fd3 with SMTP id n7-20020a056000170700b0021dcf030fd3mr7218302wrc.205.1657991678923;
        Sat, 16 Jul 2022 10:14:38 -0700 (PDT)
Received: from [192.168.2.222] ([51.37.234.167])
        by smtp.gmail.com with ESMTPSA id c14-20020a5d4cce000000b0021d82a6095bsm6537342wrt.95.2022.07.16.10.14.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 16 Jul 2022 10:14:38 -0700 (PDT)
Message-ID: <d611454a-6a23-eb09-c8ec-84f1b4b49746@conchuod.ie>
Date: Sat, 16 Jul 2022 18:14:37 +0100
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: b4 submit ready for beta testing
Content-Language: en-US
To: James Bottomley <James.Bottomley@HansenPartnership.com>,
 Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc: users@linux.kernel.org, tools@linux.kernel.org
References: <20220716142954.voq4ucnl5wkq7h2b@nitro.local>
 <4c4652b0e333bd81b91f71346ac6142322682eff.camel@HansenPartnership.com>
 <20220716145638.ubuwwc7xtjw6ugy7@meerkat.local>
 <6ad8ce3aa0d14d8a09a3c117affe19928a44f639.camel@HansenPartnership.com>
From: Conor Dooley <mail@conchuod.ie>
In-Reply-To: <6ad8ce3aa0d14d8a09a3c117affe19928a44f639.camel@HansenPartnership.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 16/07/2022 17:55, James Bottomley wrote:
> On Sat, 2022-07-16 at 10:56 -0400, Konstantin Ryabitsev wrote:
> [...]
>> I hear you, but branch descriptions are confined to your local
>> repository and can't be pushed to a remote.
> 
> 
>> So, it was either using notes (which almost everyone forgets to push
>> anyway), or using an empty commit. I agree it's hurky, but it
>> currently the only thing that fits in the "least likely to end up
>> lost on a rebase or workstation switch" category.


Is it silly to suggest that b4 could handle the a notes to
description & description to notes conversion in a "b4 push-series"
or "b4 fetch-series" type of command? 

I don't think it is much of a stretch to assume someone that is
going the whole b4 hog would be afraid of using a wrapper for git
push/fetch.

Thanks,
Conor.
