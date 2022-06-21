Received: from mail-qv1-f49.google.com (mail-qv1-f49.google.com [209.85.219.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C52EA7483;
	Tue, 21 Jun 2022 19:43:54 +0000 (UTC)
Received: by mail-qv1-f49.google.com with SMTP id 43so21974093qvb.3;
        Tue, 21 Jun 2022 12:43:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=fRlL8bMZxs7f2E4jQmIp9tyMAOfdUqFg6dXiX22t+rg=;
        b=Bd0/Rt5F8xb3lB4ER6gZbQ5B5hVNULhPWkJZcX4gIJ2ZygD+yiomMv/PTXWL3u2pp+
         b3AxG1qYVkRw9Zhu0ATX1J1RpRspPNg/+25+hhM9M0OgsZn/8MPhiRskZ3PqkeEJNsxs
         5snj+pc52K/THrDitdZW6GsmVzO9pbJqnJW4+a/1NPwQ/B8qx9apT46Yaozbf/sU74sj
         eoNQNx9DMOAQKtK4rOFlUnh9T0/bkY4K9Sx05oJQO03zOFEhnjy/AE19sZ7RtabUPwmz
         6L/lvnHS3MYWGsq2KgkOTWGrc0NjqlMe3p46WjLrNz37SsKBqAozzVTX4/6Yp9BRuDpU
         1IpA==
X-Gm-Message-State: AJIora9kOLiMMo6/V0XlYBy8bZgaRFm1hy/JPqAjFGShFUaG3l80Clzn
	egJPvlcaKbcgnM7G7BdwSWuxSDjLx0xxyw==
X-Google-Smtp-Source: AGRyM1vtY0uDyS2o6rTftlhvu+F0Rcx1nq1uFscGC/x96t3m1Xf6rMsfyYP7z9KxLOgqnbu+mwoXrQ==
X-Received: by 2002:ac8:4e82:0:b0:305:c4a:37cd with SMTP id 2-20020ac84e82000000b003050c4a37cdmr25689803qtp.106.1655840633492;
        Tue, 21 Jun 2022 12:43:53 -0700 (PDT)
Received: from mail-yb1-f176.google.com (mail-yb1-f176.google.com. [209.85.219.176])
        by smtp.gmail.com with ESMTPSA id bi25-20020a05620a319900b006a70f581243sm17770222qkb.93.2022.06.21.12.43.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 21 Jun 2022 12:43:53 -0700 (PDT)
Received: by mail-yb1-f176.google.com with SMTP id r3so26289135ybr.6;
        Tue, 21 Jun 2022 12:43:53 -0700 (PDT)
X-Received: by 2002:a05:6902:120e:b0:634:6f29:6b84 with SMTP id
 s14-20020a056902120e00b006346f296b84mr33526569ybu.604.1655840632862; Tue, 21
 Jun 2022 12:43:52 -0700 (PDT)
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
References: <20220617190153.tvi5lkzlvemeqou5@meerkat.local>
 <CAMuHMdV4AHH1TM6xf26MP0-dUQ0-fB+62GeeuVuth9pgWgdu7Q@mail.gmail.com>
 <20220621152903.czivp7fdn6me775i@meerkat.local> <CAMuHMdWz8=Zr8hnXNGBZVfe70F8oVdK670Z41=Dtib0GMDgAug@mail.gmail.com>
 <CAHk-=wiQzp+aurcmj15=LAa2ntvRZH0Ee2dn-PLjcFpmRE6Jcw@mail.gmail.com>
 <CAHmME9p+zRErOsvA1zC=kTHtpYD_sGjFxVsj0pMwteAp4dCdjQ@mail.gmail.com>
 <20220621165953.z25hwos7gom6bp6s@meerkat.local> <YrIEnmt5vDMcbOiG@zx2c4.com>
 <20220621182953.p5asczznnz3pn6dl@meerkat.local> <YrIR2v7GdC3qIt2E@zx2c4.com> <20220621192724.ls6q6fyr6ehtsyah@meerkat.local>
In-Reply-To: <20220621192724.ls6q6fyr6ehtsyah@meerkat.local>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 21 Jun 2022 21:43:41 +0200
X-Gmail-Original-Message-ID: <CAMuHMdU1EZ9vwyOec6EKGaW=Ghy_p5D0dbcun24BqoSok6maLQ@mail.gmail.com>
Message-ID: <CAMuHMdU1EZ9vwyOec6EKGaW=Ghy_p5D0dbcun24BqoSok6maLQ@mail.gmail.com>
Subject: Re: b4-0.9.0 available
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc: "Jason A. Donenfeld" <Jason@zx2c4.com>, Linus Torvalds <torvalds@linuxfoundation.org>, 
	tools@linux.kernel.org, users@linux.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Konstantin,

On Tue, Jun 21, 2022 at 9:27 PM Konstantin Ryabitsev
<konstantin@linuxfoundation.org> wrote:
> On Tue, Jun 21, 2022 at 08:45:46PM +0200, Jason A. Donenfeld wrote:
> > Anyway, in lieu of a complete and thorough list of all of the things, it
> > seems like in the last week or so we at least have two things that can
> > be be reflected in the tooling:
> >
> > - Don't add `Link:` if the URL hasn't been hand selected as being
> >   particularly relevant; the lkml patch email alone doesn't cut it. This

I disagree: when bisecting a bug, I can just follow the Link: tag,
and check if anyone already replied there with a newer review or
bug report (and hopefully with a fix, too).
Without the Link: tag, it's sometimes surprisingly difficult to find
out where the patch has been posted and discussed before.

> >   suggests that automatically adding `Link:` is invariably wrong, since
> >   automatic != "hand selected", so maybe there's no point in
> >   `-l,--add-link`, and you can just remove that option.
>
> I think the discussion veered towards "don't call it Link:", not "don't link
> to it at all". Without "BugLink" in the running, the next winning option was
> "Archived-at:" and I am considering towards making -l add that trailer

Please don't add any new variants.

> instead, with the custom msgid.link domain, to further distinguish it from
> "hand selected" lore links:
>
>     Archived-at: https://msgid.link/20220617190153.tvi5lkzlvemeqou5@meerkat.local

... which breaks the system we've been using for a few years now.

> > - Don't reorder `Signed-off-by:`. The simplest thing to do would be to
> >   remove the `trailer-order` option all together. But some people do
> >   want to sort the trailers (within each S-o-b segment) for aesthetic
> >   purposes. So if you don't want to take that away from them, maybe
> >   S-o-b needs to be unconditionally special-cased so that it forms a
> >   reorder barrier.
>
> This is already the case for all trailers -- we *group* them by trailer name,
> but the *order* in which they are written is preserved. E.g. with the config
> option trailer-order="reported-by,reviewed-by,signed-off-by,*', we go from:
>
>     Signed-off-by: Ze Developer <ze@example.dev>
>     Reviewed-by: Some Rando <rando@example.dev>
>     Reviewed-by: Managing Rando <mgmt@example.dev>
>     Signed-off-by: Awesome Maintainer <aw@example.dev>
>     Reported-by: Bug Finder <bug@example.dev>
>
>
> to:
>
>     Reported-by: Bug Finder <bug@example.dev>
>     Reviewed-by: Some Rando <rando@example.dev>
>     Reviewed-by: Managing Rando <mgmt@example.dev>

IMHO this is wrong, as it no longer shows that the review happened
on the version submitted by Ze Developer.

>     Signed-off-by: Ze Developer <ze@example.dev>
>     Signed-off-by: Awesome Maintainer <aw@example.dev>
>
> Perhaps I should call the setting "trailer-grouping" instead of
> "trailer-order" (it's called that because we did reorder them alphabetically
> at some point in the distant past when the feature was first implemented).

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
