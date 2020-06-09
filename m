Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by mx.groups.io with SMTP id smtpd.web10.333.1591741482421641345
 for <tools@linux.kernel.org>;
 Tue, 09 Jun 2020 15:24:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kernel.org header.s=default header.b=w5nI39bS;
 spf=pass (domain: kernel.org, ip: 198.145.29.99, mailfrom: robh@kernel.org)
Received: from mail-oi1-f180.google.com (mail-oi1-f180.google.com [209.85.167.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPSA id CF00F2072F;
	Tue,  9 Jun 2020 22:24:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1591741481;
	bh=rYw6+BGRchCCopRuUMntEaJ66C4MyePH5XRq1/7Mio0=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=w5nI39bSF13o2zZ3uLhDPFjsSsHoJ0YqELZOykDUHhzIuLdiI9ouYne3U2zWPbtJz
	 Fu7/90m7HjB2Db14seaYthLCc8InnKtE+Zgb9Z4mZkfrWPbVdu1rIbLF76p18+b0Mb
	 +xre2bXcvamkVnq0rQm6m/WWnw+tT5TI58hksIcc=
Received: by mail-oi1-f180.google.com with SMTP id t25so241801oij.7;
        Tue, 09 Jun 2020 15:24:41 -0700 (PDT)
X-Gm-Message-State: AOAM533UzWdkM5NlYuDsJZfCSxmnVg4vAyJBa8lgqPbr68BBH6oE+uDN
	JtuWusFAT/jqcokMRpFV0q3lyY/p3L3uLNznGQ==
X-Google-Smtp-Source: ABdhPJxXKIVzXE6V+JfMhWwmXxCVMXyunx/ALKHEl9j2Ocy+Cb83ZCzY25S/0gyv2Pyb5KQ+Xv0yV46s1qsNnc0RS1c=
X-Received: by 2002:aca:d454:: with SMTP id l81mr394009oig.152.1591741481271;
 Tue, 09 Jun 2020 15:24:41 -0700 (PDT)
MIME-Version: 1.0
References: <20200424170442.ad3b3j5f5vkbcmvb@chatter.i7.local>
 <CAL_JsqK+FyXZZ3uAcAsVFLYoxjzj_fpMLF=DFe3M2Byi9Fd6Xw@mail.gmail.com>
 <20200507202001.3sststasmemmgr5z@chatter.i7.local> <CAL_JsqLoekwTz3QWOCS+iY8ALvc9nhmNjjV+12A=_+gHmdbn0Q@mail.gmail.com>
In-Reply-To: <CAL_JsqLoekwTz3QWOCS+iY8ALvc9nhmNjjV+12A=_+gHmdbn0Q@mail.gmail.com>
From: "Rob Herring" <robh@kernel.org>
Date: Tue, 9 Jun 2020 16:24:29 -0600
X-Gmail-Original-Message-ID: <CAL_Jsq+8Ey7CHMObBNTd-EVSkNRca+DrWSABMgEctJjq-BsOGA@mail.gmail.com>
Message-ID: <CAL_Jsq+8Ey7CHMObBNTd-EVSkNRca+DrWSABMgEctJjq-BsOGA@mail.gmail.com>
Subject: Re: [kernel.org users] b4 v0.4.0 available with new features
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc: users@linux.kernel.org, tools@linux.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Tue, May 12, 2020 at 1:07 PM Rob Herring <robh@kernel.org> wrote:
>
> On Thu, May 7, 2020 at 3:20 PM Konstantin Ryabitsev
> <konstantin@linuxfoundation.org> wrote:
> >
> > On Wed, May 06, 2020 at 02:23:16PM -0500, Rob Herring wrote:
> > > I found a minor issue on patches with no 'To' header. They end up with
> > > this:
> > >
> > > To: unlisted-recipients: no To-header on input <;
> > >
> > > However, that appears to be a public-inbox problem as it's on there
> > > too. Here's an example[1].
> >
> > Interesting. I'm not seeing any strange output from that series. "b4 am"
> > and "b4 ty" seem to be generating proper things.
>
> Yes, 'b4 am' is correct, but 'b4 mbox' is not. That's with 0.4.2.

This is still an issue for me. I'm on current master, commit
ca902b59c3d1 ("Fix mbox naming inconsistencies").

Rob
