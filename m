Received: from mail-qt1-f193.google.com (mail-qt1-f193.google.com [209.85.160.193])
 by mx.groups.io with SMTP id smtpd.web11.4495.1587595428545822630
 for <tools@linux.kernel.org>;
 Wed, 22 Apr 2020 15:43:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=TsZyt6vu;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.160.193, mailfrom: konstantin@linuxfoundation.org)
Received: by mail-qt1-f193.google.com with SMTP id s30so3281452qth.2
        for <tools@linux.kernel.org>; Wed, 22 Apr 2020 15:43:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=pxUzynu3ky761aP6GOxUAEqlOueJ5RMUojAxdo/KVlA=;
        b=TsZyt6vuv04mRespu+WAeoAORedtfM9N/Er6XnD5/RRGXiE+oQg6Nup5594XjpC3GW
         G70Zy39BXFrIVf5WNxdOFmeHwArpQdgiIMKZmCk+v8QCYKzqXhehuo8+Z8pxfr/5lURB
         Xtt+RJrJA8C45OiRnIUmkmmxfbtmPpGecno40=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=pxUzynu3ky761aP6GOxUAEqlOueJ5RMUojAxdo/KVlA=;
        b=L/GbtcJ1+0DAoQ9ShZJfsdQOvJJtvu//mShwCZzBdh1mG4AoLR/l7GHll2WyRPPfWl
         oMkE4UW48QqNkvaC+6daf/E1XABGKFL9au6XcKS9XIuGQQi42LhJPeyU1UsHYoTUN4u1
         Ayo5yJQRWxYpiW4aSqeWAXpYo6gjV0Z9uOKZxJJiBZJ6/B28HvGbzY2OtczHywujES1i
         XhFmczegsw96P1h3Y79h+6zkCrZBrKC8ixBvSQipDz7XXPsb2doxoZYgDN8kFzLltH0O
         kFTVdXtysV0YzZ9dI0ElBlWIVyMFxMZpNoEL1ToeZmMARp+gY8/LvcMdpdcBr9Uo8VzO
         dcBg==
X-Gm-Message-State: AGi0PuYyW6T/wUx65zFaFRKCKiXWrUIJ3eQZi4yoKwBufUgeHxhJyg38
	JNBNSz/CTi1d2sYSf3IfU0l/OA==
X-Google-Smtp-Source: APiQypJJEKpPq/FWrCQ6NlOXr8D1LkafYqcICNaWhbQmXztgvVCC1ulXHivKCr1bQVdvg35jMGEe/Q==
X-Received: by 2002:ac8:1a85:: with SMTP id x5mr1048454qtj.302.1587595427693;
        Wed, 22 Apr 2020 15:43:47 -0700 (PDT)
Return-Path: <konstantin@linuxfoundation.org>
Received: from chatter.i7.local (107-179-243-71.cpe.teksavvy.com. [107.179.243.71])
        by smtp.gmail.com with ESMTPSA id w27sm519325qtc.18.2020.04.22.15.43.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Apr 2020 15:43:47 -0700 (PDT)
Date: Wed, 22 Apr 2020 18:43:45 -0400
From: "Konstantin Ryabitsev" <konstantin@linuxfoundation.org>
To: Mark Brown <broonie@kernel.org>
Cc: tools@linux.kernel.org
Subject: Re: b4 ty doesn't respect -b for prs
Message-ID: <20200422224345.jx7f6w7h4aisae6v@chatter.i7.local>
References: <20200422140637.GI4898@sirena.org.uk>
MIME-Version: 1.0
In-Reply-To: <20200422140637.GI4898@sirena.org.uk>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

On Wed, Apr 22, 2020 at 03:06:37PM +0100, Mark Brown wrote:
> When I run b4 ty to generate thank-you letters for a pull specifying 
> -b
> the program doesn't find the merge commit:
> 
>   $ b4 ty -b asoc-5.7 -s 2
>   Generating 1 thank-you letters
>   Could not get merge commit id for [GIT PULL] ASoC: tegra: Fixes for v5.7-rc3
>   Was it actually merged?
> 
> however if I change to the branch it does:
> 
>   $ git checkout asoc-5.7
>   Switched to branch 'asoc-5.7'
>   $ b4 ty -b asoc-5.7 -s 2
>   Generating 1 thank-you letters
>   Writing: ./thierry_reding_gmail_com_git_pull_asoc_tegra_fixes_for_v5_7_rc3.thanks

Good find -- there is a fix for this in master.

> (asoc-5.7 is for-5.7 in my sound tree, the merge commit is now 
> published.)

I see that your message says "undefined" here:
https://lore.kernel.org/alsa-devel/158756395814.23495.171205742201395813.b4-ty@kernel.org/

I'll see if I can find something nicer for it to say instead.

-K
