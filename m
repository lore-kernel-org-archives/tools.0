Received: from mail-qt1-f181.google.com (mail-qt1-f181.google.com [209.85.160.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E72F724F53
	for <tools@linux.kernel.org>; Wed,  2 Nov 2022 19:53:11 +0000 (UTC)
Received: by mail-qt1-f181.google.com with SMTP id e15so7634qts.1
        for <tools@linux.kernel.org>; Wed, 02 Nov 2022 12:53:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=VCURurVXpNKm0r5NKwujq47W0T9DuT3biYNl2ITKikc=;
        b=qrg+UFYdYshoz8JIeBsV+jzhD232C0bs9UpG/Ihj1BNkwaEUZ3Joy49umHcWfPZLsm
         BY+yJB63PZJaTaBmJsbTNJHtjhX+yifm+VYwaFDabRkt9Q1T8fK0MeIDFQ3PxvubgeEU
         Wc5F6WKpzntAswuw3J65iIMqS+0SZyaVbiVJb85UmEPW+bzL/nMBh4+7/N3uoAsXY3HB
         LkUR172tcTRo2/1+P1xgLfE/j4WD/WdCodp52PKpsSosJ+fS7Qd8w0vTaHRTYwyM7GBw
         Tz/OJm4geEVGSokDMwaNVZvrixj+aV1bEKqpldP9DSNGNoeGudN/DvbC7sv8FMbUZf8n
         sqCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=VCURurVXpNKm0r5NKwujq47W0T9DuT3biYNl2ITKikc=;
        b=XiJg39vW2ZeS7uDxh9tyVNJGPDVGqbB7U6KEz7nHXlzFQdauQ2IaUb5gRl9VZ0v7xy
         tA2oz2Pfdr8Rx1Kk/vr95GRPOs+Do7ii0B3rWpcgHoxVPq/opP5P7KYqAsSaoU18VoO/
         DRucTwWy34TrPea7R8ZMXCAbcYFRJn4Pwath3m10gKd2ZkgfOnu0ZF9ZPrculyX+ff52
         KZxF9hWJ1Yo/hjYPZ0+UZwgq9BKsxoNtmYI8xzHiU8o0lwEjD5moUkApCCKteAZlNAEn
         /r+6VBsa2OJkumkS3rjVE7LcKJaCo4cQaFN4AwqqyyCM/At67fKU3vGy9wAVEPaPkZOK
         v36Q==
X-Gm-Message-State: ACrzQf1QCttYTHlsdoh7bjGaREMHf/tFZbknCNHkttFbMg6V1jeQGfjN
	BF271/lr2MfxTj0GIgANGj276Q==
X-Google-Smtp-Source: AMsMyM4nKtBy2YNFBbKzZGPixuZYYwvKEfnXH7YElMajFAURrNRLMAyNKCFQxXZ799tS7vpuXJqBQw==
X-Received: by 2002:a05:622a:c:b0:3a5:43b0:bc6 with SMTP id x12-20020a05622a000c00b003a543b00bc6mr5092232qtw.307.1667418790832;
        Wed, 02 Nov 2022 12:53:10 -0700 (PDT)
Received: from ?IPV6:2601:586:5000:570:28d9:4790:bc16:cc93? ([2601:586:5000:570:28d9:4790:bc16:cc93])
        by smtp.gmail.com with ESMTPSA id x18-20020a05620a449200b006fa31bf2f3dsm5841929qkp.47.2022.11.02.12.53.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 02 Nov 2022 12:53:10 -0700 (PDT)
Message-ID: <57dcec48-77cb-7abd-de63-c42d87c0cc27@linaro.org>
Date: Wed, 2 Nov 2022 15:53:08 -0400
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.1
Subject: Re: DCO chain of custody revisited (was Re: [PATCH v4 08/11] mfd:
 qcom-pm8xxx: drop unused PM8018 compatible)
Content-Language: en-US
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>,
 James Bottomley <James.Bottomley@hansenpartnership.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, Lee Jones <lee@kernel.org>,
 tools@linux.kernel.org, users@linux.kernel.org
References: <20220928-mdm9615-dt-schema-fixes-v4-0-dac2dfaac703@linaro.org>
 <20220928-mdm9615-dt-schema-fixes-v4-8-dac2dfaac703@linaro.org>
 <Y1/qnCyav/S35mRo@google.com>
 <6858acf3-eb90-41aa-b714-a2ceb6afe9db@linaro.org>
 <20221031165842.vxr4kp6h7qnkc53l@meerkat.local>
 <7b25ea15b6e508f435ca36967d9f4d4408f9a690.camel@HansenPartnership.com>
 <20221031172319.znosu3gleyipeje5@meerkat.local>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221031172319.znosu3gleyipeje5@meerkat.local>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 31/10/2022 13:23, Konstantin Ryabitsev wrote:
> On Mon, Oct 31, 2022 at 01:10:58PM -0400, James Bottomley wrote:
>>>> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
>>>> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>>>> Signed-off-by: Lee Jones <lee@kernel.org>
>>>
>>> This would indicate that it's *Lee* who is claiming responsibility
>>> for collecting the Reviewed-by tag from Krzysztof, because it is in
>>> his chain of custody. However, this is not the case -- it was Neil
>>> who collected the tag, and therefore the "more correct" order should
>>> be:
>>>
>>>> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>>>> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
>>>> Signed-off-by: Lee Jones <lee@kernel.org>
>>>
>>> If my reasoning is incorrect, then I need to go back to the drawing
>>> board.
>>
>> You're way over thinking this.
> 
> Yes, but it's my job to overthink this, so nobody else has to. :)

I appreciate overthinking, because it makes the life of patch submitters
easier - they can rely on a tool (b4) as a source of the process instead
of being corrected by maintainers with conflicting points of view.

> 
>> The only tag that matters from the DCO point of view is Signed-off-by.
>> That's the ordering we care about for the chain of custody.  All other tags
>> are irrelevant.  Of course, it's nice to think that reviews happen *after*
>> the code was modified, which is why most of us like to see the Reviewed-by
>> after the initial author signoff,

I guess it depends then what is the meaning of SoB. In my understanding,
DCO (and SoB) only state the contents of the contribution, so:
1. I write patch (or collect it from somewhere etc).
2. I signed it with SoB.
3. There was a review tag given, so I add a review tag.

My SoB does not certify order of review tags or any other pieces than
what is explained in DCO: I created the contribution and I am allowed to
send it.

Therefore Rb/Ack/tags go after my SoB.

https://www.kernel.org/doc/html/v4.17/process/submitting-patches.html#:~:text=The%20Signed%2Doff%2Dby%3A,in%20the%20patch's%20delivery%20path.
is even saying:
"Some people also put extra tags at the end. "
so some tags are *after*.

> 
> But this is where it becomes complicated. The Reviewed-By trailer was sent to
> the v2 of the series, and incorporated into v3(via b4 trailers). If we stick
> it below Signed-off-by, then it may suggest that Krzysztof reviewed the v4 of
> the patch.

No, you cannot imply the order from that. That's only one possibility.

> By placing it above the Signed-off-by line, we at least clearly indicate that
> it's Neil who put it there.

True, but that's not the point of SoB... I can also argue that this
implies that review happened before contribution was signed off.

Best regards,
Krzysztof

