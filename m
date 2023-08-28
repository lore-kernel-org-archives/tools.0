Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBCBD46AB
	for <tools@linux.kernel.org>; Mon, 28 Aug 2023 15:24:02 +0000 (UTC)
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-977e0fbd742so426076366b.2
        for <tools@linux.kernel.org>; Mon, 28 Aug 2023 08:24:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1693236241; x=1693841041;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=72V2x3mKZTjFbmEG9hhyFoPHvMJYQFTBTRNOrHHTebM=;
        b=Ompvoblzs3Cp9UAhmm1CCL0laidAubR1emolqZQO5pGzyhcP5fs27FuiKSLo4jbnPc
         ZJZLYcNrvuR/XnSGJPL2y0G4v0tg33+1UYeMtCbZu0WgF67eIUHuVcMOpMKcPCsL4knG
         m9TboCQzBqEplZyQn0SsgMTnlApvrsQ54VSs6FOGePvX0+ntcwY2BWWLZk/IOxRqjbs/
         mn5p+vlgdnCTymfmgLIQjuiREmqlFVqR+Oz2ZHZvYJaMuu1dY0xO4iQBBFAZKBKOmZgT
         LZw3R0psqj+/QYYYyk4y3Co0Kixhlw5D0e7FWLyyMI4E5qS4VBtiXOuIUiCYGYPER3SG
         ZqqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693236241; x=1693841041;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=72V2x3mKZTjFbmEG9hhyFoPHvMJYQFTBTRNOrHHTebM=;
        b=ExUwcd3KxzKDKUALRMY1J0oBBuRXyyl0BE7JyqujDeOowqaaOqOHBaewhuYUSb/99V
         UvsrYuGsS6xtfL6eeRI3gVYuqLl/Fx/HKn4S16ef2o3C7l1c/RokCdIACPbTmV/Z+R2Z
         zVkQDT7ZpgfIz7RnATGW+EGnA0nCrHrYnUQQBr723eXY3eOIPu6sQOj1zxAkfVwgruX8
         JPQwoHjL57510lVAc5ktCnJ1idJRcEECiWp3l7wVDy9lQoopPBBdGgvbyOvDef8TlA85
         rZDHwj7ojW+Zz79exddLHA1/EPAooHy9tBPrqcDZNhAdh3pmz7f2IMYxGdt7MLTzO4DH
         RAFg==
X-Gm-Message-State: AOJu0YyazhgMabJmmzy1FGN0I0YtMgQBlqZujSEnWSGGKzT9uylkK1W7
	OMlvyE/CrS5tdk0O0f1dYtHzng==
X-Google-Smtp-Source: AGHT+IH9zZnahhAaJO4DU+2Gx+LWE+isMcEILa2c7LEidmge9Dr+hODq28bZiFtKa1uoaQGgr8j/Ig==
X-Received: by 2002:a05:6402:12cb:b0:522:3410:de23 with SMTP id k11-20020a05640212cb00b005223410de23mr20309002edx.3.1693236240895;
        Mon, 28 Aug 2023 08:24:00 -0700 (PDT)
Received: from [192.168.0.22] ([77.252.47.225])
        by smtp.gmail.com with ESMTPSA id f15-20020aa7d84f000000b0052228721f84sm4588463eds.77.2023.08.28.08.23.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 28 Aug 2023 08:24:00 -0700 (PDT)
Message-ID: <89c73602-43f1-30a4-ad58-637aadacd653@linaro.org>
Date: Mon, 28 Aug 2023 17:23:58 +0200
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Subject: Re: [PATCH v3 1/1] scripts: Add add-maintainer.py
To: Vlastimil Babka <vbabka@suse.cz>,
 Geert Uytterhoeven <geert@linux-m68k.org>,
 Bjorn Andersson <quic_bjorande@quicinc.com>
Cc: Jani Nikula <jani.nikula@intel.com>,
 Guru Das Srinagesh <quic_gurus@quicinc.com>,
 Masahiro Yamada <masahiroy@kernel.org>,
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
 <87jztf37ny.fsf@intel.com>
 <20230828133554.GA818859@hu-bjorande-lv.qualcomm.com>
 <CAMuHMdU+3oj+-3=f5WFVTRsKQjqCpU8SnVqKSZGk8XRxhsDcVQ@mail.gmail.com>
 <9aec0740-2482-d3ad-caf2-5e6278a050b3@suse.cz>
Content-Language: en-US
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <9aec0740-2482-d3ad-caf2-5e6278a050b3@suse.cz>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 28/08/2023 17:14, Vlastimil Babka wrote:
> On 8/28/23 15:48, Geert Uytterhoeven wrote:
>> Hi Bjorn,
>>
>> On Mon, Aug 28, 2023 at 3:37 PM Bjorn Andersson
>> <quic_bjorande@quicinc.com> wrote:
>>> On Mon, Aug 28, 2023 at 11:14:41AM +0300, Jani Nikula wrote:
>>>> On Sat, 26 Aug 2023, Guru Das Srinagesh <quic_gurus@quicinc.com> wrote:
>>>>> This script runs get_maintainer.py on a given patch file (or multiple
>>>>> patch files) and adds its output to the patch file in place with the
>>>>> appropriate email headers "To: " or "Cc: " as the case may be. These new
>>>>> headers are added after the "From: " line in the patch.
>>>>
>>>> FWIW, I personally prefer tooling to operate on git branches and commits
>>>> than patches. For me, the patches are just an intermediate step in
>>>> getting the commits from my git branch to the mailing list. That's not
>>>> where I add the Cc's, but rather in the commits in my local branch,
>>>> where they're preserved. YMMV.
>>>>
>>>
>>> May I ask how you add/carry the recipients in a commit?
>>
>> I guess below a "---" line in the commit description?
> 
> Does that do anything special in commit log? I'd expect (and I do it that
> way) it's rather just adding a

It does. It goes away.
> 
> Cc: Name <email>
> 
> in the tag area where s-o-b, reviewed-by etc are added.

Why storing autogenerated scripts/get_maintainer.pl CC-entries in commit
msg? The non-maintainer-output but the automated output? There is no
single need to store automated output of get_maintainers.pl in the git
log. It can be easily re-created at any given time, thus its presence in
the git history is redundant and obfuscates the log.

Best regards,
Krzysztof

