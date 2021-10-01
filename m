Received: from mail-qk1-f171.google.com (mail-qk1-f171.google.com [209.85.222.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58B563FDF
	for <tools@linux.kernel.org>; Fri,  1 Oct 2021 19:30:25 +0000 (UTC)
Received: by mail-qk1-f171.google.com with SMTP id 72so10242133qkk.7
        for <tools@linux.kernel.org>; Fri, 01 Oct 2021 12:30:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=e9BBjpa4vu+acTyVm2Sey9TZfQnJFc/Uubm1Leuf/a4=;
        b=EW06NBufR2t9g2rCjveZmEiTd6teHJJ9qyTXLkbC0979nFHmR1WM/VKgnUgskfl8MX
         KE5QJS3SmahhyzixTdyI1WU0E/CkGZOLy7P+uzhIYxdu5GtnUwSR/RngyqBFV88Zzq/F
         urDN/BBF+YmlzqWWiOARJCBM16FxblXFwq1Jw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=e9BBjpa4vu+acTyVm2Sey9TZfQnJFc/Uubm1Leuf/a4=;
        b=xm7whVbWckVimb2slqB0DKvCGIchXN/YszFPu19JcC9Fja4/4CK/UYpAQAlkKH2ViL
         /WIUYUcUU/nTnNrzEBmj9rfk0aS+Wt005Y+6ik+1cwnFuM2/9JQ0unDfWwEd8G0tSabi
         n1LER1gH6KPQKH0wfS8y/DS6w5ySDSD905wfaSWl79G34SMB7Ceg1y3XGZC1Rsxniex9
         wDQX6oretfQJY14cjPfV0BPQcmFa5e3+0r2VYclHZqYTp8JlClvLK9aXNfMkuqgN1gS7
         yDVYJJlpJfbDBSdDCq46GHiHHzN+shnW7Krjw8LlJGXJjRJtOtF1J6CoIdRs53tj742a
         4Yhw==
X-Gm-Message-State: AOAM531HU+ejNGevDO7jyg5DPsd3o7L8zo/r4524Ugsa7ncnoqOPujgG
	whW2lKnc9B9OQH9WI7YmHlvmKQ==
X-Google-Smtp-Source: ABdhPJwbYUeb0cfH2cXA9jyo+6IWNTpO1oy90wA6WTG5boNt5Z4K+wy7XWOJwvjBv9hPSYtY6UYkZQ==
X-Received: by 2002:a37:2d04:: with SMTP id t4mr10575377qkh.463.1633116624177;
        Fri, 01 Oct 2021 12:30:24 -0700 (PDT)
Received: from meerkat.local (bras-base-mtrlpq5031w-grc-32-216-209-220-181.dsl.bell.ca. [216.209.220.181])
        by smtp.gmail.com with ESMTPSA id b26sm3885766qtr.30.2021.10.01.12.30.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 Oct 2021 12:30:23 -0700 (PDT)
Date: Fri, 1 Oct 2021 15:30:22 -0400
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: Linus Torvalds <torvalds@linuxfoundation.org>
Cc: Kees Cook <keescook@chromium.org>, tools@linux.kernel.org,
	users@linux.kernel.org
Subject: Re: merging pull requests
Message-ID: <20211001193022.js63dt3ktovubdz3@meerkat.local>
References: <202109301023.B78ABE54B@keescook>
 <20210930200002.67vxbowvegso2zhg@meerkat.local>
 <202109301559.A9BFB03@keescook>
 <20211001182615.bcyuag7vfrkzhefj@meerkat.local>
 <CAHk-=whZMDmgs3+djfUoVrx8jj7DwGOJvLWC=vw1dCMicqHJ1g@mail.gmail.com>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CAHk-=whZMDmgs3+djfUoVrx8jj7DwGOJvLWC=vw1dCMicqHJ1g@mail.gmail.com>

On Fri, Oct 01, 2021 at 11:47:12AM -0700, Linus Torvalds wrote:
> End result: Please don't make some crazy "b4 shazam" tool that handles
> pull requests and then makes it trivial for people to do automated
> merges too. That's absolutely the last thing we want to see.

Okay, it will for sure not do any automated merges. At most, it will provide
the contents of the cover letter (if present) as a convenient starting point.

What I like about "b4 shazam" is that it can make patch series work more like
pull requests. Once it's fetched and placed into FETCH_HEAD, maintainers can
either opt to do a merge, or rebase with their working branch and ff.

I expect that merges would be rare and only for large features that do require
a merge commit with a proper explanation (as you describe).

If any of these assumptions are wrong and I'm going down the wrong path,
please let me know.

-K
