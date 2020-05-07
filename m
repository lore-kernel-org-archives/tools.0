Received: from mail-qv1-f68.google.com (mail-qv1-f68.google.com [209.85.219.68])
 by mx.groups.io with SMTP id smtpd.web10.421.1588873074073539414
 for <tools@linux.kernel.org>;
 Thu, 07 May 2020 10:37:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=UK318oet;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.219.68, mailfrom: konstantin@linuxfoundation.org)
Received: by mail-qv1-f68.google.com with SMTP id t8so3081142qvw.5
        for <tools@linux.kernel.org>; Thu, 07 May 2020 10:37:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=H2qbC+XAFVE8wdw7JUQEcduz3gA+j8Q3cs1oggMtAco=;
        b=UK318oetvF5j+nJAOxqUMtVmFYrNqjKx1Wf61+/RDhoMBnWVWN2FRyFTd6iDTKhCst
         QTyXY0gPPZnoGbtU+IrKgza44yNYlhRrkUQSpJ+84N+xaftniGjuS1D1u0QopLOVSBbK
         XgMyL0BvSuhpZchpkvNufGp+Ayrna0wLt58mc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=H2qbC+XAFVE8wdw7JUQEcduz3gA+j8Q3cs1oggMtAco=;
        b=DV5G1j6LB+4q2fWttAQlpMhoPPNezc4UhjuoVV7sw+nk52CGonocEVZ/7CjhFQgs2+
         cNuBx51E3RscICIJV4oHhIh/NZjrDRiwkCmjyeGng/pkI9FVQxpxmfqeww40dYjFaGAN
         hdXWURkZN8tNpWM18xp5KVoHkGloZWpcz/oiltSR/Uv00pHsgqpwaQukRAjsb7br7npA
         A5VAwkDqK9WcIf9r/bwkRQAhSsb6oQQqBhmIcwEjne84tJKtizjG6DZ8zKtAhycmWGZz
         rGETlyZwEA4lqysqwGcbND7NCzWByPYQ6H3pHDyIDN81tmNhUqEhYXhCX+2QekYSn6aT
         JjSw==
X-Gm-Message-State: AGi0PubL4eknt+vxN8ieGn8sgPYYCLMc+qUcUsqCdNDxvuJ2cg/hoYCP
	M0iRtY+hWKqsFkMZQL2fTNLffA==
X-Google-Smtp-Source: APiQypIsuGTCSsAMtVl6TbfmBAZnhEEU2MT3Vc91gPSbWVHTrGIlLdeOu+e/8BM0uJineU73ZRxTew==
X-Received: by 2002:a05:6214:150f:: with SMTP id e15mr14100870qvy.18.1588873073122;
        Thu, 07 May 2020 10:37:53 -0700 (PDT)
Return-Path: <konstantin@linuxfoundation.org>
Received: from i7.mricon.com (107-179-243-71.cpe.teksavvy.com. [107.179.243.71])
        by smtp.gmail.com with ESMTPSA id v2sm4882761qth.66.2020.05.07.10.37.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 May 2020 10:37:52 -0700 (PDT)
Received: by i7.mricon.com (sSMTP sendmail emulation); Thu, 07 May 2020 13:37:50 -0400
Date: Thu, 7 May 2020 13:37:50 -0400
From: "Konstantin Ryabitsev" <konstantin@linuxfoundation.org>
To: Will Deacon <will@kernel.org>
Cc: tools@linux.kernel.org
Subject: Re: b4 ty not picking up per-remote git config properties
Message-ID: <20200507173750.jvd6kvatmon36pa2@chatter.i7.local>
References: <20200507114255.GB29541@willie-the-truck>
MIME-Version: 1.0
In-Reply-To: <20200507114255.GB29541@willie-the-truck>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

On Thu, May 07, 2020 at 12:42:56PM +0100, Will Deacon wrote:
> Hi Konstantin,
> 
> I've been having trouble persuading 'b4 ty' to honour the 'b4-treename'
> and 'b4-commit-url-mask' properties if they are specified on a per-remote
> basis. This seems to be because get_branch_info() has expectations about
> branch naming to which I'm probably not adhering.
> 
> In my specific case, I have a branch called 'for-joerg/arm-smmu/updates'
> which has a remote called 'wd-korg', so my .git/config contains:
> 
> [remote "wd-korg"]
> 	...
> 	b4-treename = will
> 	b4-commit-url-mask = https://git.kernel.org/will/c/%.12s
> 
> [branch "for-joerg/arm-smmu/updates"]
> 	remote = wd-korg
> 	merge = refs/heads/for-joerg/arm-smmu/updates
> 
> but 'b4 ty' always takes the properties from my top-level .gitconfig.
> 
> I've hacked ty.py as below to get things working but, believe it or not,
> this is the first time I've written any python so I suspect it's all a
> load of rubbish.

It's not, I used it largely without changes. The latest master and 
stable-0.4.y should be a lot less naive about local and remote branch 
names.

Best,
-K
