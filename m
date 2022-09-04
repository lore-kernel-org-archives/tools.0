Received: from mail-qv1-f52.google.com (mail-qv1-f52.google.com [209.85.219.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C83823A9;
	Sun,  4 Sep 2022 08:08:29 +0000 (UTC)
Received: by mail-qv1-f52.google.com with SMTP id s13so1384745qvq.10;
        Sun, 04 Sep 2022 01:08:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=0CjNxKODTLK6ZgA1CdyDUIUvXUHqSXkkxObnlbqT0bg=;
        b=RVyqK8MH2Z/0tqx5HMDA5SjCW10OY25xpkbO18r2HJgNTtelSGxXLYKcFVAQcPq/45
         CyFfVnHtYsPb7HEV5MpnNcGk+jndX2kfPVZFMAJRT5VRJKsyIuX0/OzTJ1kTryZMpFNL
         4SUEWMAmgojzW8XzRSv8Ugx3UWENrTNQViiqS+3CGR3elp3UcyMv0PuqFV79fe55qxuY
         LAcLoEn/j6SC6eLu4qFZYsUalVTzeuKk5Ca2Ov1sol5ZdUxLoeqQqMXLmf1BgEnfyy6+
         clMKC96eYRNogZMX8HR/L1BKYZ3bVeuPyBWrKDtuBSVlD0IVK0cSgkWUdUa9EwDWX6Yb
         /ZTQ==
X-Gm-Message-State: ACgBeo3yggikxoYBaWz3Lr1FgVIk6x6Ucm8evG3PaswoofR5CkSjWXb5
	IlfDJcKQrSY53XG3ws6rCx4saytjDFuy2w==
X-Google-Smtp-Source: AA6agR6n4/V4iMoYZ1ZTuLg+kQgEO1kerMaquPuOLtBEZc7XXal4CTlWXc6rqEDfDCCknuVEw4FOPw==
X-Received: by 2002:a05:6214:301d:b0:499:3cf:c95f with SMTP id ke29-20020a056214301d00b0049903cfc95fmr29038337qvb.75.1662278907787;
        Sun, 04 Sep 2022 01:08:27 -0700 (PDT)
Received: from mail-yw1-f170.google.com (mail-yw1-f170.google.com. [209.85.128.170])
        by smtp.gmail.com with ESMTPSA id hf9-20020a05622a608900b00342fb07944fsm4385928qtb.82.2022.09.04.01.08.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 04 Sep 2022 01:08:27 -0700 (PDT)
Received: by mail-yw1-f170.google.com with SMTP id 00721157ae682-3450a7358baso20216927b3.13;
        Sun, 04 Sep 2022 01:08:27 -0700 (PDT)
X-Received: by 2002:a81:750b:0:b0:341:10ef:2c37 with SMTP id
 q11-20020a81750b000000b0034110ef2c37mr28377878ywc.316.1662278907185; Sun, 04
 Sep 2022 01:08:27 -0700 (PDT)
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
References: <20220902191622.rrcbq2obitnumfdb@nitro.local>
In-Reply-To: <20220902191622.rrcbq2obitnumfdb@nitro.local>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Sun, 4 Sep 2022 10:08:16 +0200
X-Gmail-Original-Message-ID: <CAMuHMdU5iNGKx_EeYfMRhnS4nc3aK48N3Xq6++KsNo4VuBu6dg@mail.gmail.com>
Message-ID: <CAMuHMdU5iNGKx_EeYfMRhnS4nc3aK48N3Xq6++KsNo4VuBu6dg@mail.gmail.com>
Subject: Re: b4 further beta testing (now with a web submission endpoint)
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc: users@linux.kernel.org, tools@linux.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Konstantin,

On Fri, Sep 2, 2022 at 9:16 PM Konstantin Ryabitsev
<konstantin@linuxfoundation.org> wrote:
> The work on b4 send continues and I feel things are getting close to the point
> where it can be reasonably used in day-to-day work. Special thanks to everyone
> who trialled this out in the past few weeks despite high chance of things
> spontaneously exploding.

Thanks for your continued work!

> b4 trailers: automatically apply latest received trailers
> ---------------------------------------------------------
> The "b4 trailers" command is now hopefully better behaved.
>
> - the --signoff switch is gone, as your own commits should already have your
>   DCO trailer
> - any newly received trailers should automatically be inserted above your own
>   Signed-off-by
> - the trailer-order config option will only apply to your own section in the
>   trailers, to respect the chain of custody order, e.g.:
>
>         Fixes: abcde (Commit info)
>         Suggested-by: Rep Orter <rep.orter@exmple.com>
>         Signed-off-by: Dev Eloper <dev.eloper@example.com>
>         --> start of your own custody section
>         Link: https://msgid.link/some@thing.foo
>         Acked-by: Collected Trailer 1 <collected1@example.com>
>         Reviewed-by: Collected Trailer 2 <collected2@example.com>
>         Tested-by: Collected Trailer 3 <collected3@example.com>
>         Signed-off-by: Your Name <your.name@example.com>
>         --> end of your own custody section

I am a bit confused by the order in this example:

  1. Any tags sent as replies to the series sent by Dev Eloper
     should be added below the SoB of Dev Eloper.
     This is what Dev Eloper does when sending vN+1 of a patch,
     or what Maint Ainer does, when applying the patch,

  2. Any tags sent as replies to the series sent by Your Name
     should be added below the SoB of Your Name.
     This is typically what Continuingdev Eloper does, who took
     over the work from Dev Eloper, when sending vN+1.

So the above example seems to imply this is the case where
Your Name == Maint Ainer...

> b4 send: now with web-endpoint support
> --------------------------------------
> "b4 send" saw the most changes and supports the web submission endpoint. The
> goal behind this is to make it easier for developers without access to sanely
> configured SMTP servers to submit valid patch series. Here's how it works:
>
> 1. You need to have a valid PGP key (or a valid patatt key). The PGP key
>    doesn't need to be in any web of trust, it just needs to be valid and set
>    up in git as user.signingkey.
>
> 2. Add b4.send-endpoint-web to ~/.gitconfig (or .git/config to only enable
>    this for a specific project). E.g.:
>
>         [user]
>       name = Dev Eloper

... while this section suggests Your Name == Dev Eloper
(or Continuingdev Eloper)?

AFAIU, "b4 send" is intended to be used by Dev Eloper or
Continuingdev Eloper, while Maint Ainer would use "b4 am" instead?

Thanks!

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
