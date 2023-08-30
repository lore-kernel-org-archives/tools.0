Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6AE081847
	for <tools@linux.kernel.org>; Wed, 30 Aug 2023 07:11:24 +0000 (UTC)
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-99c3d3c3db9so673994266b.3
        for <tools@linux.kernel.org>; Wed, 30 Aug 2023 00:11:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1693379482; x=1693984282; darn=linux.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=4X810Sd+FAfinOuDeQjJFxdDeSuw3tPSc7gW/bUxxmc=;
        b=L8F9Sw1hM+4hd3sLDAi6rinP/eT0MV12HdvvVVo6XoCC7vDpqB5Qb6/b/LGKJJGpva
         g5opryDmCserDOlf0BGXHrOLTSBZ4zqVWYxR7iSpL7IiEQhxCrpXyz3KdEowWsk98K+r
         I4LtxU4MRiyaFO+9f5UfU9hX+0D9CPSqGjBoPn3KGkN3KkE/EfPeLh4YlpKfez9oTR0a
         0EsV8M4/d7TCSUpAJB29YAZ81TZQQVkbo8iPE7jFkewR9Sb/xw4MYH4AYx1h3RMlTEQH
         DXtABXgg3ZCh5rrJh+J4zn0giUp7E+hJF5UPfGtg8UMDTCXDyRL+B/CtmT7AEi3M3bOF
         PN3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693379482; x=1693984282;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=4X810Sd+FAfinOuDeQjJFxdDeSuw3tPSc7gW/bUxxmc=;
        b=FL9ROtJF8s95Wm+rXTXk5gH7UOlWr76gsNLBPtVMtETxas/Ac2LPXV2jyhCYCi71HA
         +i+3MaUGeJO1nlgxuzUDylxTRUqYF9WpSSTD/2ObjaG+0ms52IEa8Ac693edhq0pZ3tS
         oH3ZseccPl+A4AbBThakyluCvEQi2hd8Q90jUKTefjtJyjqeemdCVmvi66uURXh5G9xe
         OhrfsZNx1JMosXtuqQIQ+YoXXPAwdytY5JOUcKzI4zhj7Zt0iS9tc8kMQnVxkgaXDrxJ
         /VFnQi8e2MhfxsHCRNhjBVGq1ZfAkdL759N+hv+ORHcVO8VVMMxRTCSGfGEU5MV6StHD
         j9IQ==
X-Gm-Message-State: AOJu0Yx/+pyibdPpwvEKqXTFtyKPpIVkbsCNHNKPtFWsjrErtQfufIe9
	6lOdArRrCIN/bf7mr7ikVZXaow==
X-Google-Smtp-Source: AGHT+IEYCPnvQKeOC3qIczHiEZucOO/GNEh252whblJjg9K7h3SNi2mOr9jig7a/o2KtxMadPr1MLQ==
X-Received: by 2002:a17:906:76c8:b0:9a1:d67c:b4eb with SMTP id q8-20020a17090676c800b009a1d67cb4ebmr913139ejn.48.1693379482411;
        Wed, 30 Aug 2023 00:11:22 -0700 (PDT)
Received: from [192.168.0.22] (77-252-46-238.static.ip.netia.com.pl. [77.252.46.238])
        by smtp.gmail.com with ESMTPSA id n11-20020a17090625cb00b009934855d8f1sm6910043ejb.34.2023.08.30.00.11.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 30 Aug 2023 00:11:21 -0700 (PDT)
Message-ID: <db8d5123-19d7-50d0-935b-a25d235e6e2e@linaro.org>
Date: Wed, 30 Aug 2023 09:11:20 +0200
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Subject: Re: [PATCH v3 1/1] scripts: Add add-maintainer.py
Content-Language: en-US
To: Mark Brown <broonie@kernel.org>, Masahiro Yamada <masahiroy@kernel.org>,
 Nick Desaulniers <ndesaulniers@google.com>,
 Andrew Morton <akpm@linux-foundation.org>, Nicolas Schier
 <nicolas@fjasle.eu>, Konstantin Ryabitsev <konstantin@linuxfoundation.org>,
 Kees Cook <keescook@chromium.org>, Bjorn Andersson <andersson@kernel.org>,
 robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
 Will Deacon <will@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, quic_pkondeti@quicinc.com,
 linux-kernel@vger.kernel.org, kernel@quicinc.com, workflows@vger.kernel.org,
 tools@linux.kernel.org, devicetree@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-pm@vger.kernel.org
References: <cover.1693037031.git.quic_gurus@quicinc.com>
 <141b9fcab2208ace3001df4fc10e3dfd42b9f5d9.1693037031.git.quic_gurus@quicinc.com>
 <2efba6b3-2399-9deb-d0ce-78f7b5e12f30@linaro.org>
 <20230828175629.GC23466@quicinc.com>
 <78aa33f9-ead8-b128-2a7a-40530a1a3ed0@linaro.org>
 <ZOz4XtX3DFRQpvQY@finisterre.sirena.org.uk>
 <670a87e9-2f0c-ec9e-ebb4-9041c8972ace@linaro.org>
 <20230829231638.GA27843@quicinc.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230829231638.GA27843@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 30/08/2023 01:16, Guru Das Srinagesh wrote:
> On Aug 28 2023 21:45, Krzysztof Kozlowski wrote:
>> On 28/08/2023 21:41, Mark Brown wrote:
>>> On Mon, Aug 28, 2023 at 07:59:54PM +0200, Krzysztof Kozlowski wrote:
>>>> On 28/08/2023 19:56, Guru Das Srinagesh wrote:
>>>
>>>>> Your function adds mailing lists also in "To:" which is not ideal, in my view.
>>>>> You've mentioned before that To or Cc doesn't matter [1] which I disagree
>>>>> with: it doesn't matter, why does Cc exist as a concept at all?
>>>
>>>> To/Cc does not matter when sending new patch, because maintainers know
>>>> they are maintainers of which parts. I know what I handle.
>>>
>>> That might be true for you (and also is for me) but I know there are
>>> people who pay attention to if they're in the To: for various reasons, I
>>> gather it's mostly about triaging their emails and is especially likely
>>> in cases where trees have overlaps in the code they cover.
>>
>> True, there can be cases where people pay attention to addresses of
>> emails. Just like there are cases where people pay attention to "To/Cc"
>> difference.
>>
>> In my short experience with a few patches sent, no one complained to me
>> that I put him/her/they in "To" field of a patch instead of "Cc" (with
>> remark to not spamming to much, so imagine I send a patch for regulator
>> and DTS). Big, multi-subsystem patchsets are different case and this
>> script does not solve it either.
> 
> Not sure what you mean by "does not solve it" - what is the problem being
> referred to here?

Exactly, no one even knows what problem you want to solve by swapping
To-Cc between patches...

> 
> In case of multi-subsystem patches in a series, the commit message of this
> patch explains exactly the actions taken.
> 
>> Anyway, if it is not ideal for Guru, I wonder how his LKML maintainer
>> filters work that it is not ideal? What is exactly not ideal in
>> maintainer workflow?
> 
> I am not a maintainer - only an individual contributor - and as such, even
> though I may get patches on files I've contributed to, I deeply appreciate the
> distinction between being Cc-ed in a patch vs To-ed in one. The distinction
> being that if I'm in "To:" I ascribe higher priority to it and lesser if I'm in
> "Cc:".

That's your feeling, quite subjective. I understand it comes from
corporate world, but again...

> 
> If this script is accepted and gains adoption, maintainers like yourself will
> only be To-ed in patches that touch files that you're a direct "Maintainer" or
> "Reviewer" of. 

It will not get traction because:
1. People should use b4, not this script.
2. Remaining people will just use get_maintainers.pl.
3. People cannot get right even basic commands, so we will never be able
to rely on To or Cc distinction. I can give you example: my email
address in get_maintainers.pl is a bit different. Does it matter? Often
not. Entire bunch of folks were Ccing me on different address. Even
though every tool told them not to...

> For all other patches in the series you'll be in "Cc:". I
> imagine that this can be very useful regardless of the specifics of your
> workflow.

Zero usefulness for me.

Best regards,
Krzysztof

