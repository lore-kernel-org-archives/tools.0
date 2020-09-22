Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by mx.groups.io with SMTP id smtpd.web11.162.1600813083568907872
 for <tools@linux.kernel.org>;
 Tue, 22 Sep 2020 15:18:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kernel.org header.s=default header.b=I1RXZu2i;
 spf=pass (domain: kernel.org, ip: 198.145.29.99, mailfrom: robh@kernel.org)
Received: from mail-oi1-f182.google.com (mail-oi1-f182.google.com [209.85.167.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPSA id CFEFD20684;
	Tue, 22 Sep 2020 22:18:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1600813082;
	bh=/OJ3oLaKcANPu4K+c1RxWvOupHXaLgtx6Nm4O/MQwpU=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=I1RXZu2iraZfnD+cp5nf/TgM3fIPeDA1NGkvwRgv97Ubk86M9iBU+KdWOqWHSvTDz
	 KCN8VyYm0sv6chY2WzsbZghwdc4fXsYOGV94QYvVhTr9Ihf73+rAZquERglvN8kzvM
	 vZv6XSXwSuma8mbQ9W7UWYIhosBk7BtUUooH9VK0=
Received: by mail-oi1-f182.google.com with SMTP id n2so22794688oij.1;
        Tue, 22 Sep 2020 15:18:02 -0700 (PDT)
X-Gm-Message-State: AOAM532WYwwxKXXnzxmzDTplM8tf+rOlT48ANkLgn4mFxQ/GVBXYke0e
	0x/V47Xv2FBzREKfoyL2HZDOOshH+Wrsfmm6Ug==
X-Google-Smtp-Source: ABdhPJz0P00hiorRRmt2RZRZEJuyMtZjYzdnfp35qK+k7Kpa3rKmqmd3Oju/rtH2cfT+dW+4kXDqDBLHh/Oz+7cf0vw=
X-Received: by 2002:aca:1711:: with SMTP id j17mr4086631oii.152.1600813082222;
 Tue, 22 Sep 2020 15:18:02 -0700 (PDT)
MIME-Version: 1.0
References: <20200323222041.uzfcexg2wy74jqdd@chatter.i7.local>
 <CAL_JsqLJkDx3HQEN-0ih0Jp4i2h7xKYrsfqAiYcW_hV-9GtLKA@mail.gmail.com>
 <CAL_JsqKBskO3oyEP0g9nTyWL4V614w21Hwigs5YpFpgLnUVktg@mail.gmail.com>
 <15FFE6D3B979AF4C.32445@linux.kernel.org> <20200326163225.qkitq6dkmqj2fw5l@chatter.i7.local>
In-Reply-To: <20200326163225.qkitq6dkmqj2fw5l@chatter.i7.local>
From: "Rob Herring" <robh@kernel.org>
Date: Tue, 22 Sep 2020 16:17:50 -0600
X-Gmail-Original-Message-ID: <CAL_JsqKEbeoQrBDs323WnceeLFptpaKeVsPBi5hYJZGzJAkykw@mail.gmail.com>
Message-ID: <CAL_JsqKEbeoQrBDs323WnceeLFptpaKeVsPBi5hYJZGzJAkykw@mail.gmail.com>
Subject: Re: [kernel.org users] b4 v0.3.4 released
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc: users@linux.kernel.org, tools@linux.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Thu, Mar 26, 2020 at 10:32 AM Konstantin Ryabitsev
<konstantin@linuxfoundation.org> wrote:
>
> On Thu, Mar 26, 2020 at 12:16:22PM -0400, Konstantin Ryabitsev via Linux.Kernel.Org wrote:
> > > > I'm seeing corruption of the subject on patches[1] with a comma in
> > > > the
> > > > subject (and I'd guess only ones longer than 70 something chars). It's
> > > > fine on lore web interface, but it gets wrapped in the downloaded
> > > > mbox. A log is attached. When it gets applied, a space is inserted
> > > > after the comma:
> > > >
> > > > dt-bindings: iio/accel: Drop duplicate adi, adxl345/6 from trivial-devices.yaml
> > >
> > > Nevermind. It's not b4, but the dri-devel list that is corrupting the subject.
> > >
> > > https://lore.kernel.org/dri-devel/20200325220542.19189-2-robh@kernel.org/
> > > https://lore.kernel.org/linux-devicetree/20200325220542.19189-2-robh@kernel.org/
> >
> > I think it's actually Python's fault. I'm trying to isolate the
> > operation that causes it. It makes sense that dri-devel also exhibits
> > it, because it's a mailman-managed list.
>
> No, your initial assessment is correct -- this is done by the dri-devel
> list. I was confused by the caching layer that needs to be fixed to make
> sure that we can grab the same thread from multiple projects (I'll fix
> it today).

Annoyed by this again, I dug into it some more. We're both right. :)

The problem is the email module in python2 which mailman2 uses.

On 2.7:
>>> h = email.header.Header()
>>> h.append('Subject: test,split on a long header laldkdsf dfsdakfds dskj dskfdj sdaklsdlkdfj dalkj sdlk f')
>>> h.encode()
'Subject: test,\n split on a long header laldkdsf dfsdakfds dskj
dskfdj sdaklsdlkdfj dalkj\n sdlk f'

On 3.8:
...
>>> h.encode()
'Subject: test,split on a long header laldkdsf dfsdakfds dskj dskfdj\n
sdaklsdlkdfj dalkj sdlk f'

Probably fixed in this commit which despite being 9 years ago, isn't
in the 2.7 branch:
https://github.com/python/cpython/commit/01581ee0b7c968adb987a36495af7ce5eb794d0d#diff-7d35ae5e9e22a15ee979f1cba58bc60a

I guess we'll just wait for mailman3 adoption. Maybe python2 EOL will help...

Rob
