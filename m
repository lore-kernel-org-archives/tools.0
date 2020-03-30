Received: from mail-lj1-f196.google.com (mail-lj1-f196.google.com [209.85.208.196])
 by mx.groups.io with SMTP id smtpd.web10.1512.1585600313527511563
 for <tools@linux.kernel.org>;
 Mon, 30 Mar 2020 13:31:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=ypvgK0XE;
 spf=pass (domain: linaro.org, ip: 209.85.208.196, mailfrom: linus.walleij@linaro.org)
Received: by mail-lj1-f196.google.com with SMTP id t17so19639202ljc.12
        for <tools@linux.kernel.org>; Mon, 30 Mar 2020 13:31:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=J3CZiSNklI2+jyM4b+YnS2Btc1AwbQ8jCM6g4Qcktfc=;
        b=ypvgK0XEoFrUO5ksqssTUXJK5J/M8CmpkHvTgOmSyK43O2CHdEGr/Db+RrFMH1xYoK
         Mpch75190PIvSbpdB3Jh0xAh6bfJQFbONJSVlR35GL1D4eMKoyCdRJquMbknZ2O7Y09Q
         On3ahQBZrI82FLsTlu3s57q1uZpXwhIRdijssqvVziQfDv6nByFOq6eN4ets4E3tuBMg
         2/2c7EVHdzMPqf6CjLehue3csWSvAsmwbxobtEWwpL23LDWf6/cfrLNJOihN3ZeIkCCc
         uW0CYXJCSj27/FnSKX98EwqeqGc7eSc0fYpZmtKeORTmhY11WhVf6YTXr6gOxSU1HaMH
         T0sA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=J3CZiSNklI2+jyM4b+YnS2Btc1AwbQ8jCM6g4Qcktfc=;
        b=pIcOvfemVq+F8pb1bhIEpwFoXVH3qYe5PolEqJMJyp5j0fh77Qvrdu2DZEFCn2Q6pT
         IWB5bdJDJC3cusgvmQ+DmI8N+uivATqCwfavt6JJr2dxFrH2t4xmwF2tN1A9wKoRS6CK
         iTK19ZHLgoa6CoEznHU9hsRxx3hxfNuioiFjf73Ts/b8qAF8t/yBbrEhDHuSPYFJGx85
         hH7ilHAt4KzDbfglr2+nAxK0Y7icak1PSPiH6Rw8cVRGnQXWjM1L5MI2pAS2SFGadWNE
         qzik3MRpxuoXFNDV3OJ0YmJdptfseKqVtUjpeXUQZ3vQCTowot6+8IeAoKQ8iiJiGs7X
         xBsA==
X-Gm-Message-State: AGi0Pua7LqyWrdu5V2AZCsHdGLoGvYithBXGaGgvvZa3BdRJB41dPcEY
	+m3PtxUgLqbuicn6GQnlxiSyA8OlSjwVPlEfjZRkMw==
X-Google-Smtp-Source: APiQypJp6U7bBARaCEVQAI+sNmp1K99+sdpZuZTGJf4UFZSLPkfbPNwCcFxsU74Rjl7N+ujSK2TTQu5eafpGZPzx09o=
X-Received: by 2002:a2e:9c48:: with SMTP id t8mr7888895ljj.168.1585600311485;
 Mon, 30 Mar 2020 13:31:51 -0700 (PDT)
MIME-Version: 1.0
References: <20200327165402.slc5l46hc7hlo2l5@chatter.i7.local>
 <CACRpkdZRXh8gKEyeF-uwnP+GuBWxj_QGHeEL=dDOSMoKx6G=1w@mail.gmail.com> <20200329171313.s5qe5ofvmh3uoy7z@chatter.i7.local>
In-Reply-To: <20200329171313.s5qe5ofvmh3uoy7z@chatter.i7.local>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 30 Mar 2020 22:31:40 +0200
Message-ID: <CACRpkdaF5BT+BQo0iq0pg+-W_4mKOYYSGBB9j9O3fpTdSqYO-Q@mail.gmail.com>
Subject: Re: [kernel.org users] Gmail message ID finder Chrome extension
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc: users@linux.kernel.org, tools@linux.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Sun, Mar 29, 2020 at 7:13 PM Konstantin Ryabitsev
<konstantin@linuxfoundation.org> wrote:

> The way I envision this could work is if we define workflows based on
> labels. E.g.:
>
> 1. You label a message with "Accepted"
> 2. You run "b4 gmail apply Accepted" (or an agent process runs that)
> 3. We then try to:
>    - retrieve patch series using lore and your inbox as sources
>    - make an am-ready mbox
>    - apply to a branch provided in a mapping config
>      "e.g. Accepted->refs/heads/pending"
> 4. If "git am" fails on a series, we label the thread as
>    "Review-Required" and move to the next one
> 5. If it succeeds, we add the label "Applied"

That works for me. I have noticed that some people have this
two-step workflow of first tagging stuff (or moving it to some
folder I guess if they use e.g. mutt) and then as second step
do the application and tag stuff as applied and send out mails.

I usually prefer the more
direct "this one patch, apply it, resolved conflicts done" on a
one-by-one basis that's why I wanted it right in the UI.

But I suppose I can just tag one message at the time if I
insist :D

If there is a series I guess you just tag the 00/nn patch and
it picks the whole series?

Being able to just use gmail is really low threshold and can bring
new maintainers in and up to speed I think.

Yours,
Linus Walleij
