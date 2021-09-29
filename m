Received: from mail-vs1-f45.google.com (mail-vs1-f45.google.com [209.85.217.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C26543FCB;
	Wed, 29 Sep 2021 17:55:08 +0000 (UTC)
Received: by mail-vs1-f45.google.com with SMTP id y141so4040415vsy.5;
        Wed, 29 Sep 2021 10:55:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=BeHn9rOoQKhly4yBJM51aoFruzxw8WWBGi9KiJWVl28=;
        b=OBAdmow0rA4xvNupmkn6Gqs6ycvwmeKaOWa0fYGLSmijpegarfehLTtTgC6/b0rjQe
         /8TjMssE6TqpZnn8DMC7oxv8A02lG8D3dPSEXJsq4Qrtju900BmzapOjvtnpZM0Sh+yH
         r4Vgd1uiYokTvp83boKvP1q5gtSg5/Ddrh15FXPzkUI9aTsgyV0c6o8iGXwaeh8tGDH+
         4xICV7+hZBGuHre9FBExbOX0zIpFwW/GgnxJ3+LUoscWMFNuIwnJs0uaDB9FX9g9wmsx
         qfTmaalvHI8NUFYG8/6iTi5gqOk/YiVk21f2kw55Ek/xO5zw/TbqhBZMru0yr+GHbfwg
         bVpw==
X-Gm-Message-State: AOAM530ZSgqm5yXhsvvNFp+riWNu1fiWqknPR2xxqbG4ZrQzYktOJj1z
	E8rnpbWZ/wG3uiv6DsSz+pxBvuNM7ckOwILGrrk=
X-Google-Smtp-Source: ABdhPJyCa9TjZwoh9DY6DS4t/DendsZgrcBFYg+Fx/4E5pM6i1t2Lm6RgSRP2kecVgLEZ+G3lj2SprrHA6nfD/SzYQc=
X-Received: by 2002:a05:6102:21d4:: with SMTP id r20mr1729921vsg.50.1632938107748;
 Wed, 29 Sep 2021 10:55:07 -0700 (PDT)
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
References: <20210921202526.mk2meetobbtl3tvi@meerkat.local>
 <CAMuHMdWDh=pkFWvxkikFPh3ACyo8ctO1A-DvA6qq7KZ+Lr7X9w@mail.gmail.com>
 <20210924210826.ebi3ljjdfiuie2pr@nitro.local> <CAMuHMdUubqhqyDwkO_x98-M_i1tXsA5KfxhM1RDhrbhby8QT5w@mail.gmail.com>
 <CAL_JsqL-_GhC0L7O5BugC6P_TjhoqL_p3dgBmHuoJfX0fy8gaw@mail.gmail.com>
In-Reply-To: <CAL_JsqL-_GhC0L7O5BugC6P_TjhoqL_p3dgBmHuoJfX0fy8gaw@mail.gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 29 Sep 2021 19:54:56 +0200
Message-ID: <CAMuHMdVq762Y=q-knNzEwohb9XWC53phVEOQq3r0YW0eXHGimQ@mail.gmail.com>
Subject: Re: b4: introducing b4 shazam (like b4 am -o- | git am)
To: Rob Herring <robh@kernel.org>
Cc: Konstantin Ryabitsev <konstantin@linuxfoundation.org>, tools@linux.kernel.org, 
	users@linux.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Rob,

On Wed, Sep 29, 2021 at 3:39 PM Rob Herring <robh@kernel.org> wrote:
> On Tue, Sep 28, 2021 at 1:23 PM Geert Uytterhoeven <geert@linux-m68k.org> wrote:
> > On Fri, Sep 24, 2021 at 11:08 PM Konstantin Ryabitsev
> > <konstantin@linuxfoundation.org> wrote:
> > > On Thu, Sep 23, 2021 at 10:51:21AM +0200, Geert Uytterhoeven wrote:
> > > > Note that with -s, the Link: tag appears below my Sob, while
> > > > b4 am + git am -s adds my Sob below the Link: tag.
> > >
> > > Unfortunately, I can't control this beyond reversing this for everyone. The
> > > only other alternative is setting up b4.shazam.am-flags variable for what to
> > > pass to "git am" -- which may be a good idea anyway.
> >
> > The current behavior of b4 shazam does obfuscate the patch trail.
>
> Is there a defined right order for Link and committer's Sob? Either we
> have to define what that is for b4 to implement or b4 has to be
> configurable. If the committer != author, then Link followed by Sob
> makes sense. But what about committing your own patches? If you

Yes.

> strictly follow the patch trail, you'd end up with your Sob twice:
> Sob, Link, Sob. In these cases, I've been putting Link last and a
> single Sob.

Same here.  I do not add a duplicate SoB in that case, and the Link
tag will be last.

BTW, I also do not add my own Acked-by and Reviewed-by tags
to patches it commit myself.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
