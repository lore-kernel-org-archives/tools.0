Received: from mail-qk1-f171.google.com (mail-qk1-f171.google.com [209.85.222.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCB752FB3
	for <tools@linux.kernel.org>; Thu, 27 May 2021 12:00:24 +0000 (UTC)
Received: by mail-qk1-f171.google.com with SMTP id i67so306309qkc.4
        for <tools@linux.kernel.org>; Thu, 27 May 2021 05:00:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=GLVImN+D1uWjfjtkduqzQH5j9A/ObPfdJ6spQppzLVo=;
        b=BoiBi3Ts5LRLdeHT50pfgbmHSkwaAuAfxeXzdzsKUMRU6nwsHl0lVXoCvXKMZqa5oX
         BqU/yR6NQDQ1EpZIavFtrFUCrMVIUAzCafGf5H4xzznD1YU4Demkwni5i6JQ+VslnN9O
         WGMVFam0Ri+Jkt0P/8frtI3RnCWgRH0LPH1lI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=GLVImN+D1uWjfjtkduqzQH5j9A/ObPfdJ6spQppzLVo=;
        b=oHu2o1SdKASUvkgDaOJnBpY+/jqi7hJoj0UZEnEWTuRpSHt2BUKhgPpEt8EgyqHIv5
         fHhbztbdAyB9eujBkNEBCT2rYfzQfZcgzq3f6pRkbkxNYuBwDUDZYzBUdEOWoQ2Bxmh3
         umIYJl8Edf4zd5VXLngVNBRn6A7IKFUKb65jmChGaOiR5nQ7TAOn3JiGuM+IB1h6z6Gu
         /1380eabBVCFqYHce/45vqygGScYPYS/7SNlNYEukpe+7kkaJ7XOdLeHxTQpFmDbYz2G
         KJyUd+F4nyByAOhW6qXw4aSBXjrHoCyq/psO/QGvU0PrBlUbzd7B4Nx0y/lmILVtgBxa
         DdCQ==
X-Gm-Message-State: AOAM530w0dauXaawkMnTc/qZR5WxC3p9Jf25HiwuB4gDi3/3kqi4Dj8h
	Lk2EeC4VEIN/ndUkMFYW/g/3aKkxvw3dCaSUrnI=
X-Google-Smtp-Source: ABdhPJwV439q1nWgBLBSe04CuuTdCilIej87kqrkKms/QyW2Xw25WlUV3vSrbw9Wh2IBVJu/SAZ5jQ==
X-Received: by 2002:a05:620a:9d6:: with SMTP id y22mr2970731qky.432.1622116823664;
        Thu, 27 May 2021 05:00:23 -0700 (PDT)
Received: from nitro.local ([89.36.78.230])
        by smtp.gmail.com with ESMTPSA id b18sm1178557qtt.7.2021.05.27.05.00.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 May 2021 05:00:23 -0700 (PDT)
Date: Thu, 27 May 2021 08:00:21 -0400
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: tools@linux.kernel.org, users@linux.kernel.org
Subject: Re: b4 v0.7.0 is available
Message-ID: <20210527120021.o52btp5tikzj7wnu@nitro.local>
References: <20210526192558.pex7tuorwqvkzxe3@nitro.local>
 <CAMuHMdU5vyhHOZ7x-3d0uQqD9kSLBztaKBt9yq+pNGTmATHxCQ@mail.gmail.com>
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CAMuHMdU5vyhHOZ7x-3d0uQqD9kSLBztaKBt9yq+pNGTmATHxCQ@mail.gmail.com>

On Thu, May 27, 2021 at 09:56:25AM +0200, Geert Uytterhoeven wrote:
> On Wed, May 26, 2021 at 9:26 PM Konstantin Ryabitsev
> <konstantin@linuxfoundation.org> wrote:
> > - b4 am will warn when it finds a message in the thread with an
> >   "Obsoleted-by:" follow-up trailer. Running "git am -c" will automatically
> 
> "b4 am -c"?

Yes indeed. Sometimes I wonder if naming it "b4 am" was a good idea, as half
the time I type "git am" when I meant "b4 am" and vice-versa. Brains are
terrible.

-K
