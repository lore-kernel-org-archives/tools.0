Received: from mail-qt1-f169.google.com (mail-qt1-f169.google.com [209.85.160.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D76C72
	for <tools@linux.kernel.org>; Wed,  8 Sep 2021 18:37:50 +0000 (UTC)
Received: by mail-qt1-f169.google.com with SMTP id r21so2727883qtw.11
        for <tools@linux.kernel.org>; Wed, 08 Sep 2021 11:37:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=jNahnmLfftOaHdFGsG+XofkTVGN3z1crcH1PaFBbDFE=;
        b=FxSGNSSYasrYyt54KXbROnf5jt9Y8oRp1XEGmemdWB1ruEfMg4I3xDU0q0AVvxxrJe
         hiiTj/0rtmEx+h61Emuk9M9+pZ7ti/ueqGJiILhxCTYk6pQ9fnolCAvX+RXd4yNVuUJf
         pJbKOtMd48+Ff2bzFjwVxk9XIluOQ40SsS1Bs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=jNahnmLfftOaHdFGsG+XofkTVGN3z1crcH1PaFBbDFE=;
        b=YiSLKXqRpR9Zfq7p5dJlANB7tCccobgjRVSQ50rB0NA1sdPoNq0InhEjAwhCg4hpyo
         WAbvSoUgY29/zQA0ZZoYfpwMtsLxuc6mBXV4BsEEn8S5lPagDYcrkiRephclLA7G4S2k
         s6AJEkdRwmS5NSiGOv8f0SQzbAJwcAp9zVWmqoKagu3DsuFi7GErGI461ZLOOhNX/e50
         528WBxKsE4+MszpTFxnT561nUTFHfmtR51SV5/IQfHa5LyflGrDjv/YP95ymHgsHFJDD
         vhzk3EdF5Bj5LsAy07oHpEmnPWQ8cH0P6QqQt1Y6u4mVH9OTyHK2rdkGDuHuk7VjhX0J
         UwsA==
X-Gm-Message-State: AOAM531U3ZxD2VEJ7lB17jIRfGonmwQWzLymPxPYdtwo2ywJ79naiBzr
	6NI1SqQtsgvEquigzoVVyYmypA==
X-Google-Smtp-Source: ABdhPJx9ST7f3dOBxWleJpG6Nx40M5tbj5wwtNZKQZ8ogS00AdSGfxEutM9NchjaiokmPNhEA/K5gw==
X-Received: by 2002:ac8:1e0b:: with SMTP id n11mr5014613qtl.274.1631126269014;
        Wed, 08 Sep 2021 11:37:49 -0700 (PDT)
Received: from meerkat.local (bras-base-mtrlpq5031w-grc-32-216-209-220-181.dsl.bell.ca. [216.209.220.181])
        by smtp.gmail.com with ESMTPSA id u189sm2343665qkh.14.2021.09.08.11.37.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Sep 2021 11:37:48 -0700 (PDT)
Date: Wed, 8 Sep 2021 14:37:46 -0400
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: Lee Jones <lee.jones@linaro.org>
Cc: Masahiro Yamada <masahiroy@kernel.org>,
	Jason Gunthorpe <jgg@nvidia.com>, users@linux.kernel.org,
	tools@linux.kernel.org
Subject: Re: New version of lore available for preview
Message-ID: <20210908183746.iancht34j3drun77@meerkat.local>
References: <20210818190750.g3xedu7j24sqndo2@nitro.local>
 <20210902195332.GA2493828@nvidia.com>
 <20210902201402.bbdttirbb5ckrtiz@meerkat.local>
 <CAK7LNAQogtzDbAFDtRt7UvDkH6K4tkQgwfmu-2_0rGgo_Uj_iw@mail.gmail.com>
 <20210903152143.nt5mzgwprltl36pa@meerkat.local>
 <CAF2Aj3jbU_vnKvYB2EJXuKdTCeJx3dgZY2h7sriJX4fP6Fsteg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CAF2Aj3jbU_vnKvYB2EJXuKdTCeJx3dgZY2h7sriJX4fP6Fsteg@mail.gmail.com>

On Mon, Sep 06, 2021 at 10:59:38AM +0100, Lee Jones wrote:
> > To retrieve a mbox file ready to be applied to a tree, you just need to know
> > the message-ID of the message (any message in the tread will do), and then
> > just run:
> >
> > b4 am [that-message-id]
> 
> [trying again with HTML disabled]
> 
> I'm happy with my current Patchwork based solution and would like to
> remain pro-choice.

I can understand that feeling, but it was really quite expensive to run the
LKML patchwork:

- it is super memory hungry, eating up 18+GB of RAM after just a few days of
  uptime
- its database backend is ginormous due to all the accumulated LKML patches
- it routinely pegs the database due to bot activity

All of that was costing us hundreds of dollars a month just to run it for the
few people who were legitimately using it to download patches.

> Is there another solution besides being forced to use b4?

None that I can think of other than running patchwork locally. I'm not sure I
quite understand the reluctance to switch to b4, seeing as without patchwork's
state tracking features, the functionality between pwclient and b4 is nearly
identical -- you provide a URL and you get a mailbox with patches back.

> Can we represent LKML on Patchwork as a reasonable alternative?

No. That said, what I'm currently working on is a way to provide query-defined
public-inbox sources. If you can define what kind of patches you are
interested in as a lore.kernel.org query, we can save that search and feed
*that* into patchwork. So, instead of feeding all of LKML into patchwork just
for the few patches you're interested in, we can just feed the subset of
patches that you actually want.

I'll be talking more about this at my upcoming plumbers talk:
https://linuxplumbersconf.org/event/11/contributions/983/

-K
