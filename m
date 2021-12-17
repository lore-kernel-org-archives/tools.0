Received: from mail-qt1-f170.google.com (mail-qt1-f170.google.com [209.85.160.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F413E168
	for <tools@linux.kernel.org>; Fri, 17 Dec 2021 16:17:46 +0000 (UTC)
Received: by mail-qt1-f170.google.com with SMTP id 8so3110943qtx.5
        for <tools@linux.kernel.org>; Fri, 17 Dec 2021 08:17:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=v7aKV1a60qqcqAeC5kd4Zj4WPti8/bsbrznrKdhPgpw=;
        b=hpqoyBr6rrenlpP6nEZMbz9RaowyaS/4AtXlJ2LFrYDMH0EXoyzzwZ1XsGaj0zdbM8
         FWnzz2x54uT81ujbG035TioXOgA+gobqZmvh7mxY8dq4TciaZxWJYzqynm1b2OGRokKk
         vn8O0YW+yHC991HvyPXMQ0JzOjh39WrffrBMU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=v7aKV1a60qqcqAeC5kd4Zj4WPti8/bsbrznrKdhPgpw=;
        b=Hq1pumENVUNV0hWUcHveai8COVdRgHcRS/9G/2JjbwkizppUYtEnILsg/IgunJPLau
         6GSlbPP69XVWzYP4OPzkjGZRhecGWAUtFznamu0uxprhvDyFJWv6zLJEcCAJVQpKf2r7
         Xcupo0HFG6QDM5U7TfkjORefZ8BciYuAi72pXqynyTO4EqW1uvV+tC/dF/8bWwXzM2JM
         Z20m+ukBLtptXqRZOE8tbony+iO38h9DqmDFg5fZvJ5pX7n04Ya6NN11z9KvNZs1AIZF
         PSTkpFIZ5Tzyn7UjF4QWR3oz2AwUqjIY69T+5+60gTspn92W1y2+fJ92bTityc/iSA0V
         0KjA==
X-Gm-Message-State: AOAM531gRjpQtQJtf0+uten9uWol/B3pP3/lBKsVyGGJCGJNC9+MBvw3
	ZssJmwD5xj4SRcPZ9X0DjNfuw6toCC72wQ==
X-Google-Smtp-Source: ABdhPJwqvilFbs0MaG1lZldth+tAlL/QDpuuvKAAWfk5rIrljIpL+7p8nNBPO27yRetciYjPO23gzQ==
X-Received: by 2002:a05:622a:40e:: with SMTP id n14mr3019571qtx.368.1639757865892;
        Fri, 17 Dec 2021 08:17:45 -0800 (PST)
Received: from meerkat.local (bras-base-mtrlpq5031w-grc-32-216-209-220-181.dsl.bell.ca. [216.209.220.181])
        by smtp.gmail.com with ESMTPSA id c20sm4897881qkj.119.2021.12.17.08.17.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Dec 2021 08:17:45 -0800 (PST)
Date: Fri, 17 Dec 2021 11:17:44 -0500
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: Kees Cook <keescook@chromium.org>
Cc: tools@linux.kernel.org
Subject: Re: [PATCH 1/2] patchwork-bot: Ignore empty context lines
Message-ID: <20211217161744.rxvsw2wwqzseowao@meerkat.local>
References: <20211202233836.2024510-1-keescook@chromium.org>
 <20211202233836.2024510-2-keescook@chromium.org>
 <202112161410.FCEC1C1189@keescook>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <202112161410.FCEC1C1189@keescook>

On Thu, Dec 16, 2021 at 02:11:08PM -0800, Kees Cook wrote:
> > $ MSGID=20210911102818.3804-1-len.baker@gmx.com
> > $ wget -qO- https://patchwork.kernel.org/project/linux-hardening/patch/$MSGID/raw/ | \
> > 	grep '^ $' | wc -l
> > 0
> > 
> > $ SHA=f11ee2ad25b22c2ee587045dd6999434375532f7
> > $ git diff ${SHA}~..${SHA} | \
> > 	grep '^ $' | wc -l
> > 2
> > 
> > Teaching patchwork-bot to ignore empty context lines allows pwhashes to
> > match in these cases, which lets those patches get located again.
> 
> With regard to the revert, do you not see the above problem with your
> repos? I'm working against the same patchwork. I guess there is some
> other root cause?

I'm curious if you have local git configs that affect your "git diff" output.
If you "export GIT_CONFIG_GLOBAL=/dev/null", does this make any difference to
your experience?

-K
