Received: from mail-ua1-f42.google.com (mail-ua1-f42.google.com [209.85.222.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CD0470;
	Thu, 27 May 2021 07:56:38 +0000 (UTC)
Received: by mail-ua1-f42.google.com with SMTP id f20so2319738uax.6;
        Thu, 27 May 2021 00:56:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=FkZFpWElzyckGQkvVgTz5Fyyphx+xQ48ba3cRPmLKD4=;
        b=tAkYSfnKbtGuP6aDcThJmCEsz7JNLW0/FGYydXfqlGH0Vcf0jRx7YAR+E8ViZpiLsE
         9ugI57JEmKVI2xYATQotBf9WwFvDfHVeoX575RaV0KXO0Z4nZPu0VH9/RUbf9NKRo1Py
         ZH6EvLMyQ47233zr3i7uyYNbmPLBMp2E58HPKaP21vu2jhcGCc9ILQLtTPLHDmzLeoyK
         Q/xcwqObue/m7ccsQ0fNUc73YfK7nvwOnsMuzg1zLvBSFFU+x/9qEO98d++09se6wWes
         4Y88lQNMvMJtjX+x5DK1bMOYY8CCqbF4X68UyqHMbngLp5+uVW/lIEMSYExNbgfCEpHv
         jkFw==
X-Gm-Message-State: AOAM53372LEQr0EImiUqyPdn7I2OjlrnY9XoSIJOegtRSrCB2RAYEYmT
	hva+2VhRPAUni24iFKUy0wR0a6esj0g42D8qo58=
X-Google-Smtp-Source: ABdhPJzFup4lzJ4/gfyXqhFZn8XlvFElFUxt14PcVWgkZ8rO+UPcPhMxisF25OkFQW9qX2ZlTSmGCrZk2bgv2BfuWA8=
X-Received: by 2002:ab0:3d1:: with SMTP id 75mr241894uau.106.1622102197457;
 Thu, 27 May 2021 00:56:37 -0700 (PDT)
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
References: <20210526192558.pex7tuorwqvkzxe3@nitro.local>
In-Reply-To: <20210526192558.pex7tuorwqvkzxe3@nitro.local>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 27 May 2021 09:56:25 +0200
Message-ID: <CAMuHMdU5vyhHOZ7x-3d0uQqD9kSLBztaKBt9yq+pNGTmATHxCQ@mail.gmail.com>
Subject: Re: b4 v0.7.0 is available
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc: tools@linux.kernel.org, users@linux.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Konstantin,

Thanks for the new release!

On Wed, May 26, 2021 at 9:26 PM Konstantin Ryabitsev
<konstantin@linuxfoundation.org> wrote:
> - b4 am will warn when it finds a message in the thread with an
>   "Obsoleted-by:" follow-up trailer. Running "git am -c" will automatically

"b4 am -c"?

>   retrieve the linked revision, so contributors can now follow-up to the
>   obsoleted revisions by sending a follow-up reply with:
>   Obsoleted-by: https://lore.kernel.org/r/new-revision-msgid

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
