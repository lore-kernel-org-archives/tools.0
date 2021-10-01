Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 115092FB3
	for <tools@linux.kernel.org>; Fri,  1 Oct 2021 18:47:32 +0000 (UTC)
Received: by mail-lf1-f52.google.com with SMTP id m3so41808468lfu.2
        for <tools@linux.kernel.org>; Fri, 01 Oct 2021 11:47:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=F9uZy2zzImSIeiIPo8is3fkP+XlDLbnTpMTPqGjuBMo=;
        b=RySRUcED32vLZfRdmeP4b7Z7m2eRJRy15uA6ywBn/pjB+uhid2vGCIDqakw3ScfaCm
         580ADtbQXXI/v3EsGz9VofZtmTSwc0Y0xYhLTqL8MPsyTgxetRjY5kYnFlO19UAitiHQ
         Em1i+M9xkDrVfoZM2yJ5jZLD7NWmpYDwoksMs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=F9uZy2zzImSIeiIPo8is3fkP+XlDLbnTpMTPqGjuBMo=;
        b=PARw2BREffaKhWhEF5rBjvBii5WDuEaZS0rj0C9C2mQjxOdn61NNJTjFLzsnlBycu9
         HtOsY4ZWHBhbWkxkzkjVOjki/6WnGcS4FcEj9Lpo0E0P3jmVvd6uOoV7BKANpOC+59HO
         qnz3WSIfy5GdR6pp1Eg096c3dSOWcg4GsxcX7vO21DhmU5FgLGSJVmmJSdkVg1Xr/mb4
         8LNyiKMZSJFjpomfpCiCtbzKawWGHt0rvS+jVCia7PCn5SNR1vOG+683LqTOI8Cxm3Wi
         cN8QGnooHX+SB9YuDoGsXa4e/x4zM/1B5GI0amVlmFWjRLEI5fmtJRov/orc32BnyMff
         KI9A==
X-Gm-Message-State: AOAM533HOovJhKg7Q2R8dYq0nKDHpJIA6kC/0Gx90aoPGdHbXX4GDD3z
	lggsn7jCl2e0NYtpVcjauNorflJTz8El+2HNVkc=
X-Google-Smtp-Source: ABdhPJyf999Xn9BuOy67nzABxs/VxK7aRdLXHtaBdXgOZf/DQb9KKESEahWOoTuNDL5jwOZfCFjhLg==
X-Received: by 2002:a2e:8953:: with SMTP id b19mr13009600ljk.335.1633114049580;
        Fri, 01 Oct 2021 11:47:29 -0700 (PDT)
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com. [209.85.167.45])
        by smtp.gmail.com with ESMTPSA id i26sm812977lfl.288.2021.10.01.11.47.28
        for <tools@linux.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 01 Oct 2021 11:47:28 -0700 (PDT)
Received: by mail-lf1-f45.google.com with SMTP id x27so42368940lfu.5
        for <tools@linux.kernel.org>; Fri, 01 Oct 2021 11:47:28 -0700 (PDT)
X-Received: by 2002:a05:651c:1250:: with SMTP id h16mr14161981ljh.68.1633114048434;
 Fri, 01 Oct 2021 11:47:28 -0700 (PDT)
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
References: <202109301023.B78ABE54B@keescook> <20210930200002.67vxbowvegso2zhg@meerkat.local>
 <202109301559.A9BFB03@keescook> <20211001182615.bcyuag7vfrkzhefj@meerkat.local>
In-Reply-To: <20211001182615.bcyuag7vfrkzhefj@meerkat.local>
From: Linus Torvalds <torvalds@linuxfoundation.org>
Date: Fri, 1 Oct 2021 11:47:12 -0700
X-Gmail-Original-Message-ID: <CAHk-=whZMDmgs3+djfUoVrx8jj7DwGOJvLWC=vw1dCMicqHJ1g@mail.gmail.com>
Message-ID: <CAHk-=whZMDmgs3+djfUoVrx8jj7DwGOJvLWC=vw1dCMicqHJ1g@mail.gmail.com>
Subject: Re: merging pull requests
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc: Kees Cook <keescook@chromium.org>, tools@linux.kernel.org, users@linux.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Fri, Oct 1, 2021 at 11:26 AM Konstantin Ryabitsev
<konstantin@linuxfoundation.org> wrote:
>
> I think Linus just manually adds "(patches from Andrew)" to that.

I always manually edit my merge messages fairly extensively.

And I would very much discourage anybody from thinking that a merge
commit could be auto-generated. Don't do it. If you do it, you're
doing things wrong.

Merge messages need to be meaningful, and no amount of auto-generation
will ever make them so.

Even when people use signed tags with all the merge message in them to
send me pull requests, I will edit things so that at a minimum there's
proper indentation for me quoting the data, but also to try to make
merges look somewhat consistent (different people use very different
formats for listing changes).

I'll spend time making my merge messages look more legible, including
fixing spelling and grammar for people, and sometimes going to look at
the individual commits themselves if there is some explanation that
doesn't make sense to me.

Yeah, some trivial pull requests with a couple of simple changes,
maybe the auto-generated shortlog feature ends up being sufficient.
but honestly, that's _very_ rare. And sometimes the message might be
just "Small x86 fixes" like in the recent kvm pull I did.

But if the pull has anything even remotely more subtle, I will
complain to whoever sent me the pull request if they didn't give me
enough information.

And honestly, when _I_ merge stuff, I generally will need to explain
things _less_ than most other people, for one very simple and
fundamental reason: my tree is simply the known upstream tree. So me
merging some networking pull should explain _what_ I merge, but at the
same time, I don't really need to explain why it is _I_ that am
merging it.

When you see me merging networking code into my tree, a simple "Merge
networking fixes from David/Jakub" is already enough information.
There's no question about "why is Linus merging from the networking
maintainers".

So then I get very upset when I see other people merge stuff, and they
have NO explanations at all.

If you aren't the upstream maintainer for whatever you are merging,
you should not only explain *what* you are merging, you should explain
*why* you are merging it.

So put simply: I put a fair amount of effort into making my merge
messages be meaningful.

Anybody else who does merges should do at LEAST the same, and in
situations where you're merging something that you aren't the obvious
maintainer for (like doing back-merges of my tree), you should in fact
put a lot *more* effort into it.

End result: Please don't make some crazy "b4 shazam" tool that handles
pull requests and then makes it trivial for people to do automated
merges too. That's absolutely the last thing we want to see.

Merges need *more* explanation than regular commits. The "why" is
often very important for a merge, even if you'll sendom see it in my
merges where the "why" is kind of implicit.

Don't try to do something that avoids that very important manual
editing step to explain what is going on.

I've said it many times before, and I'll sadly probably have to say it
many times again: if you can't be bothered to write a good merge
message, you shouldn't be doing the merge.

It really is that simple.

No automated merges outside of pure test-trees (ie where the merges
will never be seen by anybody else), because they fundamentally
violate that very basic rule.

             Linus
