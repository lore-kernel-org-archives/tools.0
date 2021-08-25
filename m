Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF4D172;
	Wed, 25 Aug 2021 16:30:50 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 8036B610A3;
	Wed, 25 Aug 2021 16:30:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1629909050;
	bh=AZsCWlFIRLYleoWFUQld3C5JdsEyQMbjCMi5oMtqAOc=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=sYJKeFj17fFbkJqTCoWZuwmi9VwwMkjMP/+NDKHuSejM45Zdilc5oE1uTyS+xdRby
	 cYgJNklmROXR1JYdf1wvUnOD58och1alhTosRUxn+OCq36z/xwukXnodBtldjZtEwZ
	 HulH8SWGd2hkSkI8ppJWrWl0+pocwbCrNF4umKCMs5xAPsLtKOw6dvMUIM7gifCHm1
	 /t9V5YskcsD1ns5qN4CPJpF1eQGIcuva2xI2MkdqknnYQrQM6pCQSbPS7E3hKMmReJ
	 bYPgPqFT2N82vgSHr3r7I93tFNk1S2U0/wfgDKyESjWfGUuaYW43iyJVDq4fFYhQ0G
	 m02rMt3orVWIA==
Received: by mail-ed1-f43.google.com with SMTP id q3so41730edt.5;
        Wed, 25 Aug 2021 09:30:50 -0700 (PDT)
X-Gm-Message-State: AOAM530Xo7k7kG5d0d5O16o2Av/EBVNX6h0gPnmRCdG2S95VsO9Az0En
	i4m5g/6aigus4zMh5mHnj/az3qvmWpa4lcllvw==
X-Google-Smtp-Source: ABdhPJxGoDe1hyYH/pyHsCXhsq7vNNlmo+01J7Pfi461ckZ6VIW5ob8Gq/VpIU7n4MrrLuZpzON+ZaxLGvCBU3B8G/Q=
X-Received: by 2002:aa7:d1d3:: with SMTP id g19mr12892273edp.373.1629909049117;
 Wed, 25 Aug 2021 09:30:49 -0700 (PDT)
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
References: <20210818190750.g3xedu7j24sqndo2@nitro.local>
In-Reply-To: <20210818190750.g3xedu7j24sqndo2@nitro.local>
From: Rob Herring <robh@kernel.org>
Date: Wed, 25 Aug 2021 11:30:37 -0500
X-Gmail-Original-Message-ID: <CAL_Jsq+zxVw3BaAzF+58KT9jrFWNzUpELevj=SGPJSrdcVFPSw@mail.gmail.com>
Message-ID: <CAL_Jsq+zxVw3BaAzF+58KT9jrFWNzUpELevj=SGPJSrdcVFPSw@mail.gmail.com>
Subject: Re: New version of lore available for preview
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc: users@linux.kernel.org, tools@linux.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Wed, Aug 18, 2021 at 2:07 PM Konstantin Ryabitsev
<konstantin@linuxfoundation.org> wrote:
>
> Hi, all:
>
> We will be deploying a newer version of lore.kernel.org soon, with the
> following significant improvements:
>
> 1. The default view becomes /all/, which displays messages from all lists and
>    allows the usual query/retrieval operations across all sources. This
>    achieves multiple goals, such as ability to aggregate threads regardless on
>    which list the follow-up discussion took place and will automatically
>    backfill missing messages if they are present on one list but not on
>    another.
> 2. Instead of a single system, lore.kernel.org will be mirrored across three
>    nodes currently serving git.kernel.org. This both reduces single points of
>    failure and makes things faster for folks in EU/APAC.
> 3. The web interface will now respect your browser-preferred color scheme and
>    will display dark mode interface if that's how you like it.
>
> You can access the new version at https://x-lore.kernel.org/ and it should be
> fully usable for daily operations.
>
> You can use x-lore with b4, though I strongly recommend switching to master
> branch in order to better deal with some of the changes happening on the
> server-side. Simply add the following to your ~/.gitconfig:
>
> [b4]
>   midmask = https://x-lore.kernel.org/r/%s
>
> Please report any problems or hiccups that you discover. There is no specific
> ETA for the new version go-live, but if all goes well, the hope is to have it
> in place by end of August.

I've switched over and so far, so good. I'm happy that now I get full
threads regardless of the sender's choice of MLs and no more mangling
of subjects with commas in them (DT patches frequently have commas).

Thanks!,
Rob
