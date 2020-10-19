Received: from mail-qk1-f174.google.com (mail-qk1-f174.google.com [209.85.222.174])
 by mx.groups.io with SMTP id smtpd.web10.12317.1603111409048654902
 for <tools@linux.kernel.org>;
 Mon, 19 Oct 2020 05:43:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=TmsX4IzC;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.222.174, mailfrom: konstantin@linuxfoundation.org)
Received: by mail-qk1-f174.google.com with SMTP id i22so7630948qkn.9
        for <tools@linux.kernel.org>; Mon, 19 Oct 2020 05:43:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=oV6k73QfGzyyghI/N95BGloOwADHoC4Kx//k8zAhofY=;
        b=TmsX4IzCMnr+cSTLE8HIpDrkkudngRqW182958sZiHbnRTqpTI0JaZN58wk3yU0A2/
         vxieBChc4QccxuVdTHcLkSQSIJ70E19ZHVURgJHKwx1FRT1Ca/umFoXezbuTl5rLloez
         nrQcXqyptZQilSudwJ/WqZ8S04bPvuuaADeGw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=oV6k73QfGzyyghI/N95BGloOwADHoC4Kx//k8zAhofY=;
        b=GgMdy9ruCuhFiLbQcYBpl6CAQYyRspyuJ33wh0pHyQWZiebQFqE7CDHY1sTl5dOcvA
         cBanCGnsxyyQafP3D4E1do5FeVrVVH+/ZCfMDucCDnooTdWe3xtCgah86FlS59dCWETB
         dGRAnkNWOroLD/xAP+0I18c6HKH7q9V/HchDYT4DdvzdNtuZ8j4c42DfsUtU01BAek9g
         UsDT23fxPbB0NwgvDJAtNcUiSA+AQad4THjFSxxM9W07Ie4Jno/2z+MsS1qoOggikJwz
         wgSTjre/OrcDUa0Fvitmy61NpRIqKeaTCKQsDuZSb+40IduGajoxViSpY6W56BYSGNqd
         iTwA==
X-Gm-Message-State: AOAM530YTMegq9AZhMYPw2Ig1cku8woB7HyA1Zy6a1L/0SvU00NYyNhy
	z712TJvsL8AaplA+yWYffK2Icw==
X-Google-Smtp-Source: ABdhPJxe8M3RNPEsDm7Sln13ZANiYbUC+XVZiQModpm99+fCRxAWI7WUfWakT5jaYp3QrvT6AC3XhQ==
X-Received: by 2002:ae9:ee15:: with SMTP id i21mr14908078qkg.76.1603111407940;
        Mon, 19 Oct 2020 05:43:27 -0700 (PDT)
Return-Path: <konstantin@linuxfoundation.org>
Received: from chatter.i7.local ([89.36.78.230])
        by smtp.gmail.com with ESMTPSA id v65sm4177428qkb.88.2020.10.19.05.43.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2020 05:43:27 -0700 (PDT)
Date: Mon, 19 Oct 2020 08:43:25 -0400
From: "Konstantin Ryabitsev" <konstantin@linuxfoundation.org>
To: Greg Kroah-Hartman <greg@kroah.com>
Cc: users@linux.kernel.org, tools@linux.kernel.org,
	Johan Hovold <johan@kernel.org>, Sasha Levin <sashal@kernel.org>
Subject: Re: b4 seems to be dropping "cc: stable" on patches.
Message-ID: <20201019124325.r5kx3yq3kqounke5@chatter.i7.local>
References: <20201019072006.GB3219053@kroah.com>
MIME-Version: 1.0
In-Reply-To: <20201019072006.GB3219053@kroah.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

On Mon, Oct 19, 2020 at 09:20:06AM +0200, Greg Kroah-Hartman wrote:
> Hi Konstantin,
> 
> It looks like 'b4' is dropping the cc: stable lines of patches.

Correct, sorry about that -- I was trying to tighten trailer recognition 
to avoid hitting some of the false-positives I've seen and apparently 
this affected Cc: and Link: trailers. :(

This is currently fixed.

> I can reproduce this on the current b4 git tree, at commit c0910ee77a2a
> ("Fix header encoding introduced by earlier fix") as of this moment.

This is one of the dangers of the devel branch, unfortunately -- 
sometimes it ends up with half-baked code. I do need to finally put a 
solid test matrix in place, which is the target for 0.7.0 -- currently 
I'm just continuously running on lkml to find crashers, but it's not a 
good enough solution for finding formatting errors. So, the hope is that 
we'll learn to avoid regressions like this one in the near future.

-K
