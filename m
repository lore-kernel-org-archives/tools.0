Received: from mail-qv1-f65.google.com (mail-qv1-f65.google.com [209.85.219.65])
 by mx.groups.io with SMTP id smtpd.web10.5114.1599680730419923784
 for <tools@linux.kernel.org>;
 Wed, 09 Sep 2020 12:45:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=D5vSVCZM;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.219.65, mailfrom: konstantin@linuxfoundation.org)
Received: by mail-qv1-f65.google.com with SMTP id cy2so2192527qvb.0
        for <tools@linux.kernel.org>; Wed, 09 Sep 2020 12:45:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=vD9JE1CTVwys84Z66Ks9dK6lH+UPG6AO9eVS8pmT1NI=;
        b=D5vSVCZMrne9nrnWwi65Q7A180uCxRiOVXmD7apnyQ5QHzURCygUqNCcs8qfieD7sv
         A2Qhyn9jkx6UJAUls/W2hcZRnC28ZG7v4ZTO21xKNLe0C2qwwPrOAwJzYCbfpxMFaHMA
         ZjuHbXYqrTmX6UsjeE/50bmU+QesdV4jupXhQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=vD9JE1CTVwys84Z66Ks9dK6lH+UPG6AO9eVS8pmT1NI=;
        b=EDiNKS5gX1TqW4n9uMdguyJKtZoY5yFPE6fLm6MGeZD6o9KRe96YiikmYtsvP3qzyR
         gmGJqLpGfLhMS8ZS/TVEXicCgVCUgX1kCg1AWrHXPoA6/K+OGum/BI7qUztjp1AnzL4H
         xajSgZ1oIAWhnDTZqosKw33kM7xcUNOnyZcCCr8dRbXIV2UVWhqSkmUccn/UxT/Gw2DH
         qZUOJSbqArhPPIbAeThroeBZC+9ucoHQZIcy6ul3FdM4XEcCYuMQOXr/W6Fl+6DuEI+r
         aShKvRXr1x/GsJp+rm73elo5Kkn+++hGfBDAZUON9HRl1XJZJWqWteeneURfx1Jrhstk
         JlEA==
X-Gm-Message-State: AOAM530v3uIY1cvAa9RCh63N0wQtXQVIyz/dRj8VP82dMXIPevywSiXK
	P+T1a+7KJnUAo7VKxZ7/Icm5USNuu6VJfGkU
X-Google-Smtp-Source: ABdhPJw6ckK8fp9ScqR88e3jCk1EcKKJNhWBCYLppQ3WnVmvC4lwftNxgqbZYzvyK1YubV20noQi7Q==
X-Received: by 2002:a05:6214:8b:: with SMTP id n11mr5631613qvr.60.1599680729282;
        Wed, 09 Sep 2020 12:45:29 -0700 (PDT)
Return-Path: <konstantin@linuxfoundation.org>
Received: from chatter.i7.local ([89.36.78.230])
        by smtp.gmail.com with ESMTPSA id 184sm3670669qkl.104.2020.09.09.12.45.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2020 12:45:28 -0700 (PDT)
Date: Wed, 9 Sep 2020 15:45:27 -0400
From: "Konstantin Ryabitsev" <konstantin@linuxfoundation.org>
To: tools@linux.kernel.org, josef@toxicpanda.com
Cc: kernel-team@fb.com
Subject: Re: [tools] [PATCH] b4: add an --apply option for b4 am
Message-ID: <20200909194527.ig2b4ayod7esd2a3@chatter.i7.local>
References: <73e01862e01dc42fe853365e4babe1f9d8c2e839.1598283790.git.josef@toxicpanda.com>
MIME-Version: 1.0
In-Reply-To: <73e01862e01dc42fe853365e4babe1f9d8c2e839.1598283790.git.josef@toxicpanda.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

On Mon, Aug 24, 2020 at 11:43:21AM -0400, Josef Bacik wrote:
> I'm infinitely lazy and would rather not have to copy and paste the git
> am command to run.  This patch adds a --apply/-a option to git am so
> it'll go ahead and run git am so I can get to the work of reviewing a
> patch series.

I've considered this many times, but I thus far prefer not to do it, as 
we generally try not to touch the developer's tree in order to avoid any 
potential badness.

The functionality you want can be easily achieved with "-o- | git am", 
so you can make sure to heed any error messages first without it, and 
then with it:

b4 am <msgid>
(perform the review)
b4 am <msgid> -s -l -o- | git am

Would you be willing to use that, or do you think we really need an 
--apply option?

-K
