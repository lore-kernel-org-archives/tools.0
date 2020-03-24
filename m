Received: from mail-qt1-f193.google.com (mail-qt1-f193.google.com [209.85.160.193])
 by mx.groups.io with SMTP id smtpd.web12.2473.1585088588115537275
 for <tools@linux.kernel.org>;
 Tue, 24 Mar 2020 15:23:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=UgwnZfR9;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.160.193, mailfrom: konstantin@linuxfoundation.org)
Received: by mail-qt1-f193.google.com with SMTP id t17so417436qtn.12
        for <tools@linux.kernel.org>; Tue, 24 Mar 2020 15:23:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=aRx/DRPQ/2V5bp6B2MM8QGGCTc/6qoHjPZzYq13UEiU=;
        b=UgwnZfR9aHYNNr5ZO1yco1dxCyveQqf5eKpREDLOk8NtEuEuh7wkNQ22DsZlOzCaOl
         hZGangMdYqnrFSzcyVYRfnsuaPXhCf2+yv3xC6TFHi/MIPsvsG7F8WiK6S2VEgkdInEz
         P/zoh+3gpz3R4e7s2AuYrrC4C9f7yKpcJjgek=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=aRx/DRPQ/2V5bp6B2MM8QGGCTc/6qoHjPZzYq13UEiU=;
        b=pQU4tksVwuj27PkCC3YlLxDXDrJNe1kGR5yX5YPhEOtLBwWaNuLu0eZK6MNtQn+XJy
         A0w+HfCP1gknwaRaj/Y9ok7297HxTYnWx3q3cpvVjAEcUnZChzQXSIpRL+dYncrVlcmN
         WFenMIh/LU7/KJydHh0ahnrqPjgmXe+u7BsQtJQX7rHFP66SxrrCSLKl75wiUdoyU4DY
         RTN2T9ACutT+vlgy78EjBpQZiec8RBw/aOjwNRTnZyH4yDkftM8Vx+KailzNEX98dfJr
         ZEWWw2GFFDfEiZiqVCa6/PdhtcY4bECStIp/V5+VoKUggDs7Ui2NBgCujc763LFoWrb9
         CQUQ==
X-Gm-Message-State: ANhLgQ1Pr8CJUr15BhasA6xR3GvfC0gIIb+Tsnl2jW/NTern3cRz7X/T
	gu5ljF6v2CXAgtekTJfwv9KI/A==
X-Google-Smtp-Source: ADFU+vtCsdowAAt+vf/8bIBFM2IefsTfkq14pJaXuvEEEFC0NSJa7Mke80o3eh3ma+14/A2CHfLF9A==
X-Received: by 2002:ac8:683:: with SMTP id f3mr107180qth.356.1585088587241;
        Tue, 24 Mar 2020 15:23:07 -0700 (PDT)
Return-Path: <konstantin@linuxfoundation.org>
Received: from chatter.i7.local (politkovskaja.torservers.net. [77.247.181.165])
        by smtp.gmail.com with ESMTPSA id 82sm14481573qkd.62.2020.03.24.15.23.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Mar 2020 15:23:06 -0700 (PDT)
Date: Tue, 24 Mar 2020 18:23:00 -0400
From: "Konstantin Ryabitsev" <konstantin@linuxfoundation.org>
To: Mark Brown <broonie@kernel.org>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
	users@linux.kernel.org, tools@linux.kernel.org
Subject: Re: [kernel.org users] get-lore-mbox missing Reviewed-by
Message-ID: <20200324222300.gbhlst7u5xbbkti4@chatter.i7.local>
References: <20200310120627.GA4106@sirena.org.uk>
 <20200310123644.a7r6cyaru57niio5@chatter.i7.local>
 <20200310124358.GD4106@sirena.org.uk>
 <20200310130949.inshbk4w5ngai2br@chatter.i7.local>
 <20200310131305.GC11767@piout.net>
 <20200310132451.GG4106@sirena.org.uk>
MIME-Version: 1.0
In-Reply-To: <20200310132451.GG4106@sirena.org.uk>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

On Tue, Mar 10, 2020 at 01:24:51PM +0000, Mark Brown wrote:
> > Maybe you could issue a warning or so when the SoB is not strictly
> > matching the From to make it obvious it has to be reviewed.
> 
> That's a good idea.

This kept happening, so I implemented the feature as suggested. If we 
come across a mismatch, we now warn about it:

------
$ b4 am 1527061353-16902-4-git-send-email-hl@rock-chips.com
Analyzing 9 messages in the thread
---
Writing ./v7_20180523_hl_drm_rockchip_add_transfer_function_for_cdn_dp.mbx
  [PATCH v7 1/5] drm/rockchip: add transfer function for cdn-dp
  [PATCH v7 2/5] Documentation: dt-bindings: phy: add phy_config for Rockchip USB Type-C PHY
  [PATCH v7 3/5] soc: rockchip: split rockchip_typec_phy struct to separate header
  [PATCH v7 4/5] phy: rockchip-typec: support variable phy config value
  [PATCH v7 5/5] drm/rockchip: support dp training outside dp firmware
---
Total patches: 5
---
NOTE: some trailers ignored due to from/email mismatches:
    ! Trailer: Enric Balletbo i Serra <enric.balletbo@collabora.com>
         From: Enric Balletbo Serra <eballetbo@gmail.com>
NOTE: Rerun with -S to apply them anyway
---
 Link: https://lore.kernel.org/r/1527061353-16902-1-git-send-email-hl@rock-chips.com
 Base: not found, sorry
       git checkout -b v7_20180523_hl_rock_chips_com master
       git am ./v7_20180523_hl_drm_rockchip_add_transfer_function_for_cdn_dp.mbx
------

Rerunning with -S applies them:

------
$ b4 am 1527061353-16902-4-git-send-email-hl@rock-chips.com -S
Analyzing 9 messages in the thread
---
Writing ./v7_20180523_hl_drm_rockchip_add_transfer_function_for_cdn_dp.mbx
  [PATCH v7 1/5] drm/rockchip: add transfer function for cdn-dp
  [PATCH v7 2/5] Documentation: dt-bindings: phy: add phy_config for Rockchip USB Type-C PHY
  [PATCH v7 3/5] soc: rockchip: split rockchip_typec_phy struct to separate header
    + Reviewed-by: Enric Balletbo i Serra <enric.balletbo@collabora.com>
  [PATCH v7 4/5] phy: rockchip-typec: support variable phy config value
    + Tested-by: Enric Balletbo i Serra <enric.balletbo@collabora.com>
  [PATCH v7 5/5] drm/rockchip: support dp training outside dp firmware
    + Tested-by: Enric Balletbo i Serra <enric.balletbo@collabora.com>
---
Total patches: 5
---
 Link: https://lore.kernel.org/r/1527061353-16902-1-git-send-email-hl@rock-chips.com
 Base: not found, sorry
       git checkout -b v7_20180523_hl_rock_chips_com master
       git am ./v7_20180523_hl_drm_rockchip_add_transfer_function_for_cdn_dp.mbx
------

This feature is in both the latest master and in stable-0.3.y.
Please try it out.

-K
