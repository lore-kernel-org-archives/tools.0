Received: from mail-ua1-f47.google.com (mail-ua1-f47.google.com [209.85.222.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BCBB2FB8;
	Fri, 11 Jun 2021 18:29:53 +0000 (UTC)
Received: by mail-ua1-f47.google.com with SMTP id f1so2905361uaj.10;
        Fri, 11 Jun 2021 11:29:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=GltcQ1s+wIQilwomHR+Qo+ZUydziSIz1k5XNeP4f2Zk=;
        b=smyJYTSnBDHuHlTEhGbd7uOJJ6+xOIuLDLIRDvNEfVxxnun4JWW5i6we9bw4zewnrF
         soPk57a0zy/0WOVcLNamsOItuYYJZdX1SNVkIiGfmgBK2yIrZcSbHmfBVdZ0t85vAAsf
         E0hwozi1Z06OrEUKcM65qgQ1A8LY1luPKwFxgaiAC/Y9QafRzmuRyYB0DuEcmk1kLrhM
         NRpH2kkcV3a3TfmE1Tu9VUm2ylAFAVPF2OfHyzK1Vs9zdHhJvNlzmRdQuBBUfbscd15q
         /7xajmSpkHivHMmdkklXqadfNh+ZeSzzrReXFxVeWKBMsw/yRpB7yR2txLHVtIE/F0BT
         32Ww==
X-Gm-Message-State: AOAM533C8pz1Sp2AUct7bDY2qKvqqll1F56x3odUf8aJ5IIIv5sGM88O
	ZK4uNB26lXWOhwcFUdYrindngkuhOLe8fcpqlJw=
X-Google-Smtp-Source: ABdhPJyxR0mKRKzBmQJ6p+zPYd/esS2iLrC3oVuFsDK40EvlQIzHYUWTszQMK/ka220JSza/XV40eOVvFJxtbgXlMdc=
X-Received: by 2002:ab0:71d9:: with SMTP id n25mr4959296uao.2.1623436192169;
 Fri, 11 Jun 2021 11:29:52 -0700 (PDT)
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
References: <CAMuHMdWakx2RcL4W_cmUh8s3NYp3darGmrVu11Hq2-sY0GqUPg@mail.gmail.com>
 <20210611123756.zdnyugrvuf2p23hu@nitro.local> <20210611141659.kn4duhhqcfjs5vwu@nitro.local>
In-Reply-To: <20210611141659.kn4duhhqcfjs5vwu@nitro.local>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 11 Jun 2021 20:29:41 +0200
Message-ID: <CAMuHMdWDFALefqvzwSVj5HcAPkuM+-eHWeNrn8J6KmP4y0oyrg@mail.gmail.com>
Subject: Re: Multi-patch series broken in b4 master
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc: tools@linux.kernel.org, users@linux.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Konstantin,

On Fri, Jun 11, 2021 at 4:17 PM Konstantin Ryabitsev
<konstantin@linuxfoundation.org> wrote:
> On Fri, Jun 11, 2021 at 08:37:56AM -0400, Konstantin Ryabitsev wrote:
> > I'll open a bug with Python and work around this in b4.
>
> Fixed in master, bug filed as https://bugs.python.org/issue44395

Thanks, fix confirmed!

> > Thanks for the report -- I'll push out a 0.7.3 shortly.
>
> Looks like 0.7.x is unaffected, so no new 0.7 release necessary.

Yes, v0.7.2 is fine.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
