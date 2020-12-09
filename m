Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com [209.85.208.170])
 by mx.groups.io with SMTP id smtpd.web12.3512.1607501637421054662
 for <tools@linux.kernel.org>;
 Wed, 09 Dec 2020 00:13:57 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=NVlId9U9;
 spf=pass (domain: linaro.org, ip: 209.85.208.170, mailfrom: linus.walleij@linaro.org)
Received: by mail-lj1-f170.google.com with SMTP id y22so1188870ljn.9
        for <tools@linux.kernel.org>; Wed, 09 Dec 2020 00:13:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:from:date:message-id:subject:to:cc;
        bh=hrPMmtdsYPgl0/AMzRsJX5PdixQuqf++bvrOEWdP8bc=;
        b=NVlId9U9gB6lLxySd63F7adRidBv7nn/cUqclHvn4VQMW8ev9s4uj1bKbysWCIUJdb
         6J/dIlprBYabzkGC/ev+JdYpWCqz8qmm2mhkqoLUPDIoLJhKGsSGQwPE4UkGC10Kgrpp
         t329AdBREXMPUiitromdFw7qLIf74pz6bPqXdRUAEi9mMt/jQ1FKBo3gCKtbP+NitNON
         L4d1EQ+UVxPRE7vIOtwzD9FgtM5iWmtMQ9vIMnovYc4TvIchQyuHBDJjqppcR/5xzoBX
         JyJleNGxWED5rIXDEoAeTz7nosIMr5U80L2l1RNfXrLVIhRjE9ueBSEB7YFxz2Wf7Rex
         yQVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
        bh=hrPMmtdsYPgl0/AMzRsJX5PdixQuqf++bvrOEWdP8bc=;
        b=L2jUaNXzpzeccJumkyDRa3GnE4g1jfZ0Zsft+yRGT9qfp8bj68nanQsrkVeMO2kHwb
         UXRCOIsXOmjfRjXqhPd2CXTTiZBPbYJziaww5E5ZELEE1hsuk9bPLp3cHYU+FLiyFzYV
         ZfIAxjEoG394oeD+9YkRtnY6Wvxbk+C0MyNv/vE4ZVKY8YJlZHTGlBPiMD+HRW/WsBFJ
         rR51n398tuxw/yLDEPz8+fsvAosyioD4gK8/jtc4BYhe8QDxkAdHAntY8H7dK9kXcEqu
         7m5ZFENWeCUYLW46EA/FJbjgYLzl8LEgfn10u+k49Xye/TGEG6UbUdJp92xy/I9KXx7E
         znrQ==
X-Gm-Message-State: AOAM533TqIXWOzuDdZ1S4TldbB/QGwcRi2lJCpqCyJtfVk7pp0LV9Dqa
	2MRYY3E+/YwTj9SzEs8EuoGaRKSnJlAA6ZXeW3RTTQ==
X-Google-Smtp-Source: ABdhPJwT5TZy//BFh0/NaZBd6D7fEXS+pigoGp8Gp8D0obRd3b1Mb6SFFUKLxa5OdsEzOyCQZ00Ax7CBi+u9X6DN+pU=
X-Received: by 2002:a2e:85d1:: with SMTP id h17mr614092ljj.438.1607501635244;
 Wed, 09 Dec 2020 00:13:55 -0800 (PST)
MIME-Version: 1.0
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 9 Dec 2020 09:13:44 +0100
Message-ID: <CACRpkdZrth39GdKc0OFF9cDNHq2hBOXq1f-uU=TOOT8GaogoMQ@mail.gmail.com>
Subject: b4 strips BiugLink
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc: tools@linux.kernel.org, 
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"

Hi Konstantin,

I ran into this situation with b4, when trying to apply this patch:
https://lore.kernel.org/linux-gpio/CACRpkdY6gEi6pzuuFCdO_Lj1r23=HKCWF+N+QR-E7kWS8bBkjg@mail.gmail.com/T/#m4ed4e0b58f70c69a0105c73ae8ea7ce8a6f5e61d

The "BugLink" tag gets stripped.

Is this on purpose, like b4 strips all unknown tags?

It seems BugLink is important to Intel so we better allow it
in that case.

Thanks!
Linus Walleij
