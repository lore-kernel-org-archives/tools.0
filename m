Received: from mail-qk1-f180.google.com (mail-qk1-f180.google.com [209.85.222.180])
 by mx.groups.io with SMTP id smtpd.web12.50952.1584965783130956533
 for <tools@linux.kernel.org>;
 Mon, 23 Mar 2020 05:16:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ziepe.ca header.s=google header.b=ZE+vos07;
 spf=pass (domain: ziepe.ca, ip: 209.85.222.180, mailfrom: jgg@ziepe.ca)
Received: by mail-qk1-f180.google.com with SMTP id e11so14858759qkg.9
        for <tools@linux.kernel.org>; Mon, 23 Mar 2020 05:16:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=qaleDM+dsNEg5QvbZ+F6a4np33Uo/ckr5jyVXjeBAlU=;
        b=ZE+vos07DrOb2GH9kctcaGVJqI+jJECSNaYEyC+0OxVJdr52M79aC56lKGXRWMFJOu
         9uH0K2AsY94MTgYwkqpJ5RzKz5owPKg0J0Ue6jORaSug1K3HHIp9z5pVubdAGn/loTZp
         hTZ0hYtIFBNME96xoWRZwGE5MANxP/xb29mDRI/Ogc+M34R/sjNgCKTZ/PkMxNKtjmFS
         jKj1uDn1J7JgRoId/0z6d+vK247Qef7OhcM8rfE5iTFeaBuzWc8Dx3NFEOeZLWmF2ITA
         xy9K3Kd9gnz+wyrmQCpfa8P+tKELaU+h99LM90KCpChCZQqQ9++0kkY+JFV0MyCOlI4A
         4CNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=qaleDM+dsNEg5QvbZ+F6a4np33Uo/ckr5jyVXjeBAlU=;
        b=cJmEjrBDlAI802Ih+orGDY41Mkg0iYiVvqEhtaY09JC6K9TJrl50QU7WUJIK5qREP1
         NCXm31oeCHt1nGjX2tJV+XT5DCwS24pnH8Fvp3zHzaJ5ClYQedpn8CXOkAJz/2ISg5rH
         13zDbg1bf3V00XYDnY3lMu0PnhLI5FSTRxjBWeiqAz+P51wHqxnvC7vtK6dtTqJy6R/j
         N8MoL9z0Tldz84F75nPGDbMWkMAeuGleWKdy+l7/tgWjZsrRgMhGLcxfVErfpRLUCtOX
         l8K1XlEV7W+hDOQMt8yW8erlyY1izJiyhuDlUhzlT37LF4BcOQHLbX1BtlQxcTvm+h0i
         tZUg==
X-Gm-Message-State: ANhLgQ0JGEb8G4YsvgAMVEmsIkv939EGnoVPSa9OkvaY6HI8hzV7Decx
	vyqyLJBApeFZZ4/+rI1r48s4Rg==
X-Google-Smtp-Source: ADFU+vtHyH4B+imiQEJsaurBISDkE/9K6DnW4NEQKk+4y3XWVbhESiVWtUY6zweyi+Oz4wlrdFM7TQ==
X-Received: by 2002:a05:620a:127c:: with SMTP id b28mr5094876qkl.317.1584965782285;
        Mon, 23 Mar 2020 05:16:22 -0700 (PDT)
Return-Path: <jgg@ziepe.ca>
Received: from ziepe.ca (hlfxns017vw-142-68-57-212.dhcp-dynamic.fibreop.ns.bellaliant.net. [142.68.57.212])
        by smtp.gmail.com with ESMTPSA id d201sm10668853qke.59.2020.03.23.05.16.21
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 23 Mar 2020 05:16:21 -0700 (PDT)
Received: from jgg by mlx.ziepe.ca with local (Exim 4.90_1)
	(envelope-from <jgg@ziepe.ca>)
	id 1jGM0C-00036K-U0; Mon, 23 Mar 2020 09:16:20 -0300
Date: Mon, 23 Mar 2020 09:16:20 -0300
From: "Jason Gunthorpe" <jgg@ziepe.ca>
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc: users@linux.kernel.org, tools@linux.kernel.org
Subject: Re: [kernel.org users] B4 and gmail integration features
Message-ID: <20200323121620.GX20941@ziepe.ca>
References: <20200320214532.wvmym643l3dw24qh@chatter.i7.local>
MIME-Version: 1.0
In-Reply-To: <20200320214532.wvmym643l3dw24qh@chatter.i7.local>
User-Agent: Mutt/1.9.4 (2018-02-28)
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Mar 20, 2020 at 05:45:32PM -0400, Konstantin Ryabitsev wrote:
> Hi, all:
> 
> For my next B4 trick, I plan to add some basic gmail integration -- 
> since I know many of you do use gmail.

FWIW, I've done some work on this here to avoid the 'OAUTH Apocalypse'
that is coming. You may find the oauth code helpful:

https://github.com/jgunthorpe/cloud_mdir_sync

Getting an oauth application from Google is a bit hard unfortunately.

> 3. Optionally, also send a "thanks, applied" templated reply after you 
>    do "b4 am"
> 
> (#3 will also be available if we find a sendemail.smtpserver.)

If you have a gmail credential then send email can be done over REST
too.

I would second what other people say, my usual work flow is to apply
to get, evaluate and then ack the messages. Today I have a small
script to open the thread covering the patches in git in Mutt so I can
fiddle as I like.

Would enjoy a b4 command to mark git commits as applied in patchworks
based on their Link: header :)

Jason
