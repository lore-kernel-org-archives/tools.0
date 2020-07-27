Received: from mail-qv1-f68.google.com (mail-qv1-f68.google.com [209.85.219.68])
 by mx.groups.io with SMTP id smtpd.web11.56284.1595858921446836924
 for <tools@linux.kernel.org>;
 Mon, 27 Jul 2020 07:08:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=afOGkURh;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.219.68, mailfrom: konstantin@linuxfoundation.org)
Received: by mail-qv1-f68.google.com with SMTP id j10so809429qvo.13
        for <tools@linux.kernel.org>; Mon, 27 Jul 2020 07:08:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=date:from:to:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=SM543hcxzFezPB2cPg8s4yMlJCWubVnzAxA04LBkm8A=;
        b=afOGkURhz2Ny4cDl8fFifL8UkwRltULtwn32ldi8jbwnZJ4XMmM3CDry2eCE+52qHQ
         e74XiJzLma8Xndw/Sx5q4X73Ikz330k1p8iof9wtOsoi7F2Jc7gIpdJap/TIfjLFDDey
         min3asE73W9lz+BW5myukioIF7uK7LMwYNuMI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=SM543hcxzFezPB2cPg8s4yMlJCWubVnzAxA04LBkm8A=;
        b=KzRGDmwgmWULoEGG3uq23iHxnzG9pjIwGEwgbNA1rhrctzDSrs1Cegkxj5l3U4qU1U
         qeOQIp2fjcYgX6AoCLYni+BiW5I/6Xkc+6VccQgh6CwUokr53u1HJ33DfKo90s2QQ4Qn
         Ym8/duq+Si9S0/Qu4ciPUUps6ykybiL4Te2k48y0q/QXdSDvwyqnB3muqm1NPUHhO9z4
         Yg8HCGeOyhWBFWx+DzqD3i/h0KSyUntVDbqZ/IMRJTzVczhBtM7Rqy7GUlGPXHd1cpg1
         JQpz9FmVCtYGXQbhBU62yJxikusF7yGKLlL/AKtQXat/3Yi+LiNZF4NgFdZcCAYM7ek4
         Fs3A==
X-Gm-Message-State: AOAM5307lMjATq0wywrExgrabPpTnR24Kch1174Jr4aYXvcmHvl2Y0m5
	oJuwZxGT7EAEK0V8dx7gqYR/0SznpZUeTg==
X-Google-Smtp-Source: ABdhPJy9HkxtO2kAUGfSO0r7Rq3n1oA1LAB3dqsAyFGRfi87KOER+RF1hox348OAO5rybeiTvidv0w==
X-Received: by 2002:a05:6214:2d2:: with SMTP id g18mr22209475qvu.215.1595858920029;
        Mon, 27 Jul 2020 07:08:40 -0700 (PDT)
Return-Path: <konstantin@linuxfoundation.org>
Received: from chatter.i7.local ([87.101.92.156])
        by smtp.gmail.com with ESMTPSA id r18sm14048229qtf.62.2020.07.27.07.08.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jul 2020 07:08:39 -0700 (PDT)
Date: Mon, 27 Jul 2020 10:08:37 -0400
From: "Konstantin Ryabitsev" <konstantin@linuxfoundation.org>
To: tools@linux.kernel.org, kyle@kyleam.com
Subject: Re: [tools] [PATCH b4 0/2] Two fixes for LoreMessage.get_body_parts()
Message-ID: <20200727140837.j235wtekraafvbuq@chatter.i7.local>
References: <20200726034115.21567-1-kyle@kyleam.com>
MIME-Version: 1.0
In-Reply-To: <20200726034115.21567-1-kyle@kyleam.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

On Sat, Jul 25, 2020 at 11:41:13PM -0400, Kyle Meyer wrote:
> After using 'b4 am' to grab a series from public-inbox meta [0], I
> noticed that many of the commit message bodies were missing.  It turns
> out that this happens when a message body consists of only a single,
> non-trailer paragraph.
> 
> The second patch fixes this.  The first patch addresses another issue
> I spotted when debugging the dropped commit messages.

Thanks, applied both to  master and stable-0.5.y. I guess I'm so used to 
trailers that I haven't considered cases where there are commits without 
them. :)

-K
