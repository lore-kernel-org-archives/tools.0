Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3E4A14F6B
	for <tools@linux.kernel.org>; Thu, 14 Sep 2023 16:55:09 +0000 (UTC)
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-68fac346f6aso1048407b3a.3
        for <tools@linux.kernel.org>; Thu, 14 Sep 2023 09:55:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1694710509; x=1695315309; darn=linux.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=w2Rte4D1NnKPAUNicaX/y+Pw5/c58Jqh8fdioEvviMk=;
        b=g2DTmTjiC3aUMXBiRQaJwyzG5FzXWdEXbjdd24kBMIZBBQntO+RBD5mG4+tTJTq8/J
         wUvepPKblCVD1qEzNY3bKpKOapAEw0xmVE+x5MbafX6nfBtOcte+q2s0rZSymJQMSDrR
         8GV/LLS1UK0bCOJTJmsqCnLBjQuBHL6jA68Nc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694710509; x=1695315309;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=w2Rte4D1NnKPAUNicaX/y+Pw5/c58Jqh8fdioEvviMk=;
        b=b8F3Z5qa9xvitFICcCLhbzjrybn2B2oXvJvMPc3J8n2LwogYUkVCiALf2FnK0EEast
         YwDhfjTShp7giEMNsrDcGCGBt3KmN9tEMPnDCLSp2M+9hBFz6zmkk2xgnmgPxKcRImo3
         Hy3MjaSLh7Dl14orjdLfHG1I09/breVEC3/FL639+foMbCB6tTXDn+WVxX4vMFjgoQU0
         jCeDfTYbXeUm66eY8QCYVjvdw1JnGUhEd/spkNnMaSuRxICwZfBl7zj8ayK+wKRFByAR
         iEyJuDQX+6zpNXnS3/8yu3YHZ7BD1EohIas0do15ef4evppA2qTtvTH1GsnNcr9Dp7k6
         EBYg==
X-Gm-Message-State: AOJu0Yyo6X9gvwZe1f2J3CnXmMzJTBsnW5UhVRy69GhaEMVAfItprfKL
	nFEby7nkrX+peNnInwEI4UtbkA==
X-Google-Smtp-Source: AGHT+IHaBuHFFDjPxIgReVr+vco+g1cAcX4voJ9bztGJjgDd6fZDhliXCRRgn0RkBqoLh23a5hPriQ==
X-Received: by 2002:a05:6a20:9144:b0:132:ff57:7fab with SMTP id x4-20020a056a20914400b00132ff577fabmr6900093pzc.2.1694710509025;
        Thu, 14 Sep 2023 09:55:09 -0700 (PDT)
Received: from www.outflux.net (198-0-35-241-static.hfc.comcastbusiness.net. [198.0.35.241])
        by smtp.gmail.com with ESMTPSA id e7-20020aa78247000000b0063f0068cf6csm1550816pfn.198.2023.09.14.09.55.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Sep 2023 09:55:08 -0700 (PDT)
Date: Thu, 14 Sep 2023 09:55:07 -0700
From: Kees Cook <keescook@chromium.org>
To: Johannes Berg <johannes@sipsolutions.net>
Cc: Konstantin Ryabitsev <konstantin@linuxfoundation.org>,
	"tools@linux.kernel.org" <tools@linux.kernel.org>,
	Kalle Valo <kvalo@kernel.org>
Subject: Re: b4 tag parsing too lax?
Message-ID: <202309140954.3A38E1B14D@keescook>
References: <202309131243.5D508355@keescook>
 <20230913-lunchbox-anemia-a19bc1@meerkat>
 <202309131601.979D5790@keescook>
 <ff72f308879a12f53fa7ace044ab99ab7dd9e060.camel@sipsolutions.net>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ff72f308879a12f53fa7ace044ab99ab7dd9e060.camel@sipsolutions.net>

On Thu, Sep 14, 2023 at 08:55:25AM +0200, Johannes Berg wrote:
> On Wed, 2023-09-13 at 23:04 +0000, Kees Cook wrote:
> > On Wed, Sep 13, 2023 at 04:00:27PM -0400, Konstantin Ryabitsev wrote:
> > > On Wed, Sep 13, 2023 at 12:44:43PM -0700, Kees Cook wrote:
> > > > Hi,
> > > > 
> > > > I just saw this in commit ef6e1997da63 ("wifi: mac80211: fortify the
> > > > spinlock against deadlock by interrupt"):
> > > > 
> > > >   Reviewed-by: tag, or it goes automatically?
> 
> Heh, that's kinda funny.
> 
> > > While it's possible that b4 did this, it's not any current version.
> 
> It didn't.
> 
> > Okay, weird! I have no idea how that got there then.
> > 
> > I should have CCed Johannes Berg to start with, but now I have. :) I'm
> > curious what the workflow for that patch was -- do you use b4? (Perhaps
> > this was a b4 behavior accidentally back in May?)
> > 
> 
> We use patchwork in wireless to assign the work between Kalle and I. I
> guess I could still apply patches using b4 though, but don't, at this
> point.
> 
> So I guess it's more a bug to report to patchwork, but I'm not sure how
> much good that will do unless we fix it ourselves :)

Ah-ha! Patchwork did the collecting. Thanks for taking a look. :)

-Kees

-- 
Kees Cook
