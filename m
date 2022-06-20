Received: from mail-qk1-f174.google.com (mail-qk1-f174.google.com [209.85.222.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AADCC7E6;
	Mon, 20 Jun 2022 08:40:47 +0000 (UTC)
Received: by mail-qk1-f174.google.com with SMTP id b142so7342362qkg.2;
        Mon, 20 Jun 2022 01:40:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=+MJFmcLo7kLJeylHoCidO7Q0ygtjQt1V2wKBZ6cv0Tg=;
        b=uQ5BwnxCfK/e54WMMeEbIveLiPhkLiuNNtUFUWIMAqSZ6c2yh7FXPmXcr5FByOorQp
         jOr4hKwY/crfIXbMkjDkYunQPLCZOhcbxq5wLpStxBETLCfm1f5VaMPZRMCbkUgNHIsX
         XOq/xFw+XEYaP19zbYAtUub9+CW6zzqP02RmqISL2SdUOftoVw9hnBlCuFjTOVoksc7q
         HE0BFv+eTUcbnEdNcc0mNzH4zaOxuRLOIJDkqFWtbqSmBYuQ/PDvKEXp0kwG1Fz+3zsO
         E6kOJRPkSA9slazGa+x3rZPI4u095yu30+5XsWfZy9NR0O8ucXwLga2TubhbR+5xpx/A
         +UZQ==
X-Gm-Message-State: AJIora+dNZS6dmS3y9+m7b9TjfGef87PpYLVK1mPJrV9YKM+MHfblOIK
	PCtJsZSZT/plh7QaUi/PNjBu3V7N3z9iiA==
X-Google-Smtp-Source: AGRyM1s5+SrtcAV5mXCm5sAqDc40o4JslTdoLJPqtl6njtMbHj575W932sePJYp9MsADdk7Sn/OMMQ==
X-Received: by 2002:a37:a5d3:0:b0:6a6:87cc:202c with SMTP id o202-20020a37a5d3000000b006a687cc202cmr14950338qke.732.1655714446539;
        Mon, 20 Jun 2022 01:40:46 -0700 (PDT)
Received: from mail-yb1-f175.google.com (mail-yb1-f175.google.com. [209.85.219.175])
        by smtp.gmail.com with ESMTPSA id m19-20020a05622a055300b00304fc3d144esm10764860qtx.1.2022.06.20.01.40.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 20 Jun 2022 01:40:46 -0700 (PDT)
Received: by mail-yb1-f175.google.com with SMTP id w6so17730785ybl.4;
        Mon, 20 Jun 2022 01:40:46 -0700 (PDT)
X-Received: by 2002:a05:6902:a:b0:65c:b38e:6d9f with SMTP id
 l10-20020a056902000a00b0065cb38e6d9fmr25207478ybh.36.1655714445955; Mon, 20
 Jun 2022 01:40:45 -0700 (PDT)
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
References: <20220617190153.tvi5lkzlvemeqou5@meerkat.local>
In-Reply-To: <20220617190153.tvi5lkzlvemeqou5@meerkat.local>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 20 Jun 2022 10:40:34 +0200
X-Gmail-Original-Message-ID: <CAMuHMdV54SN7ghTTUnba+3p_9M2NkcXQ6R8KzQXEsWfPWXD6mg@mail.gmail.com>
Message-ID: <CAMuHMdV54SN7ghTTUnba+3p_9M2NkcXQ6R8KzQXEsWfPWXD6mg@mail.gmail.com>
Subject: Re: b4-0.9.0 available
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc: tools@linux.kernel.org, users@linux.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Konstantin,

On Fri, Jun 17, 2022 at 9:02 PM Konstantin Ryabitsev
<konstantin@linuxfoundation.org> wrote:
> After a bit of a hiatus, I am finally able to work on b4 again, so here's
> version 0.9.0 that implements one major new feature and adds some other
> improvements to existing features.

Thanks for your continued support on improving our workflow!

> # new: b4 shazam
>
> This command is very similar to "b4 am", but it allows you to apply patches
> directly to the git repository without the need pipe the output of "b4 am" to
> "git am".
>
> The shazam command has three modes of operation:
>
> 1. default mode that applies patches directly to your git repository, just
>    like passing the .mbox file to git-am
> 2. with -H, shazam will try to prepare the patch series into FETCH_HEAD, which
>    can then be checked out into a branch or merged with git-merge. This
>    effectively makes patch series work similar to pull requests.
> 3. with -M, shazam will do the same as with -H, but will also exec git-merge
>    with the cover letter prepared as part of the merge commit message. You can
>    see it in action here: https://asciinema.org/a/502421

So if I want to run checkpatch, I have to keep on using "b4 am"
and "git am" separately, right?  I never apply patches without running
checkpatch first[1].
Perhaps "b4 shazam" could gain some --checker option to support this?

Thanks!

[1] Currently I use "cat *mbx | formail -s scripts/checkpatch.pl".

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
