Received: from mail-qv1-f49.google.com (mail-qv1-f49.google.com [209.85.219.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 949E63FC8
	for <tools@linux.kernel.org>; Fri, 24 Sep 2021 21:08:29 +0000 (UTC)
Received: by mail-qv1-f49.google.com with SMTP id 11so7092942qvd.11
        for <tools@linux.kernel.org>; Fri, 24 Sep 2021 14:08:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=8Lto8R+3vxaHOWq82kw5KyT7xU+ITaeUi1A1l8YUa/g=;
        b=Jv7RERE4DXx5vIhkmovdRQWj4LWbPBovsVU2l/9+NBJAL6YddDoh+rKjK7aRkccRiI
         LBVUs5Tyk3NM6pxc6Eqw+gSL5vVBzsi6Txa4qsN9q3HDUnJbFWIVQ9dVIpXAW7C+QyqS
         eEClDW2GLVeGPwT1AEVbZ/avmRSEfq8Cqe2sU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=8Lto8R+3vxaHOWq82kw5KyT7xU+ITaeUi1A1l8YUa/g=;
        b=24UnM/ciL8cMIO0skoUsMhgLncoY1RNGBQ6a+XT6QAv0CnyIC2HnI0/SvVpu7ObExU
         s938ZMZpy0EiqoDeHV0I2UpvW9c7GfnSvfWL2cDpxAZ7DhtDci7/3T8xOzpK3czhl27C
         b7c6XaAEH855nMeQgOTvJN4lyz0lfn0Tv31iYdiW/hnml4L4lKOYgZYo0uP+6b6naFch
         GBPinqnORrD8UeLZxCo2f8bC+p3EcA5m3YpAVXYX93rcaAkq0vk2cP8p8eVs1FV8tt0a
         YX/mXEaLp8P+sURG5r1cGDazPqFQVBF3gSqZ2Kv2RM7JY9lxdVxuD4BJglwxnu+ZVChJ
         6oyQ==
X-Gm-Message-State: AOAM530WtPWVFsz9Qfx3msgEJ5L9LjXhCqrvh8J8OGltf+j3sM1Dc7Be
	Gkd28SLy5buZF6i3IbPlFdm3Zw==
X-Google-Smtp-Source: ABdhPJxZTOeNAHlSkUxxy0U94oV197OEt+kNj3oEX+kqaH5x++6dU4zy8C1jHnTjpJZhyDxGp/iWIg==
X-Received: by 2002:ad4:4aad:: with SMTP id i13mr12093511qvx.27.1632517708610;
        Fri, 24 Sep 2021 14:08:28 -0700 (PDT)
Received: from nitro.local (bras-base-mtrlpq5031w-grc-32-216-209-220-181.dsl.bell.ca. [216.209.220.181])
        by smtp.gmail.com with ESMTPSA id c26sm4472056qka.33.2021.09.24.14.08.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Sep 2021 14:08:28 -0700 (PDT)
Date: Fri, 24 Sep 2021 17:08:26 -0400
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: tools@linux.kernel.org, users@linux.kernel.org
Subject: Re: b4: introducing b4 shazam (like b4 am -o- | git am)
Message-ID: <20210924210826.ebi3ljjdfiuie2pr@nitro.local>
References: <20210921202526.mk2meetobbtl3tvi@meerkat.local>
 <CAMuHMdWDh=pkFWvxkikFPh3ACyo8ctO1A-DvA6qq7KZ+Lr7X9w@mail.gmail.com>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CAMuHMdWDh=pkFWvxkikFPh3ACyo8ctO1A-DvA6qq7KZ+Lr7X9w@mail.gmail.com>

On Thu, Sep 23, 2021 at 10:51:21AM +0200, Geert Uytterhoeven wrote:
> [...]
> Magic: Preparing a sparse worktree
> Error running sparse-checkout init
> fatal: Unable to create
> '.git/worktrees/tmpz9m4cwww/info/sparse-checkout.lock': No such file
> or directory

Interesting. Are you already in a detached worktree, perhaps?

> According to "git help sparse-checkout", my git (2.25.1, Ubuntu
> 20.04.3LTS) does have support for that command.

I suggest you repeat the following manually:

    git worktree add --detach --no-checkout /tmp/foofoo
    pushd /tmp/foofoo
    git sparse-checkout ini
    git checkout

then, regardless of what happens above:

    popd
    git worktree remove /tmp/foofoo

That's basically all we're doing.

> Note that with -s, the Link: tag appears below my Sob, while
> b4 am + git am -s adds my Sob below the Link: tag.

Unfortunately, I can't control this beyond reversing this for everyone. The
only other alternative is setting up b4.shazam.am-flags variable for what to
pass to "git am" -- which may be a good idea anyway.

-K
