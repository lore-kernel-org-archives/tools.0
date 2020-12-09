Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com [209.85.208.172])
 by mx.groups.io with SMTP id smtpd.web09.7462.1607524853108769726
 for <tools@linux.kernel.org>;
 Wed, 09 Dec 2020 06:40:53 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=Qmv9ynH+;
 spf=pass (domain: linaro.org, ip: 209.85.208.172, mailfrom: linus.walleij@linaro.org)
Received: by mail-lj1-f172.google.com with SMTP id b10so300621ljp.6
        for <tools@linux.kernel.org>; Wed, 09 Dec 2020 06:40:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=RN5r8JOjhYT1YawXNnCRhhPy2qwNP9cpoWSEYnI8WfI=;
        b=Qmv9ynH+r5X0n1TneFNRSVcQRThzQHN4DCNHvo1Sh6aI6pCqPG3OTNKKwtF3q+DDvt
         N7Yo8A0GuyJfWl3nrt2adcp6F6pZ1T6K5JDuNJ3DCXHqKaybDlWao0OlAFbOZac4Gpnw
         FYZKS4gxU2GU438aJPDYTZkt0yfNzkTVXrGji24Zc/jAnGW0HbYgeMO9l7XIBZfwhNu9
         H471ySk6YgVfdK1cgvOOXHSN/NpoQqr32kICV9WWuqNcSpl4ytBbidBuzgu7hDnynbQD
         SEpxxMMeV7kCfGwmTRNuisatTaj6aIAhbBVSoHrihCUCfPYX6KiVmI88leBEG1iv2G4e
         Wemw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=RN5r8JOjhYT1YawXNnCRhhPy2qwNP9cpoWSEYnI8WfI=;
        b=BI2J3hyrzXsR7CPfpcwBiz9STQZbZ1AAY1o5SRrJIuRu+cdXQXUrt3mEdIHXffiPQS
         q6wYLxpl5lAMNmC8CfoNJd5aT2qoUMHgK/3S6jHgDsfujM4h5u8zm62KXaX4+cVT7CrL
         WeZ+tVztz6mmhH2QGdPC+4v7yClM8Mdl+Yo/ujU5yyKIOQ/sQnPcP6x+R+Y0JN2j44zU
         1Xd8vbtj48qS9qXE/6L75s3OrG25lZe9NL8NxFD2Q+wu5nK3eMhWNd7lSDIox3/NfH+6
         xJuZLxY69W2fKHtLsvLMPioNt8tFQDbf0+1bXCP7rzehrvBRCRFZoYFeyZxcxJy5mGHv
         GE7g==
X-Gm-Message-State: AOAM532G7DEHDc0DSguh3NqgRV8wPsbgHhPVxZQn8Uv9sjAz3gK/pP+g
	hwojoCC7r+aAME+oaIxgLMxF8j5TvmSDoUJKbuFVFw==
X-Google-Smtp-Source: ABdhPJyalxfIJyqlvH7Ieh98zW5w8Eaasdex2itKVUxm+bNx+KzNifVuEbvYoKirL8xQx1AL73Z7ey4hlVurgLTnl3s=
X-Received: by 2002:a2e:910f:: with SMTP id m15mr1154795ljg.467.1607524851211;
 Wed, 09 Dec 2020 06:40:51 -0800 (PST)
MIME-Version: 1.0
References: <CACRpkdZrth39GdKc0OFF9cDNHq2hBOXq1f-uU=TOOT8GaogoMQ@mail.gmail.com>
 <20201209131924.bai7b4tj2wb7sbon@chatter.i7.local>
In-Reply-To: <20201209131924.bai7b4tj2wb7sbon@chatter.i7.local>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 9 Dec 2020 15:40:40 +0100
Message-ID: <CACRpkdYA9T9msayNQrd5X+oXnr5_MtGQTEmUkpsAF+LALEdt8w@mail.gmail.com>
Subject: Re: b4 strips BiugLink
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc: tools@linux.kernel.org, 
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"

On Wed, Dec 9, 2020 at 2:19 PM Konstantin Ryabitsev
<konstantin@linuxfoundation.org> wrote:

> Okay, there is a fix in master and stable-0.6.y that adds BugLink to the
> list.

Wow that's quick!

Thanks a lot Konstantin!

Yours,
Linus Walleij
