Received: from mail-qk1-f195.google.com (mail-qk1-f195.google.com [209.85.222.195])
 by mx.groups.io with SMTP id smtpd.web11.1772.1589580197674909293
 for <tools@linux.kernel.org>;
 Fri, 15 May 2020 15:03:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=OZ6eGbpu;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.222.195, mailfrom: konstantin@linuxfoundation.org)
Received: by mail-qk1-f195.google.com with SMTP id m11so4269412qka.4
        for <tools@linux.kernel.org>; Fri, 15 May 2020 15:03:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=date:from:to:subject:message-id:mime-version:content-disposition;
        bh=7Py0STfXmeG+FFYrvT4AA4uOORstyqr8m30XzYtrySE=;
        b=OZ6eGbpuKW+4UmvNHm347XDqNyvshlj8+pYzd8oGY2t16pwfhiMMmr5yQGnOvAQnfD
         u+M49MDSz+PloDd2Q7lb4K/4yP+LcnI0v6hu079NgOYbgma+HCDYQRq3RcruIU1dr3L0
         0Dj/0w46Ltf7V7Opst6qQK64443xIP5KiKSrQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:subject:message-id:mime-version
         :content-disposition;
        bh=7Py0STfXmeG+FFYrvT4AA4uOORstyqr8m30XzYtrySE=;
        b=lqFy4VeqfySXPAS/VtL2sidoUZX4y88qfB9PdjGzsDHOWmq3WXNwIq+d9Sy9sYSOw3
         M50zF64zS2+8GZq2Y0PYNYMbk4Pz0VGuWhftMRvg4FCXOy2+WOWK21w3luaofK/Ondsi
         zyWC886PND8w66wW3FmhaIcPxA0CWd0WBXf4AE7Fcw2WAj0y8EHvDdqw026b7qCrnDJt
         1+WWckXZbkdu2zlE43xSqpogHLR12ETWqKCGdLM7ZiuLwoUAKnAUZeuA6H+o2ySGlUBp
         Z9i8N+0XHdEgmBDYrtuXhXIgSRXZDptLOWYGkA4ifRMwsa78FcFkhwwf2M4N0YU2H0Zo
         t0dw==
X-Gm-Message-State: AOAM530SWDkBrO4q2/0jQBpwXyWRlbJ0H1NAtpfzzC4N0aJK2nFXL4Gk
	PJcpltrzK43VhCzUfTmARpIrHsJcKl0yFA==
X-Google-Smtp-Source: ABdhPJwYJfiNrrdAAL0yhuBuzSCugO5vo2hmcl1woj5A2Z09XRZvfPafGgIY2+kTpdBvM++0FaN/yw==
X-Received: by 2002:a37:96c4:: with SMTP id y187mr5706219qkd.126.1589580196476;
        Fri, 15 May 2020 15:03:16 -0700 (PDT)
Return-Path: <konstantin@linuxfoundation.org>
Received: from i7.mricon.com (107-179-243-71.cpe.teksavvy.com. [107.179.243.71])
        by smtp.gmail.com with ESMTPSA id j45sm3260168qtk.14.2020.05.15.15.03.14
        for <tools@linux.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 May 2020 15:03:15 -0700 (PDT)
Received: by i7.mricon.com (sSMTP sendmail emulation); Fri, 15 May 2020 18:03:14 -0400
Date: Fri, 15 May 2020 18:03:14 -0400
From: "Konstantin Ryabitsev" <konstantin@linuxfoundation.org>
To: tools@linux.kernel.org
Subject: Initial "b4 diff" landed in master
Message-ID: <20200515220314.z5m5nqpz57mtos7v@chatter.i7.local>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

Hi, all:

Borrowing liberally from Jason's jg_tools, I had a first go at 
implementing "b4 diff". It's pretty slick when it works, for which it 
currently needs to be able to find the exact indexes for the files being 
modified. I found that having linux-next in my remotes helped to get 
most of those blobs into my local tree.

I would be happy if you poke at it some and let me know how it's working 
for you and what output improvements you can suggest.

Example:

$ b4 diff 1587451187-6889-1-git-send-email-masonccyang@mxic.com.tw
Looking up https://lore.kernel.org/r/1587451187-6889-1-git-send-email-masonccyang%40mxic.com.tw
Grabbing thread from lore.kernel.org/linux-mtd
Retrieved 26 messages in the thread
Checking for older revisions on https://lore.kernel.org/linux-mtd/
Added 17 messages from thread: [PATCH 0/4] mtd: spi-nor: Add support for Octal 8D-8D-8D mode
---
Analyzing 45 messages in the thread
Preparing fake-am for v1: spi: spi-mem: Add support for Octal 8D-8D-8D mode
  range: c20efe82ab72..6083ca557825
Preparing fake-am for v2: mtd: spi-nor: Add support for Octal 8D-8D-8D mode
  range: 5eaa5d76ab2e..8bfd7eea5726
---
Success, you may now run:
    git range-diff c20efe82ab72..6083ca557825 5eaa5d76ab2e..8bfd7eea5726


Best,
-K
