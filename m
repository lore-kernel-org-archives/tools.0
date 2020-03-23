Received: from mail-wr1-f66.google.com (mail-wr1-f66.google.com [209.85.221.66])
 by mx.groups.io with SMTP id smtpd.web10.57125.1584980786901373161
 for <tools@linux.kernel.org>;
 Mon, 23 Mar 2020 09:26:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=FgXc/jxr;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.66, mailfrom: konstantin@linuxfoundation.org)
Received: by mail-wr1-f66.google.com with SMTP id a25so17909778wrd.0
        for <tools@linux.kernel.org>; Mon, 23 Mar 2020 09:26:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=NRwKwZGWj/WfXTy8CA6qibHv1mXTsyAk+yktmy+JDBc=;
        b=FgXc/jxrTpLYX4qZHuHuSpgscG7XW86uUYy4invti5W3cYKWFnVLkPo7/gyHPjL7Ra
         I22HxYWf1mDyhB1vUq+iLco+05uzi1hySaJOchr875X/AlP8rfMVoS+B0qpcC/IbpQYh
         iFDt+J+BtxdyznZoomfdVSOakzqkgAnk+Eiys=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=NRwKwZGWj/WfXTy8CA6qibHv1mXTsyAk+yktmy+JDBc=;
        b=G/ZfPNDHwMyURZfQD3pO86u106yllMVMNAulKHwR15co5HG2wTI0gOWL3SCldTLNZL
         94W0Ju/Rh6ntCeXca9Evv/fQWwj0URJXrI7HOJRz72F6yM8u4Uwe4kXS3LZBDLdHEeNK
         23W6Kw2q0suwjaBLauwxp8+dvPBZwl0w8J7pIXPsW7ulpTyZtTjd4zsBXnw6Dxoj9BmJ
         5uPT/sjPwJR+W1e3GTLLjU3HE/72Ii7iMQ+Q2TI/INT7kyMXfTuc+868Zfbjgff+fF/c
         YstDXJi45vz3aP+zUdY3wuHNXdXVjglxaeUYyoi7OV+8JYMjTERQX/9Lot51bjiV1Sf5
         rpiw==
X-Gm-Message-State: ANhLgQ0R4snuPn30Ge6CeE3K7u5bX/vC8TmYfhKVT3/0w3Lr/RW2+cNj
	vl1NmHg1C6oWEIao0FcxOGlF7g==
X-Google-Smtp-Source: ADFU+vs9yE8aBkmc5ZLfvXHsQIj/mi5ojqpb1H4uV1ktndpMjZkqnCjT23GLyFUuLxxIiQzm2yaV3w==
X-Received: by 2002:adf:e98a:: with SMTP id h10mr20553807wrm.370.1584980785321;
        Mon, 23 Mar 2020 09:26:25 -0700 (PDT)
Return-Path: <konstantin@linuxfoundation.org>
Received: from chatter.i7.local ([23.129.64.213])
        by smtp.gmail.com with ESMTPSA id b82sm55150wmb.46.2020.03.23.09.26.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Mar 2020 09:26:24 -0700 (PDT)
Date: Mon, 23 Mar 2020 12:26:17 -0400
From: "Konstantin Ryabitsev" <konstantin@linuxfoundation.org>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: tools@linux.kernel.org
Subject: Re: [PATCH lore] Typos: s/Start Trek/Star Trek/
Message-ID: <20200323162617.ma4zh2bzyr4iek3a@chatter.i7.local>
References: <20200323151038.784-1-geert@linux-m68k.org>
MIME-Version: 1.0
In-Reply-To: <20200323151038.784-1-geert@linux-m68k.org>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

On Mon, Mar 23, 2020 at 04:10:38PM +0100, Geert Uytterhoeven wrote:
> Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
> ---
>  README.rst   | 2 +-
>  man/b4.5     | 2 +-
>  man/b4.5.rst | 2 +-
>  3 files changed, 3 insertions(+), 3 deletions(-)

I made it so.

-K
