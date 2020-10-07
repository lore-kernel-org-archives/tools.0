Received: from mail-pj1-f65.google.com (mail-pj1-f65.google.com [209.85.216.65])
 by mx.groups.io with SMTP id smtpd.web10.105.1602092853905757339
 for <tools@linux.kernel.org>;
 Wed, 07 Oct 2020 10:47:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@baylibre-com.20150623.gappssmtp.com header.s=20150623 header.b=TazgW8ih;
 spf=pass (domain: baylibre.com, ip: 209.85.216.65, mailfrom: khilman@baylibre.com)
Received: by mail-pj1-f65.google.com with SMTP id az3so1394808pjb.4
        for <tools@linux.kernel.org>; Wed, 07 Oct 2020 10:47:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=chCoNNmSo+QONRqS+gEVDd7+wVsSWfG5MNs+Oil3Gqs=;
        b=TazgW8ihj2xaOJUHoMvavvoPKoARZvfSxhWD5TxYs1s1uXsxsF/SlqK5s2+C9h47oX
         LA9QHypqjC93cSfAfMlfI2PBvJL8AmnuCWTiQYN1E7rckSFhYxe51aktWUUN81Vqfn4W
         uCqfa8jr4CZaMSsUsWf/bW1wet0flBTX+S8irZaOpmSdXFuMmccWfD1iIGZNFk+7ZPgS
         0rS8TMV9qe2eF7cPocVFWGkJMYstRJfJwA++rbR8IaSr+OI0F8bFF+YH3VkiJ/QmmPre
         h+XLsMDFiUux7OiPT2cIRoy8U4vgnH/gwSilGYxntNI3mD25ml1MlEwWUeWyFRg2pv1E
         X+Tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=chCoNNmSo+QONRqS+gEVDd7+wVsSWfG5MNs+Oil3Gqs=;
        b=bSfPyB4+XIsIx41oRVsUH0Ybsz/VWCQsGK5b3OstzbFZfkNg/wjz+p+oca4cQ7vYpT
         kDqEPZF0Q9oSpq1ZFJO1xXaW3sGwuoeoNBbLiWBTJd3LJ33jVyfmT3RaY/pG7mzSpM1N
         F1me51L9CBcMANupY67Qi6gddDM6qsBXGrt3f4TtKLlK+J+qHgSlwWrHnb+A6c3g2GcJ
         W+JhA3gTVGnwpAL3HGAby/VsECsV+nnmH6FyKebl+9m+xwCcLgGYr07MeHLO2ADYFnmi
         cuf1d+bhBLLUOvXGhZfUSQMYBklvQIVM+Px/9SV1cFfmkjHNOYUByZX+Sppir/htrvWy
         qirQ==
X-Gm-Message-State: AOAM53308O9t20T5NDdgY0BgH+fZuCmOLwI6oHppRXLPDyBu/E/1BVjA
	mExTtjQJ0WBNoFgmjAQFZsuadg==
X-Google-Smtp-Source: ABdhPJxvTtiEByPOF9N5x7yaqdxL/8OLdb4C8MaBMouRmNJ/dTBQoLBIG8HoibZdaO1xgfajEC5Cow==
X-Received: by 2002:a17:90a:8585:: with SMTP id m5mr3791359pjn.69.1602092853250;
        Wed, 07 Oct 2020 10:47:33 -0700 (PDT)
Return-Path: <khilman@baylibre.com>
Received: from localhost (c-71-197-186-152.hsd1.wa.comcast.net. [71.197.186.152])
        by smtp.gmail.com with ESMTPSA id x7sm4129301pgl.77.2020.10.07.10.47.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Oct 2020 10:47:32 -0700 (PDT)
From: "Kevin Hilman" <khilman@baylibre.com>
To: automated-testing@lists.yoctoproject.org, kernelci@groups.io, 
Cc: tools@linux.kernel.org
Subject: RFC: dashboards, visualization and analytics for test results
Date: Wed, 07 Oct 2020 10:47:32 -0700
Message-ID: <7hk0w2c4i3.fsf@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Hello folks interested in kernel testing/automation,

The KernelCI project is starting to look at what's next for dashboards,
visualization and analytics for the various Linux focused testing
projects.

At Linux Plumbers, we launched some discussions[1] around common ways to
collect test results, logs and metadata into a public, shared dataset,
and we've already started collecting data from several different
sources.

So the next question is... how do we best use all of this data?

We're beginning to brainstorm how to visualize, analyze and learn from
this data in useful ways.

To that end, we're starting to collect a set of user stories to help us
brainstorm a new design for web based dashboard and analytics, and we'd
like to hear from you.

Below is the start of a list of user stories[2], but we want to grow
this list with your ideas, so please share them on this thread.=20

We're also very interested in talking with any big data people and data
scientists who might be willing to look at this growing set of data and
help us better plan for the future full of lots of test data.

We appreciate your ideas and feedback,

Kevin (on behalf of the KernelCI team)


[1] c.f. Unifying Test Reporting with KernelCI from the testing/fuzzing
    micro-conference:
    https://linuxplumbersconf.org/event/7/sessions/80/#20200826



[2] Example user stories

A kernel developer has sent a patch which caused a regression
   - Find the details, how to reproduce, check when it=E2=80=99s fixed

A maintainer is getting a branch ready for the next merge window
  - Compare results against mainline, ensure all tests were run correctly

An OEM or SoC vendor needs to upgrade their kernel or move to upstream
  - See all results for a particular platform on various stable releases

Regular visitors who want to know how the kernel is doing
  - Highlight new regressions, show trends for pass/fail and performance
  - Does kernel X work on my hardware?=20

Distro vendor wants to know
  - Is the latest kernel stable enough for my distro?
  - Why does this test fail on my distro kernel but not stable kernel?

Stable kernel maintainer wants to know
  - Is this kernel stable enough to release?

Kernel / subsystem maintainer wants to know
  - Is my code/subsystem being tested?  How much coverage?
  - Is the kernel size growing?  Why?  Which subsystems
  - Is boot time / test execution time increasing/decreasing?  What are the=
 historical trends?


