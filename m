Received: from mail-ua1-f48.google.com (mail-ua1-f48.google.com [209.85.222.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D5EF2FAF;
	Thu,  9 Sep 2021 13:22:05 +0000 (UTC)
Received: by mail-ua1-f48.google.com with SMTP id t26so939657uao.12;
        Thu, 09 Sep 2021 06:22:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=RUhMSvTP5oqg2/2pGFD+/BT33jj7cCdgypKMDjaCQYc=;
        b=hKB2HUW2WD3DXCW2tfPr8Bm/V7CVyOV5sOZEAdnm9bkD3Ol4cNUT5OLDZtthurRobU
         DYYJf0Tmjgo/yInzSo5ZQOroE1PYYlPBFD3lvp7XrQmRUtPd+Ux3NT93BfopB1pRo/0f
         h/wGD7jTcgCIBk2FGS1J0OzViEY5l2KlOxEs3/MTwmjwZALxgcZt0jrgLGvoXNTzOw+v
         0ExgkrnM3DnPmwHsMiSZPbTRcvyCMyZlMDlb4IouO5eln6yLOn9NPteGq7m8ue3NqcnF
         stZKjqovjaNJg3o5Ac+lQHhWdN7xstp4PVd2jvCYIvfJokwBfo2eCeSIaZsTK7DuYQX8
         GqmA==
X-Gm-Message-State: AOAM533NjxYRjEsoekK7Fy9GHg5ysNgi3BdNC07SMvTl0gmCe6svmmUU
	HKhNQ4fQ6Zh0Ayzm9mGz1TzpVV1BI3Sy4c6U6F4/Sjhb
X-Google-Smtp-Source: ABdhPJzhyvOZIiE7xS20JfMmkx5xjusvdFe94HfGx4mPHnEgooMTf3JhnHyAd7zxegjvKGrfCR/cOKX8DX3P79qLxYA=
X-Received: by 2002:ab0:4d5b:: with SMTP id k27mr1448140uag.78.1631193724135;
 Thu, 09 Sep 2021 06:22:04 -0700 (PDT)
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
References: <20210830164626.tq5emfrht4o46x33@nitro.local> <398626.1631181532@warthog.procyon.org.uk>
 <20210909123150.fgo7vma4i32t36mg@meerkat.local>
In-Reply-To: <20210909123150.fgo7vma4i32t36mg@meerkat.local>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 9 Sep 2021 15:21:52 +0200
Message-ID: <CAMuHMdUufV8dNWuqwDa5oAt0k9KiJB06W7xLAR8=phWVWmp0wg@mail.gmail.com>
Subject: Re: lore.kernel.org upgrade: Sep 1, 2021
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc: David Howells <dhowells@redhat.com>, users@linux.kernel.org, tools@linux.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Konstantin,

On Thu, Sep 9, 2021 at 2:31 PM Konstantin Ryabitsev
<konstantin@linuxfoundation.org> wrote:
> On Thu, Sep 09, 2021 at 10:58:52AM +0100, David Howells wrote:
> > Would it be possible to get a search box on the front page into which you can
> > just drop a message ID and have it jump to the message, if present, kind of
> > like lore.kernel.org/r/<msg-id> does?
>
> You can make it even easier.

> In Chrome:
>
>     * Go to chrome://settings/searchEngines
>     * Click "Add" next to "Other search engines"
>     * Search engine: lore mid, Keyword: lore, URL: https://lore.kernel.org/%s -> Add
>
> Now you can type "lore <message-id>" in the toolbar.

Neat, thanks a lot!

And if you make it the default search engine, you can select "Show
original" in Gmail, select the Message-ID, and right-click to
search. No more copy-and-paste needed.

Unfortunately that means right-click to search for other topics doesn't
work anymore. Perhaps lore can redirect to Google if no results were
found? ;-)

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
