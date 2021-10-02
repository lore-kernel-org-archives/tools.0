Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0EB323FC9
	for <tools@linux.kernel.org>; Sat,  2 Oct 2021 00:08:49 +0000 (UTC)
Received: by mail-pj1-f43.google.com with SMTP id k23so7628525pji.0
        for <tools@linux.kernel.org>; Fri, 01 Oct 2021 17:08:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=xixTwyHKLMb3DJvrS2M+3HqtkcfycRLx+NAcuUvpTyU=;
        b=INlOlePcLungK0Ky9rWoXyKkP7zOF4vcwkFGXISeqA/rh5hUvbr/2lv4hWgX6NDl/+
         avoxArq7/dW6osvwL9GWtm3D9jy42OiQ3I4V4TvwgHfQZFkX1njztC7b+GX56nwiL12k
         Yp5zInPANmI4pTEEtOeLRqx8DLeIDfJj19vnE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=xixTwyHKLMb3DJvrS2M+3HqtkcfycRLx+NAcuUvpTyU=;
        b=u+erIgdka+OOiuQBo8trFhZI1Bw7ZhJT96dGFD5nLsjry0v7JMqA3ALK14d6bWKpF8
         LNnQzuFxlqSXh5FrbGTEmIOASTa6yBlMot7/2iVsqgEMoi7z2R5Oi2tYw28lYhFTilH/
         jBc9AOzvKI5aNd6GUDLLGdqCJVbmWxwu3gL5RPHp1/8kRdSVeI7i649G4sa1b1nQa4Ar
         UN2pDYz7mIJSFrr7HhSmT4Of3m7XjisepYi5ar3pe8CySBGoqWvTh8x58v0R+zwqjlgT
         Xc8JUfbaGZP6N54+wdT+NZ2oryIT6yjkgvXlqw1Ymx5WCkQ9WlOTgOdm4gNuaQXHyMTz
         yklA==
X-Gm-Message-State: AOAM533C/YY7o208guMHF1z1Rkz9IW++9PGvLwEz3h+oqi3O+9bB9W6U
	nwksOrc1reE4yvNDp2oJd1VEOyFSGlmQPA==
X-Google-Smtp-Source: ABdhPJxJaDLEyYJWDixg026+UX5gZQKnG3WXzjm4G/5k+YhPJALGwXJa5N7vi+rcPpym46jvoUnbmw==
X-Received: by 2002:a17:90a:71c5:: with SMTP id m5mr13428356pjs.105.1633133328117;
        Fri, 01 Oct 2021 17:08:48 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id p16sm8908753pja.24.2021.10.01.17.08.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 Oct 2021 17:08:47 -0700 (PDT)
Date: Fri, 1 Oct 2021 17:08:46 -0700
From: Kees Cook <keescook@chromium.org>
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc: Linus Torvalds <torvalds@linuxfoundation.org>, tools@linux.kernel.org,
	users@linux.kernel.org
Subject: Re: merging pull requests
Message-ID: <202110011706.FE5D4AB@keescook>
References: <202109301023.B78ABE54B@keescook>
 <20210930200002.67vxbowvegso2zhg@meerkat.local>
 <202109301559.A9BFB03@keescook>
 <20211001182615.bcyuag7vfrkzhefj@meerkat.local>
 <CAHk-=whZMDmgs3+djfUoVrx8jj7DwGOJvLWC=vw1dCMicqHJ1g@mail.gmail.com>
 <20211001193022.js63dt3ktovubdz3@meerkat.local>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211001193022.js63dt3ktovubdz3@meerkat.local>

On Fri, Oct 01, 2021 at 03:30:22PM -0400, Konstantin Ryabitsev wrote:
> On Fri, Oct 01, 2021 at 11:47:12AM -0700, Linus Torvalds wrote:
> > End result: Please don't make some crazy "b4 shazam" tool that handles
> > pull requests and then makes it trivial for people to do automated
> > merges too. That's absolutely the last thing we want to see.
> 
> Okay, it will for sure not do any automated merges. At most, it will provide
> the contents of the cover letter (if present) as a convenient starting point.
> 
> What I like about "b4 shazam" is that it can make patch series work more like
> pull requests. Once it's fetched and placed into FETCH_HEAD, maintainers can
> either opt to do a merge, or rebase with their working branch and ff.

Right -- I was just trying to save on the copy/paste mechanical process
of going from a PR email to a local branch I can review, build, test,
etc.

> I expect that merges would be rare and only for large features that do require
> a merge commit with a proper explanation (as you describe).

Totally, yes. I hope I didn't come across in my initial email as want to
automatic the commit itself. I did talk a bit about the subject being
mechanical, but the rest of the log needs as much detail as possible.

-Kees

-- 
Kees Cook
