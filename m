Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61DBC20FA
	for <tools@linux.kernel.org>; Tue,  2 Jan 2024 08:07:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="e+j5cDjQ"
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-33731db55d9so2172603f8f.2
        for <tools@linux.kernel.org>; Tue, 02 Jan 2024 00:07:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1704182841; x=1704787641; darn=linux.kernel.org;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=CWo3MGBBOfR51CNwQZT/5Vw17Er+TEQmdtQr774Rt6E=;
        b=e+j5cDjQhCu7RMwAEV5ZHdQa3Z5mf4WFlA0gsO7MiNusim8vnamYRFjpmkMsPYBWAX
         +hsMYkL+HMoLPbNbfG3ywHIN0svbsNNMH98+T2+CJbkxqtkU6J0D9mUOZMjVO/SG522Y
         RMoUPJagx+3p29rRfa7cm1r5qnJWJyHzPSBxizUf7aupZohXPBZC0+dPRar9MwGAyDEt
         /fxxjZ2nl5xCFTNgAY05PvrGIY3H+OP833y1rurswrRMsyIGf4iUiTXGGfNCBO8Io9J3
         retKiuckKRgS66bswN8oDxuKXRi0tCThTf+pbpfdMV/zUOXl9DSdLF1buA7Zag/ewW8Y
         4jKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704182841; x=1704787641;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=CWo3MGBBOfR51CNwQZT/5Vw17Er+TEQmdtQr774Rt6E=;
        b=TCRd4w94f0cZ+/IepmJcFw5xlosOpPAm475eE4nWhgSlxb9H3wIpIHklI5YrBGIJ1B
         PA/XE+WKC8qEuh4tvrFopqx3duhfgYcxADHol0GlN48Mh1/10Z9XuAAhR5C95GkdVb+s
         vkcQHYy4RjqEcEmhf4JUbbDChRGPq89r/toMitf8+H2vG54IVv71IAWHMeVvKFRtWgdB
         5/1mnXIOIF76QVVajZ6lVT303j+oZAR+qMPZi7+u6a1cxKK9LMoaXmt0EdGMtkd1PMAG
         XDCSCtYXJ83wa6tWYCS5/GqAn1v7+K5Mcxv8y5NfrbJ9GHoW9qZv2KMSeZiB6MNz7hFS
         OSKA==
X-Gm-Message-State: AOJu0Yzm6N9j6SKKj0+37dFR+GfscwzFpemAGm7uQ8lfnPnnHsn4rQ0r
	zOFwNCRGt9lB2HAT9K2DsHnMTp6FLD/DHd70Wwfb4Hcqj1M=
X-Google-Smtp-Source: AGHT+IEmqs1ILCDmL7JlCYWvOgbDUMrn3Paf9LVbosVjcCyjXT7LNMAnAjZEszyw5L3Ys+uhRL8C2A==
X-Received: by 2002:adf:a349:0:b0:336:8ab6:7aac with SMTP id d9-20020adfa349000000b003368ab67aacmr8324043wrb.102.1704182841212;
        Tue, 02 Jan 2024 00:07:21 -0800 (PST)
Received: from localhost ([2a01:cb19:95ba:5000:d6dd:417f:52ac:335b])
        by smtp.gmail.com with ESMTPSA id p13-20020a5d48cd000000b00336898daceasm27014920wrs.96.2024.01.02.00.07.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Jan 2024 00:07:20 -0800 (PST)
From: Mattijs Korpershoek <mkorpershoek@baylibre.com>
To: Konrad Dybcio <konrad.dybcio@linaro.org>, Konstantin Ryabitsev
 <konstantin@linuxfoundation.org>
Cc: tools@linux.kernel.org
Subject: Re: [PATCH] arm64: dts: qcom: sdm845: Use the Low Power Island
 CX/MX for SLPI
In-Reply-To: <f1dd06a5-d5f6-40bf-b4c9-5b073b329b04@linaro.org>
References: <20231220-topic-sdm845_slpi_lcxmx-v1-1-db7c72ef99ae@linaro.org>
 <9dc9b23b-6ebb-45b2-a03e-1379a4ceab90@linaro.org>
 <20231222-smooth-jellyfish-of-vigor-1acab8@lemur>
 <f1dd06a5-d5f6-40bf-b4c9-5b073b329b04@linaro.org>
Date: Tue, 02 Jan 2024 09:07:20 +0100
Message-ID: <875y0c5fbb.fsf@baylibre.com>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Hi Konrad,

On Wed, Dec 27, 2023 at 01:53, Konrad Dybcio <konrad.dybcio@linaro.org> wrote:

> On 22.12.2023 19:43, Konstantin Ryabitsev wrote:
>> On Wed, Dec 20, 2023 at 03:16:00PM +0100, Konrad Dybcio wrote:
>>> On 20.12.2023 15:15, Konrad Dybcio wrote:
>>>> The SLPI is powered by the Low Power Island power rails. Fix the incorrect
>>>> assignment.
>>>>
>>>> Fixes: 74588aada59a ("arm64: dts: qcom: sdm845: add SLPI remoteproc")
>>>> Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
>>>> ---
>>> b4 seems to not have included my "only compile-tested" comment
>> 
>> Can you let me know your expected behaviour vs. what you ended up seeing? 
> Sure!
>
> expected: the "Only compile-tested" bit goes under the striped
> line
>
> actual: The line is ignored. And I think this happens quite

Per my understanding, this is a "feature", not a bug.
What happens on single patches that don't want to have an additional
comment below the --- marker?

> consistently with a single patch with a single line of 'cover
> letter' only, maybe it interprets the series topic, but a
> separate 0/1 message is of course not created.

Can't this be fixed with adding a body in the commit message for 0/1 ?
See below

>
>
>
> Here's the setup:
>
>
> --------------------------------------------
> commit f516d7b26e4aa2e6ac87f7e989de008a99e5b26b (topic/sdm845_slpi_lcxmx)
> Author: Konrad Dybcio <konrad.dybcio@linaro.org>
> Date:   Wed Dec 20 15:12:56 2023 +0100
>
>     arm64: dts: qcom: sdm845: Use the Low Power Island CX/MX for SLPI
>     
>     The SLPI is powered by the Low Power Island power rails. Fix the incorrect
>     assignment.
>     
>     Fixes: 74588aada59a ("arm64: dts: qcom: sdm845: add SLPI remoteproc")
>     Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
>
> commit d8d0c7257dd4cba8ca0f9f8cdfc7ab12adfd3909
> Author: Konrad Dybcio <konrad.dybcio@linaro.org>
> Date:   Wed Dec 20 15:14:34 2023 +0100
>
>     Only compile-tested # gets ignored

Add another line here: Only compile-tested.

>     
>     To: Bjorn Andersson <andersson@kernel.org>
>     To: Rob Herring <robh+dt@kernel.org>
>     To: Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
>     To: Conor Dooley <conor+dt@kernel.org>
>     To: Dylan Van Assche <me@dylanvanassche.be>
>     Cc: Marijn Suijten <marijn.suijten@somainline.org>
>     Cc: linux-arm-msm@vger.kernel.org
>     Cc: devicetree@vger.kernel.org
>     Cc: linux-kernel@vger.kernel.org
>     Cc: Caleb Connolly <caleb.connolly@linaro.org>
>     Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
>     
>     ---
>     Changes in v2:
>     - EDITME: describe what is new in this series revision.
>     - EDITME: use bulletpoints and terse descriptions.
>     - Link to v1: https://lore.kernel.org/r/20231220-topic-sdm845_slpi_lcxmx-v1-1-db7c72ef99ae@linaro.org
>     
>     
>     
>     --- b4-submit-tracking ---
>     # This section is used internally by b4 prep for tracking purposes.
>     {
>       "series": {
>         "revision": 2,
>         "change-id": "20231220-topic-sdm845_slpi_lcxmx-03c4f98a423d",
>         "base-branch": null,
>         "prefixes": [],
>         "history": {
>           "v1": [
>             "20231220-topic-sdm845_slpi_lcxmx-v1-1-db7c72ef99ae@linaro.org"
>           ]
>         }
>       }
>     }
>
> commit 20d857259d7d10cd0d5e8b60608455986167cfad (tag: next-20231220)
>
> --------------------------------------------
>
> Konrad
