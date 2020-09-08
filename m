Received: from mail-qt1-f170.google.com (mail-qt1-f170.google.com [209.85.160.170])
 by mx.groups.io with SMTP id smtpd.web12.26756.1599587927471935075
 for <tools@linux.kernel.org>;
 Tue, 08 Sep 2020 10:58:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=A+etMf/d;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.160.170, mailfrom: konstantin@linuxfoundation.org)
Received: by mail-qt1-f170.google.com with SMTP id n18so12663587qtw.0
        for <tools@linux.kernel.org>; Tue, 08 Sep 2020 10:58:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=date:from:to:cc:subject:message-id:mime-version:content-disposition;
        bh=8CKLP9By34cLUVDG2opElLNEIVZQFVgzT9co9VdQdcc=;
        b=A+etMf/dFxpWpowoflcjvCVhYbtHYmoC09sGlj/ejEkLYYTDRYNnMD6waj42+TTe1h
         sL3kcIlwO8ye0Gw9/kqS19LGHGt3f23cnzZUS5zimLztMgMRVOomsgNODgDTIjIRsrJM
         R/uVBESKbkDe0aOh0zmCMAspMdwJgrt+51ARE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
         :content-disposition;
        bh=8CKLP9By34cLUVDG2opElLNEIVZQFVgzT9co9VdQdcc=;
        b=iyE6ywfiyeuRZk/4CqohXQAjvgO7NIfgPZeCdDLnogI+Ilsnmt6vl4K8bMSfJRaumS
         GX2TLqqfEyzmBSikcOJkI0p/+tjLNu0Gui2mX0rJVlTsWKX4WXVzVVAl6aM2NvlOj87P
         T5v62gq3wv8uIXfpN3k5V8BPjt1ewlHDB7+AbHVUs0E0NUoTRu/wNdVwBRV1JMBKaKFt
         xOhEGv2CFbt9QwDp4AHS/Uzdsv0aZ8xwrIxEdt/BtenfVWsZulZARrgZwMjbqQhGjoxJ
         Oc01XK6P7kcqn2f1Lbe80fovPOSosaqAz35BzkUtU/pape3iCseYZM4Ac7+wwLLd82Mf
         T1oQ==
X-Gm-Message-State: AOAM530IggEsCKnSVNMMJZBArs6n+jEgT7lR9OZ610Yh3JiBPpJrcTOk
	gZlfZRXFgW2gbZfOFfXXvojUyw==
X-Google-Smtp-Source: ABdhPJyIqUw4h7iaQAPg9/9g+IRoPCu2mnfVD6MIT712He9lnTxy9SiSN5tXkZsixlCe2TKWiIFN7A==
X-Received: by 2002:ac8:1b92:: with SMTP id z18mr1218218qtj.265.1599587926489;
        Tue, 08 Sep 2020 10:58:46 -0700 (PDT)
Return-Path: <konstantin@linuxfoundation.org>
Received: from chatter.i7.local ([89.36.78.230])
        by smtp.gmail.com with ESMTPSA id z2sm9166081qkg.40.2020.09.08.10.58.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Sep 2020 10:58:45 -0700 (PDT)
Date: Tue, 8 Sep 2020 13:58:43 -0400
From: "Konstantin Ryabitsev" <konstantin@linuxfoundation.org>
To: narmstrong@baylibre.com
Cc: tools@linux.kernel.org
Subject: Trying to figure out why your attestation is failing
Message-ID: <20200908175843.6urcfbntaa324ncz@chatter.i7.local>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

Neil:

I am keeping an eye on attestation emails sent to the signatures list 
(https://lore.kernel.org/signatures/) and I noticed that b4 isn't 
properly finding your attestation data. I poked at this series:

- thread: https://lore.kernel.org/linux-amlogic/20200907081825.1654-1-narmstrong@baylibre.com
- attestation: https://lore.kernel.org/signatures/159946699508.19944.11132773619713429568@kernel.org

When we generate attestation hashes from the patches you submitted, we 
get a different value for the "i" hash:

$ git mailinfo m p < 0001-dt-bindings-display-amlogic-meson-vpu-add-bindings-f.patch | egrep '^(Author|Email|Subject)' | sha256sum
7158b7d79fbd5342923a63ea14701fa75061a856f6eb30c9dfe83672894113ba -

Apparently, when you run it on your system during attestation generation 
step, you get a different hash for i:

3753d76c-4b385c46-aa69b83c:
  i: 3753d76ca01efcc78b682dc0f9feb582d67a1e9a6a89b0519cdf54a36eee5e0b
  m: 4b385c46651635915366eba13de55a445ae3d41afd2d0e5da8bad270a08c0e70
  p: aa69b83c2b5d484b33deec0c59135fdfe7290b658f29527590261abab8a4ac51

This is why when we're trying to find your attestation document, we are 
not finding it:

  Cache says looking up 7158b7d7-4b385c46-aa69b83c = 404

I am curious why this happens -- either the patches generated on your 
system have different Author/Email/Subject values until git-send-email actually
runs, or git mailinfo output has changed between revisions. I would like to
understand this better so we can properly address it, if you're willing to lend
a hand.

Best,
Konstantin
