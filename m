Received: from mail-oi1-f193.google.com (mail-oi1-f193.google.com [209.85.167.193])
 by mx.groups.io with SMTP id smtpd.web11.41506.1585240319325431724
 for <tools@linux.kernel.org>;
 Thu, 26 Mar 2020 09:31:59 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: gmail.com, ip: 209.85.167.193, mailfrom: geert.uytterhoeven@gmail.com)
Received: by mail-oi1-f193.google.com with SMTP id m14so6066461oic.0;
        Thu, 26 Mar 2020 09:31:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=2hKST+mDEtgCTbga/xgAqkeoB9ofywV6N1I9lEb5yFw=;
        b=Es60JPMSrmvDmFFOuUEc/5k0Yx+wogajLJaXhs2eYyUFZCt5jIP/imOT4BJWf3unK/
         FHH319M/cLsjFNx6sfm1ntljaTH9LnavZAMehzVYpi0lTt02mMrE5bY7Q6fZwgBxmeeA
         MLHskkX0YNZPwTncknVS0xhnWXe8J9/MyyaY8bq5SES2Fzvf8yNi3E3Sd06mAF+f2okM
         8ykf0J6qmtATLhziaEEouk/Gyeq2qUWw9+pEVESX0Y14ZlWhHzYMN141y86kjl+0o7/y
         XtI0/mfo/YJiHzrQPl9GBYk6TWpmjHJLBySCYoqZWC5slH0F9Pk+cj1oGYMg7qaXKw5/
         67XQ==
X-Gm-Message-State: ANhLgQ0m+n0040NPpeCoYfQ1QZYl4BtAh1xBUnDCt1CsPYpdPABaGGdT
	0uVsHS4C7oq7y4IkhJqZ54ycQW0zJAf3LfCSW48=
X-Google-Smtp-Source: ADFU+vsx/tmT1GbZOIvcfNgz9nRE16r6DAf2+jkoyc3okifqyEh2rUpUclPjS6vN+cO+30jLlZAkvucTUdGuG0ETzgs=
X-Received: by 2002:aca:ad93:: with SMTP id w141mr731069oie.54.1585240317680;
 Thu, 26 Mar 2020 09:31:57 -0700 (PDT)
MIME-Version: 1.0
References: <20200323222041.uzfcexg2wy74jqdd@chatter.i7.local>
 <CAL_JsqLJkDx3HQEN-0ih0Jp4i2h7xKYrsfqAiYcW_hV-9GtLKA@mail.gmail.com>
 <CAL_JsqKBskO3oyEP0g9nTyWL4V614w21Hwigs5YpFpgLnUVktg@mail.gmail.com>
 <20200326161622.pzma44m6vte2qi33@chatter.i7.local> <1585240058.3610.19.camel@HansenPartnership.com>
In-Reply-To: <1585240058.3610.19.camel@HansenPartnership.com>
From: "Geert Uytterhoeven" <geert.uytterhoeven@gmail.com>
Date: Thu, 26 Mar 2020 17:31:46 +0100
Message-ID: <CAMuHMdUbk75UVQ8+SH_ejP5e5TsKgG20Fksrg3SBF0915WMaiQ@mail.gmail.com>
Subject: Re: [kernel.org users] b4 v0.3.4 released
To: James Bottomley <James.Bottomley@hansenpartnership.com>
Cc: Konstantin Ryabitsev <konstantin@linuxfoundation.org>, Rob Herring <robh@kernel.org>, 
	tools@linux.kernel.org, "users@linux.kernel.org" <users@linux.kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Thu, Mar 26, 2020 at 5:27 PM James Bottomley
<James.Bottomley@hansenpartnership.com> wrote:
> On Thu, 2020-03-26 at 12:16 -0400, Konstantin Ryabitsev wrote:
> > On Thu, Mar 26, 2020 at 10:11:44AM -0600, Rob Herring wrote:
> > > > I'm seeing corruption of the subject on patches[1] with a comma
> > > > in the subject (and I'd guess only ones longer than 70 something
> > > > chars). It's fine on lore web interface, but it gets wrapped in
> > > > the downloaded mbox. A log is attached. When it gets applied, a
> > > > space is inserted after the comma:
> > > >
> > > > dt-bindings: iio/accel: Drop duplicate adi, adxl345/6 from
> > > > trivial-devices.yaml
> > >
> > > Nevermind. It's not b4, but the dri-devel list that is corrupting
> > > the subject.
> > >
> > > https://lore.kernel.org/dri-devel/20200325220542.19189-2-robh@kerne
> > > l.org/
> > > https://lore.kernel.org/linux-devicetree/20200325220542.19189-2-rob
> > > h@kernel.org/
> >
> > I think it's actually Python's fault. I'm trying to isolate the
> > operation that causes it. It makes sense that dri-devel also
> > exhibits it, because it's a mailman-managed list.
>
> It smells like a mishandling of RFC2822 header folding rules.
>
> https://tools.ietf.org/html/rfc2822#section-2.2.3
>
> Lots of email tools get this wrong as well, so they add an extra space
> where the subject header got split by the wrapping because they expect
> the header to split at a space and the space to be eaten by the split,
> but that's not what the rules say.

Even formail -c gets it wrong, so my scripts have to postprocess the result.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
