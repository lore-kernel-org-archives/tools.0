Received: from mail-qk1-f177.google.com (mail-qk1-f177.google.com [209.85.222.177])
 by mx.groups.io with SMTP id smtpd.web12.2290.1602107671349763380
 for <tools@linux.kernel.org>;
 Wed, 07 Oct 2020 14:54:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=M2hFtFuB;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.222.177, mailfrom: konstantin@linuxfoundation.org)
Received: by mail-qk1-f177.google.com with SMTP id d20so4802679qka.5
        for <tools@linux.kernel.org>; Wed, 07 Oct 2020 14:54:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=date:from:to:cc:subject:message-id:mime-version:content-disposition;
        bh=HcAmbAC7Zz1e3UOZYBkEiB9ftM6s58UFlLGXXPtG5gI=;
        b=M2hFtFuBoOBCqd3tWe/0DKAB2jNFQBSfM2cwnfdd+qQDkJLRf5kj6hpJzC6i6WUvVd
         qXuLOvHYKvYWrer/NqmvOhIkSiYv272cfJnbTzbQWi9lNf+k5cwuR+727Iel8SOpF6jC
         OHUIy9OrRHQWm/LubyY+jOvmrivW/gkEAKIkM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
         :content-disposition;
        bh=HcAmbAC7Zz1e3UOZYBkEiB9ftM6s58UFlLGXXPtG5gI=;
        b=YQavYX+4zaTk+K9WWOypFmMUH2V6QQHgyDZeUtefWAxa0jPPFvuWOYWSuk4o1fxAqV
         At+ZsfTvlD9fbZ22X0w4E3Co88HQVxP6LaIS+86xnKYfoUetUyvVmPiQoQ7QHy2Y4q2G
         2deOZT2xhlmCms3CqvQyJ6cfWT3KFPCHYGJGku5IC6oqKIkvvEBJunVCgkJ8poJ9qi0s
         GwJhb0D+ccVT6Zvj9VMCYocVvPGiNNpbpFTfMSX5Rg790223ZXREB1IJ8h9Z2qzqthCd
         EyQn5ReixK7FPg9KTROxhcgsNdTay5+WjBVr9W99RjV5XYzRFEIFZ5rsGrghQ+wgja6+
         DUPw==
X-Gm-Message-State: AOAM532nvFaBLwJnrrCvc3LnlUFOZUNm8LwHssaDIDP+j/o/kTU1ds+z
	Yc481R021ofPEp+20GrUF5/V1DmR98cH9btk
X-Google-Smtp-Source: ABdhPJxQMhcdkrfggfIKU5xKKU++tZ1jr8TqjgbSva6U2t9JXAZwokq8KgQYG4uM1bdsrDTS2u+EEA==
X-Received: by 2002:a37:58c3:: with SMTP id m186mr3259623qkb.25.1602107670391;
        Wed, 07 Oct 2020 14:54:30 -0700 (PDT)
Return-Path: <konstantin@linuxfoundation.org>
Received: from chatter.i7.local ([89.36.78.230])
        by smtp.gmail.com with ESMTPSA id v16sm2373257qkg.37.2020.10.07.14.54.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Oct 2020 14:54:29 -0700 (PDT)
Date: Wed, 7 Oct 2020 17:54:28 -0400
From: "Konstantin Ryabitsev" <konstantin@linuxfoundation.org>
To: users@linux.kernel.org
Cc: tools@linux.kernel.org
Subject: subscribing to lore using grokmirror + procmail
Message-ID: <20201007215428.g45vafyjigj5k2d2@chatter.i7.local>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

Hi, all:

I needed a way to pipe lore.kernel.org lists straight into 
patchwork.kernel.org, so we don't have to subscribe patchwork separately 
for each list. Then I realized that it's generally useful as a way to 
deliver straight from public-inbox archives into local inboxes -- 
similar to how l2md does it, plus with some additional perks:

- we use manifest.js.gz provided by public-inbox to quickly see which 
  lists have updates, so we only update those repositories that actually 
  have new content
- we automatically recognize when remote epochs roll over
- if configured with `shallow=yes`, we can automatically re-shallow
  local git copies after each successful delivery, so they don't take up
  any space

Since it delivers via procmail, you can use in-depth filtering or just 
dump it into your ~/Mail/. You can also pair it with mbsync to have 
things uploaded straight to your imap mailbox.

If you're interested, you can read the details here:
https://people.kernel.org/monsieuricon/subscribing-to-lore-lists-with-grokmirror

Caution: pi-piper is brand new and probably has bugs.

-K
