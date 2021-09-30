Received: from mail-qt1-f180.google.com (mail-qt1-f180.google.com [209.85.160.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DA89168
	for <tools@linux.kernel.org>; Thu, 30 Sep 2021 14:45:52 +0000 (UTC)
Received: by mail-qt1-f180.google.com with SMTP id d8so5885888qtd.5
        for <tools@linux.kernel.org>; Thu, 30 Sep 2021 07:45:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=7A6dw2gnZxv+Xw9hLi1LHmdHKuudOcNyOktfm+fSzdk=;
        b=DFwnyFyw/ZnL0MxnjHxDzdOMZ42dwFsvw6YelIVMT2a1RxFrfkmYf4qudX5sZVfta7
         CJOhT7V9CvEaLeVRlQO8mldO3tCPYWGV314Bc5y3vjFU2eG2xU22X2/3LyWtpqUeP/mp
         kkahTlDEKbD8t229bTcIq4afYYEVuegoXTxpk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=7A6dw2gnZxv+Xw9hLi1LHmdHKuudOcNyOktfm+fSzdk=;
        b=4V4xhpNBv91iZVQPdKGPURkqSDc9+TfaF5NsaozV3oF3AiKQzavDwB/1OKkXZwT1fv
         iaDrucDJ9JYxfsCF+oRXGt460okpaZkLLjzaftNSVKSPn03P3i21LvTk7gfsg7qw8bSU
         fsKAbpslF4p+D8d/syQkbXoClQ/F4xAPxmZ9p27uKRvkoL6sXXeGqWjiAhIIk1JJ0I8p
         6WeYCDrqEs2KwwA4n3tUjkbNZyaxGqBEHB6XxzVaHugst3TUEtFgAVORU8HEnzItfks6
         ceraMToroO7iXtVSof5ijIUg6EM8iZXsWL59WcaQsSkw6cV46HXX3i9xQPKmlYHXUEFu
         OWzg==
X-Gm-Message-State: AOAM5313Ma/CWk1GKeTI0cRcFdizKmTKT9bajPOXQw+8GcBGDkWuxeVV
	oCuPLAC4aoYDliaPDSIK/ATCzhmJqszqBA==
X-Google-Smtp-Source: ABdhPJx1la8+FZA/6L355JzkCThIkAUK63s0Z1DUYs5x6dP/Kd1P7EhARUYB3fORUUhqqy77U2rwiQ==
X-Received: by 2002:a05:622a:190a:: with SMTP id w10mr6756751qtc.300.1633013151379;
        Thu, 30 Sep 2021 07:45:51 -0700 (PDT)
Received: from nitro.local (bras-base-mtrlpq5031w-grc-32-216-209-220-181.dsl.bell.ca. [216.209.220.181])
        by smtp.gmail.com with ESMTPSA id p201sm1595074qke.27.2021.09.30.07.45.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Sep 2021 07:45:50 -0700 (PDT)
Date: Thu, 30 Sep 2021 10:45:48 -0400
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: Jason Gunthorpe <jgg@ziepe.ca>
Cc: tools@linux.kernel.org, users@linux.kernel.org
Subject: Re: b4: introducing b4 shazam (like b4 am -o- | git am)
Message-ID: <20210930144548.z6gxm2g3jlwfu4zq@nitro.local>
References: <20210921202526.mk2meetobbtl3tvi@meerkat.local>
 <20210922173803.GV3544071@ziepe.ca>
 <20210922182154.zqtuvmcsjd4ivfgp@meerkat.local>
 <20210928174653.GH3544071@ziepe.ca>
 <20210929211827.5yvedlfq3bia2pk7@meerkat.local>
 <20210929233053.GE3544071@ziepe.ca>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20210929233053.GE3544071@ziepe.ca>

On Wed, Sep 29, 2021 at 08:30:53PM -0300, Jason Gunthorpe wrote:
> I would suggest a template:
> 
> Merge patch series "<cover letter subject>"
> 
> David Hildenbrand <david@redhat.com> says:
> ====================
> <over letter body>
> ====================
> 
> * mailing-list:
>    [..]
> 
> Link: http..
> Signed-off-by: ..
> 
> As a possible starting point?

Okay, the latest master allows for some minor templating and will use the
proposed netdevy format as the default. Since Signed-off-by can be added by
the git-merge command itself, I'm not adding it into the template unless
I can think of a good reason to do so.

I'm also skipping the mailing-list suggestion, as patches are routinely sent
to any number of lists, so that's bound to be a crowded section.

-K
