Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by mx.groups.io with SMTP id smtpd.web11.2004.1589310472171578311
 for <tools@linux.kernel.org>;
 Tue, 12 May 2020 12:07:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kernel.org header.s=default header.b=O5+/RvQA;
 spf=pass (domain: kernel.org, ip: 198.145.29.99, mailfrom: robh@kernel.org)
Received: from mail-oi1-f179.google.com (mail-oi1-f179.google.com [209.85.167.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPSA id 930AA206A5;
	Tue, 12 May 2020 19:07:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1589310471;
	bh=IyF4wilAL9ywX8M+HZ1DjEfK50DTmlOkEoPNrzyBl2E=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=O5+/RvQA4gjLt4vj/hiZcwWOSNWxmIcV1vZlw2KYPZ8zVPzY2UJF13LoBKnV4ldcU
	 ohOh3FyWkpG8NwWDFh+aKoDaO9O9zx5qejWDK3YwfR6CIpVPZ13OoK3iGP93hPGY/U
	 SIdMX673CNScDr7hPXUK/hz9xSEYhXvO8plET+/k=
Received: by mail-oi1-f179.google.com with SMTP id v128so2387573oia.7;
        Tue, 12 May 2020 12:07:51 -0700 (PDT)
X-Gm-Message-State: AGi0PuakyUHj+CR77x2SSH7jlEuXNbB298bNIxNA5gWoVlQvwYJ2ImDu
	q1ySODR0zPPWA45xCZ2KzP7xDvWOMNALjf4IXQ==
X-Google-Smtp-Source: APiQypKkeR69xgAt4qOkbkBuL0X19PnfAj8KUmdY3rOyj+BfwiUK4yDUq73N+tXbXCLV0b8o6KeGcWVObJ2lIWrBwGs=
X-Received: by 2002:aca:1904:: with SMTP id l4mr24999916oii.106.1589310470873;
 Tue, 12 May 2020 12:07:50 -0700 (PDT)
MIME-Version: 1.0
References: <20200424170442.ad3b3j5f5vkbcmvb@chatter.i7.local>
 <CAL_JsqK+FyXZZ3uAcAsVFLYoxjzj_fpMLF=DFe3M2Byi9Fd6Xw@mail.gmail.com> <20200507202001.3sststasmemmgr5z@chatter.i7.local>
In-Reply-To: <20200507202001.3sststasmemmgr5z@chatter.i7.local>
From: "Rob Herring" <robh@kernel.org>
Date: Tue, 12 May 2020 14:07:39 -0500
X-Gmail-Original-Message-ID: <CAL_JsqLoekwTz3QWOCS+iY8ALvc9nhmNjjV+12A=_+gHmdbn0Q@mail.gmail.com>
Message-ID: <CAL_JsqLoekwTz3QWOCS+iY8ALvc9nhmNjjV+12A=_+gHmdbn0Q@mail.gmail.com>
Subject: Re: [kernel.org users] b4 v0.4.0 available with new features
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc: users@linux.kernel.org, tools@linux.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Thu, May 7, 2020 at 3:20 PM Konstantin Ryabitsev
<konstantin@linuxfoundation.org> wrote:
>
> On Wed, May 06, 2020 at 02:23:16PM -0500, Rob Herring wrote:
> > I found a minor issue on patches with no 'To' header. They end up with
> > this:
> >
> > To: unlisted-recipients: no To-header on input <;
> >
> > However, that appears to be a public-inbox problem as it's on there
> > too. Here's an example[1].
>
> Interesting. I'm not seeing any strange output from that series. "b4 am"
> and "b4 ty" seem to be generating proper things.

Yes, 'b4 am' is correct, but 'b4 mbox' is not. That's with 0.4.2.

Rob
