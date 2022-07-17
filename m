Received: from mail-qk1-f176.google.com (mail-qk1-f176.google.com [209.85.222.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E8E27F6;
	Sun, 17 Jul 2022 09:58:21 +0000 (UTC)
Received: by mail-qk1-f176.google.com with SMTP id o21so6766179qkm.10;
        Sun, 17 Jul 2022 02:58:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=b1gyAQWm0GeoYy6gYjKFpCEvVI6OVC3dHr3cPWD82kA=;
        b=dasuROFzP8gmgOarnzkhXDNBcmRKcXdXMNnv+9TLqhNYcG5h6p2+O4VV17dmS9deR7
         4JoMRRXAbZeH1Qj6HYA2yvfYGRbyY1VcDAapUCdreqBEvPSDiNWjq3NDx+Px1SDru01m
         OB6fiuUWOG9WywH4V1gqmPIw+x98n9bIV7eUR4rSwTYWFvt5XT8GmvvQuHJidAt4eOIm
         ayDSz9AzfBJREi3pxP8FkKpsRFiAnpNb0hclefaITF1L53pL6msE2/CGXhE0pNjPluFa
         Vi0ICm+miKktzVhLV0tR8TGMVCbL+tteXhS5NDmMZjYprQQr9228q9JT/rnC3Eyn9kjV
         oKdA==
X-Gm-Message-State: AJIora9eciDDQEx2WccllhTU6eABNFbhX5PneUVlvjYKRB/E2YhaEshI
	mxG4xRSxesTOmGZPTn158dcByWqTTKVqUQ==
X-Google-Smtp-Source: AGRyM1t8POGyx3j9Cc924C12OQ3YEi+cy93SEvq0jt7RFrU1RAoXBN6f9fEDXjgoYusFdhp/880qOg==
X-Received: by 2002:a05:620a:2b9c:b0:6b5:a675:2d91 with SMTP id dz28-20020a05620a2b9c00b006b5a6752d91mr14399626qkb.326.1658051900027;
        Sun, 17 Jul 2022 02:58:20 -0700 (PDT)
Received: from mail-yw1-f172.google.com (mail-yw1-f172.google.com. [209.85.128.172])
        by smtp.gmail.com with ESMTPSA id y17-20020a05620a25d100b006b46a78bc0fsm8296432qko.118.2022.07.17.02.58.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 17 Jul 2022 02:58:19 -0700 (PDT)
Received: by mail-yw1-f172.google.com with SMTP id 00721157ae682-31c89653790so82574137b3.13;
        Sun, 17 Jul 2022 02:58:19 -0700 (PDT)
X-Received: by 2002:a81:9209:0:b0:31c:b1b7:b063 with SMTP id
 j9-20020a819209000000b0031cb1b7b063mr24476081ywg.383.1658051899473; Sun, 17
 Jul 2022 02:58:19 -0700 (PDT)
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
References: <20220716142954.voq4ucnl5wkq7h2b@nitro.local> <4c4652b0e333bd81b91f71346ac6142322682eff.camel@HansenPartnership.com>
 <20220716145638.ubuwwc7xtjw6ugy7@meerkat.local>
In-Reply-To: <20220716145638.ubuwwc7xtjw6ugy7@meerkat.local>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Sun, 17 Jul 2022 11:58:08 +0200
X-Gmail-Original-Message-ID: <CAMuHMdU8H98M2u9OXM347+Gz8Y9erwTejv-3U_=8KTK1XgMdow@mail.gmail.com>
Message-ID: <CAMuHMdU8H98M2u9OXM347+Gz8Y9erwTejv-3U_=8KTK1XgMdow@mail.gmail.com>
Subject: Re: b4 submit ready for beta testing
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc: James Bottomley <James.Bottomley@hansenpartnership.com>, users@linux.kernel.org, 
	tools@linux.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Konstantin,

On Sat, Jul 16, 2022 at 4:56 PM Konstantin Ryabitsev
<konstantin@linuxfoundation.org> wrote:
> On Sat, Jul 16, 2022 at 10:43:17AM -0400, James Bottomley wrote:
> > On Sat, 2022-07-16 at 10:29 -0400, Konstantin Ryabitsev wrote:
> > > After the branch is created, b4 will create an empty commit that will
> > > serve to store the cover letter contents and some tracking
> > > information. You can view the raw commit with "git log" just like any
> > > other commit, and you can even edit it with "git rebase" but it's not
> > > recommended. It's much better to use "b4 submit --edit-cover".
> >
> > Could we please stop inventing stuff that's incompatible with a
> > standard git workflow ... or argue with the git maintainers that what
> > we want to do is better and persuade them to add it?  That way git and
> > b4 are fully interoperable ... for those of us who aren't dedicated to
> > one or the other.
> >
> > The standard git way of storing cover letters isn't in an empty commit,
> > it's in the branch description.  To be honest, this does seem a more
> > logical way to do it (a commit can get lost within the branch), but I'd
> > be reasonably OK with either mechanism, provided both git and b4 agree
> > on it.
>
> I hear you, but branch descriptions are confined to your local repository and
> can't be pushed to a remote. So, if you work on a series, send it off, and
> then pick it up again two weeks later from a different workstation, that's no
> good for most of what b4 submit needs to do. :(
>
> So, it was either using notes (which almost everyone forgets to push anyway),
> or using an empty commit. I agree it's hurky, but it currently the only thing
> that fits in the "least likely to end up lost on a rebase or workstation
> switch" category.

Empty commits are very likely to be lost on a rebase, as the default is
to drop them while doing an interactive rebase (unless --keep-empty).

My local development trees have lots of visual separators which are
commits that add dummy files, to avoid losing these commits during
rebases.  I have a script to create such separators, but it's been
a while since I used it, as the separators are recyclable.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
