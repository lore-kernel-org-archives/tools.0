Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F31E53C00
	for <tools@linux.kernel.org>; Mon, 31 Oct 2022 17:37:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1667237865;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=LbXFFKbbsf9Zr9GNMfn1Y11G0KB/LuRSATTiS6oErG4=;
	b=iEZwh8WeROJlG+0w806SDJF6rMJtkxwWmxR4oTgKcdxFO2wWziSNiy9+3Wl9mLlmYEY54P
	1A6CbM2PsZlwSRxGR0jUQ7YUumnOAAfTdZ4gZt/IvdOKyb5Nl2hf1Dv/dDT9e6sYVHeMH0
	y/fBDA8qmj3ck4Lkpu8OwsjcPeCBbg0=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-479-npmMkfYeMZGwBIM2kh6wSw-1; Mon, 31 Oct 2022 13:37:44 -0400
X-MC-Unique: npmMkfYeMZGwBIM2kh6wSw-1
Received: by mail-wr1-f70.google.com with SMTP id d23-20020adfa417000000b002364a31b7c9so3268215wra.15
        for <tools@linux.kernel.org>; Mon, 31 Oct 2022 10:37:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LbXFFKbbsf9Zr9GNMfn1Y11G0KB/LuRSATTiS6oErG4=;
        b=jcYVihQPJnTIlIm6h1NlKhS/uyuFeBsMJsZ5tsS+XEQgh9VOtlAB6lRgApexLiPIbP
         DozYU3RA4BE1clYQ1jyaAz8EFRyxyJTawJU6hnTNG9T1EhJo4eUODru3XLtDEpFXEx+w
         YaikZuYyHrabwS3XViztwe/3Lngoy0hQu1SN+cfJcWmNd2dfGWFkzaSnfb1sisM62yCO
         zebIWYp091Bn1zAV5oGvWuX037cdFfwtZ7efm0a0x/FugeuSBIhYUVt739ljs+gTf6Y2
         frPZdO/y4Y9FUC4/tNZ5YrodyGT/f1GxFnRM2iI6HzL4q7Bq4YNd7n30n7cTgL15p1XG
         EovA==
X-Gm-Message-State: ACrzQf3HSNTI+DkY/eihTCG/IZqd5Nr78/zwRnjyIvPZvHal9FNBOnUx
	w2JnSCaHN/JopbMeorHNxztshheOmll1P4RSIvdb5Do3Y5a3VPES9x6P291OyUh0etO9d4N9Rpg
	u8kS0u2qi9V9F6ZkS
X-Received: by 2002:adf:ec8a:0:b0:236:5b80:da83 with SMTP id z10-20020adfec8a000000b002365b80da83mr8642963wrn.509.1667237863493;
        Mon, 31 Oct 2022 10:37:43 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM729CTorTP4Cvche4nr8oAHq6fJnrRN5oJsfWOBzJCoH3826RCXbRAsB+qdBz+5SWNXedkMBA==
X-Received: by 2002:adf:ec8a:0:b0:236:5b80:da83 with SMTP id z10-20020adfec8a000000b002365b80da83mr8642939wrn.509.1667237863175;
        Mon, 31 Oct 2022 10:37:43 -0700 (PDT)
Received: from redhat.com ([2.52.15.189])
        by smtp.gmail.com with ESMTPSA id jb1-20020a05600c54e100b003c6b874a0dfsm8369308wmb.14.2022.10.31.10.37.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Oct 2022 10:37:42 -0700 (PDT)
Date: Mon, 31 Oct 2022 13:37:39 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, Lee Jones <lee@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	tools@linux.kernel.org, users@linux.kernel.org
Subject: Re: DCO chain of custody revisited (was Re: [PATCH v4 08/11] mfd:
 qcom-pm8xxx: drop unused PM8018 compatible)
Message-ID: <20221031133130-mutt-send-email-mst@kernel.org>
References: <20220928-mdm9615-dt-schema-fixes-v4-0-dac2dfaac703@linaro.org>
 <20220928-mdm9615-dt-schema-fixes-v4-8-dac2dfaac703@linaro.org>
 <Y1/qnCyav/S35mRo@google.com>
 <6858acf3-eb90-41aa-b714-a2ceb6afe9db@linaro.org>
 <20221031165842.vxr4kp6h7qnkc53l@meerkat.local>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
In-Reply-To: <20221031165842.vxr4kp6h7qnkc53l@meerkat.local>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Oct 31, 2022 at 12:58:42PM -0400, Konstantin Ryabitsev wrote:
> Hijacking this thread for greater good.
> 
> On Mon, Oct 31, 2022 at 04:35:38PM +0100, Neil Armstrong wrote:
> > Hi,
> > 
> > On 31/10/2022 16:32, Lee Jones wrote:
> > > On Fri, 21 Oct 2022, Neil Armstrong wrote:
> > > 
> > > > The PM8018 compatible is always used with PM8921 fallback, so PM8018
> > > > compatible can be safely removed from device ID table
> > > > 
> > > > Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> > > > Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
> > > 
> > > Tags should appear chronologically.
> > 
> > Indeed, they were added by b4, I'll report this.
> 
> My trouble is that there are seemingly as many opinions about the order of
> trailers as there are subsystem maintainers. The last time we had a long
> discussion about this on the users list I got a strong message that what
> matters most is the chain of custody, and the Signed-off-by trailer indicates
> the chain of custody boundary.
> 
> In the scenario below, the chain consists of 3 people:
> 
> | Suggested-by: Reporter 1 <...>
> | Signed-off-by: Developer 1 <...> -- initial DCO boundary
> | Reviewed-by: Reviewer 1 <...>
> | Tested-by: Tester 1 <...>
> | Signed-off-by: Submaintainer 1 <...> -- intermediate DCO boundary
> | Acked-by: Submaintainer 2 <...>
> | Signed-off-by: Maintainer 1 <...> -- final DCO boundary
> 
> In terms of DCO, this makes the following claims:
> 
> Developer 1:
>  - I am responsible for this change
>  - It was suggested by Reporter 1
> 
> Submaintainer 1:
>  - I am signing off on this change
>  - I have collected the trailers from Reviewer 1 and Tester 1
> 
> Maintainer 1:
>  - I am signing off on this change
>  - I have collected the trailer from Submaintainer 2
> 
> In the current case, and using this principle, the following order is correct:
> 
> | Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> | Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
> 
> Because the Reviewerd-by trailer was sent to the v2 of the series and was
> collected by Neil, so Neil is the person who is the DCO signatory of that
> chain of custody in the v4 of the series.
> 
> I assume that in the final commit Lee rearranged the tags in the following
> order:
> 
> | Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
> | Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> | Signed-off-by: Lee Jones <lee@kernel.org>
> 
> This would indicate that it's *Lee* who is claiming responsibility for
> collecting the Reviewed-by tag from Krzysztof, because it is in his chain of
> custody. However, this is not the case -- it was Neil who collected the tag,
> and therefore the "more correct" order should be:


I think this is often incorrect:
I often pick a patch, then amend it adding tags from reviewers,
typically I add tags at the end just because it's easier,
and tools like git-interpret-trailers exist.

> | Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> | Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
> | Signed-off-by: Lee Jones <lee@kernel.org>
> 
> If my reasoning is incorrect, then I need to go back to the drawing board.
> 
> -K

