Received: from mail-qk1-f175.google.com (mail-qk1-f175.google.com [209.85.222.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18BB533C9
	for <tools@linux.kernel.org>; Mon, 31 Oct 2022 17:23:22 +0000 (UTC)
Received: by mail-qk1-f175.google.com with SMTP id o28so5364915qkl.4
        for <tools@linux.kernel.org>; Mon, 31 Oct 2022 10:23:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=1rz0a2doZdvU91YjzwCNpOIsVC3MU4dRyTheN6uFkBg=;
        b=T4aP/xhBt9WQa+i1RMd+CwZ49rObr2IHFnlwoEIg9U+nSbs/+kalmfVzt8FjRKKFR/
         eX9rarLtSHoxNUuUcjh1U3qICm7bIpGOnv7DpayC337Sp/K4PgCkdL+Btyh7uu13iE9b
         puD7/PD1YKQ7fFHFRv5KcoOG8ttMCzBEstEuk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1rz0a2doZdvU91YjzwCNpOIsVC3MU4dRyTheN6uFkBg=;
        b=g85VQG4SMuindLn8eBN/3CEZEDjzsbvunNNYocadj1+AVxcZ/+hDhPCjgZ1+J0EmQQ
         TP4G+xttJdTUDlenRX8UUw6MRTjLDRO4LyPZ2R5pDhC0VAzAYqQ8DJzdKHYrC0PR6Rz1
         LK4pSEb3/5FiGgAIQH8Mg3ZKkiQVlFdCHcummpEiFJq7kIh+3JyFqUONoJ/uIQbwmNOY
         fwVBkuPxHz27HAFW+In+vo0LWUzG3CiZNJJXJL9cR/p5uoVgx+mS6spX3bh9efhQLWZ9
         dJ7/zI2KKCGpraT30VvMp0Y/JOF9mH5jrpcYApxGtGLd7wRO8iqLwLwZYRl12NmeBm4b
         3/Bw==
X-Gm-Message-State: ACrzQf1cb1HqleUjQO30cWPhkOWVdAL5BZgcgwbI2a1yqWgtHd/fwl6+
	nSiHbFOugn7ZJ7y9SLopIqS0gw==
X-Google-Smtp-Source: AMsMyM51R9FfUomGSJgX7WlqdKYlB2DEJd0sE9xhPEKsSmVz2mYa42uGVvtwxBqnKyJ7VRc6uwkCLA==
X-Received: by 2002:a05:620a:132a:b0:6fa:2050:4042 with SMTP id p10-20020a05620a132a00b006fa20504042mr6935979qkj.485.1667237001986;
        Mon, 31 Oct 2022 10:23:21 -0700 (PDT)
Received: from meerkat.local (bras-base-mtrlpq5031w-grc-33-142-113-79-147.dsl.bell.ca. [142.113.79.147])
        by smtp.gmail.com with ESMTPSA id l8-20020a05620a28c800b006fa2cadf1efsm2431817qkp.68.2022.10.31.10.23.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Oct 2022 10:23:21 -0700 (PDT)
Date: Mon, 31 Oct 2022 13:23:19 -0400
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: James Bottomley <James.Bottomley@hansenpartnership.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, Lee Jones <lee@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	tools@linux.kernel.org, users@linux.kernel.org
Subject: Re: DCO chain of custody revisited (was Re: [PATCH v4 08/11] mfd:
 qcom-pm8xxx: drop unused PM8018 compatible)
Message-ID: <20221031172319.znosu3gleyipeje5@meerkat.local>
References: <20220928-mdm9615-dt-schema-fixes-v4-0-dac2dfaac703@linaro.org>
 <20220928-mdm9615-dt-schema-fixes-v4-8-dac2dfaac703@linaro.org>
 <Y1/qnCyav/S35mRo@google.com>
 <6858acf3-eb90-41aa-b714-a2ceb6afe9db@linaro.org>
 <20221031165842.vxr4kp6h7qnkc53l@meerkat.local>
 <7b25ea15b6e508f435ca36967d9f4d4408f9a690.camel@HansenPartnership.com>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <7b25ea15b6e508f435ca36967d9f4d4408f9a690.camel@HansenPartnership.com>

On Mon, Oct 31, 2022 at 01:10:58PM -0400, James Bottomley wrote:
> > > Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
> > > Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> > > Signed-off-by: Lee Jones <lee@kernel.org>
> > 
> > This would indicate that it's *Lee* who is claiming responsibility
> > for collecting the Reviewed-by tag from Krzysztof, because it is in
> > his chain of custody. However, this is not the case -- it was Neil
> > who collected the tag, and therefore the "more correct" order should
> > be:
> > 
> > > Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> > > Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
> > > Signed-off-by: Lee Jones <lee@kernel.org>
> > 
> > If my reasoning is incorrect, then I need to go back to the drawing
> > board.
> 
> You're way over thinking this.

Yes, but it's my job to overthink this, so nobody else has to. :)

> The only tag that matters from the DCO point of view is Signed-off-by.
> That's the ordering we care about for the chain of custody.  All other tags
> are irrelevant.  Of course, it's nice to think that reviews happen *after*
> the code was modified, which is why most of us like to see the Reviewed-by
> after the initial author signoff,

But this is where it becomes complicated. The Reviewed-By trailer was sent to
the v2 of the series, and incorporated into v3(via b4 trailers). If we stick
it below Signed-off-by, then it may suggest that Krzysztof reviewed the v4 of
the patch.

By placing it above the Signed-off-by line, we at least clearly indicate that
it's Neil who put it there.

-K
