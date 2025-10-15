Received: from mail-vs1-f45.google.com (mail-vs1-f45.google.com [209.85.217.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B34031986D
	for <tools@linux.kernel.org>; Wed, 15 Oct 2025 08:56:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760518617; cv=none; b=QqUDyNuWXDOmIs/6JZ+8ZrtdNE8CWdNvUyDeK17GbzcvGB94SIdeti6AwLCQYv48TW0k0XJ6oMXAhxptFW8ZMVTqqVN7EMrChfcn+ii74PuSvtRj0nsNbJqA7jCpIRt/O0YDn14V+XoV+CEJBsCWR4NfyXpu9CgU45l5QD2AeRw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760518617; c=relaxed/simple;
	bh=x6AsfPLAHnA3UW5wOeY4nvoqsW59I4erJ3Ns+OfUIxM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=fB8Esmmcp6+DgNhkYw7jQWdxzLFKp1Neysg1pj6tHfPMeGSt965vpPC6be25ul7+sVjX30ZlVg9F5tZueAkFbUn+/O16+dJwFGJhg4F3c6hjCXBIgO/OCk5JfvHnY/OAZvZHuoRFzfeZcxEjn1yZkToSVdi+fW+zsbra9wGcq3w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.217.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f45.google.com with SMTP id ada2fe7eead31-5b59694136bso3440040137.0
        for <tools@linux.kernel.org>; Wed, 15 Oct 2025 01:56:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760518615; x=1761123415;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2TPX95PtTqRL6bQm+BA/2H6QCcmI1Jgp2q+wt1TwzBE=;
        b=R1GNfYGpyavXCAmLfZNfRvYtqnr/gaAXkJHygD5BNS7mkGwC203x6g2I++KG4Me2OF
         vC6MxBAb7M13yYQw1qk3LNn98W3vvXAa4M37d+etkJlg5qrO7BpXpa+UQjVpF9r1DCMG
         mm890owpScCCPh3VFZWlb3oXwYrQkZssU2WAmZ8ZGkvkhiToVPe2Pyvuj8iwi158tU8c
         Dx6rsEpvyxJwYv97EEQ+NhMunj2eYWWo+IM6yjkFwX06gzp92mSzoyMEvUKxq9FmnVPC
         Qr8GZCCEm9/uHZPqS4+GI9pxlQvVM2hbNGZ3vEBdKocvg08L9sqUHDQ2+Bbxyyb+YFTM
         MEEw==
X-Forwarded-Encrypted: i=1; AJvYcCVHQDgyV61ZFPgUeH/HMw8jW3aQe2u2gnCcCljbnC98Es3SJ/pORpVq/qn8DEFHEv8GYeKnGg==@linux.kernel.org
X-Gm-Message-State: AOJu0YyXx6tH2eyEPHOmRpPwwB0rwP3D8U7zTFCuJtbC4OeKLkQzamQC
	zMdz1qoW4SqyYLs1iOCo19LH1Vcnp+bN8XEIboCJDIUU/otxcjJSsJ1R85Mtn7q1
X-Gm-Gg: ASbGncuPW3cGxu3UWR/tTeQV+01F/exYFQ1T0jnAj7jskZATWn/YXJl/31AxyQvRlZi
	+sHr2UEf333tPkUB2hV0cRdTIxEppOjWB4ieOQMS+aC7vM4UTfpqtpRZgxMciJNuanJl/3h4n3P
	j7Jf0+OaeiE2f245WAWypt0tX4lEj/vEwslRzTi1gkEH9W/SG0WwrtPBep6n8VPwMEtCss6/ewC
	cML7fx9QFCfyMUnVHKnMeQ/U2+GWL6WdRAFtLzJuPaEvZ8jgQj8+uvSnPQELyoT2kXM/7ekUGWo
	NGJB7+oziYKPm+Z4RrpjW5adc2130HotLqBliMm1CnIuL5X2+FuwhvNDrAOR/MoQ/MwunkyznKX
	yjByXeFEhvUZ+3kVrnR5H3yYyb9NCJ+70z7PGwLtnoGRvIMyFqu+W3T690XDJL/2hETBxDv2CdD
	fS07w=
X-Google-Smtp-Source: AGHT+IF7JGYhofOL25hQRmJXsr4/NcThNLn/rWP/BRm3OxtbaZ6X2gFT14zxVNOyjAvJJHUV58d0Dg==
X-Received: by 2002:a05:6102:374a:b0:5d5:f6ae:74b3 with SMTP id ada2fe7eead31-5d5f6ae75a0mr7086407137.39.1760518614484;
        Wed, 15 Oct 2025 01:56:54 -0700 (PDT)
Received: from mail-ua1-f46.google.com (mail-ua1-f46.google.com. [209.85.222.46])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-930bf7ad6f3sm4162565241.17.2025.10.15.01.56.53
        for <tools@linux.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 15 Oct 2025 01:56:54 -0700 (PDT)
Received: by mail-ua1-f46.google.com with SMTP id a1e0cc1a2514c-930989f9f81so1800155241.3
        for <tools@linux.kernel.org>; Wed, 15 Oct 2025 01:56:53 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCV7jyNa2sHw3bHKNLfLMGwhKYloqflXVY1cbo+lh977It/qpo71nIemE533q/0vg+Bc6ZoaGg==@linux.kernel.org
X-Received: by 2002:a05:6102:c09:b0:5a3:6a6f:21ad with SMTP id
 ada2fe7eead31-5d5e23c174amr10303350137.30.1760518613633; Wed, 15 Oct 2025
 01:56:53 -0700 (PDT)
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
References: <CABgObfY5agTRsB-bCqCYbA0erFn5cVbujtTNBiCti8g_68nCWg@mail.gmail.com>
 <20251011061351.GB23024@1wt.eu> <CABgObfbCLK9aEVg=y_fG8EfN3Q_f=LnGMjCPz+yWU-FS5-6V4Q@mail.gmail.com>
In-Reply-To: <CABgObfbCLK9aEVg=y_fG8EfN3Q_f=LnGMjCPz+yWU-FS5-6V4Q@mail.gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 15 Oct 2025 10:56:42 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWu+Az_jac7nMjjBkE+F3CPB5d9nMZvaXyCR0NOZELoHQ@mail.gmail.com>
X-Gm-Features: AS18NWDFL5soxwNkxmhjcd91Gl6BwOmD2oCZFi5VAdLn17NBfOYNk8vqBLliKf0
Message-ID: <CAMuHMdWu+Az_jac7nMjjBkE+F3CPB5d9nMZvaXyCR0NOZELoHQ@mail.gmail.com>
Subject: Re: In defense of Link (was Re: [b4] initial "b4 dig" to supplant
 Link: trailers)
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: Willy Tarreau <w@1wt.eu>, Konstantin Ryabitsev <konstantin@linuxfoundation.org>, users@kernel.org, 
	tools@linux.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, 15 Oct 2025 at 10:43, Paolo Bonzini <pbonzini@redhat.com> wrote:
> On Sat, Oct 11, 2025 at 8:20=E2=80=AFAM Willy Tarreau <w@1wt.eu> wrote:
> > On Sat, Oct 11, 2025 at 07:59:32AM +0200, Paolo Bonzini wrote:
> > > [1] "git am" adding Message-Id predates Link as far as I know. It's
> > > less handy than a clickable link, but again the known format used by
> > > git send-email comes to help. I have configured my terminal so that
> > > "email addresses" starting with "20" open in lore rather than as
> > > mailto URLs. :))
> >
> > Maybe what would be needed would be a "Lore" (or "Series" or "Discussio=
n")
> > trailer that automatically makes a lore link from the message-id, and

Or "Follow-Up-To:"?
(although that would mean growing the collection of tags again)

> > which would explicitly indicate that there's nothing else there but the
> > actual patch submission, contrary to Link that's for any extra info ?
> > It would be added by "git am" when passed a specific option.
>
> And if no one has a problem with s/Link/Lore/, who am I to complain!
> With -m (or the am.messageid config) I have in the applypatch-msg hook
>
> sed -i \
>   -e 's,^Message-I[Dd]: <\(.*\)>$,Link: https://lore.kernel.org/r/\1,' \
>   "$1"
>
> and it's an easy replacement to change the name of the trailer.
> Likewise b4 could do it.

Exactly.

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
