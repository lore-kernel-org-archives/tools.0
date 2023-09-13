Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 650B639F
	for <tools@linux.kernel.org>; Wed, 13 Sep 2023 23:04:02 +0000 (UTC)
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-1bd9b4f8e0eso2424955ad.1
        for <tools@linux.kernel.org>; Wed, 13 Sep 2023 16:04:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1694646241; x=1695251041; darn=linux.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=+Ld6lfRcEJe7bKmk98Gb/nH/bWafckY17eZjaURqNng=;
        b=I18lXeiguSVY9iSPSMHOrkq4K/dDolTqrn9/mpgOnjom7DGmTacnlBiFahEUt1xZaA
         WfF+FVR8kWdxKaw1CzkueWNdQGLlLsCuMdHg0ddjAsCJh1BNdh62wsGOYq6vV+6RlRkz
         MkZzgZW4HX4dvQnrk16q30RNA0eKcJbZFdmPY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694646241; x=1695251041;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+Ld6lfRcEJe7bKmk98Gb/nH/bWafckY17eZjaURqNng=;
        b=hOHSXWWX4b474tnA+hizdVebRWY7OwrjQv+fubhH1RqkIbfrRQzphYYDKm6q+IFZHv
         kiG4XYUnLQpv0eeVclXmOKA7zd+X/+Lgonw31bB6dPq7NcJ3rQwD0dZqVHX1TSdHi+BO
         QfnAV+VZmUyawoMoz3OyFzfg/75ZBsoGSAgvtfckJzTUPBcITL316119R68Zc2o1SaeZ
         1BLUnLroVKqARriDaG+uJpW/K1CVHnbGx4gtU9fslRGaoDIcqxHwOAKJwTubUDF/FB2y
         DNU6GxReVlWaShBU+4GGDAVUi393j5FnDtTltZAeu/Db79Zu1OqSmXx+yGcyPfG44nvv
         5VKA==
X-Gm-Message-State: AOJu0Yy45FFhr0c0WvjrJR4oPh5jd5LtBqkV5xFj5LeIZWfkvVEz3WHZ
	IyrhV6yI/0lEOuSY2T9OmYzFA+R0UeViH7bTgL0=
X-Google-Smtp-Source: AGHT+IGXrvF+RUpSfjofkiz51Mq/J8FRsjUPFMzkMaWE8wRczvQ7mHU82r7DnxrOSWmnABRAUk4bWg==
X-Received: by 2002:a17:902:cec1:b0:1bb:35b6:448f with SMTP id d1-20020a170902cec100b001bb35b6448fmr4788400plg.15.1694646241583;
        Wed, 13 Sep 2023 16:04:01 -0700 (PDT)
Received: from www.outflux.net (198-0-35-241-static.hfc.comcastbusiness.net. [198.0.35.241])
        by smtp.gmail.com with ESMTPSA id p6-20020a170902a40600b001bf00317a49sm147325plq.104.2023.09.13.16.04.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Sep 2023 16:04:01 -0700 (PDT)
Date: Wed, 13 Sep 2023 16:04:00 -0700
From: Kees Cook <keescook@chromium.org>
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>,
	Johannes Berg <johannes.berg@intel.com>
Cc: tools@linux.kernel.org
Subject: Re: b4 tag parsing too lax?
Message-ID: <202309131601.979D5790@keescook>
References: <202309131243.5D508355@keescook>
 <20230913-lunchbox-anemia-a19bc1@meerkat>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230913-lunchbox-anemia-a19bc1@meerkat>

On Wed, Sep 13, 2023 at 04:00:27PM -0400, Konstantin Ryabitsev wrote:
> On Wed, Sep 13, 2023 at 12:44:43PM -0700, Kees Cook wrote:
> > Hi,
> > 
> > I just saw this in commit ef6e1997da63 ("wifi: mac80211: fortify the
> > spinlock against deadlock by interrupt"):
> > 
> >   Reviewed-by: tag, or it goes automatically?
> > 
> > I tracked it down to:
> > 
> > https://lore.kernel.org/all/074cf5ed-c39d-1c16-12e7-4b14bbe0cac4@alu.unizg.hr/
> > 
> > I can't tell if we should just deal with kind of unfortunate misparsing,
> > or if b4 should require at least a "@" in the tag? (Though plenty of
> > tags are just someone's name without an email in the cases where no
> > email was available...)
> 
> I don't think b4 did this, because we already have precautions against this in
> place. E.g. if you retrieve that with b4, you will see that it doesn't get
> confused by that line:
> 
> $ b4 am -o/tmp https://lore.kernel.org/netdev/074cf5ed-c39d-1c16-12e7-4b14bbe0cac4@alu.unizg.hr/
> Analyzing 5 messages in the thread
> ...
> ---
>   ✗ [PATCH v4 1/1] wifi: mac80211: fortify the spinlock against deadlock by interrupt
>     + Reviewed-by: Leon Romanovsky <leonro@nvidia.com> (✓ DKIM/kernel.org)
>   ---
>   ...
> ---
> ...
> 
> While it's possible that b4 did this, it's not any current version.

Okay, weird! I have no idea how that got there then.

I should have CCed Johannes Berg to start with, but now I have. :) I'm
curious what the workflow for that patch was -- do you use b4? (Perhaps
this was a b4 behavior accidentally back in May?)

Anyway, no worries. I only found 1 instance like this in the last year.

-- 
Kees Cook
