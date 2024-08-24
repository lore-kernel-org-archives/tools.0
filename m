Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B7C4376E9
	for <tools@linux.kernel.org>; Sat, 24 Aug 2024 13:50:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724507450; cv=none; b=uagwofqfxYPy9dZ7hv4jO69Td2RTmZoRPKixFhz1hA5g7fszKA/GSw3+odyhKZ62YVJ00zhYS3l1OOmsTGBSjmxRkoOWQsNalzygN/Wys26sZdI9KbRZb1sPsyPQQzHXkugqNgAs34eBXPxWS2Xn4IaEyg9ICeVKIyCGVCdn2WA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724507450; c=relaxed/simple;
	bh=JlokijqjV286NNAhkJuWx/v58GzOsJ8QrJ6MQ9KBfvU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=lLQvCiOnRGuSY41wnbMpGHZAf6PgZjHWStZjf1wdbNOszcuLmR3wFyF3ALgnuJ6du49OAlfPgBqSXpjleSXcPegutkDXMzyxDy5AR4hOeruC4aGIHhxokwSPYgEOm7JUOAEOUnTATFS//18wI9H3OCSrERLG99HoiYr5fSrp/hc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KzlOXPO6; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KzlOXPO6"
Received: by smtp.kernel.org (Postfix)
	id 081C8C4AF0B; Sat, 24 Aug 2024 13:50:50 +0000 (UTC)
Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 32C3FC32781
	for <tools@kernel.org>; Sat, 24 Aug 2024 13:50:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 32C3FC32781
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-2d3f39e7155so356552a91.0
        for <tools@kernel.org>; Sat, 24 Aug 2024 06:50:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724507448; x=1725112248; darn=kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JlokijqjV286NNAhkJuWx/v58GzOsJ8QrJ6MQ9KBfvU=;
        b=KzlOXPO6FOGqXz+Cr6x7lwcu3a6xrZ6o1aK33N18gXlLlbSPgQ4T6s/H4Jw1zgxnvg
         1Bu0xe5QfPgya9KiEHrcRImIEine6ZqKc9OLaTrEdnZSKTZielJXyhuC+iJzTf1oc7E6
         ZdrcTkOKea3hFyh8DmBbKFO4oSF+NTzGdAwDPYm/y1oSS9j14AVO0nb6v8ZkTAApdZmx
         G8X94kAT1kSSE1/nVocqSL6nLOcCsHHE4Gdb2kszl9WfGdu95g39kuncdjpX444CkVnz
         r8kwcZxVQ25ZyW1gjlUKjwmQ64iWQsc3UvXxoYHS5izjlMUTTEJ8/VoYEvkC7TMeU1fd
         +i4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724507448; x=1725112248;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JlokijqjV286NNAhkJuWx/v58GzOsJ8QrJ6MQ9KBfvU=;
        b=eWhQ9IcZB9HaukeyTxR1QBP+8AGa49qLL8i1ZwAUbtlMVKBBdczZaoZTYjzSkqdytp
         5ce+dLcgmBWzf5TSGBlJG/F80LTMlewNSCcoYnqdTLtMb7DzbF4OpL+w2pCxEbgXWnWk
         QYOYb8kYNouzW1/3KoODpNV8XyttUVH0bCyi9lh97P0PbnDWT8vrUErvVdlP8D3nGgjI
         oPysJWq8zSb4Rktutt9/0PK9+PQLqKhvgNh7H5ohCzAX0yig+s1fBy15wT2inVSH+Nfl
         YnSmgLISVe/n+dbZct2fwKFN5rmRMAtf5/0rIbhbiwOgBdGNQrYKbhidmfFN2Qeqnum9
         sQHg==
X-Gm-Message-State: AOJu0YyiXsQb2DOAtnE/P6GrZrcP6Y62uTDVHvBMuVWxa/wWMoI7olKC
	N+AKhFgkmYoa2Z1kyMWQ8ZWOENyxCKpkPteIy01JZronfv7Kd1mjFHtqndnmXMkzNYzgzOUdVVZ
	MsUd7ScQcCw4rn0PatYBQSsd7YVU=
X-Google-Smtp-Source: AGHT+IGqN9iDNZJSAm6K+PFwlMy3pbWwI/DpBGKcj8xEMOj1t6vs9iaNJtiSDXwxBOdv85RFml+VhHEWwu1NK2MxRwo=
X-Received: by 2002:a17:90a:fe0a:b0:2c9:863c:604 with SMTP id
 98e67ed59e1d1-2d646d257dcmr3600702a91.3.1724507448169; Sat, 24 Aug 2024
 06:50:48 -0700 (PDT)
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
References: <CANiq72=y5OjbyDhh_W2FF_v_7mLGDkf3+TbpfYiSGMdWH=_KKw@mail.gmail.com>
 <20240821-colossal-amaranth-mule-2f314b@lemur> <CANiq72n73A0aUbrSHjtb+TB7+emEgjCezeUg3F=PJquyCtNg3g@mail.gmail.com>
 <20240823-benign-encouraging-falcon-282cf6@lemur>
In-Reply-To: <20240823-benign-encouraging-falcon-282cf6@lemur>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Sat, 24 Aug 2024 15:50:36 +0200
Message-ID: <CANiq72mLEMq3ZePB51tSFNt7j6X1XqU+TfX7PnyjYxmLNJJBeg@mail.gmail.com>
Subject: Re: Non-deterministic bug applies non-existent tags
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc: tools@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 23, 2024 at 7:54=E2=80=AFPM Konstantin Ryabitsev
<konstantin@linuxfoundation.org> wrote:
>
> We already do something similar for "b4 trailers", so I'll look into maki=
ng
> that show up for "b4 am/shazam" usage.

Thanks!

> Would you be able to try it with the latest master? I think I've tracked =
down
> the cause of non-determinism.

It works!

Both issues appear to be fixed (I always get Gary's tag and I never
get Benno reviewing himself). I tried a few times. I also tried going
back to the old version and both issues also happened again.

Cheers,
Miguel
