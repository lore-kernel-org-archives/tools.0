Received: from mail-wm1-f68.google.com (mail-wm1-f68.google.com [209.85.128.68])
 by mx.groups.io with SMTP id smtpd.web11.7712.1603262358410996137
 for <tools@linux.kernel.org>;
 Tue, 20 Oct 2020 23:39:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@baylibre-com.20150623.gappssmtp.com header.s=20150623 header.b=rxQuSXs1;
 spf=pass (domain: baylibre.com, ip: 209.85.128.68, mailfrom: clabbe@baylibre.com)
Received: by mail-wm1-f68.google.com with SMTP id d3so215563wma.4
        for <tools@linux.kernel.org>; Tue, 20 Oct 2020 23:39:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=5HR+4nIsNaiTjZk65rGUJGfbuD5Z7M87aGzO+gRoC54=;
        b=rxQuSXs1rLv11Kxj+ijcAuq4zW7awBNwtt3PhX7+WoPTHsuHhVJyrSmOBcukMzeNAd
         vMpDWMiTcwKSfQdAxF8D7xIk56RA5XH67BNGx90wEtVvCO1IyhI99nzLtmnnsnI8a8Cf
         79brgK+EiL+3XUmJsx/UD7NHmw/3K1IV2V9aW3gaIuKuBB5UWWlxLyxPLl+m+9dybycj
         EVZhBJrTuFuBrLpBEaj1S5OPl+3DxYfbaPq8yveHrSBc/+H/a6pbTPJ8mUxk9yVSojek
         cyABuH0ajEzKPcZ10GpI0Ej8jl5JJ5tZxKi7DWhnoLQUDEImWQ/78BTgYQdhM1OCfkM7
         LLKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=5HR+4nIsNaiTjZk65rGUJGfbuD5Z7M87aGzO+gRoC54=;
        b=YUtKRZ3rPzuQyAzF5JNd2TWR98fEGd5XBHSHawcOynES7TGa3PW7B0mw8cfb3f4XQp
         XVYxUKHyk8ZxTbCO3Mhl8O1JREQDds2sYR5uvz9NvSxwrWqXMYCtyUUMsTuxX9FzRd4A
         8gpTsEppzfc5akE8/HSl+g/15h54pCtMiQX2fzqYBBhicZP/w4sH83fuCuOHg6AHEHoF
         /72eJqsgnTDUm2/yPD3frwbl143S7BR9Qfd066oCTsKh5QcIsY/fkhWzMSUImUHxBJg0
         kDS2seTdXKF3S9i8fimJmsTS3Vf3Q2duCjR2Bjrxs0Y00kwFGqlfkpPaQN8rNwKY31UQ
         UcnA==
X-Gm-Message-State: AOAM532lKZcGQ57rZdUqFz4w3x7WTQVvbqou05lNTm16Cx+8nlmTDUJj
	tp+6Zzw0dAeWkgRgFtjUVzokKA==
X-Google-Smtp-Source: ABdhPJxLnBJvULdKmsvUzq2dWe3jzc30Jr0I7swW9QgZZ5/1DG9LNxbbY8ldULnLp7Zfwrbd+N97/g==
X-Received: by 2002:a1c:dc43:: with SMTP id t64mr1954421wmg.6.1603262356675;
        Tue, 20 Oct 2020 23:39:16 -0700 (PDT)
Return-Path: <clabbe@baylibre.com>
Received: from Red ([2a01:cb1d:3d5:a100:264b:feff:fe03:2806])
        by smtp.googlemail.com with ESMTPSA id j9sm1985081wrp.59.2020.10.20.23.39.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2020 23:39:15 -0700 (PDT)
Date: Wed, 21 Oct 2020 08:39:14 +0200
From: LABBE Corentin <clabbe@baylibre.com>
To: kernelci@groups.io, khilman@baylibre.com
Cc: automated-testing@lists.yoctoproject.org, tools@linux.kernel.org
Subject: Re: RFC: dashboards, visualization and analytics for test results
Message-ID: <20201021063914.GC21391@Red>
References: <7hk0w2c4i3.fsf@baylibre.com>
MIME-Version: 1.0
In-Reply-To: <7hk0w2c4i3.fsf@baylibre.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

On Wed, Oct 07, 2020 at 10:47:32AM -0700, Kevin Hilman wrote:
> Hello folks interested in kernel testing/automation,
> 
> The KernelCI project is starting to look at what's next for dashboards,
> visualization and analytics for the various Linux focused testing
> projects.
> 
> At Linux Plumbers, we launched some discussions[1] around common ways to
> collect test results, logs and metadata into a public, shared dataset,
> and we've already started collecting data from several different
> sources.
> 
> So the next question is... how do we best use all of this data?
> 
> We're beginning to brainstorm how to visualize, analyze and learn from
> this data in useful ways.
> 
> To that end, we're starting to collect a set of user stories to help us
> brainstorm a new design for web based dashboard and analytics, and we'd
> like to hear from you.
> 
> Below is the start of a list of user stories[2], but we want to grow
> this list with your ideas, so please share them on this thread. 
> 
> We're also very interested in talking with any big data people and data
> scientists who might be willing to look at this growing set of data and
> help us better plan for the future full of lots of test data.
> 
> We appreciate your ideas and feedback,
> 
> Kevin (on behalf of the KernelCI team)
> 
> 
> [1] c.f. Unifying Test Reporting with KernelCI from the testing/fuzzing
>     micro-conference:
>     https://linuxplumbersconf.org/event/7/sessions/80/#20200826
> 
> 
> 
> [2] Example user stories
> 
> A kernel developer has sent a patch which caused a regression
>    - Find the details, how to reproduce, check when it’s fixed
> 
> A maintainer is getting a branch ready for the next merge window
>   - Compare results against mainline, ensure all tests were run correctly
> 
> An OEM or SoC vendor needs to upgrade their kernel or move to upstream
>   - See all results for a particular platform on various stable releases
> 
> Regular visitors who want to know how the kernel is doing
>   - Highlight new regressions, show trends for pass/fail and performance
>   - Does kernel X work on my hardware? 
> 
> Distro vendor wants to know
>   - Is the latest kernel stable enough for my distro?
>   - Why does this test fail on my distro kernel but not stable kernel?
> 
> Stable kernel maintainer wants to know
>   - Is this kernel stable enough to release?
> 
> Kernel / subsystem maintainer wants to know
>   - Is my code/subsystem being tested?  How much coverage?
>   - Is the kernel size growing?  Why?  Which subsystems
>   - Is boot time / test execution time increasing/decreasing?  What are the historical trends?
> 

Hello

As a maintainer, viewing all boot including a specific hardware/driver.
Does my xxxx driver works everywhere ?

Recent example:
- I have added support for PRNG/hash on sun8i-ce, I want to check all boots with this driver.
More complex recent example:
- since commit bbc4d71d6354 ("net: phy: realtek: fix rtl8211e rx/tx delay config") many board could loose network, I want to see all boots including this patch with this PHY.

Regards
