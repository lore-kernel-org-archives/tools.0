Received: from mail-ua1-f42.google.com (mail-ua1-f42.google.com [209.85.222.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AB0826B762
	for <tools@linux.kernel.org>; Wed, 15 Oct 2025 07:33:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760513612; cv=none; b=Eqylw+xLS+ZlnnYIWxLyELNr8MRTrq4D7wpvgd/zh30N+xBajfAs5h5qpKg/PEfY9l+ZvBz7xfPZ0wkD+mYQWjyMB9mI0ZFtrN/yTZRSAr7vgRIfVKxH6J1GmK6NzyrVks799rfSuFHzjVGTKV2G1M2+vc0+RbtFL3dcDnf03BA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760513612; c=relaxed/simple;
	bh=dhIoeuXCQpzvjTx038Cn4v0PwSPfHWBJFvsFeAoQQwg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=KVbPIj1pJ7q/AvHXfAyEhoPvzxF8CbSE423XmyGMBagkBIr5dRscQDz9fD7tQJ7RJs1fo3SLkc+v7ZgXl5xBmXC1fXEC1u4QV//nJfjjzyxepmzeDcdL/HrZ25YxwOBewuN9mGGZ7jsdZGEh7XURT83U87TOKv61UZZJFMzMHto=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f42.google.com with SMTP id a1e0cc1a2514c-8fea25727a9so1658802241.1
        for <tools@linux.kernel.org>; Wed, 15 Oct 2025 00:33:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760513609; x=1761118409;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nouo6Sw+Hvtz+7PHWWIibCUHM1n3mTFflpANhiFGskk=;
        b=IB+ZTVaONK66iMe+ejpWd0W6BM0uHqUgncUdzKtueZ3umXMvhiB0S/snHfE+NdBjMs
         XBeWVHm/B0Amhywp2Y9lETUFwzZuB+2BP40AHfMJ3js8tkkMa7hZ5tX1mqb2wRt/Uf9W
         1m46j1w4LchEgS4krT8yOhx6Rag8p33pWSCaLMlWuywsQtZl1+Ku9EpSYDowfXalUsEj
         V4JL5kzmE0+xtZeWvhF2Zp/tNo8AYx60+9pRbFNzxjGq3O2jBxDkGPNwsxuVwjNLYzUe
         DJCKHc+WOPTe5bE7Ue+IRcoouE4GIaYQrYkPdd1VnccN9y2qfCzStLD6rlHIqOVjj5O6
         hWJg==
X-Forwarded-Encrypted: i=1; AJvYcCX9omA2eSDEBR/zU/Llkbra8nbm8jFQzntRyex/vyBXK1dJ3mhxQn3+Vq8ci6jn1ScvW7aQVQ==@linux.kernel.org
X-Gm-Message-State: AOJu0YxlrGET43Ni4NW4jOf3arD6+hrFS5nmVpmq+AFvDNv9izSQBwRi
	WUziLXKNcmRRANOWgY7syIVGiorJQ9dc1VjzrP8TgCTdg68xlF/9ySrQToJHwynS
X-Gm-Gg: ASbGnctjaIwj7p8ssCzL72nftaxdqbxg+FbFZ4PgOu46Ew0ZSej2vuHFk0ejQBkt/UR
	KoJsGTkPd2l5cBom1ZICiiZNVD5RLzzq66GokqN+70x8NBcdbQJynSD7DQztJvdEYF9P2bOCUHB
	Bp6Oz7lbQuN5dvWahaHdYX5VWDVtH239c2I7Hi/8rKzazPd+FC66MGu1XsoFGnLw6uLdYk9RUNL
	y3qESyilfCsII7xqUSRzxaD5GEzW8JcQJZ3SGdpjwadW7TZyGohTUxlqfill21sny0O0sN0pbst
	TsHdFiKOOsxTghU+vG9soQAO+I7sdBRN4xrtwQSpEx9miwsiZ6W425n6yVnXj4lZqBZPL2bUm8H
	retFMb2vOxW/3WOpCWXkYqb15DGL5H4EMD8pBMu+qxQXgcatxJ0n31V6wU9tFeHLaVa4hWK6rlc
	L1xryWHiCdrBvgHw==
X-Google-Smtp-Source: AGHT+IHISfi1Ynr8RxMcGoTicnZuMUNH4PrPxfdC5uB5yR6UGfEVZgozMeJ5uPXjJV9X+NLAXqRbdA==
X-Received: by 2002:a05:6102:5128:b0:4fd:35ca:6df5 with SMTP id ada2fe7eead31-5d5e2216164mr9017495137.7.1760513609070;
        Wed, 15 Oct 2025 00:33:29 -0700 (PDT)
Received: from mail-vs1-f48.google.com (mail-vs1-f48.google.com. [209.85.217.48])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-5d5fc8b5e06sm5192083137.11.2025.10.15.00.33.28
        for <tools@linux.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 15 Oct 2025 00:33:28 -0700 (PDT)
Received: by mail-vs1-f48.google.com with SMTP id ada2fe7eead31-5d5f8e95d5eso2309162137.1
        for <tools@linux.kernel.org>; Wed, 15 Oct 2025 00:33:28 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUzH7A4YjKS4B5bPWMj7Lb0X6USk4I5sEgNzuONIWNG0cxFc32n7VIYwKZ4uu/qtehSfaa73w==@linux.kernel.org
X-Received: by 2002:a05:6102:54a0:b0:5d5:ff0f:aea1 with SMTP id
 ada2fe7eead31-5d5ff0faeacmr5922355137.22.1760513608042; Wed, 15 Oct 2025
 00:33:28 -0700 (PDT)
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
References: <CABgObfY5agTRsB-bCqCYbA0erFn5cVbujtTNBiCti8g_68nCWg@mail.gmail.com>
 <20251013081536-mutt-send-email-mst@kernel.org> <CAHk-=whSShtPG1_+02Cc4yDuEJxVqX=G8tAx0gW7UjA7cuBp-w@mail.gmail.com>
In-Reply-To: <CAHk-=whSShtPG1_+02Cc4yDuEJxVqX=G8tAx0gW7UjA7cuBp-w@mail.gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 15 Oct 2025 09:33:16 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWxMhM1J3zHC8OkN_fd8XsJPFA6jM_3JFU=ySKhnX6ESw@mail.gmail.com>
X-Gm-Features: AS18NWDS45Ngu6MWNzFbR-_HpnfyA_2ElVwA2xwdz78kRCuCax0lQli9czdOQn0
Message-ID: <CAMuHMdWxMhM1J3zHC8OkN_fd8XsJPFA6jM_3JFU=ySKhnX6ESw@mail.gmail.com>
Subject: Re: In defense of Link (was Re: [b4] initial "b4 dig" to supplant
 Link: trailers)
To: Linus Torvalds <torvalds@linuxfoundation.org>
Cc: "Michael S. Tsirkin" <mst@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>, 
	Konstantin Ryabitsev <konstantin@linuxfoundation.org>, users@kernel.org, tools@linux.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Linus,

On Mon, 13 Oct 2025 at 19:16, Linus Torvalds
<torvalds@linuxfoundation.org> wrote:
> I object *strongly* to any random noise that doesn't add explicit
> value. For example, the argument that "I want to see which of the
> identical 17 submissions was used" I find completely pointless.

That is your prerogative, but I find it extremely useful.  Not just for
reporting bugs, but also for queuing patches (has anyone reported a bug
between me taking the patch, and actually queuing it?).
Other people have other use cases.

> If you can already look things up by patch ID - and you can - then why
> is it AT ALL relevant "which of the six identical patch submissions
> was taken". They were the same patch.

So which version do you reply to when submitting a bug report?  If you
find an issue, and want to submit a bug report, which older versions of
the same patch do you have to scan for replies to discover if someone
already ran into the same issue?

An https://patch.msgid.link/-Link serves (a.o.) as a pointer to where
to report an issue, and where to find other reported issues.  You can
consider it a pre-assigned bug report ticket.

Note that I am also replying to your email in this thread, and not just
starting a new conversation, with a different set of addresses in CC.

> And that's really my objection here. The thing I really really hate
> about how people used "Link:" patches was that it was both mindless
> and pointless.

FTR, I dislike the use of Cc: in patch bodies.

> I have no objections to *mindful* use of Link patches.
>
> The workflow that Steven Rostedt explains with multiple versions that
> are explicitly linked together is fine: if you have real mindful use
> of a "Link", then go on using it, IF YOU THINK ABOUT IT, and didn't
> just mindlessly automate it.

I'd love for more people to link to the previous version when submitting
a new one (for substantial work, not for simple and obvious changes).
It helps a lot when trying to find out why something was changed
between e.g. vN-4 and VN-3 (that is: when I am looking for that
info, and don't just want to find out the actual version that made
it upstream).

> Because we *HAVE* automated information that is already sufficient.
> Every single commit already fundamentally has sufficient information
> to find the submission if it was to a lore-tracked mailing list:
>
>  - patch ID

Patch ID is not sufficient, because maintainers change patches
regularly, for minor improvements, or because of small conflicts.

>  - commit date

It is not uncommon that a different version than the last one that was
posted is applied: the last version may introduce a bug, the developer
keeps on submitting newer versions after the maintainer already applied
it, the maintainer accidentally took the wrong version, ...

>  - subject line and patch date (note: maybe from the email, maybe in
> the body of the email)

These may be edited by the maintainer, too, because of prefixes that do
not match the subsystem style, or because of spelling/grammar/wording
issues.

> I argue that "Link" makes everything worse. It does not add
> information. It adds redundant data (explicit difference between
> "information" and "data"), and not in a good way.

Also, think database normalization

> What's the real argument against "b4 dig"?

It's one more indirection, and can never be 100% correct, compared
to using the Message-ID in the original patch.

Thanks!

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
