Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 313653201
	for <tools@linux.kernel.org>; Tue, 27 Dec 2022 16:06:36 +0000 (UTC)
Received: by mail-wm1-f46.google.com with SMTP id p1-20020a05600c1d8100b003d8c9b191e0so9598304wms.4
        for <tools@linux.kernel.org>; Tue, 27 Dec 2022 08:06:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=hCS3LGB8g8fzkM5gyMQWLaS3d8nyvBf2Jjn0oedWUzc=;
        b=KjabaFwSmq6531tP6QMu60mGOQZriLIwbuPoYjxC3M0QPOeKu34eft/kFnPfNiO46R
         4ScWxz+XyCUFO/0FmlfjfzZg2BRHegstVidTkjtJaxBwo9/vOqoo+h/vBMWojXRm03r9
         bA9KSa6TCuOa8w+NEy5f6BqRgyugMR5VKXOsJMRNiANPACDgttxLevqy2vMSDeFRJ+SG
         2lXr2dj7x8s64KTYNNB0Wbp+136FpDmJKUNoVeIMpk5aH8T9rKy3sVWWLjZN3xgyoHyW
         GKezmFfPksIz0bRqSsa3K6uUB0Ej8osl3A7oqTOfTWouj0HqTL7mbeoYfDn/witzOUau
         P2dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hCS3LGB8g8fzkM5gyMQWLaS3d8nyvBf2Jjn0oedWUzc=;
        b=sgPwbt7RGzun0IoKT2SyLioP7HUdwZ56B9F71SAMRRA8YkXUc85ZZenHfVUBcAdFnc
         EMdS8q/1K1iM2/ZXOV2QNgnLgiIBq/YKwnTstUVcySVEuglfJREtft4v6lazNh4b7bi4
         1wAmAa/ftivIs8zr2IFXeGTWcw+4Ll/9UNtIsIumskB2J//ReHElV12Ixzlpyv5ZeNHC
         wtIn6L3Z3M12XUPzOoD4frEfH20dgDOoWERAx319/A9reTgzXMr8rnKHZx5xchPyXOW2
         1xiVJsXT5Ue0xZWGC6yqAitBHVlt4dDu+yiJKQVv8HwUVw7sitNalDe/KluJao9/4ZGL
         XYtg==
X-Gm-Message-State: AFqh2kqodTpVwsy3CW3GtEEhS9OAQItiGFO21mmHVGVhXxN3/gu/qdVJ
	hxI+RhNAX4Z8dn+SoFfSwmqanA==
X-Google-Smtp-Source: AMrXdXuQQmfPYlp0T/HgHjGhhB1TI0CS/sk6mqSUhVWcGnaT8RucpEvBp/AdFibUNZHCLCooOcJScw==
X-Received: by 2002:a05:600c:34cd:b0:3d5:1175:92c3 with SMTP id d13-20020a05600c34cd00b003d5117592c3mr15506543wmq.23.1672157194411;
        Tue, 27 Dec 2022 08:06:34 -0800 (PST)
Received: from blmsp ([2001:4091:a245:805c:8713:84e4:2a9e:cbe8])
        by smtp.gmail.com with ESMTPSA id r9-20020a05600c35c900b003d6b71c0c92sm30367324wmq.45.2022.12.27.08.06.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Dec 2022 08:06:33 -0800 (PST)
Date: Tue, 27 Dec 2022 17:06:33 +0100
From: Markus Schneider-Pargmann <msp@baylibre.com>
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc: tools@linux.kernel.org
Subject: Re: b4 prep from detached HEAD
Message-ID: <20221227160633.7cnhyote4xgk7agp@blmsp>
References: <20221223101539.xlacupmglv2dw4oz@blmsp>
 <20221227151433.tg4yldmlyyubqpgu@nitro.local>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20221227151433.tg4yldmlyyubqpgu@nitro.local>

Hi Konstantin,

On Tue, Dec 27, 2022 at 10:14:33AM -0500, Konstantin Ryabitsev wrote:
> On Fri, Dec 23, 2022 at 11:15:39AM +0100, Markus Schneider-Pargmann wrote:
> > Unfortunately it seems that b4 prep is not able to handle not being on a
> > branch:
> > 
> > 	git checkout v6.1
> > 	b4 prep -n up/test -f v6.1
> > 		Not able to get current branch (git symbolic-ref HEAD)
> > 		Not able to get current branch (git symbolic-ref HEAD)
> > 		Not able to get current branch (git symbolic-ref HEAD)
> > 		Not able to get current branch (git symbolic-ref HEAD)
> > 		CRITICAL: fork-point v6.1 is not on the current branch.
> > 		          Switch to the branch you want to use as base and try again.
> 
> Yes, we currently use "what branch you're currently on" as our base tracking
> branch. Knowing the base branch is less important with the default commit
> strategy, but it will come in handy when I add the "prep --cleanup" feature
> that will remove prep-tracked branches if we find that they have been merged
> into the base branch (e.g. master).
> 
> I will probably add a --base-branch flag to go with "prep -n", though, so
> eventually it will be possible to create new prep-tracked branches from
> arbitrary locations in the tree.
> 
> In your particular case, you don't need to checkout v6.1 before running prep.
> You can just start in master and rerun "b4 prep -n [name] -f v6.1".

Thanks for explaining. The checkout of v6.1 was just an example. I often
use detached HEAD on remote branches and tags to not pollute the
branches that I have. I thought b4 prep would ignore the current state
of my work directory so I used it similarly to a 'git checkout -b'.
I may be creating a git helper for me which does a git checkout -b and a
b4 prep -e afterwards.

> 
> > Also b4 translates my branch name I wanted to use 'up/test' to 'up-test'
> > is there a reason for that?
> 
> Yes, the branch name becomes the base of the message-id, which in turn becomes
> the base of lore lookup URL. We replace all non-url-friendly characters to
> avoid a url-encoding mess.

That does make sense, thank you.

Best,
Markus

> 
> Best wishes,
> -K
