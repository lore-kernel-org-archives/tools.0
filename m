Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B0BE2C9A
	for <tools@linux.kernel.org>; Fri, 18 Aug 2023 21:15:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1EAB5C433C8
	for <tools@linux.kernel.org>; Fri, 18 Aug 2023 21:15:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1692393314;
	bh=pjTbE0MSseUAfxLxc4JYDmQPg3QLQvDCaLnaEMcEUCc=;
	h=References:In-Reply-To:From:Date:Subject:To:From;
	b=LxmzZNMIFRlgrbU9WRsqdCdA07LLzv54SKfShndmMzcrVI3uMH1RDQ0YL/gG8DUrA
	 r9639aXs8jkv9slAH9RHRoiGO/RKpSfuy4TQDD6PoBhhPTqX0R9ztTih6gy6WB6WS+
	 1FY1+sF2EY+v6/sPKwBiqor3N7wmla4rMxM30MRm2aZYdmFSGoGrBn/yAWm/pfuOpi
	 lZ+p1DMDe4bSUunHUPUahdhUveLByoeDHer8IjIFUlau0k0zLYZbZmq0TvrUE9LLCw
	 CPhX8MYw3CiL1lp065P9T3ovADltoTBCJqSxKlvt4KmYjwwyYUjqwMrMjDNcAux/bm
	 YCotHFXQ3pN5Q==
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-4fe27849e6aso2022724e87.1
        for <tools@linux.kernel.org>; Fri, 18 Aug 2023 14:15:14 -0700 (PDT)
X-Gm-Message-State: AOJu0Yyjns/G3E5PMf5x78iL2yfmF7Nl2A612F15EGF9ZOBGh8Vr+yFh
	qjwpufaNOEEau46S5VSstfzfFXt6s8hD8nbPEjE=
X-Google-Smtp-Source: AGHT+IErjVFitiiru4jSIOlz/j68XMj40B4oMIi6Zu2S01QDFrbd3WmuXoBQnD3Ve8oOxzoj+yyLswfu3ATAobEZL34=
X-Received: by 2002:ac2:58e8:0:b0:4ff:881d:620 with SMTP id
 v8-20020ac258e8000000b004ff881d0620mr196253lfo.34.1692393312135; Fri, 18 Aug
 2023 14:15:12 -0700 (PDT)
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
References: <CAPhsuW5Fqv7g=AVCGgQtFotG1oaUO+j5qBEyoTWJy0=n0mJS8w@mail.gmail.com>
In-Reply-To: <CAPhsuW5Fqv7g=AVCGgQtFotG1oaUO+j5qBEyoTWJy0=n0mJS8w@mail.gmail.com>
From: Song Liu <song@kernel.org>
Date: Fri, 18 Aug 2023 14:14:59 -0700
X-Gmail-Original-Message-ID: <CAPhsuW5siX-pXc2FbsZcPHPdreFaqWRKnJha8hpZn9GQBU6-uA@mail.gmail.com>
Message-ID: <CAPhsuW5siX-pXc2FbsZcPHPdreFaqWRKnJha8hpZn9GQBU6-uA@mail.gmail.com>
Subject: Re: feature request: b4 am verifies SHA1 from the Fixes tag exists in
 current branch
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>, tools@linux.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 18, 2023 at 2:10=E2=80=AFPM Song Liu <song@kernel.org> wrote:
>
> Hi folks,
>
> I recently made a mistake with a patch that contains wrong Fixes tag:
>
> https://lore.kernel.org/lkml/20230815091931.4dd2b277@canb.auug.org.au/
>
> Some lore search shows this is kinda a common mistake:

oops, sent too soon..

Continue here..

Some lore search shows this is a common mistake:
https://lore.kernel.org/lkml/?q=3D%22Fixes+tag+needs+some+work%22

In this case, the patch contains a Fixes tag with old SHA1, so we can actua=
lly
catch it at b4-am time.

AFAICT, this can be done with some command like:

git branch $(git symbolic-ref --short HEAD) --contains $COMMIT_ID

Does this sound like a feature we can add to b4 am?

Thanks,
Song
