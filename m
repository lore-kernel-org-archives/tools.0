Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17E932C848
	for <tools@linux.kernel.org>; Fri, 22 Dec 2023 19:13:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="H5CKLW/6"
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-336755f1688so1887662f8f.0
        for <tools@linux.kernel.org>; Fri, 22 Dec 2023 11:13:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1703272427; x=1703877227; darn=linux.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=qSOReUo545iODrQNT8BawSdiv/SF1T5vGxaHDQCJI8k=;
        b=H5CKLW/6uVkxufdMsZR0la4It6XP8te/49DCsYEAhL0qQEdV7RS9B8SrudPSKRsCCM
         7pf7/EphNwdp22a3mUqbze3mavSr6QA27PGFjPHoKPoy9+OTHBty62HhTTzJv5bjaEqt
         nKRrYEFqmB96Baud28VTbGdNeIeN6dmKRro5zhTG2+kRNjraxrgoE0Ip8eiv1KJoX2gh
         FGBGbFJ5ideqbFJL7JhMciJjayGC2l16LEd466tYIw5+Ja276/Oqlj3DPMfK3HuUkEzy
         p9GhQYiLuTPIGI9MHrWXtu6rivT89oW4hzLkXdq97GVjj127x1Rc3mczut0OgoiutlDo
         JQJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703272427; x=1703877227;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=qSOReUo545iODrQNT8BawSdiv/SF1T5vGxaHDQCJI8k=;
        b=FAUYun13925Qoa+eRNwnTcvqE3h67n4jhItCC49jFBPVk7tD8eZoFtl45OFtv20sW/
         RsrTbrBkXZECtZArdx2iQhQgtnd8cHMcRKWv0k7HPVjCS6izlEWQPwT/IeGbkJhvHy8P
         PQYDjWk48OVM9OPGSqk+t74k6FtxRvBxm5oLdZkdyM6funlGjqHwrxNUJQ/TLakRqIeX
         a38QFI3DfYbiuqdKT+TfZN2+Yiq12aWZVNqz5Y3mffYStz4waR9rQ1nunacbZiFpb+SA
         /ZarzI7+ZNtln2IjaY7S7BqGUFygKbFxaR9+GBiZWZSM5Of8qSRk622c5Os4edLIbn8L
         eGyA==
X-Gm-Message-State: AOJu0YwxBE0QTYbcZAomvWRLPCI1BIGtmJLsdIDvuRGlhH/0tcV8xTKo
	8DOzQZgT/zDpAlCL9Y6TqFlZ26vzxGTkvA==
X-Google-Smtp-Source: AGHT+IGFNtSufqRgQcA0yOZgNKe664wbKV/6XZho1BDiPo8wrQH4+2M3qxVneD4cjar3QAwdbZYNrw==
X-Received: by 2002:adf:e74f:0:b0:336:7866:4e66 with SMTP id c15-20020adfe74f000000b0033678664e66mr942822wrn.29.1703272425110;
        Fri, 22 Dec 2023 11:13:45 -0800 (PST)
Received: from ?IPv6:2804:30c:1668:b300:8fcd:588d:fb77:ed04? ([2804:30c:1668:b300:8fcd:588d:fb77:ed04])
        by smtp.gmail.com with ESMTPSA id k15-20020adfe3cf000000b003367a51217csm4948656wrm.34.2023.12.22.11.13.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Dec 2023 11:13:44 -0800 (PST)
Message-ID: <3a0b19b97cedd69b49a23aab35038e0844f3f1eb.camel@suse.com>
Subject: Re: [PATCH RESEND v4 0/3] livepatch: Move modules to selftests and
 add a new test
From: Marcos Paulo de Souza <mpdesouza@suse.com>
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc: tools@linux.kernel.org
Date: Fri, 22 Dec 2023 16:13:40 -0300
In-Reply-To: <20231222-groovy-llama-of-pluck-feaafd@lemur>
References: <20231220-send-lp-kselftests-v4-0-3458ec1b1a38@suse.com>
	 <55b717dba239f3bedf0da7e25925e390a63459f5.camel@suse.com>
	 <20231222-horned-caiman-of-freedom-3fec0a@lemur>
	 <f5c38763b4d42cfafdaac24d83ec18b81dfc073a.camel@suse.com>
	 <20231222-groovy-llama-of-pluck-feaafd@lemur>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.50.1 
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0

On Fri, 2023-12-22 at 14:11 -0500, Konstantin Ryabitsev wrote:
> On Fri, Dec 22, 2023 at 03:52:29PM -0300, Marcos Paulo de Souza
> wrote:
> > So my usecase was that I first sent the patches locally to my
> > colleagues, so I used
> > 	b4 send --no-trailer-to-cc --to
> > colleague1@suse.com,colleague2@suse.com
> >=20
> > Well, maybe adding a confirmation for the user that the version
> > will be
> > bumped. A new flag could also be created b4 send --keep-version to
> > send
> > without bumping, thus avoiding the prompt?
> >=20
> > Is this too convoluted?
>=20
> No, this sounds reasonable -- we do need to support a "hey, can you
> look over
> this pretty quick" kind of action.
>=20
> How about the following:
>=20
> =C2=A0=C2=A0=C2=A0 b4 send --only-to colleague1@example.com,colleague2@ex=
ample.com
>=20
> This will automatically trigger the "don't tag and reroll" mode.

Looks great! Exactly what I wanted to do, and very simple. Thanks a lot
for looking into it!

>=20
> -K

