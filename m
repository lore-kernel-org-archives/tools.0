Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B7AB3FE9
	for <tools@linux.kernel.org>; Thu,  9 Sep 2021 14:04:52 +0000 (UTC)
Received: by mail-wr1-f43.google.com with SMTP id b6so2723953wrh.10
        for <tools@linux.kernel.org>; Thu, 09 Sep 2021 07:04:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=nQW13q76Y8eKA5KTORa6p4g3K+MabXDhmHn5ZpC8BEc=;
        b=fmdSyNqOfic6wSkQsoP9NjHWWdopXOLaqksGy2Ic8Rr1DkG0CcEz1qmcva4WYkFBM6
         NsCW4yu4vzXJJMm9Rd9QBZgGnxKtjVAUFoo6xxB2kMyXs79iSOigxHz2ghGEE0+FEZTR
         CUgF8Fn0UFxUnAwRkuKdYtebaFhCAX3uLaonXfpp3zWAAYZJiGNLqMaTUgZEpUtgOmAe
         pWmbugjYGhjp5mPOxmRLdDH9qaKOq26tTng/OtOAKHEJASpWaxkFks+0GtIloLCap5ke
         uCY2dwAHxa1DCZ+ScxQ8E2e0sGv6zYrY5/n1g1gjMhQXaz/EHMrZfLFQ/QMaSn7So8Fp
         TWEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=nQW13q76Y8eKA5KTORa6p4g3K+MabXDhmHn5ZpC8BEc=;
        b=KHlH2b5bD5fPN1TJvEfSClSiA3NEen+6MywzVcl75pk8HrgDN2CYnjVHLZM9IMNEcW
         ooJqH3ckvbj1vWxmclzkGcnvmipyGp3Tp8Q5Mdo8KD/1KeUhjds0Ga0FPAioAd3BSiE5
         kuTG8eJSOvknFdZc9dxpbZOqAd/HEpxRiWk+QaK2i1V5WOSKfqOgTIEkrs8dysniG5Xl
         X8Odqx3I4WHxK5MkcUS54eUxcMIW/cjYpHsn7tjTPxDQrEfT2gef6nFLpnbAweX8KvBA
         hLLz3R0My9SbyFzZF8zhqvCnIPZxPPB+pO3avWBz3eSE0HlSozsRCN4NXQZCWx6v1Kv6
         xKrA==
X-Gm-Message-State: AOAM531xVO3JTBDIdDGUnjIj6ZAAjRq0SgbXjP37XSi8i14MF+6+1fBU
	V7t4AiXyu9Rb/FZCYftImpAlZQ==
X-Google-Smtp-Source: ABdhPJzMDpERQOBVCDxzuNB0xBwFFOTbeR68gOcBFn2jFz5oCP9JJ3YqhD2dP2Z+0OL/WLZBqFzvqA==
X-Received: by 2002:a5d:6741:: with SMTP id l1mr3828050wrw.289.1631196290810;
        Thu, 09 Sep 2021 07:04:50 -0700 (PDT)
Received: from google.com ([95.148.6.201])
        by smtp.gmail.com with ESMTPSA id r36sm1563972wmp.33.2021.09.09.07.04.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Sep 2021 07:04:50 -0700 (PDT)
Date: Thu, 9 Sep 2021 15:04:48 +0100
From: Lee Jones <lee.jones@linaro.org>
To: Steven Rostedt <rostedt@goodmis.org>
Cc: Konstantin Ryabitsev <konstantin@linuxfoundation.org>,
	Masahiro Yamada <masahiroy@kernel.org>,
	Jason Gunthorpe <jgg@nvidia.com>, users@linux.kernel.org,
	tools@linux.kernel.org
Subject: Re: New version of lore available for preview
Message-ID: <YToUgHL2V/lci+Df@google.com>
References: <20210818190750.g3xedu7j24sqndo2@nitro.local>
 <20210902195332.GA2493828@nvidia.com>
 <20210902201402.bbdttirbb5ckrtiz@meerkat.local>
 <CAK7LNAQogtzDbAFDtRt7UvDkH6K4tkQgwfmu-2_0rGgo_Uj_iw@mail.gmail.com>
 <20210903152143.nt5mzgwprltl36pa@meerkat.local>
 <CAF2Aj3jbU_vnKvYB2EJXuKdTCeJx3dgZY2h7sriJX4fP6Fsteg@mail.gmail.com>
 <20210908183746.iancht34j3drun77@meerkat.local>
 <20210909084907.271b6df5@gandalf.local.home>
 <YToM6bH/I9rHQMeE@google.com>
 <20210909095514.49e68456@gandalf.local.home>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210909095514.49e68456@gandalf.local.home>

On Thu, 09 Sep 2021, Steven Rostedt wrote:

> On Thu, 9 Sep 2021 14:32:25 +0100
> Lee Jones <lee.jones@linaro.org> wrote:
> 
> > Well, as beautifully inefficient as that all sounds, it might be
> > slightly less time consuming if I just succumb to peer pressure and
> > switch pwclient out for b4.
> 
> The old "Show them an even more painful alternative to make the current
> solution seem good" trick.

Works every time! :)

> > Thankfully, my use-case is much simpler than Steven's.
> 
> Of course, my solution came before b4 was even thought of (I even mentioned
> this solution in the kernel summit discussion that started the path to b4).
> 
> The one thing I need that b4 doesn't give me, is a place outside of email
> to keep track of the state of patches. I've failed in all my attempts at
> using email folders to do this. What I love about patchwork is that I can
> keep the patches at various states.
> 
>  New - I just received it and need to look at it / test it.
> 
>  Under review - They have been tested, just need to be pushed to upstream.
> 
>  Accepted - they have been accepted.
> 
> I also created other states for topics, like "Real Time", "Scheduler",
> "RCU", etc, so that I can go back if I have time (which currently I never
> do), and look at these patches.
> 
> I also use the "delegate" option to assign patches to myself that are high
> in priority.
> 
> I tried doing this with email folders, and even a git repo, but because I
> use email and git for so much else, it still gets lost in the noise. I like
> patchwork because its web based, and I have a window up all the time that
> shows me what patches I need to work on next.
> 
> The pulling into git is actually one of the trivial parts of the process.

I like to keep my setup as KISS as possible.

Fortunately, in terms of upstream reviews I've managed to whittle
patches down into 3 states;

 - unread
 - does not need review
 - needs review

The latter is represented with Mutt's 'flag-message' functionality.

-- 
Lee Jones [李琼斯]
Senior Technical Lead - Developer Services
Linaro.org │ Open source software for Arm SoCs
Follow Linaro: Facebook | Twitter | Blog
