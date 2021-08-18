Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35EC3168;
	Wed, 18 Aug 2021 19:50:34 +0000 (UTC)
Received: by mail-ej1-f51.google.com with SMTP id b15so7388337ejg.10;
        Wed, 18 Aug 2021 12:50:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=BihID8feRxRb21J8JgL5t7zuprXhwguyuMdyDzEn5tg=;
        b=c+mKWadVOtLMOHr1bNUId17Y/UJvegk3PY4I4U62yiaHH5c8MAQR4gEjGQWODjUiKq
         Ic0f4WQtzQoXcBYQyyRUL9sXBFhKUuUZnIO7ZY3IJ5fF8YGbvxXrAgi0RqMHxjw6ZjBJ
         oFpOYFNvyJ1zYr9PnF7eGkJHIxAoX6fPohAftaQ+kWisUkekQmsMqDiDE1TbSuuZPaEO
         Rn8VKeg2qOBGLRSB+r5oM54fdjn2Hb+ADRbExikh95foEgMnrwz/FdXyiB/VgyeE3JBv
         ZOCcYQcDbsOEVRzbmFEbc4UZAkQvNadPnOm2vcZALAgumHGifq1KtuD/cEq8s5ZkoBuf
         4vBg==
X-Gm-Message-State: AOAM53048nFdgbxSFywp58QIlebvGzXZFsvXi9TY8+1NutyI1XouErTt
	NNPi9bBlVKw401FqupTUytL+ix/XamkJtfR+/EE=
X-Google-Smtp-Source: ABdhPJyMPQRwR36Zytj07UUaa8Gd5LC/KTmIOX99bIQu1JwXkA3ESPHj8hBcYX4ZjJ4xvKOFi/f3Pnt7/6WZe6cGaw0=
X-Received: by 2002:a17:907:9851:: with SMTP id jj17mr11433802ejc.489.1629316232516;
 Wed, 18 Aug 2021 12:50:32 -0700 (PDT)
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
References: <20210818190750.g3xedu7j24sqndo2@nitro.local> <CAHmME9qz08XYyrofJOU9TYvgZ2tB39GaaxQrVz1-wiuGRgB6fQ@mail.gmail.com>
 <20210818194809.zyoqio4pepghhb3c@nitro.local>
In-Reply-To: <20210818194809.zyoqio4pepghhb3c@nitro.local>
From: Junio C Hamano <gitster@pobox.com>
Date: Wed, 18 Aug 2021 12:50:20 -0700
Message-ID: <CAPc5daXMjbzP4fECxWLXfVgv=5ufJK0BXrw0Mn5Pi4RLJ3Q6+w@mail.gmail.com>
Subject: Re: New version of lore available for preview
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc: "Jason A. Donenfeld" <Jason@zx2c4.com>, users@linux.kernel.org, tools@linux.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

https://x-lore.kernel.org/all/_/text/color/ mentions public-inbox;
those who are not familiar with the history of software that powers
lore may find it confusing.

2021=E5=B9=B48=E6=9C=8818=E6=97=A5(=E6=B0=B4) 12:48 Konstantin Ryabitsev <k=
onstantin@linuxfoundation.org>:
>
> On Wed, Aug 18, 2021 at 09:09:13PM +0200, Jason A. Donenfeld wrote:
> > Planning on having /linux-kernel/ be canonical, with /lkml/
> > redirecting to it, for x-lore?
>
> It's not as straightforward as that, unfortunately (it would break existi=
ng
> mirrors), but we'll now serve the same content from both locations.
>
> -K
>
