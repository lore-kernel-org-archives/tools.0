Received: from mail-qk1-f182.google.com (mail-qk1-f182.google.com [209.85.222.182])
 by mx.groups.io with SMTP id smtpd.web11.3829.1594073499648663661
 for <tools@linux.kernel.org>;
 Mon, 06 Jul 2020 15:11:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=e104nVh8;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.222.182, mailfrom: konstantin@linuxfoundation.org)
Received: by mail-qk1-f182.google.com with SMTP id l6so36413288qkc.6
        for <tools@linux.kernel.org>; Mon, 06 Jul 2020 15:11:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=H+tYoqDXpvAmFiPRnT+jwQco1JBZF9IWl/X1GOOIKks=;
        b=e104nVh8V4yF86T+EmoyvJx/w2er2w86k8TazJzoW7BiSL1vx4GwPZL69KHnO5M4Er
         Dm918eptT6H8QGhk5MKDvSzBCHRZWF1BQfAJJzejL41ZRnUt7BFP9B+pdeWfGIsSdbGh
         m+MbrIVCyE7QgW6yLD/ZjGVryVATUENmRA/ww=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=H+tYoqDXpvAmFiPRnT+jwQco1JBZF9IWl/X1GOOIKks=;
        b=Awumay7V/UyGdgqvPHIYjgjwVMw770r9D7/bDmaiyvHwJOT+ceiPd1aGR4vYTk9z6O
         CIhaIbT17HVE5+monP4oEeR9u3hRmHmTMWDK9z1khcjgzBbEZy8R6/myvND6Op5mfahr
         NBm4v2QscWdX+DnPNYUj5RU4dxNiP7QxUq3rhvxrKGsqMuZlCpccfIR+cnnE7LZWHMKf
         j95R0ObnfsnSVYYr/d6srK6OdIQGLb5AE6by9czYjOuRDxAbMhczq74sR7x6bcKfiYD+
         0tSDVne6Kh3nXWPuVVs6Sh1KVA7ubM1GfI3xkTJGv6AgI9G+uF1xXdEI/ZoCXMnId4/K
         v7Ag==
X-Gm-Message-State: AOAM533POQpo2v68hg1cIwv95xrMNS0tktBqg4LpnZfO2FJHaGm3p+97
	G+6ML3eQX3pFrJezpj5AO1FRmQ==
X-Google-Smtp-Source: ABdhPJwFs8b+mhfhmIojP0CJYIKoMkIMpaNSOp+NZqdZTq80EwsxdYgnmieFAPh3f3HrKGdW79walA==
X-Received: by 2002:a37:7b83:: with SMTP id w125mr48029256qkc.6.1594073498713;
        Mon, 06 Jul 2020 15:11:38 -0700 (PDT)
Return-Path: <konstantin@linuxfoundation.org>
Received: from chatter.i7.local ([87.101.92.156])
        by smtp.gmail.com with ESMTPSA id i22sm20219131qki.4.2020.07.06.15.11.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2020 15:11:38 -0700 (PDT)
Date: Mon, 6 Jul 2020 18:11:36 -0400
From: "Konstantin Ryabitsev" <konstantin@linuxfoundation.org>
To: Mark Brown <broonie@kernel.org>
Cc: tools@linux.kernel.org
Subject: Re: b4 picking the wrong message
Message-ID: <20200706221136.w7cduok4zjvpbbp2@chatter.i7.local>
References: <20200703185237.GA996@sirena.org.uk>
MIME-Version: 1.0
In-Reply-To: <20200703185237.GA996@sirena.org.uk>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

On Fri, Jul 03, 2020 at 07:52:37PM +0100, Mark Brown wrote:
> Hi Konstantin,
> 
> When I ask b4 am to fetch either of these message IDs:
> 
>    20200626164623.87894-1-sebastian.reichel@collabora.com
>    DB6PR1001MB10965E5BDA9B3EF570B607A4806A0@DB6PR1001MB1096.EURPRD10.PROD.OUTLOOK.COM
> 
> both of which are for v4 of a single patch that was previously part of a
> series b4 fetches v3 of that series rather than the v4 I thought I was
> asking for. I see that the patch (the first message ID) was sent in
> reply to discussion of v3 of the series which is probably confusing
> things, there's also the use of PATCHv4 rather than PATCH v4.

That's the culprit -- we look for a standalone word "PATCH" inside the 
brackets, so if it's mangled as [PATCHv4], then we don't consider that 
message. I added logic to master/stable-0.5.y to deal with that case.

Thanks,
-K
