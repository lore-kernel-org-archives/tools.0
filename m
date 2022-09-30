Received: from mail-qv1-f44.google.com (mail-qv1-f44.google.com [209.85.219.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B1B62F2A
	for <tools@linux.kernel.org>; Fri, 30 Sep 2022 13:14:33 +0000 (UTC)
Received: by mail-qv1-f44.google.com with SMTP id ml1so2766072qvb.1
        for <tools@linux.kernel.org>; Fri, 30 Sep 2022 06:14:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:from:to:cc:subject:date;
        bh=oFgRdZyIzKVWolCoIOrA7r+gROHxg2hvwwM8mq/xoA8=;
        b=fynPmiUwelr/m/EIEBYGLd0+/ZZqEmonUDocKdKWfN9VgCdY/ctwUpoQA7Km4GTh77
         DFgdSSvHp8BkLhYXBjHFGvp8u271m/N1O4vDMBCafGOZLGuM+GjNMROAUFO4kICJXDNQ
         tyX3z4LQbJXdCLxve7j7JBhJcWtsU3Mg3yfIo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:x-gm-message-state:from:to:cc:subject:date;
        bh=oFgRdZyIzKVWolCoIOrA7r+gROHxg2hvwwM8mq/xoA8=;
        b=Vp4XukZePl7NoBh9M9B+JdIjI3W93KQ/PMcGVaE4BYx7wuozjZ73jsuarGcMxQedLz
         rxBBAjlDJ7+gkdEn0dBcgTSyz+tfO4I/wYPezaMYrpMrQSbCdsOL8m9mZgvxsrt4IfQF
         htPPSI7d7tzxspEcjMAJiuFp02gSmALzzmmJA3o3Q8KnMlClrMXjNZJLd2/SgVTsooIG
         sfAL0tg7B0HDarKWWyUrPKjwdmOqj5xk6tJP4Yxq1gJa3IcFXCHDULdfh+XQTkZsNNgk
         9s+P5d5uhMHqxH0okrYvH52O0StGspu4j5LYoEvXMS3a0SqQKg4OiVE/kV3df3qpvinu
         VMVw==
X-Gm-Message-State: ACrzQf0aNk2Th9hOl6ARPfdZ2P1tW+t++5NNOMJpfRe3Aw2HyPcXJpSH
	bE5K+EzNTLxPZod79ED6ou9fHm2QVJgoFg==
X-Google-Smtp-Source: AMsMyM5JHSnNzLmvXtoqsA3uGQqCnC56G/X/6/R6I0q1OOxsb7/cNNgWW9FAHw25ocY+iCTadzIDcQ==
X-Received: by 2002:a05:6214:20e3:b0:4a7:618d:44d8 with SMTP id 3-20020a05621420e300b004a7618d44d8mr6528207qvk.47.1664543672105;
        Fri, 30 Sep 2022 06:14:32 -0700 (PDT)
Received: from meerkat.local (bras-base-mtrlpq5031w-grc-33-142-113-79-147.dsl.bell.ca. [142.113.79.147])
        by smtp.gmail.com with ESMTPSA id i10-20020ac8764a000000b0031f41ea94easm1953900qtr.28.2022.09.30.06.14.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Sep 2022 06:14:31 -0700 (PDT)
Date: Fri, 30 Sep 2022 09:14:30 -0400
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: Marijn Suijten <marijn.suijten@somainline.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	linux-kernel@vger.kernel.org, tools@linux.kernel.org
Subject: b4 prep range-diff (was Re: [PATCH v4 1/5] dt-bindings: mfd:
 qcom-spmi-pmic: Add pm6125 compatible)
Message-ID: <20220930131430.djqv7brsxgkfoebx@meerkat.local>
References: <20220926190148.283805-1-marijn.suijten@somainline.org>
 <20220926190148.283805-2-marijn.suijten@somainline.org>
 <052630d0-299e-e468-b2dd-266d371e2b0f@linaro.org>
 <20220928081055.p66huqct2wnrsrdx@SoMainline.org>
 <3f2e62f5-a6e4-7011-3f5b-29a6657eae79@linaro.org>
 <20220928082340.mkn23ersrtzb5oth@SoMainline.org>
 <2bd60261-a977-3225-8d41-4987252e6abb@linaro.org>
 <20220928154437.if3x2zf5yozhy5kt@meerkat.local>
 <20220930123118.nkmajihodvxgqdvw@SoMainline.org>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20220930123118.nkmajihodvxgqdvw@SoMainline.org>

On Fri, Sep 30, 2022 at 02:31:18PM +0200, Marijn Suijten wrote:
> > FYI, it can do just that using "b4 trailers -uF [msgid]". See:
> > https://b4.docs.kernel.org/en/stable-0.10.y/contributor/trailers.html
> 
> That's super cool and will save a lot of time.  I'll also have to get
> accustomed to `b4 prep` and `b4 send`, though typically prefer to look
> at the `diff` between two `format-patch` revisions to make sure the
> changelog is complete and no erratic changes made it in.

(Dropping most people from CCs and adding the tools list.)

Hmm... Yes, we can do this, since we keep previously sent revisions tagged in
the tree. Something like:

    b4 prep --compare v3

to show you a range-diff between v3 and the current revision.

-K
