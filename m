Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA11C7492
	for <tools@linux.kernel.org>; Wed, 20 Jul 2022 23:24:17 +0000 (UTC)
Received: by mail-ej1-f52.google.com with SMTP id j22so243729ejs.2
        for <tools@linux.kernel.org>; Wed, 20 Jul 2022 16:24:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=QHspPLAA4IjE5cIrqmPiJM9ATSM0SjncRIlTUUneQvI=;
        b=eY65LwKD0Zwkp3rpX5nYozUKUimgTvUyfegPNz/FtdxI/TYtI335b+xpZt1tBWYBXR
         cZMeOI9dGmLmlPKKfIOpN2GAyYjtI5lSB4O6FjmX+idg27/2XraLkIA/aFF/b6j/dVSh
         O/YsFBBIpejm/EiO2qSakJ6ODhKYPITRKfp80=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=QHspPLAA4IjE5cIrqmPiJM9ATSM0SjncRIlTUUneQvI=;
        b=rkrrjqOPIDso5awOG2QEpEQ6JvccaECjur5NSLlDaxi5gIMsUk525TZ1LeshASw0H3
         q4VDJUlgs5UNMkPrWGjecDqid10RdrZIHzzj7iuHXeE6SseHx/2wlfEQK4vF19K6Hewi
         4H1K2xdepHJzN+jqDJT1zaILYdCeJ0b3DuFHtpGavmibbdvMGb73a5hW6WFctXIbk+JM
         ZJyoi04gkhxcykDatBdhLrF8iZLnNvNXAoHmx83b95Hu0+jt1G70hPVXI3ks79bN1Gg0
         WJ6Yo2WhQ55uW6Ls9dvtjMJjJqa41tgbwhoLiAzzR20gXqoVwyHGXTGtyocj0se+Q5zN
         c++Q==
X-Gm-Message-State: AJIora9+WyS1WadpCiJd5hUY5oTwLtOTluFZ6HlM4pb6KvJvrQpMyy4e
	F2hAuFQ8GxH7RM37kEzLmB/1tos4wfpk0irm/+Q=
X-Google-Smtp-Source: AGRyM1t2SHRsGyipno1P4e5/Nf39dM4YeK5XoHgxs9tfxbjiqXdsd2SVr2p/KXnMkO1nhqIeQen7wA==
X-Received: by 2002:a17:907:3e84:b0:6fe:8c5f:d552 with SMTP id hs4-20020a1709073e8400b006fe8c5fd552mr37896158ejc.710.1658359455770;
        Wed, 20 Jul 2022 16:24:15 -0700 (PDT)
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com. [209.85.221.50])
        by smtp.gmail.com with ESMTPSA id kz20-20020a17090777d400b00722e203633esm151893ejc.122.2022.07.20.16.24.14
        for <tools@linux.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 20 Jul 2022 16:24:14 -0700 (PDT)
Received: by mail-wr1-f50.google.com with SMTP id b26so28161230wrc.2
        for <tools@linux.kernel.org>; Wed, 20 Jul 2022 16:24:14 -0700 (PDT)
X-Received: by 2002:a05:6000:1f8c:b0:21d:7e98:51ba with SMTP id
 bw12-20020a0560001f8c00b0021d7e9851bamr30809700wrb.442.1658359454069; Wed, 20
 Jul 2022 16:24:14 -0700 (PDT)
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
References: <20220716142954.voq4ucnl5wkq7h2b@nitro.local> <20220720184835.uhnkucai54alhgo6@nitro.local>
 <20220720192456.GM5049@ziepe.ca> <xmqqmtd31ip8.fsf@gitster.g>
In-Reply-To: <xmqqmtd31ip8.fsf@gitster.g>
From: Linus Torvalds <torvalds@linuxfoundation.org>
Date: Wed, 20 Jul 2022 16:23:57 -0700
X-Gmail-Original-Message-ID: <CAHk-=wgWY5920sr5AUxZVP6hs85wiTzR0AMH9pc5epfzTeC3wA@mail.gmail.com>
Message-ID: <CAHk-=wgWY5920sr5AUxZVP6hs85wiTzR0AMH9pc5epfzTeC3wA@mail.gmail.com>
Subject: Re: b4 submit ready for beta testing
To: Junio C Hamano <gitster@pobox.com>
Cc: Jason Gunthorpe <jgg@ziepe.ca>, Konstantin Ryabitsev <konstantin@linuxfoundation.org>, users@linux.kernel.org, 
	tools@linux.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Wed, Jul 20, 2022 at 4:16 PM Junio C Hamano <gitster@pobox.com> wrote:
>
>  - "git am", where the cover letter becomes an empty commit at the
>    tip of the series; and
>
>  - "git merge", where such a branch with an empty commit that stores
>    the overall topic description at the tip of it would lose the tip
>    commit when the topic is merged, and instead the resulting merge
>    message would inherit the message from the empty commit at the tip.
>
>  - "git format-patch", where such an empty commit at the tip is
>    recognised and is used to pre-populate the cover letter.
>
> And having cover letter consistently at the top of the series would
> make the life easier, I would imagine.

Honestly, I think the *really* convenient place for the cover letter
information would be in the branch description.

I don't think branch descriptions are used very much, but they have
the advantage that they stick around with the branch as you add or
edit commits in the branch.

There's no "empty commit at the top or bottom of the series" that you
have to worry about, or any tag that needs to be updated as the branch
contents change.

The argument against branch descriptions was always that they didn't
move around with the branch when you use git pull/push, but for the
stated use of "branch for sending emailed patches with a cover
letter", the notion of just having it in the branch description seems
to be exactly the rigth thing to do.

It also has the advantage that you can edit it at any point, so people
who don't want to write the cover letter until the very end (as
somebody piped up in this thread) can continue to do that, and people
who want to just update the description as they go about their branch
work can _also_ do that.

Hmm?

                Linus
