Received: from mail-qv1-f51.google.com (mail-qv1-f51.google.com [209.85.219.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98AD371
	for <tools@linux.kernel.org>; Fri, 14 May 2021 20:37:36 +0000 (UTC)
Received: by mail-qv1-f51.google.com with SMTP id r13so298009qvm.7
        for <tools@linux.kernel.org>; Fri, 14 May 2021 13:37:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=t2yrKF4y5KvpJnE9/kGtKSIT/5B4OUOIOoHt8neZiSE=;
        b=XXENFOPL2IhzErZ9UeHoiNFtjpxzz9DF7dgRVZszS8fGLdpn7wLC8DVISU1fYW2GUL
         b87I6wYabD3jEkoJ06SwLCYpyS038VThjVAaRCLG3aR7h25/VmE4XUnTWL5P3+tKyuj1
         /aneYy2WYtlxih9N7XMqZEH7CWYOLHjdOQCoc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=t2yrKF4y5KvpJnE9/kGtKSIT/5B4OUOIOoHt8neZiSE=;
        b=WVe5QiQP/GZrzvLPrarWmGlbY2ZFoNAwyUqUemlgg2hFTUzYKQgeRtcpZouPF6rIcm
         n9r6d6lPnYPNZCymhOGaW/wGC6PcjdgoUZJi9DVIWfGCN3E7fJBE06hzAZpztD3S4NhA
         FmwS+kC5sNpo9SrhYwSWz6etSxliKs4aWy6pSo3BDRq4j/fCH9dKiV0fqW7uuSgvJvEI
         5y/xqegIYj4v3htmZ3OA0jDjXBhNa0ILLS3AsyNWMkebafBYoYD3cxsIAr0o3sq+KXEM
         mcjA2Y6he0CuPCFC0MU5uvEGXeoeShtXyGuACVRbs4+Xa7C9v0TvogfdyoQ95+Z6Ifu3
         cUyg==
X-Gm-Message-State: AOAM530qDnhnqKf+0B15wleQcL9eDH18PELhGnT0Wt4CtHk433UtH6TN
	cxfSu+A+w1kTfZB5AOBizB28zBPHrPk6u62j
X-Google-Smtp-Source: ABdhPJwvkaI4BXChWMgVuN+1XZeRMLLms6UdLFkTLedtdOgCwpFn9Sa/D0Deg0N9kpp4y4YJ8/7sBA==
X-Received: by 2002:a0c:f00d:: with SMTP id z13mr48502963qvk.0.1621024655539;
        Fri, 14 May 2021 13:37:35 -0700 (PDT)
Received: from meerkat.local ([89.36.78.230])
        by smtp.gmail.com with ESMTPSA id s190sm5544006qkc.40.2021.05.14.13.37.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 May 2021 13:37:35 -0700 (PDT)
Date: Fri, 14 May 2021 16:37:33 -0400
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: Kyle Meyer <kyle@kyleam.com>
Cc: tools@linux.kernel.org
Subject: Re: [PATCH b4] Delay dns.resolver.get_default_resolver call
Message-ID: <20210514203733.h4dlub7vvpu2x3jr@meerkat.local>
References: <20210208040722.31203-1-kyle@kyleam.com>
 <87fszji4pb.fsf@kyleam.com>
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <87fszji4pb.fsf@kyleam.com>

On Wed, Apr 21, 2021 at 07:43:44PM -0400, Kyle Meyer wrote:
> Kyle Meyer writes:
> 
> > When b4.attestation-policy is 'off', calling `b4 am` with
> > --use-local-mbox is conceptually an offline operation, but it still
> > requires being online because get_default_resolver() is called at the
> > top-level of b4/__init__.py.
> >
> > Support offline operation by delaying the call to
> > get_default_resolver() until it's needed.  Note that
> > get_default_resolver() already caches the result, so there's no need
> > for b4 to store the result as a global variable on its end.
> 
> Any thoughts on this patch?

Kyle:

I reworked the current 0.7-dev version to remove the little hacks for caching
that I added. I'm comfortable with how the latest dns-python module is doing
it by default, so we just defer to it for doing whatever caching necessary.

This should allow it to be a fully offline operation again.

Thanks and best regards,
-K
