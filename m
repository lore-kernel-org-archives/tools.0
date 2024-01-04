Received: from mail-yw1-f178.google.com (mail-yw1-f178.google.com [209.85.128.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FF39208DF;
	Thu,  4 Jan 2024 09:37:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f178.google.com with SMTP id 00721157ae682-5e75005bd0cso3142727b3.1;
        Thu, 04 Jan 2024 01:37:06 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704361025; x=1704965825;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pBAVL5rqekvc4808oNiNg/9V018eaEKSja8j5d9GdJs=;
        b=A0cN5cKgKhYu+e0YtsZ96H91Nev4//L8aPvUHw+QZYlHtYCAVIkVdFbs0potjdoWzO
         KtNUwkWgROdDYgphQJ0kSPR8X5iux+lpCi4E26gSt6XJ/8p43GWhNr2lBpbTfQ5iWyuR
         QTFLDQijDsVlC5gDazK+JwbGeJKzM72USQGVCW60KeZd21cRz+QfAAWNQTbW7TGALiyM
         L/a3HeL1hTe7Gs7ahBpSjhRmHDPq/bRJqwDGkSADFPIl1tmQ7Mv4NvMQL9k+/JXXEH2z
         LL0Dm5/pCXK9ZsnQ+K4u3Lw5MNiYiJx+VIkKOSMpBU3KUUxjAHBt0o3C7v8LgdQNAvzr
         g6qg==
X-Gm-Message-State: AOJu0YyVTjBv/1rgocioub9VrpGpdkCG3xjbrAUUhEbPovXiAt5T83mI
	ssneeAHR++n0sulhLIAFdnk/cKJ24qNSsxF3
X-Google-Smtp-Source: AGHT+IE3Khk+0DC92Lff73/Uhlg7yVljduwCvfzBjDrjNjQ1Nvbsli+5bCa2bu0RbPtlhbCKmURSXA==
X-Received: by 2002:a0d:ce46:0:b0:5e5:5683:8f5a with SMTP id q67-20020a0dce46000000b005e556838f5amr329344ywd.37.1704361025046;
        Thu, 04 Jan 2024 01:37:05 -0800 (PST)
Received: from mail-yw1-f173.google.com (mail-yw1-f173.google.com. [209.85.128.173])
        by smtp.gmail.com with ESMTPSA id v127-20020a818585000000b005ce93212c47sm13682947ywf.134.2024.01.04.01.37.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 04 Jan 2024 01:37:04 -0800 (PST)
Received: by mail-yw1-f173.google.com with SMTP id 00721157ae682-5f00bef973aso3199537b3.0;
        Thu, 04 Jan 2024 01:37:04 -0800 (PST)
X-Received: by 2002:a25:8407:0:b0:dbd:4c4d:240d with SMTP id
 u7-20020a258407000000b00dbd4c4d240dmr291385ybk.59.1704361024058; Thu, 04 Jan
 2024 01:37:04 -0800 (PST)
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
 <CAMuHMdXxzhddGOoxXLxNoyHX2NnLad2PRz9V1sGd_or6UWFkMA@mail.gmail.com>
 <f8d3ddc69bd95bc8553b5908523e55e0be245e84.camel@HansenPartnership.com> <20240104004108.zs3wlfju6gzfl2mo@pali>
In-Reply-To: <20240104004108.zs3wlfju6gzfl2mo@pali>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 4 Jan 2024 10:36:52 +0100
X-Gmail-Original-Message-ID: <CAMuHMdUq++GTCDZZd3yeAJgKTe1entWQ7jsf3pw5N7pqU_8svw@mail.gmail.com>
Message-ID: <CAMuHMdUq++GTCDZZd3yeAJgKTe1entWQ7jsf3pw5N7pqU_8svw@mail.gmail.com>
Subject: Re: b4 modifying Cc-tags
To: =?UTF-8?Q?Pali_Roh=C3=A1r?= <pali@kernel.org>
Cc: James Bottomley <James.Bottomley@hansenpartnership.com>, 
	Konstantin Ryabitsev <konstantin@linuxfoundation.org>, users <users@linux.kernel.org>, 
	tools@linux.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Pali,

On Thu, Jan 4, 2024 at 1:41=E2=80=AFAM Pali Roh=C3=A1r <pali@kernel.org> wr=
ote:
> On Wednesday 03 January 2024 08:19:15 James Bottomley wrote:
> > On Wed, 2024-01-03 at 13:26 +0100, Geert Uytterhoeven wrote:
> > > On Wed, Jan 3, 2024 at 1:44=E2=80=AFAM Pali Roh=C3=A1r <pali@kernel.o=
rg> wrote:
> > > > I would recommend you to at least try to setup SPF into your DNS
> > > > zone and see if it improves situation or not. In the worst case you
> > > > would have to revert setup back.
> > >
> > > I could do that, after obtaining a list of all outgoing email servers
> > > used by all linux-m68k.org email users...
> > > E.g. I use Gmail, and my ISP's SMTP relay for sending patches
> > > (I did set up an app-specific password for using Gmail's SMTP relays,
> > > but last time (long ago) I tried, Gmail always replaced the address
> > > in the From: line by the default address configured in Gmail,
> > > breaking other addresses and any "+<sponsor>" additions).
>
> Have not you tried to register/link also additional account with that
> "+<sponsor>" suffix into your gmail account? I would expect that gmail
> allows to set only registered addressed into From: header and maybe
> additional +suffix needs additional register/link.

IIRC I tried that (don't remember if it succeeded, or if it failed
because the base address was already registered).
Anyway, that won't help much, as the address in the From: line was
always replaced by the default sending address, so sending a patch
series from a different address would mean changing the default in
the web interface first, i.e. lots of manual work.

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
