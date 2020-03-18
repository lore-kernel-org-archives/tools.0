Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
 by mx.groups.io with SMTP id smtpd.web12.571.1584563926016253411
 for <tools@linux.kernel.org>;
 Wed, 18 Mar 2020 13:38:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=J4wytQFR;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.49, mailfrom: konstantin@linuxfoundation.org)
Received: by mail-wm1-f49.google.com with SMTP id m3so4981977wmi.0
        for <tools@linux.kernel.org>; Wed, 18 Mar 2020 13:38:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=rbkcDeuRYEz8U9RFI3PHaxXdU2zqmaFcpZmPrcTlocM=;
        b=J4wytQFRyzZ6bcjj05WUvOaLWeEu0V3YQHKbeKmSDFN3wp9q4RzO9ir7Ijk7Gly7S5
         ykQCXMCQBf8Du6JzpB8M/SEHGhf0fyMRb+CjSvYHCJt0lEILrHJGFJ/pD/LsJzEcZGdU
         +Mzpaenvivfq3i2pkLdGIVp/o6p5I8YtiKxOg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=rbkcDeuRYEz8U9RFI3PHaxXdU2zqmaFcpZmPrcTlocM=;
        b=YWbjNvULK1Qz3O/05uu/YT6tzfdj4K4p9drOKubYy/ntXANx50AELkFJgVEtFa7hqM
         12RT8qVwGMsVjvf3RylOgMlsQxBccjVST/u9UhRfqw8UbXFOah8mrrBcm/Oe5oAi6Ok/
         4Ir02suKJDJRGxzJcOjHPUjrfG/h+rSFMH7TRfHT7h7o4HI+uROg9bcJOH1BcoKAVPYO
         ITKj6zucZ2XSr+pGLgZh7jy0VgokxMaKzNbo8khoFuoTtb+RrBLnyOnBj/lEegioav24
         izcszCN61s3m9y76f3UtviXcW2Em13b3uG2t4UnzgDMTL8pNW0qOEqA76pAdHwvD7ROp
         ITfw==
X-Gm-Message-State: ANhLgQ3JfRdpom7MuvNbCB3rc3kVIXzqSYP6eMrf2pUaSOU6f0nxUBGw
	gXZYgAYx9AAVujYWFE2zOv2N1Q==
X-Google-Smtp-Source: ADFU+vu1EKkGaspzzHK/8twy0env83Q2CVLgjHWjQza2CuyBYy8YrUlBzLsKaQetSXCSeNWiOeyYUw==
X-Received: by 2002:a1c:7d88:: with SMTP id y130mr7391767wmc.5.1584563924540;
        Wed, 18 Mar 2020 13:38:44 -0700 (PDT)
Return-Path: <konstantin@linuxfoundation.org>
Received: from chatter.i7.local (139.ip-51-83-76.eu. [51.83.76.139])
        by smtp.gmail.com with ESMTPSA id k84sm5484451wmk.2.2020.03.18.13.38.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Mar 2020 13:38:43 -0700 (PDT)
Date: Wed, 18 Mar 2020 16:38:38 -0400
From: "Konstantin Ryabitsev" <konstantin@linuxfoundation.org>
To: Mark Brown <broonie@kernel.org>
Cc: tools@linux.kernel.org
Subject: Re: b4 not finding patches
Message-ID: <20200318203838.jb2q4g4sxstob75e@chatter.i7.local>
References: <20200318202335.GF4553@sirena.org.uk>
MIME-Version: 1.0
In-Reply-To: <20200318202335.GF4553@sirena.org.uk>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

On Wed, Mar 18, 2020 at 08:23:35PM +0000, Mark Brown wrote:
> When I run
> 
>    b4 am -t 87y2s0olg6.wl-kuninori.morimoto.gx@renesas.com
> 
> it says:
> 
> | Grabbing thread from lore.kernel.org
> | Analyzing 13 messages in the thread
> | Found new series v1
> | Will use the latest revision: v3
> | You can pick other revisions using the -vN flag
> | ---
> | Writing ./v3_20200316_kuninori_morimoto_gx_renesas_com.mbx
> |   ERROR: missing [1/6]!
> |   ERROR: missing [2/6]!
> |   ERROR: missing [3/6]!
> |   ERROR: missing [4/6]!
> |   ERROR: missing [5/6]!
> |   ERROR: missing [6/6]!
> | ---
> | Total patches: 0
> | ---
> 
> even though lore appears to have the full thread:
> 
>    https://lore.kernel.org/alsa-devel/87wo7kolfa.wl-kuninori.morimoto.gx@renesas.com/

This is because the cover letter is the only bit where we see "v3":

> [PATCH v3 0/6]

all other messages have

> [PATCH N/6]

I'm not sure if there is a reliably clean way of handling this 
situation, but I'll think about it. For this particular case, you can 
just pass -v1 to "b4 am" to grab the actual patches.

-K
