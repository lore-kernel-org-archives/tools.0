Received: from mail-qt1-f177.google.com (mail-qt1-f177.google.com [209.85.160.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C92462C96
	for <tools@linux.kernel.org>; Tue, 19 Oct 2021 16:30:08 +0000 (UTC)
Received: by mail-qt1-f177.google.com with SMTP id n2so494296qta.2
        for <tools@linux.kernel.org>; Tue, 19 Oct 2021 09:30:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=LoLMFyMBaDM8pQgyXtwSp4lAx0r5DqB/3lfB7X5ilTM=;
        b=E/y7sMEeZUL3wrhMM9R3AGHcoAjI+uDTVC/Jiqdw8mCd5sNpKGW20ftz0RVdFNQ5kQ
         LPoX4oDp5I9YiZ0sjkKj75L8Rfblx+sDQkt8hh/LeF3p9qqO+jHvP4L0KLDFqeE09Wzh
         72S4AQevuiaVTkRHTnsPwE11EeWkhVpt6vMqs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=LoLMFyMBaDM8pQgyXtwSp4lAx0r5DqB/3lfB7X5ilTM=;
        b=thUNbbdAfBDGpxsrXC8rOYC9kwh0dftW6UY0ePn3G5q63TOTJuQY4yxYrkUJs7Tw0H
         sPUlZvRcb0q7DoWA6bhygcnBMVmPZpaZVmoO2cbmF0397wWpwmbfRvpv1/aabi7/rT3c
         9wOeWHQkVP4sd5Z+vopQELhRe/dUTtWO9NHtyIBLEyH9YqiJK6agNWIgiDj02zJU9jPY
         7iivpM5Ri3Jl2hqQNE+QfW+jdGoG9g584hbCcMcEQ1VV5fmcsAgGCqpnHLhxp76rZDHx
         oH+uueIIXsa39KQlkFnv6Hj72kHGMEPvn3up/ftSiNodPFNTMuFbo/5pCz7ELoMDnK/u
         +Hhg==
X-Gm-Message-State: AOAM530g/BeJ4OR9Y6uwiCnivTPPw2vYFhkRNcs+2HUvlAeoHIhPm+9P
	Is0/b1f8sdjQON9m5Z1iJb4C2g==
X-Google-Smtp-Source: ABdhPJw83wYnPNIiRQAvYzFRCDRFv2VjIyCgCEwDLP5urVEM0ZPDeo7wn1vX9RmrwfUISjhn/DBrQQ==
X-Received: by 2002:ac8:57c9:: with SMTP id w9mr1104353qta.254.1634661007731;
        Tue, 19 Oct 2021 09:30:07 -0700 (PDT)
Received: from meerkat.local (bras-base-mtrlpq5031w-grc-32-216-209-220-181.dsl.bell.ca. [216.209.220.181])
        by smtp.gmail.com with ESMTPSA id k8sm7270923qth.2.2021.10.19.09.30.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Oct 2021 09:30:07 -0700 (PDT)
Date: Tue, 19 Oct 2021 12:30:05 -0400
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: Rob Herring <robh@kernel.org>
Cc: tools@linux.kernel.org, users@linux.kernel.org
Subject: Re: b4: introducing b4 shazam (like b4 am -o- | git am)
Message-ID: <20211019163005.efymrn3gix6edtv5@meerkat.local>
References: <20210921202526.mk2meetobbtl3tvi@meerkat.local>
 <CAL_JsqK0+f_QPiYr6hv1dVoNT7qJspmjDW6hg0HUcfctpTo22Q@mail.gmail.com>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CAL_JsqK0+f_QPiYr6hv1dVoNT7qJspmjDW6hg0HUcfctpTo22Q@mail.gmail.com>

On Tue, Oct 19, 2021 at 09:49:57AM -0500, Rob Herring wrote:
> I get a splat due to my multiple worktree setup:

Yes, I was expecting this not to play quite well with pre-existing worktrees.
Thanks for the report.

> I just sent a patch to fix it.

Will apply, thanks.

> '-A' worked fine. Can we make this a configuration value with
> enable/disable override instead? I kind of expect users will use this
> mostly one way or the other rather than decide per patch series. Sure,
> I could wrap that in a script, but so could I with "b4 am -o- | git
> am".

Yes, I am leaning towards "git shazam" without any flags being the equivalent
of "apply to current tree" (i.e. -A behaviour becomes the default), and the
FETCH_HEAD magic will only work with another flag (-H|--make-fetch-head,
probably).

Thanks,
-K
