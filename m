Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5D5C7497;
	Wed, 20 Jul 2022 23:42:56 +0000 (UTC)
Received: by mail-pj1-f53.google.com with SMTP id t3-20020a17090a3b4300b001f21eb7e8b0so2963367pjf.1;
        Wed, 20 Jul 2022 16:42:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=2Qz/a0QxVhmaThj0o0cBiUI+iYowbhS6rrKRuOk2auA=;
        b=cFAckSPyeHRe15WNeNlww4y62x2hPpDj+T9yLjUzC+TytOYKgnFaZnTHuJWZheCjXV
         YNHoFDadKh9xLMPLJUgtJfFqbRGGaz5epCcV/zvCVO/JyjHJkypPnhO52L5QMoo/ACnq
         +91+UMl0LzE5E1Dx6APGsp7z1UMMS6zT88lIO3khcJE06W6Mbj2KQq8Yauw8xG7nHNGX
         zoOQt6fHVTYQJNJSxplvwXO4B2aXxLAPJjXl2d7FVY3YWb5KQEL4Imw7VdxcZ0buPoVh
         Ga2KOwF/OhxqEK5EfEP1rvKuS9bFrpsiAoP2+TX8Vl/LRrpnC+a1rrM0wDUjcOP6hcPT
         Uz9g==
X-Gm-Message-State: AJIora/J9IKDgToxq6W4D1G9u6JiZuQ9TpnjNm4jMY+egj+LBtnKFil9
	lMKGn8BAxvln+aYelO9ggYdE91igmIn7I+nhb6a88+7t
X-Google-Smtp-Source: AGRyM1vysgJahJoFgIjMobMYwDybkDkcDVY01o5SfmjE9buxEB8Z32tOPsjt0Fb86BtgLgBYmrjwhkedrslzlFnpaqQ=
X-Received: by 2002:a17:90a:b383:b0:1f2:24d8:71f5 with SMTP id
 e3-20020a17090ab38300b001f224d871f5mr4038359pjr.206.1658360576320; Wed, 20
 Jul 2022 16:42:56 -0700 (PDT)
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
In-Reply-To: <CAHk-=wgEmH89HpOB5ZYO9owwZ67=O6cikbre2-PShM+AsXhYcg@mail.gmail.com>
From: Junio C Hamano <gitster@pobox.com>
Date: Wed, 20 Jul 2022 16:42:44 -0700
Message-ID: <CAPc5daWCm=8Bket5t9Q+SJ+6pRL3PPSYVqU3Z98miKV+D_bFFQ@mail.gmail.com>
Subject: Re: b4 submit ready for beta testing
To: Linus Torvalds <torvalds@linuxfoundation.org>
Cc: Jason Gunthorpe <jgg@ziepe.ca>, Konstantin Ryabitsev <konstantin@linuxfoundation.org>, users@linux.kernel.org, 
	tools@linux.kernel.org
Content-Type: text/plain; charset="UTF-8"

"git rebase -i" is your friend ;-)

On Wed, Jul 20, 2022 at 4:41 PM Linus Torvalds
<torvalds@linuxfoundation.org> wrote:
>
> On Wed, Jul 20, 2022 at 4:39 PM Jason Gunthorpe <jgg@ziepe.ca> wrote:
> >
> > If the cover letter is the last commit then 'git commit --amend'
> > allows editing it as easily as 'git branch --edit description'.
>
> .. and what about adding new commits during development?
>
> That sounds oh-so-*very* inconvenient.
>
>                Linus
