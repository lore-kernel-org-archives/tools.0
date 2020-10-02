Received: from mail-qv1-f65.google.com (mail-qv1-f65.google.com [209.85.219.65])
 by mx.groups.io with SMTP id smtpd.web10.13096.1601641440334982069
 for <tools@linux.kernel.org>;
 Fri, 02 Oct 2020 05:24:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=VLITYOBA;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.219.65, mailfrom: konstantin@linuxfoundation.org)
Received: by mail-qv1-f65.google.com with SMTP id h1so628162qvo.9
        for <tools@linux.kernel.org>; Fri, 02 Oct 2020 05:24:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=g4n1dQJZyl4qp4zjOwJk8tY/250TnQsb2r5QbJt3KoM=;
        b=VLITYOBAZH1U/zNlzkm5VAEaosdCtgmOayGKkPbI88APFVGq9Ucr8OYGKC5x14IbST
         9PeRFHfmLyPcSzdYEPiuI7JVCV81z8WyNXmqvRf9oVly9rtazw+kABfXuC3Veqx9By9j
         LCDN/XUu6o6CNMv5LugI9yb7fHBJNmeKtUUsY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=g4n1dQJZyl4qp4zjOwJk8tY/250TnQsb2r5QbJt3KoM=;
        b=kI9xVJjwedA/DrHA0EES9mJgyqc3xTZMWX2GjZq/aAo7rpdtqlIUoMVKOOZA8f45yV
         hgEaSnf8s+pJjCBux3tfiWmU2RQJYeneWkBYTCaXusgVfEVa7pt2mYSaRwkl68ko3sCD
         Ln7kZIjCTI8b+2OuGM+/sakUsjEdgPAcBFQ2PDoUG/IF7b4IOPjfguGoRpuTA7sM1lFE
         lAGaC9Z7xEiAo5hD4Ix/T3IRMwxb0oQI26cvjqkl4Et2svwSoeNj6I24It7nHpvzPloo
         mA/etsc6uOxRfO41KdSpgAri22aOWGy2HkAgi6flW43dEfTqBbiVMt/0J1IqgPHmSMTn
         sX+g==
X-Gm-Message-State: AOAM533d2cstdYq8MbAEBHN1y+//wJbWP+Qg8y0kIP6RYBAnag5gYELX
	xm+EiLprlvze2TJcp6tehvaJ+Q==
X-Google-Smtp-Source: ABdhPJw/Lew1N0hp/55i88/vAVoiqdFK14nFIMgyUs9C0geP9KypWUgb6LMnFzMhrMOsgzNK1bLjiQ==
X-Received: by 2002:a0c:d443:: with SMTP id r3mr1913776qvh.17.1601641439336;
        Fri, 02 Oct 2020 05:23:59 -0700 (PDT)
Return-Path: <konstantin@linuxfoundation.org>
Received: from chatter.i7.local ([89.36.78.230])
        by smtp.gmail.com with ESMTPSA id o13sm903050qtq.41.2020.10.02.05.23.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Oct 2020 05:23:58 -0700 (PDT)
Date: Fri, 2 Oct 2020 08:23:56 -0400
From: "Konstantin Ryabitsev" <konstantin@linuxfoundation.org>
To: Rob Herring <robherring2@gmail.com>
Cc: users@linux.kernel.org, tools@linux.kernel.org
Subject: Re: b4: traceback on stdout mbox output
Message-ID: <20201002122356.oygd22atfswhxgid@chatter.i7.local>
References: <CAL_JsqJhxJKbaeUjH7MVhuhuU1o9xm-eE2+sYr-4yit1btG+SQ@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAL_JsqJhxJKbaeUjH7MVhuhuU1o9xm-eE2+sYr-4yit1btG+SQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

On Wed, Sep 23, 2020 at 05:07:08PM -0600, Rob Herring wrote:
> Hi Konstantin,
> 
> I'm getting a traceback on a particular thread when I output to
> stdout. File output is fine.

Indeed, we were needlessly trying to output unicode. It's fixed in the 
latest master and stable-0.5.y where we dump bytes instead.

Thanks,
-K
