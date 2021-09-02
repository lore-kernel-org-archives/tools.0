Received: from mail-qk1-f176.google.com (mail-qk1-f176.google.com [209.85.222.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E5893FCD
	for <tools@linux.kernel.org>; Thu,  2 Sep 2021 20:14:05 +0000 (UTC)
Received: by mail-qk1-f176.google.com with SMTP id f22so3555030qkm.5
        for <tools@linux.kernel.org>; Thu, 02 Sep 2021 13:14:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=ixTX30XvueLFPWcEymTpw+oNGtw9pVJDawrMsiYcR3o=;
        b=ZDF1Ebwo1NEZgRzIT1bNXjbWWCQRaeC767QQVKoNKZ301CwMkhssr9431jhkPCKQ8S
         SP2J4MBDtXcuB3Hqu7bbttkfkQEpd1Qongx83aiciFradkeSeCPN/zWPQGJVhx9V3ED4
         SZW0Gvkxkg3ongTA1FLGFn9HWNp2EQdGvOnM0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=ixTX30XvueLFPWcEymTpw+oNGtw9pVJDawrMsiYcR3o=;
        b=iIMSltxVKw0o7FMRYJu4+ITLa/PoqJXzUbbAmMBimfBQBgiaIwmduHU0s32y1hQXb7
         75wjibjUeNX7wv/Nq8L3fuHZQcmYaf3OnRh0DJvcclhMhgv8NeTwTmAbuVYxl2VjVw0i
         Kh1JUrOL3wnwRRhutNwz4t1GoPwRgQ+XlXdY4J+4+mdpR/kxJflCXYmWzCies2icd023
         zJOr9aOQQ8V5zkfqA5tRyKh8BDgWYMRU591AWVCfP2EgrdOMAvkWVaPlj0X9Cw525OjU
         RnTEIw0dbuALrhpl3pvHuze32qwzz3hTdFRjRp1GVgnn/5fC3A8jdDUwgx5dZ2CNgAd1
         yMfw==
X-Gm-Message-State: AOAM530Fy82Pw09sDnxeTHEYznkUJZQNjRQ+KbOsNR9mNpAsBYQ/eX/u
	R7hkUzgEF+xVzbqgVpWazkyZDg==
X-Google-Smtp-Source: ABdhPJwa8nTrpICzYUT2t73U05ikT3ymdK8Du+FzpUoka+OSQTHDAmhYCZVujcx0EB9VFegMgK70rQ==
X-Received: by 2002:a05:620a:1529:: with SMTP id n9mr5012891qkk.322.1630613644131;
        Thu, 02 Sep 2021 13:14:04 -0700 (PDT)
Received: from meerkat.local (bras-base-mtrlpq5031w-grc-32-216-209-220-181.dsl.bell.ca. [216.209.220.181])
        by smtp.gmail.com with ESMTPSA id g8sm2208498qkm.25.2021.09.02.13.14.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Sep 2021 13:14:03 -0700 (PDT)
Date: Thu, 2 Sep 2021 16:14:02 -0400
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: users@linux.kernel.org, tools@linux.kernel.org
Subject: Re: New version of lore available for preview
Message-ID: <20210902201402.bbdttirbb5ckrtiz@meerkat.local>
References: <20210818190750.g3xedu7j24sqndo2@nitro.local>
 <20210902195332.GA2493828@nvidia.com>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20210902195332.GA2493828@nvidia.com>

On Thu, Sep 02, 2021 at 04:53:32PM -0300, Jason Gunthorpe wrote:
> > Please report any problems or hiccups that you discover. There is no specific
> > ETA for the new version go-live, but if all goes well, the hope is to have it
> > in place by end of August.
> 
> Hi Konstantin,
> 
> The https://lore.kernel.org/lists.txt URL now gives a 404, is this
> expected?
> 
> If so does someone have a fix for lorifier.py? It is very unhappy to lose
> this URL..

I forgot about the lorifier. However, the upside is that you don't really need
the lists.txt URL any more, as you can just blanket aim things at
lore.kernel.org/all/<message-id> -- if it's on lore, it will be there.

I pushed a quick fix here:
https://github.com/mricon/lorifier/

If you really want to only show the link if a message is actually on lore,
it's easy to add a HEAD call to see if we get a 404 or not, so let me know if
it's something you'd need.

-K
