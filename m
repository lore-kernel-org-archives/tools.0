Received: from mail-qt1-f175.google.com (mail-qt1-f175.google.com [209.85.160.175])
 by mx.groups.io with SMTP id smtpd.web10.53653.1606233504014772936
 for <tools@linux.kernel.org>;
 Tue, 24 Nov 2020 07:58:24 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=ZJ/COZRy;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.160.175, mailfrom: konstantin@linuxfoundation.org)
Received: by mail-qt1-f175.google.com with SMTP id t5so16433706qtp.2
        for <tools@linux.kernel.org>; Tue, 24 Nov 2020 07:58:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=Rcakhdzr9c1VvPo1puye/v7T1rhdXrKjh/imxxXKcBI=;
        b=ZJ/COZRybO7dThLe/dmFlTEy68DLTrB65rSkWR620XH9SRnh04yrdXXwyxfPAeoNS2
         vl8+fF7pfSaD5QJVsPQTt08kXQHI6cYBqaE2dEu/KMxqawlglpiSAAIZZgcfFHTEu3Nd
         g5Tk/dUqn60Ny3jqNgMciBtDp+nlTMrZEtqXs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to;
        bh=Rcakhdzr9c1VvPo1puye/v7T1rhdXrKjh/imxxXKcBI=;
        b=TwVBK+IjRf15/7mdMEkyCqyea3cVLoUHXvsEmhBwmcUN8/u/T8zFm1MkzlrepyddI2
         wuh6REY2My2KaW0GUGTH0/Y3u6jxLt0OjjoWjLZCa/ypL/liX2ye0o54pD9Ukgb8x0uE
         iTRmnxay84tnCbNCGR45MTxbbzTV/3w/zSjagOLTdsQwRpeVd225xrOvE+Ijr2taiCXn
         VTM0M2FyWlVrG15zAxLRkbafYMYDnsBIzDQTk4TRG8BX/g0uhWp2MyMzOJOvafN4RT+h
         iAxAAniL8qb/C6pHRxctc4MQJSoZUeZN61KrFN0rc2xnUd1Yr32yGhIeO09huyXjLjXx
         GxtA==
X-Gm-Message-State: AOAM533lHtj9RvRnHzOJIXKOfIN+SObFONUT+h+Xvwornqxdho0OXV0Y
	+o1lWUjvwVhNogdtpCH5Gzvhww==
X-Google-Smtp-Source: ABdhPJyZM9VE/bInlO518H/5Hs0JY+Ei8mhkvhUoh5oscYRCITFKHhnCoRYKY35D16mAsb5iTTXktg==
X-Received: by 2002:ac8:34e9:: with SMTP id x38mr4967338qtb.141.1606233503020;
        Tue, 24 Nov 2020 07:58:23 -0800 (PST)
Return-Path: <konstantin@linuxfoundation.org>
Received: from chatter.i7.local ([89.36.78.230])
        by smtp.gmail.com with ESMTPSA id v32sm13953643qtb.42.2020.11.24.07.58.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2020 07:58:22 -0800 (PST)
Sender: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Date: Tue, 24 Nov 2020 10:58:20 -0500
From: "Konstantin Ryabitsev" <konstantin@linuxfoundation.org>
To: Philippe Blain <levraiphilippeblain@gmail.com>
Cc: tools@linux.kernel.org
Subject: Re: [BUG] b4 can't grap thread with already-percent-encoded slash
Message-ID: <20201124155820.db3ypsohltauumsa@chatter.i7.local>
References: <2ce40a78-4291-c01c-f468-8b7f3be2f379@gmail.com>
 <20201124144542.arws25irjgylbrqa@chatter.i7.local>
 <8a1500fe-7c1a-2904-7723-8e638f524c03@gmail.com>
 <20201124145232.2mnfvyqy5cdb7ds7@chatter.i7.local>
 <2dc4badd-6f08-d83b-f57d-48c1286748d0@gmail.com>
MIME-Version: 1.0
In-Reply-To: <2dc4badd-6f08-d83b-f57d-48c1286748d0@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

On Tue, Nov 24, 2020 at 09:55:47AM -0500, Philippe Blain wrote:
> > No, I *just* fixed it, so you'll need the latest master.
> 
> Ha! wow I'm impressed by your responsiveness then :P

Just luck, I assure you. :) I happened to be looking at that exact code.

Glad it works.

-K
