Received: from mail-qv1-f43.google.com (mail-qv1-f43.google.com [209.85.219.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEE9023A6
	for <tools@linux.kernel.org>; Wed, 11 Jan 2023 22:00:10 +0000 (UTC)
Received: by mail-qv1-f43.google.com with SMTP id p17so11535964qvn.1
        for <tools@linux.kernel.org>; Wed, 11 Jan 2023 14:00:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=KEBmf4OeN8ERrgY7aiUD+rCxHUCfIzHrtMC5uMQuW+g=;
        b=ee4v5CCbwAeMa/R7r758Fzo9uY59VgwDKgFisD3YHkb6zXnNJqqpIJonnd5+Mq04Oj
         bHLOpwtXXWlzG2tID72XpCdovIMQVhgob11rbKYz3qsQVdSu49tssZyQ/7DlfNwI1Sc3
         ncpKIKSMJDGFVk/VsKLwdWoSJijOu3U0Ab/Fg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KEBmf4OeN8ERrgY7aiUD+rCxHUCfIzHrtMC5uMQuW+g=;
        b=t+7ZcO8rQD+nyJzfmSW3u+07Ff58w23LJ9nHHSBTzASG5sB+lKI2XGK2uGQa33zcSX
         tO+PqG6eQdKe9e+Mu6H8khW8iYFx2MSxR9vSwcpDi04WG8HRkBH/lVjeIrRNjoGTVikx
         TKQxAJ/1l/jdS63CmNIcFJKhvFytzfK4zZb/vnMp2bH6GOJzuq2vwKHRuLXrmahvPkJb
         rO7q3gBJ5epsSgR+/LlOrRP0Wvp4srJjq18RP6zBWTPQk76/m1Y2hSQ9TMRPCi269N1m
         YYcd4gXM/oA4opoSqnKetfHHApGWL9bDCGIXKmcG3WnPwQLOphA+VuaMozBxpb9MhDgD
         mI+g==
X-Gm-Message-State: AFqh2kqb40tc0/nglEd7igaUHWu3PmrHpQtEb9XWk0y3031NnX5bp2Lq
	0b7+4tjNLHk4NnT70UXsxA66cN4gtxn2AFxB
X-Google-Smtp-Source: AMrXdXsiWRYZE4b+0XuDNBbrI107Uv2FyxvrgXEWJVqkdlBoebrC8N/3rmEcSb6bqClGDYsFAOdtfQ==
X-Received: by 2002:a0c:90c5:0:b0:521:2df4:f467 with SMTP id p63-20020a0c90c5000000b005212df4f467mr141003018qvp.38.1673474409678;
        Wed, 11 Jan 2023 14:00:09 -0800 (PST)
Received: from meerkat.local (bras-base-mtrlpq5031w-grc-30-209-226-106-7.dsl.bell.ca. [209.226.106.7])
        by smtp.gmail.com with ESMTPSA id x30-20020a05620a0b5e00b00705cef9b84asm3136773qkg.131.2023.01.11.14.00.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Jan 2023 14:00:09 -0800 (PST)
Date: Wed, 11 Jan 2023 17:00:07 -0500
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: Vishal Verma <vishal@kernel.org>
Cc: tools <tools@linux.kernel.org>
Subject: Re: b4 prep -e oddness
Message-ID: <20230111220007.b5kjtmcvrq3tn7xj@meerkat.local>
References: <ad77e06d2cb9ba322abad4f27865d4d6f79f6644.camel@kernel.org>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <ad77e06d2cb9ba322abad4f27865d4d6f79f6644.camel@kernel.org>

On Wed, Jan 11, 2023 at 01:56:24PM -0700, Vishal Verma wrote:
> The problematic step seems to be:
> 
> $ git --no-pager merge-base --fork-point master new_branch
> 9652673e06ea84926e3be7c5cef0285c60fe31ff

I'm not sure it's problematic as much as it's just not something you're
expecting in this particular case. 

I did think that finding the actual fork-point would be useful, but I'm happy
to drop that if the expectation is that we're just looking for the best
merge-base, as opposed to the actual forking point.

> It looks like --fork-point uses the reflog, which has an entry for, I
> guess, a stale new_commit on master. (Maybe a gc will clean this up?)
> 
> Instead, if I did this (drop --fork-point and just do a vanilla merge-
> base):
> 
> $ git --no-pager merge-base master new_branch
> b7bfaa761d760e72a969d116517eaa12e404c262
> 
> This is what I'd expect (-rc3).
> 
> I'm not sure if switching to this breaks other expectations though?

No, this is literally up to what makes most sense. Do we always want to use
the actual merge-base and ignore any reflog forking history when enrolling
branches?

-K
