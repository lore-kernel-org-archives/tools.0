Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 083D41E7C05
	for <tools@linux.kernel.org>; Wed, 20 Aug 2025 21:26:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755725218; cv=none; b=E0nnEUUkBPbUae1BnDM0HUM21l4GpAfuiOkjh8GEq/jFHVSmg/Tpx2YtUfVlSNTkayFQZqYEVdIMS6o9UGS1NvRwb2RHJmk29SADtsa4RHk1QII8/bwWZD8nlUC19jzPS+NO6N2wNg/+8f2nwhMGqQowvTNOUwxTFxs0rV5IzUc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755725218; c=relaxed/simple;
	bh=w0R1dxggflC0EeAbDuJaWHdQBvefTPqJAm7H4ZLno4c=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=koXVpebDhT5btYam8JZaxXcVQa3AbSN2OqkrQecm8qheEkgbcDb8rtm24FPRNlg4bIOO4k3YATtRy3uuI5bNDiRCBe8PG3p6qV8STqvtaDT6ZddBnaqs3bP139lfe0fhd87qUJ56Xrd6g0ViIg2C+1KxD79Bwk76VneAZLPctdA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=m7T497Mz; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="m7T497Mz"
Received: by smtp.kernel.org (Postfix)
	id A5ADDC4CEED; Wed, 20 Aug 2025 21:26:57 +0000 (UTC)
Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 8C206C4CEE7
	for <tools@kernel.org>; Wed, 20 Aug 2025 21:26:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 8C206C4CEE7
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-61aa702c9ebso766990a12.3
        for <tools@kernel.org>; Wed, 20 Aug 2025 14:26:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1755725215; x=1756330015; darn=kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TPA8SAsLpO6h6Gr5UoegnaRBagwJ8dhDmaSKHHXQxNc=;
        b=m7T497Mzrd69g+gT5ORaASOBg1Lu97XJAXIhS27MhWs9EbEtVivbBheHj2ciVUNazm
         JWRMnAxSBXZiPUgzIYHbTycI+PKXHmDCt5Qp1h72/EeqRj34UA51ruciMnrkWEv1pOQN
         lIQ2fFGUEBivDj3kCDxvgd3sTAIm0GRzkqQPwrHaxf7LRHktIoeZn4OWFWMekSU13fnw
         HQJu6EMZxnd8zUnbf3MtH6phcJyHWRaRrcVo+AIVKYapV60U5sesN7U2RkYs0sOv/fF4
         CWw0MQpVA35zV3waVk06yxyqNAV4BaFoSQy1Mje0h3bixtpXaBW8BkheLQExfUkQ0gzn
         kBGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755725215; x=1756330015;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TPA8SAsLpO6h6Gr5UoegnaRBagwJ8dhDmaSKHHXQxNc=;
        b=p0l/3lKtUHHTWqU66FxgkdKZqBJPD03ufHp+09NU8u1Tvkc9OIHhy3vzenv/93103v
         WDEyxxQHAT7Os83cFC+qydIRjjzom0+xt0hwihrBLYyKwIUHgZ3rWozLca/lwM24tRXR
         2ZNOktMNsFwE5cO+AaPFgZqjqY7TgW3w2vdyKIm0ttPDD9Fp9n3TaVtWcmTfekvtko5r
         Y65ikKgsweUKQGmUBz+oLQfTb0UZ0k7AEqeCQhrW8YeX67E67oD28Nez09GleVAvlSDG
         vl3IenWeA9DkPkVjuRhSOXVI726pRyVeB5pv+d/7fqYXXVank/jIFeofgUpl6TqVlHvr
         OpXg==
X-Gm-Message-State: AOJu0YyansgVZL9mTcxGVDW4UXwSB4q+1i2GW+227bzZOx3MpbzvfjPt
	2FQvKmYgq9V7/aw9G1IHsZkDr+PSfjqKxU3NCpkDLyCDtBfCArzQUmE3Mi6DykyY+TNix5wyehI
	CiN5oJIT1E37UiuZcS+824wVMLBqWf6jQcIejqw2ythqyap0QGvIRFo8=
X-Gm-Gg: ASbGncsMJJv8S5jy4stQXWuW3K8sGTAJJFht80HQotD2030SOmw1Hseiiq/w1aXMbax
	EXcHc1kOjrTdpcHM88aGUBnvKGhgDL7DcpiEoLWdz7p1oD+zJXmXdtmyRagkQ7XS9IxXlsS5sRh
	0y44Ld5oLYLfd9J3ZGjyIk3o4xkJOAbpe8eT4qFnAMfVWxuKoLhSeQJwW2/xGqNKN/FrGt7jZIC
	Ky6/DRHM1c14PDh4RDxqD+77ZQCjQ==
X-Google-Smtp-Source: AGHT+IFPMHzzD3NSA3LwVWqWlLEaXJJKrdylEkA/FzhHqcKrbgdfVYrj3TK1IPqD0qvy9vLLyr2hESv1QweA1sJnBvU=
X-Received: by 2002:a05:6402:5244:b0:618:1521:8dec with SMTP id
 4fb4d7f45d1cf-61bf86f95demr138353a12.16.1755725214730; Wed, 20 Aug 2025
 14:26:54 -0700 (PDT)
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
References: <20250820-auto-unreviewed-v1-0-b0af9cac4b4d@linaro.org> <20250820-congenial-groovy-collie-cce23d@lemur>
In-Reply-To: <20250820-congenial-groovy-collie-cce23d@lemur>
From: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>
Date: Thu, 21 Aug 2025 00:26:28 +0300
X-Gm-Features: Ac12FXzd0cy9mh14EgnYONeacgva2AUzMGGV3nBcAG3gvoA9rS4VBEgZ0h_JsY8
Message-ID: <CAAjaMXZ7Gq=mbnr-wULGos8v82r0YdTaz9ytzqKCj5pi3nbgkw@mail.gmail.com>
Subject: Re: [PATCH b4 0/3] prep: add --auto-list-unreviewed option
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc: "Kernel.org Tools" <tools@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 21, 2025 at 12:12=E2=80=AFAM Konstantin Ryabitsev
<konstantin@linuxfoundation.org> wrote:
>
> On Wed, Aug 20, 2025 at 05:55:02PM +0300, Manos Pitsidianakis wrote:
> > Imagine you have a >v1 series with over 50 or so patches, and only a fe=
w of
> > them lack Reviewed-by: tags.
> >
> > You want to help other reviewers in the list help you, so you manually
> > point out which patches still lack reviews in your cover letter. This
> > can be easily automated with the new b4 prep --auto-list-unreviewed opt=
ion,
> > which uses a new "auto-list-unreviewed" dict key in the tracking json i=
n the
> > cover letter commit.
>
> This is is a neat idea, but I think this would be best left to a system l=
ike
> patchwork. There are multiple benefits to doing this in patchwork instead=
:
>
> - stays off the mailing list without generating more noise
> - allows tracking trailers like Tested-by
> - allows collaborating between multiple authors
>
> I realize that not all projects run patchwork (or its derivatives like
> patchew, etc), but it does have its undeniable benefits.

Yep, we use patchew and I often use it for the R-b tags.

>
> I do agree that we need better visibility into what's happening with a se=
ries
> from the point of view of contributor, so maybe we can take this work in =
a
> slightly different direction. I expect people would love to have a way to=
 see:
>
> - which series are being ignored (no comments or follow ups)
> - which series have been merged (but this is tricky, because we don't hav=
e a
>   standard trailer like "Merged-by" or "Accepted-by" that is sent post-fa=
ct
> - which series received a NACK
>
> I just don't think this necessarily needs to go into the cover letter.
>
> What do you think?
>
> -K

I don't have a strong opinion to be frank (I sent it just for
consideration). I can understand this argument. I think the only
observation I have is that this listing is only a signal for the state
of the series when it's submitted as opposed to current, so it solves
a slightly different usecase.

I doubt I will be writing triple digit long series any time soon :),
but I review some (in)frequently, which made me think this could be
useful for those submitters.

I definitely agree that it adds more noise, especially if the
unreviewed patches are many. That's why it's strictly opt-in by
default. Some people manually include such a list in the cover letter
on large series which I've found on many occasions that it helped me
go through mail faster.

--=20
Manos Pitsidianakis
Emulation and Virtualization Engineer at Linaro Ltd
