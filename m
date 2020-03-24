Received: from mail-oi1-f194.google.com (mail-oi1-f194.google.com [209.85.167.194])
 by mx.groups.io with SMTP id smtpd.web10.8611.1585062778821721918
 for <tools@linux.kernel.org>;
 Tue, 24 Mar 2020 08:12:58 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: gmail.com, ip: 209.85.167.194, mailfrom: geert.uytterhoeven@gmail.com)
Received: by mail-oi1-f194.google.com with SMTP id y71so18742065oia.7
        for <tools@linux.kernel.org>; Tue, 24 Mar 2020 08:12:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=fiRPAJzSd5hCqByh2yPYY50ymTN6XCkOOd/uUe4ie3Q=;
        b=QeMrxAfF/iUcLnzRxxposaqfiPfcmkNt9/UN709au5hgPtn7FQXDCsTpuOrN0bPI4Y
         d0L9zMMV0t8dv8Mx6WRlGOeywLJWc2QYZeeSSkfP6pfMb1e2cEideAwb0mMbYaajivgL
         93j0ezF7BopiyHXDM2FnUAWeoWMDqvJ6PX4TF8Etl3hrGrxsvqsMD7ljTIa9ZPOskwd/
         Zb882RvizKPBWVlNMITBUm2KFiPrV9BHJ/orIxutcMgkrX/UC5eRSBLidJa/aUiwsfnv
         Li1S99+mRIVK60eTV8Ys1bwbcZLdXYTB/OfekMkhSCDTjW11uMw+oelqHKMLxuuHIMtr
         6szQ==
X-Gm-Message-State: ANhLgQ1F24N7uNi8eV/hAbCbJMAH4l6Bh7MVWsXWf7phZBaxgBIfBNep
	WT34mv7Kngo2YXP2ks/EJWPK5Z7MH3k51oWWIXQ=
X-Google-Smtp-Source: ADFU+vuqyeFN0bXYQ+BB7w9BF6rOpmCE4Jcp114gSav/rngB1132aOaK+d26OHtJIPwZbq1kbwuPo2Jyk0yUojmN/KI=
X-Received: by 2002:aca:ad93:: with SMTP id w141mr3878052oie.54.1585062778152;
 Tue, 24 Mar 2020 08:12:58 -0700 (PDT)
MIME-Version: 1.0
References: <20200324090057.25409-1-geert@linux-m68k.org> <20200324143336.rqwxnp3dutchlqah@chatter.i7.local>
In-Reply-To: <20200324143336.rqwxnp3dutchlqah@chatter.i7.local>
From: "Geert Uytterhoeven" <geert.uytterhoeven@gmail.com>
Date: Tue, 24 Mar 2020 16:12:46 +0100
Message-ID: <CAMuHMdVx6k6RBzUDekQ_N9L+=aoPHsyg28kFj+hM3GkG2UCuiQ@mail.gmail.com>
Subject: Re: [PATCH] Fix invocation of b4.sh through a symlink
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc: tools@linux.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Konstantin,

On Tue, Mar 24, 2020 at 3:33 PM Konstantin Ryabitsev
<konstantin@linuxfoundation.org> wrote:
> On Tue, Mar 24, 2020 at 10:00:57AM +0100, Geert Uytterhoeven wrote:
> > If b4 in your $PATH is a symlink pointing to b4.sh, $SCRIPT_TOP points
> > to the directory containing the symlink, and b4/command.py cannot be
> > found.
> >
> > Fix this by following any symlinks, if present.
> >
> > After this it works for being invoked through either an alias, symlink,
> > or plain path.
> >
> > Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
> > ---
> > Stack Overflow tells me "readlink -f" is not supported on OS X and some
> > BSDs. Do we care?
>
> I used a similar patch that Greg sent because it used "realpath"
> instead. It doesn't exist at all on OSX/BSDs, but if they are doing any
> kernel development at all, they probably know how to install coreutils.
> I think that's an easier requirement than setting up a GNU-compatible
> version of readlink.

Greg's version works fine for me, too.

Note that both readlink and realpath are part of coreutils ;-)

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
