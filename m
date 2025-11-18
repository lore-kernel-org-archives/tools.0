Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 215722EA482
	for <tools@linux.kernel.org>; Tue, 18 Nov 2025 19:56:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763495770; cv=none; b=GyzyeX/KVMY26LYyT67Fae+M0Vq5ckM52Nnt+BVCyhmuplHUcvT+9Js8a7DtVS5QqCwbMyleGlF8xG3uLp5fWIFSv7GyHxo65v9GHPdYfkX+9dNOqlddSuP1Skz8i2iup8PDFM75dgTWOsMnba1mk+jlRPNNy2cQb+7i3kwiP8I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763495770; c=relaxed/simple;
	bh=baP3f/PzZc4d0Zoi2WNsY7vJBjsROZ4rEh3NiorIli8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=XeLmd44x2KEE1k5d2N8Qr8M+DlpK/oNLwukW1CVFl1Pa+tvey2+d/NApktX3MlftiFJXjEnVwMjNZ+uSR1VJNmkB7AMJVf4eN5SO6rPcyhWrUjNjxpCWDHq+Q9Ojc+MBE3Ez4OHg0SZ9GzvLCQS9Z3WFmN65zxWnEXCNPXWKIyo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=j3ext8yG; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="j3ext8yG"
Received: by smtp.kernel.org (Postfix)
	id A0647C2BCB3; Tue, 18 Nov 2025 19:56:09 +0000 (UTC)
Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com [209.85.208.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 75C6EC4AF0B
	for <tools@kernel.org>; Tue, 18 Nov 2025 19:56:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 75C6EC4AF0B
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lj1-f169.google.com with SMTP id 38308e7fff4ca-37a2dced861so1633011fa.1
        for <tools@kernel.org>; Tue, 18 Nov 2025 11:56:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763495760; x=1764100560; darn=kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=baP3f/PzZc4d0Zoi2WNsY7vJBjsROZ4rEh3NiorIli8=;
        b=j3ext8yGvJBHFulVuH97SYfkswnNyB6emo7vMWUqxU3IoqJ0voMPGKKHelU8VYFtaG
         sMHWdsIaUQ/dkI6g+6DquEDTH1jcwG+NDjqyc5sknyaIlhRTnHrynHFMUcvIMPtYGRpe
         qcxdOYrMiFz96ZyYT2bGTeieWsNqmTwRWh1BBxSdVvqicQ82dM8d0wHRs4C53SmCAwcP
         P+QNv3lxwvKhDqypqeK4Y7WIbHaVo9Yct/Ujt91P5x83AaAM8w9MYikqah8WvN+NdXiA
         9xtTlWkiYjXRs0uTGY0dpeeOU/09O+BTwUO+mM2Cq4lvfx2Ei0au7QDajREujCG+PIKC
         NyeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763495760; x=1764100560;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=baP3f/PzZc4d0Zoi2WNsY7vJBjsROZ4rEh3NiorIli8=;
        b=GZjuGXLoEujl7q5rmw3iMGgmgEJORaPO1OGU1Crdos4E0IkWFM8U0btfuO2WkMPJgJ
         1WqYqkwlScqbECghdeIDoKvChsCnLQzZ1FmW6vBDtBqeTn9Fed16ztAK9TNcYpYlOSqa
         FGvnNq15VoYNAXDYIklnrVzgLCau+NUMvJ7I5CAYkTM6f3B0cYESO+KNfJAy/C3VodH/
         JlwbRKZe3gMoVLffGfda36Us6zWkyLJXJC7tiO5bwMcEqG0dIaVLyvFZOXP95YwuMLeu
         l5ssKfOb+elC6mmAHuKjPupoGDCYCy47ONlOLoFOcZBnV4zQTTMN2RTt0HtgXiRxzRlh
         EUkQ==
X-Gm-Message-State: AOJu0Yzil6fH9z59rGgMx0dDRxhzjf+JVjqbZ83yjTnPN07IvjSibJM6
	PXzMgZMtBm84GClxCNhjAyF80mNshVEY74G95z1ShDeBODsBPMig/GZmvU4+11qPRsw93S0U6If
	Nh9inz9gxuoG4tv/owWRUjPx3+Uy78ajxLjuo
X-Gm-Gg: ASbGncvo37/hy8kxBOzGyUhWvxih93jC+qGpZTxc11VZDHwzcCk/GYqJoG9mQ5Q6NqM
	6NZtBAI+jCUHAGGEJVilTCGe/Ezl9+aMYr0STYTjmtNNDfjKQut0Y7G3e73qrEIg1ikcjeDQ64g
	5rTKrMGg4dXMtQKjEZaIqYEit4jFH6dqW//jjlBVgWMNGZ5ss8w4KieTSGOe18OjC+NGXSjI2Yg
	QzeWFoql3wjuPItX1yZyNLY4R/k8mrMrmOardqfD3wbhIyDJBDGgYzE+YOkOa3tns9zCpI8Rycl
	ZIjX02N7u2HrD0W/Ik1IS6ZarWjv37thrO76ZVEZigsoqlkY/NfH2KT77p0V14EH03xvlIWH+/u
	sl7IZljN0ZAdQNgCH
X-Google-Smtp-Source: AGHT+IF5W8n9aZ4+r5lhr8iSyg0tlWZ6p+1jtfeLg95CoZHM4GXorpgJX02Vx724IyxSoaOka5kflUuhJXVGTL5gUNo=
X-Received: by 2002:a2e:a549:0:b0:37a:3910:6c77 with SMTP id
 38308e7fff4ca-37c29117fe8mr422991fa.5.1763495760136; Tue, 18 Nov 2025
 11:56:00 -0800 (PST)
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
References: <20251118-bump-shtab-v1-1-4126cf1d1e44@gmail.com> <20251118-enchanted-daffodil-cormorant-baed67@meerkat>
In-Reply-To: <20251118-enchanted-daffodil-cormorant-baed67@meerkat>
From: Tamir Duberstein <tamird@gmail.com>
Date: Tue, 18 Nov 2025 14:55:22 -0500
X-Gm-Features: AWmQ_blNboVhyaztmeJ5XSxFsVIBW3kShnFEJ3ivOKUvktS__RzQtgxsclJL-BM
Message-ID: <CAJ-ks9kaJZdAk0g-XxQ1_5Dk=Dz1qV-uWyuvcA3yF9L+9RXYVw@mail.gmail.com>
Subject: Re: [PATCH b4] Update shtab requirement to >=1.8
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc: "Kernel.org Tools" <tools@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 18, 2025 at 2:11=E2=80=AFPM Konstantin Ryabitsev
<konstantin@linuxfoundation.org> wrote:
>
> On Tue, Nov 18, 2025 at 10:23:34AM -0500, Tamir Duberstein wrote:
> > This release fixes tab completion in zsh. Bump requires-python to >=3D3=
.9
> > to avoid warnings caused by shtab requiring >=3D3.9.
>
> I'm okay with this, since 3.8 is out of support. However, I cannot take a
> patch that updates hashes in requirements.txt -- for security considerati=
ons.
> Can you send just the pyproject.toml patch and I will then regenerate
> requirements.txt on my end.
>
> -K

Sure, sent v2.

https://lore.kernel.org/all/20251118-bump-shtab-v2-1-6bb1e2f11d8a@gmail.com=
/
