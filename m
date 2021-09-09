Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1EAC72FAF
	for <tools@linux.kernel.org>; Thu,  9 Sep 2021 13:32:29 +0000 (UTC)
Received: by mail-wm1-f48.google.com with SMTP id n7-20020a05600c3b8700b002f8ca941d89so1414961wms.2
        for <tools@linux.kernel.org>; Thu, 09 Sep 2021 06:32:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=oDuzlS2Ay+SXx6BVjzNQI89qNR0zM5cKzvI3n6i3HVw=;
        b=gR69hfOC3Nj8SPqxDcgEcOZOk7RVIQpmAN/bAvKl1SOkoCRyVr6f1SgWbRYllTulvm
         fuaIZyoaaFFb+ss06CFHixLmUnPWSGfhpye0w64cvuadHhiRxgjR6dz+kZDMsrzAIIJy
         5N4bkD/3YcodfuJgC7rbFCav71XPrn6UMf0YY8oinwBidz5NWgpERvHxuf3UCgMjBtWj
         cbQN1IhwI5Ky2QCCCSnfblmimgnp9gLPsqx2Ztj5fSQg49hIlReiagLMlr/I+5Hr7F02
         SgISd2DiG8PzQQ21+Fa3w6GClh0B+zd3NOE0VkmcEvt81X6rGNR2AuqW2vrpj/ct5mVw
         MT4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=oDuzlS2Ay+SXx6BVjzNQI89qNR0zM5cKzvI3n6i3HVw=;
        b=qU0MxreUebj7eVnn0deuFoFOZ6k0l7INlf1qelDogbtSDRvTaAGigGl0x0ejkAmMDR
         MMCEd4IKXTfklwOL/68bxytlK8MClRFPMvwAAea/k4Rq6YLefFtPZx5jXUoFoTdmEb0Y
         nepaaD3w2nBWU25gW+9254F9VRcfgzcQwWVIs7Qzew4FOUiJUdp3JPUyOc4JGeSFr4+4
         PQk2eK57P6X0fErpqXDiddPXentOFtnt5haycwT4E3w2YxGs4RYk6NavJkPfrIODzWRq
         m80q2AkiaY+xxyr9Mg2CBvwv4z6LUa6gGRu8VTM+fzJFW2B3TQjOlDe1TZWWlJCila+C
         PXKQ==
X-Gm-Message-State: AOAM532fyWYOlqRP2+RqkRvPLnmfeeRvj24CNplssVTf2HDHYnTAAIfR
	58M26UHPq4vaqZqqwWlYU/nbUQ==
X-Google-Smtp-Source: ABdhPJwcOPoStEkb1nwPRU267KdZv/Attj0SI0BTsL77omyCJ6XR1dMuq7y0uflNesYHZfJNaRQsmA==
X-Received: by 2002:a7b:c442:: with SMTP id l2mr3091703wmi.131.1631194347367;
        Thu, 09 Sep 2021 06:32:27 -0700 (PDT)
Received: from google.com ([95.148.6.201])
        by smtp.gmail.com with ESMTPSA id a9sm2062179wru.27.2021.09.09.06.32.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Sep 2021 06:32:26 -0700 (PDT)
Date: Thu, 9 Sep 2021 14:32:25 +0100
From: Lee Jones <lee.jones@linaro.org>
To: Steven Rostedt <rostedt@goodmis.org>
Cc: Konstantin Ryabitsev <konstantin@linuxfoundation.org>,
	Masahiro Yamada <masahiroy@kernel.org>,
	Jason Gunthorpe <jgg@nvidia.com>, users@linux.kernel.org,
	tools@linux.kernel.org
Subject: Re: New version of lore available for preview
Message-ID: <YToM6bH/I9rHQMeE@google.com>
References: <20210818190750.g3xedu7j24sqndo2@nitro.local>
 <20210902195332.GA2493828@nvidia.com>
 <20210902201402.bbdttirbb5ckrtiz@meerkat.local>
 <CAK7LNAQogtzDbAFDtRt7UvDkH6K4tkQgwfmu-2_0rGgo_Uj_iw@mail.gmail.com>
 <20210903152143.nt5mzgwprltl36pa@meerkat.local>
 <CAF2Aj3jbU_vnKvYB2EJXuKdTCeJx3dgZY2h7sriJX4fP6Fsteg@mail.gmail.com>
 <20210908183746.iancht34j3drun77@meerkat.local>
 <20210909084907.271b6df5@gandalf.local.home>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210909084907.271b6df5@gandalf.local.home>

On Thu, 09 Sep 2021, Steven Rostedt wrote:
> On Wed, 8 Sep 2021 14:37:46 -0400
> Konstantin Ryabitsev <konstantin@linuxfoundation.org> wrote:
> 
> > > Can we represent LKML on Patchwork as a reasonable alternative?  
> > 
> > No. That said, what I'm currently working on is a way to provide query-defined
> > public-inbox sources. If you can define what kind of patches you are
> > interested in as a lore.kernel.org query, we can save that search and feed
> > *that* into patchwork. So, instead of feeding all of LKML into patchwork just
> > for the few patches you're interested in, we can just feed the subset of
> > patches that you actually want.
> 
> This is basically what I have done locally. I set up a local instance of
> patchwork. Added a procmail filter to copy all my emails with "PATCH" in the
> subject into its own folder. Then I have a cron job that runs the following
> script to add "List-ID: <rostedt.inbox.com>" to these emails, as my local
> patchwork "listens" to the "mailing list" called "rostedt.inbox.com". And
> then send them off to my local patchwork instance.
> 
> #!/usr/bin/perl -w
> 
> my $state = "none";
> my $patch = 0;
> 
> while (<>) {
>         if (/^From /) {
>                 $state = "head";
>                 $patch = 0;
>         } elsif ($state eq "head") {
>                 if (/^\s*$/) {
>                         print "List-ID: <rostedt.inbox.com>\n" if ($patch);
>                         $state = "body";
>                 } else {
>                         if (/list-id/i) {
>                                 next;
>                         } elsif (/^Subject.*patch/i) {
>                                 $patch = 1;
>                         }
>                 }
>         }
>         print;
> }
> 
> 
> This works great for me, but I can imagine if people have their own public
> inboxes, where we can just create a patchwork instance that feeds off of
> these inboxes, I believe you will get the same functionality that I have.
> 
> Note, I also have filters to read patches that have "[for-next]" and
> "[for-linus]" which converts the patches in patchwork from "New" to "Under
> Review". Then I have a subscription to all commits that go into Linus's
> tree, and I process all of them to go through and "Approve" any patch that
> it finds.
> 
> I still would love a way to download patchwork offline, where it loads
> locally all pending patches, and lets you review / apply them locally
> without needing to be connected online, as this would be useful during
> flights. Then when you land, you can upload your changes.

Well, as beautifully inefficient as that all sounds, it might be
slightly less time consuming if I just succumb to peer pressure and
switch pwclient out for b4.

Thankfully, my use-case is much simpler than Steven's.

In my current implementation, I have pwclient pull down the patch,
apply my SoB and apply the it, all in one foul swoop:

  pwclient git-am -p ${project} -3 -s ${pwid}

Does b4 provide this functionality too, or do I have to script around
it?  How have other's chosen to automatically apply the downloaded
mboxes?

-- 
Lee Jones [李琼斯]
Senior Technical Lead - Developer Services
Linaro.org │ Open source software for Arm SoCs
Follow Linaro: Facebook | Twitter | Blog
