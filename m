Received: from mail-il1-f180.google.com (mail-il1-f180.google.com [209.85.166.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 016EE15480;
	Tue,  2 Jan 2024 17:03:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-il1-f180.google.com with SMTP id e9e14a558f8ab-35fff16827fso29734975ab.0;
        Tue, 02 Jan 2024 09:03:58 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704215038; x=1704819838;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JATB9fRg85ov+8VyY8ZeVlMowKMLU1n+9IXIgh9+78c=;
        b=Eix8H+aaxFAK8t9eDNXx9956BcmH4Sr50r4ziatAmunkwSx/cDWo6vn/fTPKMc0SgT
         vauNrFEkqBqi/l9R/c6TVjlUj+CyN5a/RNKpOAGzqMsQPEVFAkAXU5LKYcIKiUiEZKU4
         te6hk2P0rpsuwLRJgbtYXdPFe2xd7nwu+extcbnUv+iK53DlZkqfnjNxG7WzTz3nhyp4
         ZYjKtReE1o7dZWU285/ZaSPgpUK7O1dckTsqn3iI8Mg+LBP7adJvk5giy/hku7R2ScOA
         2YcpyIh/ORZRd9k9AXeR+UnKAo1r6h2GeQj7AMxbQUt+K95o85bm/14k/kK4XeS4OA2a
         9O6Q==
X-Gm-Message-State: AOJu0YwHwJwiPtf5ObqzgfLoBKRM1xIY8OVWUnbeVDWipxIcxsFhxTEA
	B1hAsvSv4ms4Mw94+4SLAIA/8qItOC0qNw==
X-Google-Smtp-Source: AGHT+IF2CutHvMAvCiNYRh4GEoSCxW/qpDL7eo0aPaBsmdn5JNrPH7B/8X0MyWDgtrUi2n0HIX2fAA==
X-Received: by 2002:a05:6e02:1a69:b0:35f:f819:b282 with SMTP id w9-20020a056e021a6900b0035ff819b282mr12981317ilv.64.1704215037758;
        Tue, 02 Jan 2024 09:03:57 -0800 (PST)
Received: from mail-yw1-f182.google.com (mail-yw1-f182.google.com. [209.85.128.182])
        by smtp.gmail.com with ESMTPSA id q133-20020a815c8b000000b005e4e79d4921sm12235288ywb.94.2024.01.02.09.03.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 02 Jan 2024 09:03:57 -0800 (PST)
Received: by mail-yw1-f182.google.com with SMTP id 00721157ae682-5e840338607so58506537b3.2;
        Tue, 02 Jan 2024 09:03:57 -0800 (PST)
X-Received: by 2002:a81:4a54:0:b0:5e8:7c7a:55d5 with SMTP id
 x81-20020a814a54000000b005e87c7a55d5mr7865139ywa.18.1704215037109; Tue, 02
 Jan 2024 09:03:57 -0800 (PST)
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
References: <CAMuHMdVGqTM08DvsAjZ45wn1HTR0Grh8Ewj9q21pPwJmbok5hw@mail.gmail.com>
 <CAMuHMdVhyjjcyxMAGF8rAqmyqin=xjWH0fhhOjqbq7rH4f-RNw@mail.gmail.com>
 <20240102-axiomatic-gabby-whale-48d3bb@lemur> <CAMuHMdVtCfkLCb=d59XDELJO53jXJmo03iLcCwvMq54BFiUpFA@mail.gmail.com>
 <20240102-calculating-purple-dogfish-f4408c@lemur>
In-Reply-To: <20240102-calculating-purple-dogfish-f4408c@lemur>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 2 Jan 2024 18:03:44 +0100
X-Gmail-Original-Message-ID: <CAMuHMdW7+ENssXG4aim-Oa0T1pH-i5-YhVB9C+JaFoJjzuQK4g@mail.gmail.com>
Message-ID: <CAMuHMdW7+ENssXG4aim-Oa0T1pH-i5-YhVB9C+JaFoJjzuQK4g@mail.gmail.com>
Subject: Re: Re: Re: b4 modifying Cc-tags
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc: users <users@linux.kernel.org>, tools@linux.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Konstantin,

On Tue, Jan 2, 2024 at 4:59=E2=80=AFPM Konstantin Ryabitsev
<konstantin@linuxfoundation.org> wrote:
> On Tue, Jan 02, 2024 at 04:29:41PM +0100, Geert Uytterhoeven wrote:
> > > The main problem is that your From: is @linux-m68k.org, but you send =
from
> > > Gmail. I'm afraid there isn't much I can do to tweak things on our en=
d -- even
> > > if we make exceptions for your address on our end, your emails will s=
till
> > > likely be rejected or sent to spam when we try to deliver them.
> > >
> > > This really should be fixed on the linux-m68k.org side of things.
> >
> > What is the problem with this?
> > This is working fine with the vger.kernel.org mailing lists, and picked=
 up
> > by lore.  Only some (not all?) of my emails to {users,tools}@linux.kern=
el.org
> > seem to be rejected?
>
> When a domain is missing DKIM/SPF records, like linux-m68k.org, a lot of
> providers assign them a high "spamminess" value. When such messages are s=
ent
> via gmail.com or some other large provider, this additionally raises
> suspicions, because this is a common spammer tactic (pick a domain withou=
t
> DMARC settings and then use it to forge the From address).
>
> For example, on our end your message triggered the following spamassassin
> rules:
>
> FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS
>
> By itself, this is not usually enough to trigger the spam refusal, but th=
is
> does mean that if there's anything else spamassassin doesn't like about y=
our
> message, it's likely to be refused. In your particular case, that trigger=
 was
> BAYES_50 -- amusingly, probably because of the word "enlarged". :)

Doh, that's GregKH's fault ;-)

> We do have a bunch of other custom rules that usually lower the score on
> patches and common code-review trailers, which is why most of the time yo=
ur
> messages will be accepted by the list server, but it didn't help in this
> particular case.
>
> Overall, I would suggest that whoever is responsible for linux-m68k.org s=
ets
> up all the bits required by the modern email delivery stack (DKIM, SPF,
> DMARC).

That would be me (partially ;-)

Looking at linux-foundation.org, I guess that means adding a TXT
record with

    "v=3Dspf1 include:_spf.kernel.org include:_spf.google.com ~all"

+ whatever outgoing servers the users of linux-m68k.org are using?

Although the latter may not be strictly required?
Or are Greg KH and Andrew Morton not using fastmail.com for sending
email, only for receiving?

Thanks!

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds
