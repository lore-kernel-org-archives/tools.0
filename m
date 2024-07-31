Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04BFF60DCF
	for <tools@linux.kernel.org>; Wed, 31 Jul 2024 19:47:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722455281; cv=none; b=bG7a7l+/th+RAY6KVWh8jEsYmt3Qeyup6kh69jT/u8FofNqGsvkzbdCyVNv7jEqn1viIZZR2qSS1l3n1bEA/4v22n/3t2bCaAsCXDHYEbP7I70gh9WJMxpuENL9aB+kp3aZXAwSkiYJP85SD2D8J8QKxtcSkoIigg18L/8+fLNI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722455281; c=relaxed/simple;
	bh=SGnxCj03vrUmqW44QWHs8mkXNWnTGm4uZLAv/ZtTaHA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Gqgtp3JE/ETVbFRmmkXu4x9QhP0J1xCmfKtUMhP2DHP/8WSOqjc2Ddn8RM22vgXOuJi7Sz9Jr29QLxEQeeFcM64uPFg66X3jc6Fn+xpv09ofPM/aVPbdMAr8MwlMbobY5z8MD61pRLTSOW4tp3yStgqtkZCa0w8fZZ1Ri+qQsGY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ffyWumok; arc=none smtp.client-ip=209.85.167.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ffyWumok"
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-52efd855adbso9033220e87.2
        for <tools@linux.kernel.org>; Wed, 31 Jul 2024 12:47:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1722455278; x=1723060078; darn=linux.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=T0ri+Ge08M+liIYYEgUFT09Fc/hYV0cT8Sde44AgiEw=;
        b=ffyWumokITKw7qtuAb1IFTvEPg6plJaq/d7ydW6T7Ma59GGiqJiRcPQEr7fqX62Nft
         aUz6wwvNNgRilZCUFHD3o0sta3qMN5tFYLUpLKQ3gAIfiinUlmm66/yL/JFDFuwRfrB2
         FLk73weDY2JIqHOpMglyFf4ia052vocY+SfombAJJFT6376H5sof00EhXZeLIYu4N+CL
         3Pe/ZwJI1llEsvcUi6+7+VaA/sjnTM6+DABysMRFFzongz66mDK0bSQoz6aDFuvZFHbj
         9YPYdPrZUpfQwu4Ga03RtfJ8ouLBG8rGRQ08+9hFpba/X+WgVxjemV6ZXPSwEoNmrI6M
         isXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722455278; x=1723060078;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=T0ri+Ge08M+liIYYEgUFT09Fc/hYV0cT8Sde44AgiEw=;
        b=Xpn84F4sSU61zbm/9XKxEYq38GVZ0VsvQa/nQxRj0thw2v/o9uGHHfM3qE8zrRt+2R
         LHofljd6rAHvxGBoaQBbR+jXZsIcUt+a2J8fNTR/f8fd2tOM6vtIQx+7307REuA8fnWa
         Ha7Pelx7Jhdmbu6vZUuFslyVZrh3Bg3bHjgSR6jsiP2DSgaYNOvzXInYRAxMIVw7xHIp
         cI/wiDr5hwYeDdhauYL7SgOpeKUBmM0BTKDke75wqBVCekgJH6VDn9siXCPNMbgo8n0u
         /eEtj/kVQHBnsyu7R8AwdIr87AyLwJ66YVAUuq0I7kCNOcC7BkzlQ+CmUVGNZR63IX0j
         G/VA==
X-Forwarded-Encrypted: i=1; AJvYcCXZCdGsbME3x6kBxZjpl8Tc6bBhOIFzXnffw/q2Dxm2LvNiNPwz9Pp7upZuUYsv+srvFt26+sUvuIRrk5E6BGbx3qVEfDxA
X-Gm-Message-State: AOJu0YxLeBn/ctvmD7EQhChLLSr+cFPmXl64x0TbsQCaWXIX6CiHhqq9
	2dr60R+zc7wg8G+V61RtkEySKB0OsaLHKuIMxpqMMmdiBIkE4rT2YrLO3Tch5WRRuhuYLtYyjQu
	EdxTzk7s0mpXq4RcuhXC2CCOCSBA8K5158dpTgA==
X-Google-Smtp-Source: AGHT+IGPWKUSorkkYrxo6rabt8pGcPpWNKfREiBvUmbYNXPalBZgHYjrYOlgzsI/J94nkz/aKPCHqgbdyQJ2gC0z+Io=
X-Received: by 2002:ac2:5d52:0:b0:52c:dca7:c9bd with SMTP id
 2adb3069b0e04-530b61b8b47mr41188e87.30.1722455278010; Wed, 31 Jul 2024
 12:47:58 -0700 (PDT)
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
References: <cover.1722439238.git.lukas@wunner.de> <70935696913de1e834ede287158a4ab03431b273.1722439238.git.lukas@wunner.de>
In-Reply-To: <70935696913de1e834ede287158a4ab03431b273.1722439238.git.lukas@wunner.de>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 31 Jul 2024 21:47:46 +0200
Message-ID: <CACRpkdZ-Zv8gFQc2L6UZo4Jw83Tv6YEwO+0ZW=pmwBSJ+VHdOQ@mail.gmail.com>
Subject: Re: [PATCH ksmap 1/2] users: Clean up key ids and e-mail addresses
To: Lukas Wunner <lukas@wunner.de>
Cc: Konstantin Ryabitsev <konstantin@linuxfoundation.org>, tools@linux.kernel.org, 
	Ben Widawsky <bwidawsk@kernel.org>, "H. Peter Anvin" <hpa@zytor.com>, 
	Matthieu Baerts <matttbe@kernel.org>, Luis Chamberlain <mcgrof@kernel.org>, 
	Maxime Ripard <mripard@kernel.org>, Paolo Abeni <pabeni@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 31, 2024 at 5:32=E2=80=AFPM Lukas Wunner <lukas@wunner.de> wrot=
e:

> Several user entries contain outdated key ids or broken e-mail addresses
> which make the map less useful than it could be:
(...)
> Linus Walleij's entry references key 746e7b29c50a0166, a 1024 bit DSA
> key created in 2005.  The kernel keyring contains a 4096 bit RSA key
> instead which was created in 2011.  Assume that the older key has been
> abandoned and replace it with the newer one.

That's correct, I think I "bumped" they old key but I don't know what
the semantic effect of that really is, I guess it just creates a new key
and signs it with the old key.

Yours,
Linus Walleij
