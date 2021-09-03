Received: from mail-qk1-f182.google.com (mail-qk1-f182.google.com [209.85.222.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D82A2FAE
	for <tools@linux.kernel.org>; Fri,  3 Sep 2021 15:21:46 +0000 (UTC)
Received: by mail-qk1-f182.google.com with SMTP id ay33so6117033qkb.10
        for <tools@linux.kernel.org>; Fri, 03 Sep 2021 08:21:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=nyOJ8OCxd2l8ZC6UHqkBsof8qYjxmIqb0wGgrM37Yko=;
        b=MWnGmIrnfoRo6cz8QGpPcd8nH+mumHNxeseThUXImZsEJrtXY2cjQqg+k/5An+6+ej
         86G9revSyrj3RK0pxxr5YLIGKFROft6QvJo9cCagrmoZFMHyYGhZRJiU6mjE0NBSWJ7Y
         x4Tvv7HxLNtGMzMbzx8LTyonjT44n+OS/k4lg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=nyOJ8OCxd2l8ZC6UHqkBsof8qYjxmIqb0wGgrM37Yko=;
        b=o+1d7rJq/DsoFiyKU+Uf0P1jBm8AEFRwEDwAG3JhHg73c4XjrgXRHFgqoco5oI2BVy
         dnZm/IfYF06SDPw+gu8lvWLFKR8xhXThqZW3Ye7uPwHJtXlceg2HasDzAan1zIJmuOYh
         86d3SyXSY6F32SvhuWURqxEQh6oKfKYVkhoszr8Bak8IIS15N2s2a+FZAR9f5RKV/Cts
         3rsbM+5gwnE6PCXERO4XfYfHPSq6m9vEja607y4dnjRBxzsWflBv2JhKwDO84iMSSPzB
         x8n5riHSstSIp32x8AGIFZdJ7dAP3DpwRX5fHdB/JvATX8KQL286WgO/b+BTh0aJOu9h
         zyng==
X-Gm-Message-State: AOAM530SWG4hZiJsUcnLppzshbLi//keGIsYFnYioXGYAQn4gQeKg1XX
	kMOV2udsKX+fxZqIgyhZDUcRAw==
X-Google-Smtp-Source: ABdhPJyeXVvSG4ZlukxJoe3Zn1LwKKfdlSxfhLqjH00vI8D9lR4mKvzbX24Y4tUrzvEkTzY425j6fQ==
X-Received: by 2002:a05:620a:1397:: with SMTP id k23mr3781597qki.380.1630682505216;
        Fri, 03 Sep 2021 08:21:45 -0700 (PDT)
Received: from meerkat.local (bras-base-mtrlpq5031w-grc-32-216-209-220-181.dsl.bell.ca. [216.209.220.181])
        by smtp.gmail.com with ESMTPSA id k186sm4066165qkd.47.2021.09.03.08.21.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Sep 2021 08:21:44 -0700 (PDT)
Date: Fri, 3 Sep 2021 11:21:43 -0400
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: Jason Gunthorpe <jgg@nvidia.com>, users@linux.kernel.org,
	tools@linux.kernel.org
Subject: Re: New version of lore available for preview
Message-ID: <20210903152143.nt5mzgwprltl36pa@meerkat.local>
References: <20210818190750.g3xedu7j24sqndo2@nitro.local>
 <20210902195332.GA2493828@nvidia.com>
 <20210902201402.bbdttirbb5ckrtiz@meerkat.local>
 <CAK7LNAQogtzDbAFDtRt7UvDkH6K4tkQgwfmu-2_0rGgo_Uj_iw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CAK7LNAQogtzDbAFDtRt7UvDkH6K4tkQgwfmu-2_0rGgo_Uj_iw@mail.gmail.com>

On Fri, Sep 03, 2021 at 07:44:35AM +0900, Masahiro Yamada wrote:
> I used to use
>   https://lore.kernel.org/patchwork/project/lkml/list/
> to pick up patches sent to LKML, but it is gone now.

As Mark has suggested, just use b4 to do the same. Running a patchwork
instance just for the purpose of retrieving a few patches was extremely
cost-inefficient, especially alongside the same functionality being offered by
public-inbox and b4.

You can install b4 from pypi (pip install b4), or you can clone the git
repository and use it straight from there:

https://git.kernel.org/pub/scm/utils/b4/b4.git

To retrieve a mbox file ready to be applied to a tree, you just need to know
the message-ID of the message (any message in the tread will do), and then
just run:

b4 am [that-message-id]

The output should tell you what to do next.

-K
