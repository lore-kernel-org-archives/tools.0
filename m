Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7624A2113
	for <tools@linux.kernel.org>; Wed, 27 Dec 2023 00:53:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="IAjHO0bT"
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-5537dd673e5so3793528a12.0
        for <tools@linux.kernel.org>; Tue, 26 Dec 2023 16:53:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1703638416; x=1704243216; darn=linux.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=FiUVvKqqjPod0bJnT5xTzBfyfeEzRvvV2er/AkELJcs=;
        b=IAjHO0bTnEPxenocsLNU/+1AAouxnrkXmNHJTLtFWbKXQ92I2Xive7orAH7mdtLi5x
         gqFu94DTTMNWf3oQD3+b+Mob52WPM9z3NJ5naWysyAMzsFHZDWNMZAv1iTnMzlqQJUBf
         XKUgqJ0T93AUWv1A5NUbgLNSmOwTRLEWVCgi/YwoE+JZGNI8QXmuD+kUsXrGS6Kq6isy
         A7F9Z7qvDgisA0xOij++z7vyy/Ozw8JAxzMWgSZUwSgntudVnrTvQraozStlvouXv0yL
         X7RnBOtaGXOBwvAwE904BlWtNLEDiMi39m/wceGaj1Bchvs5hGXXBBVMuDxDCIUJp85q
         dzvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703638416; x=1704243216;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=FiUVvKqqjPod0bJnT5xTzBfyfeEzRvvV2er/AkELJcs=;
        b=iwjxO1mjsIlqH6ZASeuGYwLkKXm4l48Rsz6Z+9e8nz5Jtaut5/aTp4YE9yakfd+uMw
         VT/D48H57Puu926GVQJp2jSET9cM54r4GqV8wOqAzk1O2a2lmrBAGFjLr8AwPK/KSkdD
         4xsyA0oaSGrOO3cG0ueP0htj7W8+ZuKV+Umd746Qnxf4smAziPThbw0Toi1CASr5RB0h
         760FTEa8n3KrDXOdshQ/ROYXw06G8QZoYE/2x9V4ISuYau/4BRWNonSWOC/vwD+7jMuf
         nhFOUuqAO1RVEXy2Gaq0gCzfEwGIQg3BdJmKXXJ28+E1Vv2+EdrcfkTsGzAlaLo8u4gD
         DFQg==
X-Gm-Message-State: AOJu0YwaH6Knnt/UHA6Lmr1F/Hr/bTRpGtIeoHyT93VMdFswEIX6YcCx
	a2mrvC/WjTWDpCLiw/EhXO5+Kf1Eu7iQRBU4lQ4rKewfP3Y=
X-Google-Smtp-Source: AGHT+IE7mnE0yZNEtPgDN2YtXaUQg9vNdKqigjAfLpj80l32zvJupGTe5nDIyC0UvK9VCvARJ7cnzw==
X-Received: by 2002:a50:ab13:0:b0:553:a041:3560 with SMTP id s19-20020a50ab13000000b00553a0413560mr5564179edc.58.1703638416263;
        Tue, 26 Dec 2023 16:53:36 -0800 (PST)
Received: from [192.168.199.125] (178235179028.dynamic-4-waw-k-1-3-0.vectranet.pl. [178.235.179.28])
        by smtp.gmail.com with ESMTPSA id c13-20020a0564021f8d00b00554bb95bf3fsm3655856edc.58.2023.12.26.16.53.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 26 Dec 2023 16:53:35 -0800 (PST)
Message-ID: <f1dd06a5-d5f6-40bf-b4c9-5b073b329b04@linaro.org>
Date: Wed, 27 Dec 2023 01:53:34 +0100
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: sdm845: Use the Low Power Island CX/MX
 for SLPI
Content-Language: en-US
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc: tools@linux.kernel.org
References: <20231220-topic-sdm845_slpi_lcxmx-v1-1-db7c72ef99ae@linaro.org>
 <9dc9b23b-6ebb-45b2-a03e-1379a4ceab90@linaro.org>
 <20231222-smooth-jellyfish-of-vigor-1acab8@lemur>
From: Konrad Dybcio <konrad.dybcio@linaro.org>
Autocrypt: addr=konrad.dybcio@linaro.org; keydata=
 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
 izWDgYvmBE8=
In-Reply-To: <20231222-smooth-jellyfish-of-vigor-1acab8@lemur>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 22.12.2023 19:43, Konstantin Ryabitsev wrote:
> On Wed, Dec 20, 2023 at 03:16:00PM +0100, Konrad Dybcio wrote:
>> On 20.12.2023 15:15, Konrad Dybcio wrote:
>>> The SLPI is powered by the Low Power Island power rails. Fix the incorrect
>>> assignment.
>>>
>>> Fixes: 74588aada59a ("arm64: dts: qcom: sdm845: add SLPI remoteproc")
>>> Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
>>> ---
>> b4 seems to not have included my "only compile-tested" comment
> 
> Can you let me know your expected behaviour vs. what you ended up seeing? 
Sure!

expected: the "Only compile-tested" bit goes under the striped
line

actual: The line is ignored. And I think this happens quite
consistently with a single patch with a single line of 'cover
letter' only, maybe it interprets the series topic, but a
separate 0/1 message is of course not created.



Here's the setup:


--------------------------------------------
commit f516d7b26e4aa2e6ac87f7e989de008a99e5b26b (topic/sdm845_slpi_lcxmx)
Author: Konrad Dybcio <konrad.dybcio@linaro.org>
Date:   Wed Dec 20 15:12:56 2023 +0100

    arm64: dts: qcom: sdm845: Use the Low Power Island CX/MX for SLPI
    
    The SLPI is powered by the Low Power Island power rails. Fix the incorrect
    assignment.
    
    Fixes: 74588aada59a ("arm64: dts: qcom: sdm845: add SLPI remoteproc")
    Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>

commit d8d0c7257dd4cba8ca0f9f8cdfc7ab12adfd3909
Author: Konrad Dybcio <konrad.dybcio@linaro.org>
Date:   Wed Dec 20 15:14:34 2023 +0100

    Only compile-tested
    
    To: Bjorn Andersson <andersson@kernel.org>
    To: Rob Herring <robh+dt@kernel.org>
    To: Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
    To: Conor Dooley <conor+dt@kernel.org>
    To: Dylan Van Assche <me@dylanvanassche.be>
    Cc: Marijn Suijten <marijn.suijten@somainline.org>
    Cc: linux-arm-msm@vger.kernel.org
    Cc: devicetree@vger.kernel.org
    Cc: linux-kernel@vger.kernel.org
    Cc: Caleb Connolly <caleb.connolly@linaro.org>
    Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
    
    ---
    Changes in v2:
    - EDITME: describe what is new in this series revision.
    - EDITME: use bulletpoints and terse descriptions.
    - Link to v1: https://lore.kernel.org/r/20231220-topic-sdm845_slpi_lcxmx-v1-1-db7c72ef99ae@linaro.org
    
    
    
    --- b4-submit-tracking ---
    # This section is used internally by b4 prep for tracking purposes.
    {
      "series": {
        "revision": 2,
        "change-id": "20231220-topic-sdm845_slpi_lcxmx-03c4f98a423d",
        "base-branch": null,
        "prefixes": [],
        "history": {
          "v1": [
            "20231220-topic-sdm845_slpi_lcxmx-v1-1-db7c72ef99ae@linaro.org"
          ]
        }
      }
    }

commit 20d857259d7d10cd0d5e8b60608455986167cfad (tag: next-20231220)

--------------------------------------------

Konrad
