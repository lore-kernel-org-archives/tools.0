Received: from mail-qv1-f41.google.com (mail-qv1-f41.google.com [209.85.219.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C8361FAE;
	Thu, 21 Jul 2022 08:48:28 +0000 (UTC)
Received: by mail-qv1-f41.google.com with SMTP id j11so674455qvt.10;
        Thu, 21 Jul 2022 01:48:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=NinDAa9K6Spdw9xD38BxhvnprbSGIzcxC+wEdVjtKEc=;
        b=rCtfQ9p1HQcFzGpncI2DwWgej7S8PFqaWLMWLnJadg5BVb0eZaoLwI/sw0md2Cn3pK
         bGCDrfGW1t4ZuHEO8PLXzncTeUhnwpg3JvErVwk+ha5qVtx/tJjV5nJzjMUc5/6Ej1pV
         GMgtsoKzZZDjF3tvIUOUvZJz9DcryV0oX5EIgf2ovQdFkGMGznSgyNhi3bsqq47Un6jE
         BBSCfIYJ2fBd8zlcPpxaDE5G1hWNNYYTsC8UPy7gZhrxcA/4yqHg2N2VQk+6s0CxzGFo
         mel8g6pI/phHyf1aw43n4EuVJmcevp7DSfFt1PHMcAUYd3+1E36rAnYG0LVHz7/0dz+4
         wQ8Q==
X-Gm-Message-State: AJIora+pd8Apae4j49PXO2TLC1ZS9gRB8BL9Iy9w6dF/TY4v1kP3BOJD
	sy4gkz87iZtmTnC5PPJ+U/Up2XSLgnOlsg==
X-Google-Smtp-Source: AGRyM1vhjsbv42PJKtFcZSwuKeb/CUDiBqHlvCxxm+pZApL3W9W+tCNEITviwp100x5zBc1nhUAwHQ==
X-Received: by 2002:a05:6214:3009:b0:473:990:6d08 with SMTP id ke9-20020a056214300900b0047309906d08mr32638532qvb.121.1658393307167;
        Thu, 21 Jul 2022 01:48:27 -0700 (PDT)
Received: from mail-yb1-f173.google.com (mail-yb1-f173.google.com. [209.85.219.173])
        by smtp.gmail.com with ESMTPSA id y28-20020a37f61c000000b006b5f7d0d0b6sm1044157qkj.4.2022.07.21.01.48.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 21 Jul 2022 01:48:26 -0700 (PDT)
Received: by mail-yb1-f173.google.com with SMTP id e69so1699050ybh.2;
        Thu, 21 Jul 2022 01:48:26 -0700 (PDT)
X-Received: by 2002:a05:6902:38c:b0:670:b6bc:6ed5 with SMTP id
 f12-20020a056902038c00b00670b6bc6ed5mr1612064ybs.604.1658393306469; Thu, 21
 Jul 2022 01:48:26 -0700 (PDT)
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
References: <20220716142954.voq4ucnl5wkq7h2b@nitro.local> <20220720184835.uhnkucai54alhgo6@nitro.local>
 <20220720192456.GM5049@ziepe.ca> <xmqqmtd31ip8.fsf@gitster.g>
 <CAHk-=wgWY5920sr5AUxZVP6hs85wiTzR0AMH9pc5epfzTeC3wA@mail.gmail.com>
 <20220720233940.GO5049@ziepe.ca> <CAHk-=wgEmH89HpOB5ZYO9owwZ67=O6cikbre2-PShM+AsXhYcg@mail.gmail.com>
 <CAPc5daWCm=8Bket5t9Q+SJ+6pRL3PPSYVqU3Z98miKV+D_bFFQ@mail.gmail.com> <20220721000256.GS5049@ziepe.ca>
In-Reply-To: <20220721000256.GS5049@ziepe.ca>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 21 Jul 2022 10:48:14 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUB2F3BeaG2qH0jCDM87tJjzWhp=-Xx7xq+Y=oc76322Q@mail.gmail.com>
Message-ID: <CAMuHMdUB2F3BeaG2qH0jCDM87tJjzWhp=-Xx7xq+Y=oc76322Q@mail.gmail.com>
Subject: Re: b4 submit ready for beta testing
To: Jason Gunthorpe <jgg@ziepe.ca>
Cc: Junio C Hamano <gitster@pobox.com>, Linus Torvalds <torvalds@linuxfoundation.org>, 
	Konstantin Ryabitsev <konstantin@linuxfoundation.org>, users@linux.kernel.org, 
	tools@linux.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Jason,

On Thu, Jul 21, 2022 at 2:03 AM Jason Gunthorpe <jgg@ziepe.ca> wrote:
> On Wed, Jul 20, 2022 at 04:42:44PM -0700, Junio C Hamano wrote:
> > On Wed, Jul 20, 2022 at 4:41 PM Linus Torvalds <torvalds@linuxfoundation.org> wrote:
> > > On Wed, Jul 20, 2022 at 4:39 PM Jason Gunthorpe <jgg@ziepe.ca> wrote:
> > > >
> > > > If the cover letter is the last commit then 'git commit --amend'
> > > > allows editing it as easily as 'git branch --edit description'.
> > >
> > > .. and what about adding new commits during development?
> > >
> > > That sounds oh-so-*very* inconvenient.
> >
> > "git rebase -i" is your friend ;-)
>
> Yeah, exactly.
>
> New commits are not even that likely to be added at the end of the
> series anyhow. A new commit needs to be added at the logical place it
> belongs in the sequence, so someone should already be proficient using
> rebase to shuffle commit order around.
>
> Either write the commit at the end and 'rebase -i' it into place, or
> 'rebase -i' with "edit" to directly author it where it belongs.
>
> An empty commit is trivial to reorder with 'rebase -i' - guarenteed no
> conflicts :)
>
> And when there are issues in the commits I generally end up with
> fixup! commits and repeated "rebase -i --autosquash"'s until the
> series is done.

I'm wondering how this rebasing is working well with the "team"
workflows where patches are being shuffled around with push/pull?

> I'm getting the impression that people are building series in git
> without using a lot of 'rebase -i' ? How is this done ?

FTR, I use "rebase -i" all the time.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
