Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB9CF199A9;
	Wed,  3 Jan 2024 12:26:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-50e7c76897dso7321294e87.2;
        Wed, 03 Jan 2024 04:26:22 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704284779; x=1704889579;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zPff8hATEg6motGviyt91GjgUFMTXtwXzBN/UhREhAU=;
        b=mrjomZP1u+hmqJJREeyiU6yM9hg1cTyCVqy9dUwdF4MOJqRZHr3vQekWxH2tYFtY0r
         XznJSHn3WWn0jfzoIv33bIXbIXA8Uy/FWA5Db0qpcmI/HlifCsfd7cDh/UwHT6gLcT5R
         nXjTMNOYVPoXSefw+ZzXJx0Td3juV5fW9E0xy1sK2f09ptFZolks49h/PnffDJOy+kph
         676kp+mpo4z1MAirDCChoL7vC+fFehbWHbQUZfopFfdMjz3o75gN5RBEWPusFqFlmbpu
         iM2vcR2NZWMn2EvSUIleMewgwRwiOd3N58EPZ5/642MK26Y/zRCwRy7yDHi7toW252X7
         LhBA==
X-Gm-Message-State: AOJu0YwfkQErJtQ2g6y95m7Yb98gBe8stlAhZHH3XctLA4SQ7BeLuuvv
	OMm2VUP901gq/y8wAGKkKl6Q3qoqtNI31gVu
X-Google-Smtp-Source: AGHT+IH3cm2p7jSlvbeO5JahMPIPUa5yxaJ5ku+g5QbHQAoUMAeXTg8UqC9z8iPVeNWeK7BYQKB6Lg==
X-Received: by 2002:a05:6512:6d0:b0:50e:7dfe:fe86 with SMTP id u16-20020a05651206d000b0050e7dfefe86mr3180581lff.271.1704284779015;
        Wed, 03 Jan 2024 04:26:19 -0800 (PST)
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com. [209.85.167.48])
        by smtp.gmail.com with ESMTPSA id f12-20020a05651232cc00b0050e7a956cf0sm2958726lfg.236.2024.01.03.04.26.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 03 Jan 2024 04:26:18 -0800 (PST)
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-50e7e6283bdso7159485e87.1;
        Wed, 03 Jan 2024 04:26:18 -0800 (PST)
X-Received: by 2002:a05:6512:39d1:b0:50e:9872:ae83 with SMTP id
 k17-20020a05651239d100b0050e9872ae83mr1250171lfu.12.1704284778107; Wed, 03
 Jan 2024 04:26:18 -0800 (PST)
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
References: <CAMuHMdVGqTM08DvsAjZ45wn1HTR0Grh8Ewj9q21pPwJmbok5hw@mail.gmail.com>
 <CAMuHMdVhyjjcyxMAGF8rAqmyqin=xjWH0fhhOjqbq7rH4f-RNw@mail.gmail.com>
 <20240102-axiomatic-gabby-whale-48d3bb@lemur> <CAMuHMdVtCfkLCb=d59XDELJO53jXJmo03iLcCwvMq54BFiUpFA@mail.gmail.com>
 <20240102-calculating-purple-dogfish-f4408c@lemur> <CAMuHMdW7+ENssXG4aim-Oa0T1pH-i5-YhVB9C+JaFoJjzuQK4g@mail.gmail.com>
 <20240102-debonair-beautiful-capybara-afced1@lemur> <20240103004415.42xndtocu2ggr2a5@pali>
In-Reply-To: <20240103004415.42xndtocu2ggr2a5@pali>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 3 Jan 2024 13:26:03 +0100
X-Gmail-Original-Message-ID: <CAMuHMdXxzhddGOoxXLxNoyHX2NnLad2PRz9V1sGd_or6UWFkMA@mail.gmail.com>
Message-ID: <CAMuHMdXxzhddGOoxXLxNoyHX2NnLad2PRz9V1sGd_or6UWFkMA@mail.gmail.com>
Subject: Re: b4 modifying Cc-tags
To: =?UTF-8?Q?Pali_Roh=C3=A1r?= <pali@kernel.org>
Cc: Konstantin Ryabitsev <konstantin@linuxfoundation.org>, users <users@linux.kernel.org>, 
	tools@linux.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Pali,

On Wed, Jan 3, 2024 at 1:44=E2=80=AFAM Pali Roh=C3=A1r <pali@kernel.org> wr=
ote:
> On Tuesday 02 January 2024 15:49:45 Konstantin Ryabitsev wrote:
> > On Tue, Jan 02, 2024 at 06:03:44PM +0100, Geert Uytterhoeven wrote:
> > > > Overall, I would suggest that whoever is responsible for linux-m68k=
.org sets
> > > > up all the bits required by the modern email delivery stack (DKIM, =
SPF,
> > > > DMARC).
> > >
> > > That would be me (partially ;-)
> > >
> > > Looking at linux-foundation.org, I guess that means adding a TXT
> > > record with
> > >
> > >     "v=3Dspf1 include:_spf.kernel.org include:_spf.google.com ~all"
> > >
> > > + whatever outgoing servers the users of linux-m68k.org are using?
> >
> > That wouldn't be sufficient, because setting SPF by itself won't really=
 do
> > anything without DKIM signing as well.
>
> Is not it really sufficient to have at least one of them? Because these
> things are different.
>
> SPF in DNS zone specifies which IP addresses are allowed to send emails
> from that DNS domain. DKIM is a signature in the email header, signed by
> the private key and reference to public key is in the email header.
> Reference can point to any DNS domain. Also in email header can be more
> DKIM signatures (e.g. if email is going throw more email servers and
> every one signs email). So basically these techniques are orthogonal to
> each other.

That was my understanding as well...

> I would recommend you to at least try to setup SPF into your DNS zone
> and see if it improves situation or not. In the worst case you would
> have to revert setup back.

I could do that, after obtaining a list of all outgoing email servers
used by all linux-m68k.org email users...
E.g. I use Gmail, and my ISP's SMTP relay for sending patches
(I did set up an app-specific password for using Gmail's SMTP relays,
but last time (long ago) I tried, Gmail always replaced the address
in the From: line by the default address configured in Gmail, breaking
other addresses and any "+<sponsor>" additions).

> > To set up DKIM with gmail, you'd pretty
> > much need to pay for their Google Workspace product. It's probably a hu=
ge
> > overkill for this purpose.
>
> That is pity. But according to following discussion, gmail without
> gsuite is adding DKIM signature (generated by gmail key):
> https://support.google.com/accounts/thread/60798443/dkim-settings-without=
-gsuite?hl=3Den
>
> Anyway, I see that linux-m68k.org has MX record pointing to gandi.net.
> In past gmail had an option to send emails for non-gmail address via
> external smtp server (linked account). Cannot you specify gandi smtp
> server + your linux-m68k.org/gandi credentials into gmail settings and
> let gandi to sign your emails with DKIM and send them?

All linux-m68k.org email addresses are merely forwarding aliases, not
(paid since 2023-12-01) mailboxes.

Gr{oetje,eeting}s,

                        Geert

--=20
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds
