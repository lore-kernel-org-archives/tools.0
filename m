Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72F762820CB
	for <tools@linux.kernel.org>; Wed, 20 Aug 2025 19:29:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755718175; cv=none; b=FiMGDLZAplriGbZ3Kjej1DrPPd9qMhLOQj9i0Vogh7YQb6rNOcFbvlkDHBvLhwhQFhX7ECKQt42zXhiL9/Lv1qys3d/P7yHyTocF+KuBIgC+NAKqOkQ8Ogj6OvDAB/3ab3z4lv+wt11rJcGRjj7oJa2Yyc7Cj/gZilulOB5wNYU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755718175; c=relaxed/simple;
	bh=zsw/YWFo48hUOkOZgbgg7A1R2TDwq8xpiDoAi0bCgkw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=pnTJqkMhTzc3kfP9dqOE3Q3je08x/sJ5uKKY3efhJz8aAWU7pEFVwoQubXkWUZbc2KEo2wjuAt4pSmizLK8BX7/VbRxHDTi40wnzxP9IdD0UBP4vvhcz4HGD4B0xH5uRBnCpstE+FH6YYcgzyyU6v31/miyCncb1gLVHZsNlP8g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=vhUtTXsh; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="vhUtTXsh"
Received: by smtp.kernel.org (Postfix)
	id EF41FC113CF; Wed, 20 Aug 2025 19:29:34 +0000 (UTC)
Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id D65FCC4CEE7
	for <tools@kernel.org>; Wed, 20 Aug 2025 19:29:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org D65FCC4CEE7
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-6188b73bef3so485604a12.3
        for <tools@kernel.org>; Wed, 20 Aug 2025 12:29:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1755718172; x=1756322972; darn=kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=maca6t6bicWnGDXTrxPWIaNuEfFTq8IOm2oh6zcHolA=;
        b=vhUtTXshPl+1wzBewlB0z7CfFgR1X6zUj44gthHjfXBwV2d01HvvZsEvkDPooxXqqW
         lODjzmolGjiu6luf2qnW7DCngZHbnxvYgWjn2wADMSQV4+fMXzvblR4vScrFNA5j+DXj
         qVa4OHUHXaaICXRAIE4jewL4c8MxBIghTm+nd+mNHA4j18jOq2bPuCLwj/h14dD9l7Dm
         6+no7LbhvQIWrpjjMIfWZ7uTO9sbfyv82QQLSLBhJa5iVBLE+XMd5jNcEqdfB0mDNAKs
         Eik+xfuRhi5i4SliHQLhznC+YXC1Fi52qPxhEFO7AZl081zIr/hHtjC5DjAxzfl9rKRN
         MzcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755718172; x=1756322972;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=maca6t6bicWnGDXTrxPWIaNuEfFTq8IOm2oh6zcHolA=;
        b=XDFOIhXUj1RcmS2JeUBJ1ogdCm/wayNvq7FfbexRw+G9ZEJn7F4C9l31uCEgRHR4GB
         uBA9UfrhOYdc8t0PDA7K2nlrti3MYbZfeQMYsXBEAdMZ/syRE5Wm+jFAalu72sbJ5bk8
         6JqNBuIF5myEWi+6i33v2LSRxKPiUjePCq2Qqk/w7ynsbPLmL/BGXQawN+t1GndbUYcc
         5J5DGR6Db6IrYqOcndACFfa0CKj8tpo+XNVI66Rm8AoI4PwuT+FZa5t8u41oLf1lLOoW
         czZopYA4tr2yTxwQdHCAUIR8ax7QOAQmyDkMode9OjKP1JXoNQ1SrDSLu0RhIUECHUyi
         H0Yg==
X-Gm-Message-State: AOJu0Yzq9FK7C9irDvKXV6RfcJR49nq5mb0VJFeGhyPnIDusLfK0Ne0k
	B9457v4hJxiy/SMWa5LjtMF1+zIsuSX0TNh6M8il1nnufnAFdJjDOJpLyBIPjg1Bgu5yFobfhQR
	nZvijiYYwmS1UIq7FnGhj7l+FOuStsxxn610Y7IOgh39dl6KnwgoNP98=
X-Gm-Gg: ASbGncu950ynb5SyoWf2WzbchAED6uZl3WYZbEpubdgfXake8dRZdX3JD1mS/rcs+bQ
	iTv0WzhTXLoJC/8o2u6TjrdY/XDIlZouMNw+I9eOwfxlW+8eH9FoaN4EThlxmOKDX46YOpTUu5f
	svESNw663gyX6YZ7xIXngaGItCCFFaUxXxS0IGBWVdvKPk3J/MW8QEebG3OT/cjVNr5zkSJ/x3S
	G38Lpf/8ZPqgsqTgxc=
X-Google-Smtp-Source: AGHT+IFXPPrT8JT3dNDWxNvl/clWjaRNoVWykDOqANnIa8O+iJzkcjNeI7hcPSJhvSdpf3WvZBtkAUJ/gAFtR2Bpayc=
X-Received: by 2002:a05:6402:3507:b0:615:aec5:b5bc with SMTP id
 4fb4d7f45d1cf-61a96c539ffmr3382528a12.0.1755718172122; Wed, 20 Aug 2025
 12:29:32 -0700 (PDT)
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
References: <20250820-auto-unreviewed-v1-0-b0af9cac4b4d@linaro.org>
In-Reply-To: <20250820-auto-unreviewed-v1-0-b0af9cac4b4d@linaro.org>
From: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>
Date: Wed, 20 Aug 2025 22:29:05 +0300
X-Gm-Features: Ac12FXzWMH0uvd5N9LZ0YagsNdBvhksrTXixAY4EpMOGjlqbtQjuZK0IRWbW87A
Message-ID: <CAAjaMXav4hC+HZgKA861Ur-jES6ibhjFzw8iYsDwVWZo1k4Bvg@mail.gmail.com>
Subject: Re: [PATCH b4 0/3] prep: add --auto-list-unreviewed option
To: "Kernel.org Tools" <tools@kernel.org>
Cc: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 20, 2025 at 5:55=E2=80=AFPM Manos Pitsidianakis
<manos.pitsidianakis@linaro.org> wrote:
>
> Imagine you have a >v1 series with over 50 or so patches, and only a few =
of
> them lack Reviewed-by: tags.
>
> You want to help other reviewers in the list help you, so you manually
> point out which patches still lack reviews in your cover letter. This
> can be easily automated with the new b4 prep --auto-list-unreviewed optio=
n,
> which uses a new "auto-list-unreviewed" dict key in the tracking json in =
the
> cover letter commit.
>
> See patch description for an example.
>
> Since this is an RFC I didn't add test cases but instead tested it
> manually. If the maintainer thinks this is a useful feature, I will
> try implementing cover letter generation tests in follow-up revisions.
>

Ah apologies, forgot to set the RFC prefix :)

> RFC questions:
>
> - Should tracking json values be under "series" key or top-level?
> - Should the template be configurable or is this overkill?
> - Should the code review tags be configurable or at least expanded?
>   Currently they are "Reviewed-by" and "Acked-by".
> - What if a series of 100 patches has only one R-b? This will list 99
>   items in the cover letter.
>
>   It's not easy to realize this will happen as it requires running b4
>   send --dry-run or exporting the patches to files and inspecting them.
>
>   I think it might make sense to limit the number to some hardcoded or
>   optionally configurable percentage and/or upper limit but this might
>   also be overkill as this is can be deferred to the user's judgement.
>
> Signed-off-by: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>
> ---
> Manos Pitsidianakis (3):
>       Add LoreTrailer.is_code_review property
>       prep: add --auto-list-unreviewed option
>       docs: add auto-list-unreviewed documentation
>
>  docs/config.rst     | 10 +++++++++
>  src/b4/__init__.py  |  7 ++++++
>  src/b4/command.py   |  6 ++++++
>  src/b4/ez.py        | 61 +++++++++++++++++++++++++++++++++++++++++++++++=
++++++
>  src/b4/man/b4.1.rst |  8 +++++++
>  5 files changed, 92 insertions(+)
> ---
> base-commit: e44bb8727e2b49db66c2c1e2fc2e9b22b32816ae
> change-id: 20250820-auto-unreviewed-cb3584691947
>
> --
> =CE=B3=CE=B1=E1=BF=96=CE=B1 =CF=80=CF=85=CF=81=CE=AF =CE=BC=CE=B9=CF=87=
=CE=B8=CE=AE=CF=84=CF=89
>
