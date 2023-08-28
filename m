Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 317A01429C
	for <tools@linux.kernel.org>; Mon, 28 Aug 2023 19:46:01 +0000 (UTC)
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-9a19bf6ab66so474866466b.3
        for <tools@linux.kernel.org>; Mon, 28 Aug 2023 12:46:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1693251960; x=1693856760;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=oiqe0gxfgN86bDvtk+BEvYyxTVQVDqi2WsAzVHCVfqE=;
        b=mJqCSinPqwWv/swpZS9AXlSqdApX2gFQOQeI1Wgyr5SQK3CPfcqTzJvzNRntXNcWLM
         ysLnxWWDdfqphD5whGdKY9ive1lPzmEgZ28mFOfm51+qhqkheODY789jnq3arcJ5ToqX
         LXe7CuAxiBnMYJjC5Gyy7W2ni+5K2aifLiyZo9B+9qoufcwK8lxYz1JSvsMH8wAJ+vcF
         EGFzsXS9gRxE3DVCDduBc8t8ROVC8Q4L76MImcWCmD1dZiJnQNba/YYiCQtnbloHajUx
         8iKJh2Hnco6OUAzkxC1Czxbr7nQQIKt77NihZbCmksmKx/HHK+JGWDE9uKOf3zwwawNT
         XN3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693251960; x=1693856760;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=oiqe0gxfgN86bDvtk+BEvYyxTVQVDqi2WsAzVHCVfqE=;
        b=k1MwrdBuN2qC3V17wo1cWmHUwyEe1sZPkua1bUBWF8+HOkJJR1dbFElPEaJE9J8wnC
         ZwiG9Ui47kbvfY4DPSrgTYwk7Oct/ofpnfx+al55F4eLqtUAOkqgH+Z/PCFQOnFXanVN
         PufypSAHOWvYp6pU2wIBCJ1SXZw0EmAL09aJ+SC8BqPdNH7Ttd8vbixAA0vM7aIU7NgG
         Fa52INdNatyC7d8ho4LSzFNxpP+5vxYawgYee6rstZiIpjSn+RD8C+WXARlondqcMThd
         ol3MIfDUlBhYjDr+juepKTv3mZaO9QBx/tI8bvM4VCetIpFG91wkx3A+fglq2EeyccYu
         rW0w==
X-Gm-Message-State: AOJu0YyuHQ6Zpl6RMw3RCjwK0IIiQkZOGu/i7hvuOtoeUR6gWa8/GtE3
	RkgrNuWtjqNzV0StoCQngquW3Q==
X-Google-Smtp-Source: AGHT+IGjDB+imRvxhoYsDEK81COTY6JJtmUTK6fjHq5X5OOFVyGN/7ZceR1tHPH5f3sKcM1VuOcdsg==
X-Received: by 2002:a17:906:8474:b0:9a1:e8c0:7e30 with SMTP id hx20-20020a170906847400b009a1e8c07e30mr10797736ejc.7.1693251960225;
        Mon, 28 Aug 2023 12:46:00 -0700 (PDT)
Received: from [192.168.0.22] ([77.252.47.225])
        by smtp.gmail.com with ESMTPSA id dk13-20020a170906f0cd00b00992e14af9c3sm5106233ejb.143.2023.08.28.12.45.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 28 Aug 2023 12:45:59 -0700 (PDT)
Message-ID: <670a87e9-2f0c-ec9e-ebb4-9041c8972ace@linaro.org>
Date: Mon, 28 Aug 2023 21:45:58 +0200
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
To: Mark Brown <broonie@kernel.org>
Cc: Masahiro Yamada <masahiroy@kernel.org>,
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
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <ZOz4XtX3DFRQpvQY@finisterre.sirena.org.uk>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 28/08/2023 21:41, Mark Brown wrote:
> On Mon, Aug 28, 2023 at 07:59:54PM +0200, Krzysztof Kozlowski wrote:
>> On 28/08/2023 19:56, Guru Das Srinagesh wrote:
> 
>>> Your function adds mailing lists also in "To:" which is not ideal, in my view.
>>> You've mentioned before that To or Cc doesn't matter [1] which I disagree
>>> with: it doesn't matter, why does Cc exist as a concept at all?
> 
>> To/Cc does not matter when sending new patch, because maintainers know
>> they are maintainers of which parts. I know what I handle.
> 
> That might be true for you (and also is for me) but I know there are
> people who pay attention to if they're in the To: for various reasons, I
> gather it's mostly about triaging their emails and is especially likely
> in cases where trees have overlaps in the code they cover.

True, there can be cases where people pay attention to addresses of
emails. Just like there are cases where people pay attention to "To/Cc"
difference.

In my short experience with a few patches sent, no one complained to me
that I put him/her/they in "To" field of a patch instead of "Cc" (with
remark to not spamming to much, so imagine I send a patch for regulator
and DTS). Big, multi-subsystem patchsets are different case and this
script does not solve it either.

Anyway, if it is not ideal for Guru, I wonder how his LKML maintainer
filters work that it is not ideal? What is exactly not ideal in
maintainer workflow?

Best regards,
Krzysztof

