Received: from mail-qt1-f196.google.com (mail-qt1-f196.google.com [209.85.160.196])
 by mx.groups.io with SMTP id smtpd.web11.617.1586210026838108693
 for <tools@linux.kernel.org>;
 Mon, 06 Apr 2020 14:53:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=LJh/gz6g;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.160.196, mailfrom: konstantin@linuxfoundation.org)
Received: by mail-qt1-f196.google.com with SMTP id c14so1187073qtp.0
        for <tools@linux.kernel.org>; Mon, 06 Apr 2020 14:53:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=j0vRV2nbqnTzroFvJ6qXivGqKk5g3xfBNcce6wCHoBM=;
        b=LJh/gz6gmnqXlfmrqzeHAyZ3KXGZrhLPuTaqGT5gfltCVpt1TuunnvLP2W4bSIpyOa
         jqdWQWr0OKvq5PduEp4DO62Vz4Er5VIbP4SLoizSJHZExpnlm+Fom5WgjIejTlVPNd+v
         /RXkgCKGhRKfQ4OgLveCqoz0DOAP/HHr5quP4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=j0vRV2nbqnTzroFvJ6qXivGqKk5g3xfBNcce6wCHoBM=;
        b=bjkG3uLwRVEiH4sGb7cg7VzOlGWRQRF2iwgqtziEaPfXGXJnFmo8+FU3/p3zzhnNVX
         YKxvFhc7puj0uwfJPLcxxtcbpLBTPFE7KAai1PGN+Piw5XoDH79aDWfxNxS+ViHf93xN
         71rnvlnSLhyDP0k68M0V98IXUY3ua4vJQvHe0aU2T5y9wZCstAtLBIvgp4BjXVpDX/4m
         W5gxLg/7/BAmMMm0hr5M5HBbv/bD/H1dXLtKe5uFe8qj7TzLAR9SQKiXNq/kpjdnjkg0
         vhuajfJN/Bkz/I4SeS8hQWI4oaTPjV7JSXKKws8I1OkwOwimZliU03eb/sgqN+QRG/mS
         dA0Q==
X-Gm-Message-State: AGi0PuZc16ACDwzv6zbxwoxLgsRxbq/cklMgBZavl8Z9txfUNkni9SDd
	WvIMK6RD2bx5OFesXp5UTJARPc5wpm+780XKmTqwNQ==
X-Google-Smtp-Source: APiQypJxH//FBeoAoP+LgNjTAkuK45F3bCCnT5nMiuIfJIQtsY5jdrZqsFssbVQ9NB/2vYOxnRvzXrXJugt7pyMdimc=
X-Received: by 2002:ac8:480d:: with SMTP id g13mr1751075qtq.29.1586210025954;
 Mon, 06 Apr 2020 14:53:45 -0700 (PDT)
MIME-Version: 1.0
References: <20200323222041.uzfcexg2wy74jqdd@chatter.i7.local>
 <CAL_JsqLJkDx3HQEN-0ih0Jp4i2h7xKYrsfqAiYcW_hV-9GtLKA@mail.gmail.com>
 <CAL_JsqKBskO3oyEP0g9nTyWL4V614w21Hwigs5YpFpgLnUVktg@mail.gmail.com>
 <15FFE6D3B979AF4C.32445@linux.kernel.org> <20200326163225.qkitq6dkmqj2fw5l@chatter.i7.local>
 <CAHmME9oP4epS5UvrrnvLDcSEZAHXgrrGHkbZ7ddryKO56KFosg@mail.gmail.com>
In-Reply-To: <CAHmME9oP4epS5UvrrnvLDcSEZAHXgrrGHkbZ7ddryKO56KFosg@mail.gmail.com>
From: "Konstantin Ryabitsev" <konstantin@linuxfoundation.org>
Date: Mon, 6 Apr 2020 17:53:34 -0400
Message-ID: <CAMwyc-RNCoq_kZMeczKiajK3vg-Gs2rbCu8M=qorXTLOKbecmg@mail.gmail.com>
Subject: Re: [kernel.org users] b4 v0.3.4 released
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
Cc: Rob Herring <robh@kernel.org>, users@linux.kernel.org, tools@linux.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Thu, 26 Mar 2020 at 16:18, Jason A. Donenfeld <Jason@zx2c4.com> wrote:
>
> Looks like the auto project detection has issues:
>
> zx2c4@thinkpad ~/Projects/linux $ b4 am -c
> 20200326080104.27286-16-masahiroy@kernel.org
> Looking up https://lore.kernel.org/r/20200326080104.27286-16-masahiroy@kernel.org
> Grabbing thread from lore.kernel.org
> Reduced thread to strict matches only (12->11)
> Checking for newer revisions on https://lore.kernel.org/linux-crypto/
> Analyzing 11 messages in the thread
> ---
> Writing ./v2_20200326_masahiroy_x86_crypto_remove_always_defined_config_as__and_cosolidate_kconfig_makefiles.mbx
>  ERROR: missing [1/16]!

The latest master is able to backfill missing patches from other
lore.kernel.org lists, so this should significantly improve this
particular problem. Now, if a patch is missing from the thread,
there's a good chance that it's missing from lore.kernel.org entirely.

I hope to release v0.4.0 some time in the next week or so, but if you
can't wait, you can always run it straight from the checkout.

Regards,
-K
