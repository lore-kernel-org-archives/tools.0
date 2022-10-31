Received: from mail-qv1-f47.google.com (mail-qv1-f47.google.com [209.85.219.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CD0433C8
	for <tools@linux.kernel.org>; Mon, 31 Oct 2022 16:58:45 +0000 (UTC)
Received: by mail-qv1-f47.google.com with SMTP id i12so8734465qvs.2
        for <tools@linux.kernel.org>; Mon, 31 Oct 2022 09:58:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=mio9EjUcwmKVpYskhiJVRxg19wxsVwwzVAVlGabDIJs=;
        b=JhMNJCn3FJtIvWXaMiQ4UJeDFJzHAeLD5jdbBcDGYqau0FdUBTnEolBcu4VV4HnaAr
         0hOX8pEMY83Yv654A6PcxgbKu0yTu9KaxoRKkITXKFsf8P7WuNvHPDIZ3kAb3mpYC3FG
         RjgPIPqTZDngGUKpn4nuUI9aZBvX3u5Ip4F2c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mio9EjUcwmKVpYskhiJVRxg19wxsVwwzVAVlGabDIJs=;
        b=nhS5G9U6CJS3n8SZXluPdQLSIfVmkHcFcT5z4dSyKTBEb3ceEiCGWV0HBhnuY6HRn3
         zMbDFM3WbLsoksJEZCNgsb5peYs+OHPK3OtfaPRNl4B77AFb0gTZeo8SDW73FbebmnqO
         RnuWk1jT9lIAgwt8oHbqv4A4JFwltTZEFug9A6HrUkImboe4Gn/bZyDpgVHjyF88lNuz
         4dyABzJABbxCbyw9JCTQEWVRvOI4PbGKBfdWH3d9Ty8xbCXci/O5sPII/przcSOxniqx
         r7G+IvbBtmRus9AFU/X9WkNAQKEaqq4i8uig8DPwwLH0KwwRNaItUUwk+48n63TIUQZm
         34Ow==
X-Gm-Message-State: ACrzQf2wRGrHwTF7EOX+JhXwOPjWqv42liqv4z9RGeiCaSEzJE5WkgDY
	G20XNpgSjSW2ZhbEO9CCHx83qg==
X-Google-Smtp-Source: AMsMyM6PcgcJQu3W6Rf8+ZnLLRJW0cyaysmRxxpYXXNBmBgb1VRJ34Tj6gKErSjlngA7MgVmOEHXYQ==
X-Received: by 2002:a0c:e651:0:b0:4bb:a726:3392 with SMTP id c17-20020a0ce651000000b004bba7263392mr11973773qvn.0.1667235524100;
        Mon, 31 Oct 2022 09:58:44 -0700 (PDT)
Received: from meerkat.local (bras-base-mtrlpq5031w-grc-33-142-113-79-147.dsl.bell.ca. [142.113.79.147])
        by smtp.gmail.com with ESMTPSA id g1-20020a05620a40c100b006cebda00630sm1278471qko.60.2022.10.31.09.58.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Oct 2022 09:58:43 -0700 (PDT)
Date: Mon, 31 Oct 2022 12:58:42 -0400
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: Neil Armstrong <neil.armstrong@linaro.org>
Cc: Lee Jones <lee@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	tools@linux.kernel.org, users@linux.kernel.org
Subject: DCO chain of custody revisited (was Re: [PATCH v4 08/11] mfd:
 qcom-pm8xxx: drop unused PM8018 compatible)
Message-ID: <20221031165842.vxr4kp6h7qnkc53l@meerkat.local>
References: <20220928-mdm9615-dt-schema-fixes-v4-0-dac2dfaac703@linaro.org>
 <20220928-mdm9615-dt-schema-fixes-v4-8-dac2dfaac703@linaro.org>
 <Y1/qnCyav/S35mRo@google.com>
 <6858acf3-eb90-41aa-b714-a2ceb6afe9db@linaro.org>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <6858acf3-eb90-41aa-b714-a2ceb6afe9db@linaro.org>

Hijacking this thread for greater good.

On Mon, Oct 31, 2022 at 04:35:38PM +0100, Neil Armstrong wrote:
> Hi,
> 
> On 31/10/2022 16:32, Lee Jones wrote:
> > On Fri, 21 Oct 2022, Neil Armstrong wrote:
> > 
> > > The PM8018 compatible is always used with PM8921 fallback, so PM8018
> > > compatible can be safely removed from device ID table
> > > 
> > > Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> > > Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
> > 
> > Tags should appear chronologically.
> 
> Indeed, they were added by b4, I'll report this.

My trouble is that there are seemingly as many opinions about the order of
trailers as there are subsystem maintainers. The last time we had a long
discussion about this on the users list I got a strong message that what
matters most is the chain of custody, and the Signed-off-by trailer indicates
the chain of custody boundary.

In the scenario below, the chain consists of 3 people:

| Suggested-by: Reporter 1 <...>
| Signed-off-by: Developer 1 <...> -- initial DCO boundary
| Reviewed-by: Reviewer 1 <...>
| Tested-by: Tester 1 <...>
| Signed-off-by: Submaintainer 1 <...> -- intermediate DCO boundary
| Acked-by: Submaintainer 2 <...>
| Signed-off-by: Maintainer 1 <...> -- final DCO boundary

In terms of DCO, this makes the following claims:

Developer 1:
 - I am responsible for this change
 - It was suggested by Reporter 1

Submaintainer 1:
 - I am signing off on this change
 - I have collected the trailers from Reviewer 1 and Tester 1

Maintainer 1:
 - I am signing off on this change
 - I have collected the trailer from Submaintainer 2

In the current case, and using this principle, the following order is correct:

| Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
| Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>

Because the Reviewerd-by trailer was sent to the v2 of the series and was
collected by Neil, so Neil is the person who is the DCO signatory of that
chain of custody in the v4 of the series.

I assume that in the final commit Lee rearranged the tags in the following
order:

| Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
| Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
| Signed-off-by: Lee Jones <lee@kernel.org>

This would indicate that it's *Lee* who is claiming responsibility for
collecting the Reviewed-by tag from Krzysztof, because it is in his chain of
custody. However, this is not the case -- it was Neil who collected the tag,
and therefore the "more correct" order should be:

| Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
| Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
| Signed-off-by: Lee Jones <lee@kernel.org>

If my reasoning is incorrect, then I need to go back to the drawing board.

-K
