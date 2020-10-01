Received: from mail-qt1-f172.google.com (mail-qt1-f172.google.com [209.85.160.172])
 by mx.groups.io with SMTP id smtpd.web10.284.1601575545142292452
 for <tools@linux.kernel.org>;
 Thu, 01 Oct 2020 11:05:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=Vc/sqU0x;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.160.172, mailfrom: konstantin@linuxfoundation.org)
Received: by mail-qt1-f172.google.com with SMTP id 10so1439809qtx.12
        for <tools@linux.kernel.org>; Thu, 01 Oct 2020 11:05:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=iyPGHz9Ix/yZVggFITp/LfRGEgh7QrpRV+nMz1IA1VY=;
        b=Vc/sqU0xIxysRo8r0k7KBX0kgvevVqJ04MDc1eAi+xkjeimlHqaaJAgXzkx2hL9D3s
         5QYOFLbL8kJ4lI93jTARWpMksQTvSxo6bSbgmdvj6j6CZFuEUdBE1G54nAuQShdcgzsR
         Y4/0XzLZxCoFADcPSB1oiZU6IHKq6DdkphwvU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=iyPGHz9Ix/yZVggFITp/LfRGEgh7QrpRV+nMz1IA1VY=;
        b=d32bLK3oK8zPIvaJII6hQ9H/HwOCwZDxaBMIW712sjt8ZvHu2tXcAVKkbOMoJJVR8s
         nBrtDxq81mTgRTluM69f5OcQxXe53joyfbj/v0Uu+ATQ4XrT7W+JjqDQBe22e/OtNPjt
         ZwMKljYe5mDGwDNeEww/inhWV1dx1eho4bxdIpbvecW7vvfpyY7FA61fMr2lfE25c+UK
         +G011vfZWkUHU7fSotBcn1twp7URW+yWybGA9GH5RevQ5Vos4NCxkBrVuWmwmUGPlii9
         7OeZNy0pGWxja43nEyzfNb7jb5OcxFsMP10b3XBWDjWjSoZwaOU4z3wFMyupi4mYNVGT
         2bEQ==
X-Gm-Message-State: AOAM531cSD9SjcqMsTdRBQgXKmFxcyLEoPs3JZ5NPNbRCEHzP5wgrNqT
	24dLeDbO1obz2e3dijUKmn5jyh/5c8c9LDAY
X-Google-Smtp-Source: ABdhPJzqMO2WB4k0/MxfOZfionlPfDiq4z3RGMvO/dPGa5nEdLDpW1jp7ztdMjZ1ku9q8VcSvRS7vw==
X-Received: by 2002:ac8:6a12:: with SMTP id t18mr6320116qtr.125.1601575544111;
        Thu, 01 Oct 2020 11:05:44 -0700 (PDT)
Return-Path: <konstantin@linuxfoundation.org>
Received: from chatter.i7.local ([89.36.78.230])
        by smtp.gmail.com with ESMTPSA id q185sm7005848qke.25.2020.10.01.11.05.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Oct 2020 11:05:43 -0700 (PDT)
Date: Thu, 1 Oct 2020 14:05:41 -0400
From: "Konstantin Ryabitsev" <konstantin@linuxfoundation.org>
To: =?utf-8?B?TWljaGHFgiBNaXJvc8WCYXc=?= <mirq-linux@rere.qmqm.pl>
Cc: tools@linux.kernel.org
Subject: Re: b4: UTF-8 in replies
Message-ID: <20201001180541.poupp36rtajzkihs@chatter.i7.local>
References: <20201001171405.GA17873@qmqm.qmqm.pl>
MIME-Version: 1.0
In-Reply-To: <20201001171405.GA17873@qmqm.qmqm.pl>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

On Thu, Oct 01, 2020 at 07:14:05PM +0200, Michał Mirosław wrote:
> I'm writing to you because I can't find a bug tracker for b4 script.

There isn't one. Just email tools@linux.kernel.org (cc'd).

> The bug is that when generating the reply, script doesn't include MIME
> headers but is using UTF-8 in the body (eg. when replying to an author
> with non-US name, like me).

Hm... is that causing you any problems? We make sure to set 
"Content-Transfer-Encoding: 8bit" in the headers, so unless you're using 
some extremely old SMTP software, UTF-8 in the body or headers shouldn't 
matter.

Regards,
-K
