Received: from mail-qk1-f174.google.com (mail-qk1-f174.google.com [209.85.222.174])
 by mx.groups.io with SMTP id smtpd.web11.1053.1588189666697213616
 for <tools@linux.kernel.org>;
 Wed, 29 Apr 2020 12:47:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=Q1e6QGCp;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.222.174, mailfrom: konstantin@linuxfoundation.org)
Received: by mail-qk1-f174.google.com with SMTP id s63so3343460qke.4
        for <tools@linux.kernel.org>; Wed, 29 Apr 2020 12:47:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=CuRBGksnI+O6JVgH/MBwvJ0p19qogYEI+NCdWt4ElZQ=;
        b=Q1e6QGCpXJVverOIz/kCtBqM2YI3qvlq703calL5el9Pvo3UXfTjkKFErAFj02900F
         OR1CXGNm5qYW6+40QnvoVSq0APsLvm/86oy09fQXpmNx11GdzeHSGqY/qQxxrrDKL4lK
         6TCAD1bL9vUYt1sMJ0FYdU0ULNYae+Hg+bVDU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=CuRBGksnI+O6JVgH/MBwvJ0p19qogYEI+NCdWt4ElZQ=;
        b=UCvz1fFb3r601WiOFix/+wEul4EgfY5Lw+nHwvz6S8BGxseIbH2y6Udc2KxPw6/P7+
         419lxj+NiMw8d4ND9gbXFG3+YeS7dCfiQWEUwlpFWnyYAtzreyWWpWVUpPK75PmiOMn8
         hVb3Wx5+a3hsbd4Zsbru/XwsKiTL2HawXZN+GVp3WexZhqlafsI8wADoAZUQSIF9ULl8
         /75iCpmUmYgev8M2FFAAwUJAERQX0wiMliagQ4Zs3ElkrRmqSUiZ2JIxMGgeXC2FkGVD
         6x2ELQytsYsDbI+8sqwn6Jm3tpvX3W9/n2uDMsbEudCwZ3GlQB894oKIVRLWMuXjx+tr
         VgaQ==
X-Gm-Message-State: AGi0PubfFzfQe6sHfHWBrlTYpUZPIh2uxGNRMo5i6L9XBQ89QyfvYF2U
	d38wtCB6YVqST0hSlGQIYR9IbR3Aa5G1CWLH85FU+/+r
X-Google-Smtp-Source: APiQypJne8Hb3fcP9rt/GQSey5VKDifgne4wqFFHs3wCJ9bY23y/fWs3WIoTgXjqobLlAYt6oB+zckCXsWsNVpow2P0=
X-Received: by 2002:a37:9d3:: with SMTP id 202mr40343qkj.401.1588189664119;
 Wed, 29 Apr 2020 12:47:44 -0700 (PDT)
MIME-Version: 1.0
References: <20200428192938.aue3v6kxsm47day5@chatter.i7.local> <87sggnexjq.fsf@mpe.ellerman.id.au>
In-Reply-To: <87sggnexjq.fsf@mpe.ellerman.id.au>
From: "Konstantin Ryabitsev" <konstantin@linuxfoundation.org>
Date: Wed, 29 Apr 2020 15:47:32 -0400
Message-ID: <CAMwyc-RaUhw9q9baKKPMLWSWsnQ+e1=+u2yC1Fi2KCGqfTgCtg@mail.gmail.com>
Subject: Re: [tools] [kernel.org users] What is a useful way to show changes between series?
To: tools@linux.kernel.org
Cc: users@linux.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Wed, 29 Apr 2020 at 00:16, Michael Ellerman <mpe@ellerman.id.au> wrote:
> There will be cases where the diff of the whole series is going to be
> too big and/or busy. So having a way to drill down would be awesome.
>
> The easiest to implement would be limiting it to a single file, which
> would be useful in some cases.

With Jason's help, I think I have a good idea how we can do this. It's
not infallible, but it moves most of the logic to git-range-diff,
which is how I prefer it anyway. I'll try to figure out how to limit
this to a subpath and if I can do it without it potentially causing
more confusion, then I'll try to implement it.

> Harder to implement but possibly more useful would be showing the diff
> between the two series up to some point, so eg. show me the changes
> between the series but only patches 1-5.

Well, the upside of using git-range-diff for the actual comparison is
that it makes it very easy to locate the commits that you're
interested in.

Let me try to put together something that folks can try out and then
we can work iteratively from there.

Thanks for everyone's input.

-K
