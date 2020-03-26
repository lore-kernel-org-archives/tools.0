Received: from mail-wr1-f68.google.com (mail-wr1-f68.google.com [209.85.221.68])
 by mx.groups.io with SMTP id smtpd.web10.40970.1585239390426481263
 for <tools@linux.kernel.org>;
 Thu, 26 Mar 2020 09:16:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=YDgiiTE4;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.68, mailfrom: konstantin@linuxfoundation.org)
Received: by mail-wr1-f68.google.com with SMTP id h9so8504394wrc.8
        for <tools@linux.kernel.org>; Thu, 26 Mar 2020 09:16:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=3o9whE1SE4KsfSMjrMRpMi84bMWwayc9npdAD1cUmkM=;
        b=YDgiiTE44PyyIQXa9Q83tzZ+bXMR6g4QSazcvhV29JlNtu2kd+OBRMtFJCgnImaNSu
         enVlgqGiLpycxeI8QVUDQmUHrenMp5zX4MSyHEKfQO2NeuPALrwFJrLp7DLGFMaQZraD
         LowbbziNQ66YIFSC0QlbRr8oLMis9xfm35MRk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=3o9whE1SE4KsfSMjrMRpMi84bMWwayc9npdAD1cUmkM=;
        b=nRUL21p6s44I1LMQG30+tYNbrt8E4nPcUZDT/xoLX5kZ6hFLXeN5y2kd3Z5+hhLZjM
         BNaC8r7ykr1Kpz8QkInGY+Nn6w4VEkYrvWNBljbb24ryDFQJAY/SlubGaI9KTl4m/GFW
         l28o6zzrv0pRbRRcqxQzVvbVD8bJ/U0eGGbUTqyI7bQRRVsnDUR+erNZPaOiO9zrG+q3
         OGuIzP01QLV3UBJ4O1SXiPQroDUuyfE7rnZAGCA6cC8d0iM6LwzTEQuD70y7wDkXGYAw
         qHapwgQT15rWD0L0mQLeoCC5IZn3v1qUc3KgFGGGdpaSZwUBAbHExqvvuAxmXFwgBStt
         CHpg==
X-Gm-Message-State: ANhLgQ1K5F8gPnWVnYaJNocvzPFOonMxeMzTC/wxf4xt3NAmeUqZ/Dhz
	rup95mGR7+T89wIvNlaw8XZNlg==
X-Google-Smtp-Source: ADFU+vsPHsjz080mtUf2jD0IoM0+FryXsGmr/ioWtHnYOWOgkaxWjfKyaTrfjoCylP0qkzKvvRxnyw==
X-Received: by 2002:a5d:5230:: with SMTP id i16mr10009358wra.15.1585239388911;
        Thu, 26 Mar 2020 09:16:28 -0700 (PDT)
Return-Path: <konstantin@linuxfoundation.org>
Received: from chatter.i7.local (134.ip-51-79-53.net. [51.79.53.134])
        by smtp.gmail.com with ESMTPSA id s2sm4077028wru.68.2020.03.26.09.16.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Mar 2020 09:16:27 -0700 (PDT)
Date: Thu, 26 Mar 2020 12:16:22 -0400
From: "Konstantin Ryabitsev" <konstantin@linuxfoundation.org>
To: Rob Herring <robh@kernel.org>
Cc: tools@linux.kernel.org, users@linux.kernel.org
Subject: Re: [kernel.org users] b4 v0.3.4 released
Message-ID: <20200326161622.pzma44m6vte2qi33@chatter.i7.local>
References: <20200323222041.uzfcexg2wy74jqdd@chatter.i7.local>
 <CAL_JsqLJkDx3HQEN-0ih0Jp4i2h7xKYrsfqAiYcW_hV-9GtLKA@mail.gmail.com>
 <CAL_JsqKBskO3oyEP0g9nTyWL4V614w21Hwigs5YpFpgLnUVktg@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAL_JsqKBskO3oyEP0g9nTyWL4V614w21Hwigs5YpFpgLnUVktg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

On Thu, Mar 26, 2020 at 10:11:44AM -0600, Rob Herring wrote:
> > I'm seeing corruption of the subject on patches[1] with a comma in 
> > the
> > subject (and I'd guess only ones longer than 70 something chars). It's
> > fine on lore web interface, but it gets wrapped in the downloaded
> > mbox. A log is attached. When it gets applied, a space is inserted
> > after the comma:
> >
> > dt-bindings: iio/accel: Drop duplicate adi, adxl345/6 from trivial-devices.yaml
> 
> Nevermind. It's not b4, but the dri-devel list that is corrupting the subject.
> 
> https://lore.kernel.org/dri-devel/20200325220542.19189-2-robh@kernel.org/
> https://lore.kernel.org/linux-devicetree/20200325220542.19189-2-robh@kernel.org/

I think it's actually Python's fault. I'm trying to isolate the 
operation that causes it. It makes sense that dri-devel also exhibits 
it, because it's a mailman-managed list.

-K
