Received: from mail-oi1-f180.google.com (mail-oi1-f180.google.com [209.85.167.180])
 by mx.groups.io with SMTP id smtpd.web12.4658.1585641847024017705
 for <tools@linux.kernel.org>;
 Tue, 31 Mar 2020 01:04:07 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: gmail.com, ip: 209.85.167.180, mailfrom: geert.uytterhoeven@gmail.com)
Received: by mail-oi1-f180.google.com with SMTP id u20so13424811oic.4;
        Tue, 31 Mar 2020 01:04:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ij7B1PITUJsaml0zcNHpqJ4VdmP42bRtun7YY/QlJBc=;
        b=Swt2IZrsNSa0uDin+ySEQwh/jnuoHPNVIcZND6BsuW0dRdjjd4FC0+sT6RzwFi7Tur
         /hIJPVMsaaGUR8bPnxp6ZwmmYYpeL1iqxRA12b1jJWcfxOOq/lfb2J/n1SyenmLtfy5w
         L05rY7MSC7vSk8HAD/jCR5R04oIL/MBD54GtdiIzc0rviQAaKAPn8+F+BVNeQStlFWhX
         cyUpYlZUjyBjt3vaJTyJ6IakSKj509mCVcRqbareVsOgAu8+Xmh/xTn4Nzh773BKOpAw
         1oaKW8brhlpwm2v2qVKxblc0BWks3FX8iNHEg1bOSoUkae6YoPYAcxnnjGSi3cKEWpm+
         3SvA==
X-Gm-Message-State: ANhLgQ2U0fzFjhxyyJQOMmFpnLNGrZ34yHNPKK1ba2/c0vPu9LG7IANq
	355mXNn5xZa9bUG/oUi22hZdCVXGz0bg8q/1OQg=
X-Google-Smtp-Source: ADFU+vv3UHt1XcqDVcdq87c/UA+Wmnlt2KpYBOTigPQSMYnWspW6j2xrcZgQsieABZnjmiSnGuHd+XRcmUm1mJjflHI=
X-Received: by 2002:aca:ad93:: with SMTP id w141mr1311054oie.54.1585641846260;
 Tue, 31 Mar 2020 01:04:06 -0700 (PDT)
MIME-Version: 1.0
References: <20200327165402.slc5l46hc7hlo2l5@chatter.i7.local>
 <CACRpkdZRXh8gKEyeF-uwnP+GuBWxj_QGHeEL=dDOSMoKx6G=1w@mail.gmail.com> <20200329171313.s5qe5ofvmh3uoy7z@chatter.i7.local>
In-Reply-To: <20200329171313.s5qe5ofvmh3uoy7z@chatter.i7.local>
From: "Geert Uytterhoeven" <geert.uytterhoeven@gmail.com>
Date: Tue, 31 Mar 2020 10:03:55 +0200
Message-ID: <CAMuHMdUpbQydt09SJKPeTr3SL6NM+huyVAZbMBu8qrNmtPUZ=w@mail.gmail.com>
Subject: Re: [kernel.org users] Gmail message ID finder Chrome extension
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc: Linus Walleij <linus.walleij@linaro.org>, 
	"users@linux.kernel.org" <users@linux.kernel.org>, tools@linux.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Konstantin, Linus,

On Sun, Mar 29, 2020 at 7:13 PM Konstantin Ryabitsev
<konstantin@linuxfoundation.org> wrote:
> On Sun, Mar 29, 2020 at 04:54:33PM +0200, Linus Walleij wrote:
> > > If you're a Chrome and Gmail user, you can try the following
> > > extension
> > > to easily get the message-id of an email without having to "show
> > > original" and hunting for the right header:
> > >
> > > https://chrome.google.com/webstore/detail/gmail-message-id-finder/comcoiiifldaaejpbgbincdkoohihbae
> > >
> > > The message-id will be copied to the clipboard with the "rfc822msgid:"
> > > lead, but current versions of b4 will handle that properly.
> >
> > Actually, but I don't know if I'm unique in this, for my workflow
> > I'd ideally take that thing a step longer so that the drop down menu
> > simply had "apply patch" meaning it gets the message ID,
> > calls on b4 to get the message, and applies it to a certain branch
> > in a certain local git tree with --signoff.
>
> The way I envision this could work is if we define workflows based on
> labels. E.g.:
>
> 1. You label a message with "Accepted"
> 2. You run "b4 gmail apply Accepted" (or an agent process runs that)
> 3. We then try to:
>    - retrieve patch series using lore and your inbox as sources
>    - make an am-ready mbox
>    - apply to a branch provided in a mapping config
>      "e.g. Accepted->refs/heads/pending"
> 4. If "git am" fails on a series, we label the thread as
>    "Review-Required" and move to the next one
> 5. If it succeeds, we add the label "Applied"

And remove the "Accepted" label?
Else, as labels applies to conversations, if someone replies with a
full patch, it will be applied next time you run your script.

> You still have to do your own merging, though. :)
>
> > I anyway use gmail's web UI to read all mail and keep track
> > of what's processed and not by whether is is read or unread in
> > gmail.
> >
> > Are these extensions to say Chrome hard to write? I think
> > if I wrote an extension like that it could save me hours of work
> > time, but maybe I'm the only one. I tried to find the source code
> > for the above extension but no such luck.
>
> I wouldn't use a chrome extension for this, but it's fairly
> straightforward to accomplish this with a gmail API. There are a few
> annoying things about Gmail that make it not super great for the purpose
> of working with patch threads. Specifically, Gmail ignores In-Reply-To
> if subjects don't match, so while the API provides a "retrieve a thread"
> call, we can't use it to get a properly threaded patch series the same
> way we can from lore.kernel.org, because Gmail refuses to consider them
> all part of the same thread.
>
> The best we can do is do a search for "from:same sender AND
> date:same-ish date AND subject-contains:PATCH", and then go through what
> we got back to reconstitute the patch series.

Alternatively, select "Download message" in the drop-down menu (repeat
if needed), and run a script on your download directory.
As the downloaded messages contain Message-IDs, they can be fed to
the b4 machinery for further processing of tags and series, augmented
by data from lore.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
