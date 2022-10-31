Received: from mail-io1-f42.google.com (mail-io1-f42.google.com [209.85.166.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45FCC33C9
	for <tools@linux.kernel.org>; Mon, 31 Oct 2022 17:33:33 +0000 (UTC)
Received: by mail-io1-f42.google.com with SMTP id o65so10326667iof.4
        for <tools@linux.kernel.org>; Mon, 31 Oct 2022 10:33:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ieee.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ntoiOEGFJZA3pI7OFF8xEV8oEp3XSIxx6l+/dv61Nr4=;
        b=HDchOKtjvYZDBrbXznMPZCJ1Z4OI80Rnu0nlXmB7mY3hBu7GTcaM2agoyEMPghIkl8
         jNBhY801sCv012iDvjqsPsgc94Jz+qWBcxs9xlWbiQrimovuAd1iTHZlQ7P7H3CiXeBR
         AYiltw6BThGV5lFZAAAoQ13J5/66F9Z1jQCcI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ntoiOEGFJZA3pI7OFF8xEV8oEp3XSIxx6l+/dv61Nr4=;
        b=bbha+PMl1e8Taqp5LzkMchXvWFKfkvLUAibuhmQrcG23Ud8FOD6Li6taQ3ezC31fm2
         CPTZhUHO2Yv9XnsnJsZTIaRzGJnYss/iffIQpP8bfHHzZvrGjiK7kL5XLj5oSt0LUYa9
         +OKTKk8/CMxCNn8I7P1rGIyu5ohpNfUYHQZsHuhWJ2Di2DfMrOlcFIwKuQiHBAYOGSx5
         HOU9Cbc6zGNi+jrBwc0y5vgL/hIWUruxxiOuVe+CmaMM9/JT3LQhofBsVexb4Q540gFG
         JO28VLKtQOrIAbk/7ybJcscDLE0tl84zwZdb0HgLxeUQaPMVTytzcqzhl3KZ+WbuL28w
         /ePA==
X-Gm-Message-State: ACrzQf3IYaPI12ldFNAdtL1MaEKhCihsd0aCUQtXob/tlLpM+ZQg4w+f
	5AJYHNb4XD22v4lG0fEBauss7w==
X-Google-Smtp-Source: AMsMyM7Pn9lXLH9E9+sZzl6gfxBkOjGEZUAwgm5YSLQlkrIcDzn0RuICq5ct+yr+gFEJMOl7Y/5BAw==
X-Received: by 2002:a5e:920c:0:b0:6c5:da79:4cd1 with SMTP id y12-20020a5e920c000000b006c5da794cd1mr7428077iop.78.1667237612233;
        Mon, 31 Oct 2022 10:33:32 -0700 (PDT)
Received: from [172.22.22.4] ([98.61.227.136])
        by smtp.googlemail.com with ESMTPSA id x6-20020a0566380ca600b003495b85a3b9sm2915528jad.178.2022.10.31.10.33.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 31 Oct 2022 10:33:31 -0700 (PDT)
Message-ID: <89ce6b7a-3500-6026-0044-9916f5a567b7@ieee.org>
Date: Mon, 31 Oct 2022 12:33:30 -0500
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: DCO chain of custody revisited (was Re: [PATCH v4 08/11] mfd:
 qcom-pm8xxx: drop unused PM8018 compatible)
Content-Language: en-US
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>,
 James Bottomley <James.Bottomley@hansenpartnership.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, Lee Jones <lee@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 tools@linux.kernel.org, users@linux.kernel.org
References: <20220928-mdm9615-dt-schema-fixes-v4-0-dac2dfaac703@linaro.org>
 <20220928-mdm9615-dt-schema-fixes-v4-8-dac2dfaac703@linaro.org>
 <Y1/qnCyav/S35mRo@google.com>
 <6858acf3-eb90-41aa-b714-a2ceb6afe9db@linaro.org>
 <20221031165842.vxr4kp6h7qnkc53l@meerkat.local>
 <7b25ea15b6e508f435ca36967d9f4d4408f9a690.camel@HansenPartnership.com>
 <20221031172319.znosu3gleyipeje5@meerkat.local>
From: Alex Elder <elder@ieee.org>
In-Reply-To: <20221031172319.znosu3gleyipeje5@meerkat.local>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/31/22 12:23 PM, Konstantin Ryabitsev wrote:
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
> 
>> The only tag that matters from the DCO point of view is Signed-off-by.
>> That's the ordering we care about for the chain of custody.  All other tags
>> are irrelevant.  Of course, it's nice to think that reviews happen *after*
>> the code was modified, which is why most of us like to see the Reviewed-by
>> after the initial author signoff,
> 
> But this is where it becomes complicated. The Reviewed-By trailer was sent to
> the v2 of the series, and incorporated into v3(via b4 trailers). If we stick
> it below Signed-off-by, then it may suggest that Krzysztof reviewed the v4 of
> the patch.
> 
> By placing it above the Signed-off-by line, we at least clearly indicate that
> it's Neil who put it there.

I prefer this interpretation.  That is, the "outer" (last) sign-off
is essentially indicating that everything within (above) it is what
their sign-off applies to.

Most (all?) of the other tags (like Suggested-by, etc.) don't 
necessarily have a strong requirement or precise meaning, so in
a way it doesn't matter that much.  But I think this convention
adds a small amount of value.

					-Alex

> 
> -K
> 

