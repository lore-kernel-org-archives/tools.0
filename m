Received: from mail-qk1-f195.google.com (mail-qk1-f195.google.com [209.85.222.195])
 by mx.groups.io with SMTP id smtpd.web10.6386.1607519967445212426
 for <tools@linux.kernel.org>;
 Wed, 09 Dec 2020 05:19:27 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=P4y/egPq;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.222.195, mailfrom: konstantin@linuxfoundation.org)
Received: by mail-qk1-f195.google.com with SMTP id z11so1101210qkj.7
        for <tools@linux.kernel.org>; Wed, 09 Dec 2020 05:19:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=U/JmD/JEZjtfvG78xl+WzkA+POdNZcaA2P+4tTio1LI=;
        b=P4y/egPqO+1OEctWuJ7jBszZDYazW9yjCyygi/IdYc/dFYeq+ikRQdwFKeetPGf/1G
         jKEJK+TJnQJAe4dkliqSNOnhxYu8avBAR6/g5O4H56d8SqE2PDTNtBFi4TB4nQst29ap
         raqvcxieH2XXMtghc4sgYiVaZOs+aYxB80hUo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=U/JmD/JEZjtfvG78xl+WzkA+POdNZcaA2P+4tTio1LI=;
        b=X+MbatBhNv3tgSkul3TVHpBooK11kgwLTNWiwhYlCoJS4sDe/+LaOqL6yJtWe0dOwb
         fWmVhZ0kxOsoJgkuQaXqRmpeyKAF2Pjfrd7836vv7dT6ALp+xLVgRSU8OPSRS21sirqX
         Xer5nN2aa/Iw6YnQ4Mj3nkRsMNw/h2JSiwkFC5yUr3ML1zsLqlQvsaxSAku1Ukviuc8H
         oC6yHsJ1eq3h5phHoaK3JXlu2iNwmPWqQQ9BFuWlLK14cUbpU1qNrd1BEeH/ylHIZehU
         QL5mKiht8MDRkUIdWzXBDbJz2+aZkmQGAjLdH93vgIiZSqj8oKI6hMCmgljUMrNskGa+
         5QDw==
X-Gm-Message-State: AOAM5315FssaCX39PisOviVy3MmmWxBLeQ/koXznufFPNVzdRE+G/RvY
	yvwWnCI62R96qJ0m6Tmf2e9AiA==
X-Google-Smtp-Source: ABdhPJwix+RQZJmgqak54w8khSIAD2gWf/2G+8H2LsgjITJIl8d8gM89zDIZsGn+fEVgtX7aKDMEwQ==
X-Received: by 2002:a05:620a:6c8:: with SMTP id 8mr2983999qky.176.1607519966493;
        Wed, 09 Dec 2020 05:19:26 -0800 (PST)
Return-Path: <konstantin@linuxfoundation.org>
Received: from chatter.i7.local ([89.36.78.230])
        by smtp.gmail.com with ESMTPSA id z125sm987410qke.18.2020.12.09.05.19.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Dec 2020 05:19:25 -0800 (PST)
Date: Wed, 9 Dec 2020 08:19:24 -0500
From: "Konstantin Ryabitsev" <konstantin@linuxfoundation.org>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: tools@linux.kernel.org,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: Re: b4 strips BiugLink
Message-ID: <20201209131924.bai7b4tj2wb7sbon@chatter.i7.local>
References: <CACRpkdZrth39GdKc0OFF9cDNHq2hBOXq1f-uU=TOOT8GaogoMQ@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CACRpkdZrth39GdKc0OFF9cDNHq2hBOXq1f-uU=TOOT8GaogoMQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

On Wed, Dec 09, 2020 at 09:13:44AM +0100, Linus Walleij wrote:
> Hi Konstantin,
> 
> I ran into this situation with b4, when trying to apply this patch:
> https://lore.kernel.org/linux-gpio/CACRpkdY6gEi6pzuuFCdO_Lj1r23=HKCWF+N+QR-E7kWS8bBkjg@mail.gmail.com/T/#m4ed4e0b58f70c69a0105c73ae8ea7ce8a6f5e61d
> 
> The "BugLink" tag gets stripped.
> 
> Is this on purpose, like b4 strips all unknown tags?

Yeah, I had to come up with some kind of "known trailers" list for what 
I call "non-person" trailers. It's easy to recognize a sign-off trailer, 
because it almost always follows the same format:

[\w-]: Name Here <email@here>

However, non-person trailers can be anything and we were routinely 
hitting false-positives whenever someone did stuff like:

See: https://foo.bar/baz
Example: https://foo.bar/baz
Ugh: https://foo.bar/baz
WTF: https://foo.bar.baz

> It seems BugLink is important to Intel so we better allow it
> in that case.

Okay, there is a fix in master and stable-0.6.y that adds BugLink to the 
list.

-K
