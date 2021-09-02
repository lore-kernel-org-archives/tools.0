Received: from condef-09.nifty.com (condef-09.nifty.com [202.248.20.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63D703FC1;
	Thu,  2 Sep 2021 22:51:55 +0000 (UTC)
Received: from conssluserg-02.nifty.com ([10.126.8.81])by condef-09.nifty.com with ESMTP id 182Mjc0I002158;
	Fri, 3 Sep 2021 07:45:38 +0900
Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179]) (authenticated)
	by conssluserg-02.nifty.com with ESMTP id 182MjC5I031605;
	Fri, 3 Sep 2021 07:45:12 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-02.nifty.com 182MjC5I031605
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
	s=dec2015msa; t=1630622713;
	bh=+fqeZxWmqRtYXBL/A1vijWw1Y+gkTvj6cb31k+AHP2k=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=0PINxfSgcLgtfWrvmHFwibCLQT9s6+6aMiOOFWgDvIwbD1AnfID/izi4Q39+wCADa
	 etQg4GqEwIHSMLYjG4R55pkLX5RlU46lA9S9C33iq+uP2rdC3MWpt+iy55Zk04I1oW
	 jrNTETAghWrVJ9DWb0LOfeDx76w55T7C+xTDBhmiZcci7z/KZY6nqctBgIyV2g9e3Z
	 BVq6EzxctiSXxLjGeq59E1stojFr+NFArrKFixWPmS8IWNIRP6GWuKV1MLT2tskTm5
	 Q8DsbFe9muvp9x2iFU9fWoz83ITS1QLxas6Pqs9ndkoLfCrtzVCgb98R+vffPv2lQG
	 qZYMVwu0zS5Rg==
X-Nifty-SrcIP: [209.85.210.179]
Received: by mail-pf1-f179.google.com with SMTP id v123so2787833pfb.11;
        Thu, 02 Sep 2021 15:45:12 -0700 (PDT)
X-Gm-Message-State: AOAM532ExfUy2UDxFCcPBnMOFVi19gUzXdR8r4XDWP9trvNa4LtupqI5
	oN0D3CIjyfLGqeVoTU7cATrIh7lSAXw2Qb0E48o=
X-Google-Smtp-Source: ABdhPJwwciimra9j3y7iCT4kJJkjPnfZjanbksShLy9P4hVYawHVOSmDTOUhJSw4x9GIMdRiHcllKLVAw+NJ3PvenXI=
X-Received: by 2002:a63:dd51:: with SMTP id g17mr633508pgj.47.1630622711963;
 Thu, 02 Sep 2021 15:45:11 -0700 (PDT)
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
References: <20210818190750.g3xedu7j24sqndo2@nitro.local> <20210902195332.GA2493828@nvidia.com>
 <20210902201402.bbdttirbb5ckrtiz@meerkat.local>
In-Reply-To: <20210902201402.bbdttirbb5ckrtiz@meerkat.local>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Fri, 3 Sep 2021 07:44:35 +0900
X-Gmail-Original-Message-ID: <CAK7LNAQogtzDbAFDtRt7UvDkH6K4tkQgwfmu-2_0rGgo_Uj_iw@mail.gmail.com>
Message-ID: <CAK7LNAQogtzDbAFDtRt7UvDkH6K4tkQgwfmu-2_0rGgo_Uj_iw@mail.gmail.com>
Subject: Re: New version of lore available for preview
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc: Jason Gunthorpe <jgg@nvidia.com>, users@linux.kernel.org,
        tools@linux.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Fri, Sep 3, 2021 at 5:14 AM Konstantin Ryabitsev
<konstantin@linuxfoundation.org> wrote:
>
> On Thu, Sep 02, 2021 at 04:53:32PM -0300, Jason Gunthorpe wrote:
> > > Please report any problems or hiccups that you discover. There is no specific
> > > ETA for the new version go-live, but if all goes well, the hope is to have it
> > > in place by end of August.
> >
> > Hi Konstantin,
> >
> > The https://lore.kernel.org/lists.txt URL now gives a 404, is this
> > expected?
> >
> > If so does someone have a fix for lorifier.py? It is very unhappy to lose
> > this URL..
>
> I forgot about the lorifier. However, the upside is that you don't really need
> the lists.txt URL any more, as you can just blanket aim things at
> lore.kernel.org/all/<message-id> -- if it's on lore, it will be there.
>
> I pushed a quick fix here:
> https://github.com/mricon/lorifier/
>
> If you really want to only show the link if a message is actually on lore,
> it's easy to add a HEAD call to see if we get a 404 or not, so let me know if
> it's something you'd need.
>
> -K
>


I used to use
  https://lore.kernel.org/patchwork/project/lkml/list/
to pick up patches sent to LKML, but it is gone now.


I use
  https://patchwork.kernel.org/
to pick up patches per subsystem,
but LKML is missing there.
