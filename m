Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 119A41D0F5C
	for <tools@linux.kernel.org>; Fri,  8 Nov 2024 12:59:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731070779; cv=none; b=mIJXf4rDOQy+LQRhI2q92rupPIkKj9kO5gnCJ4HYrrUZMSFFPWaDulAxj7rqoCIrt7T83tznTZ1j93oGhZsXQgV7tnfZrKFFMOVcDTdwRISummujl0hKH/rCRXe62K4JwfABUXY8dAxuEJPHcoCB5LUgN8gpYgY0XkbQwgn2KLM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731070779; c=relaxed/simple;
	bh=JsPyyJbG2Cq7w2ug0KeDiBXDsGzn4kjiOes9fUf1cmI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qAjjeKRNmub+25GqezS2jY2/yFOGBGwq2XnO+Pp2IF4jwcYlHZDt7wwY91Fx/cQQYr3FbxrCKZjYxLRAMybZNd1aTz3vV+hG9BYK7T2Kz4A85DIx+kLIsYn0zkninte6mqOKkKQpZ5OWZ56yem3QKYgNNYwkLivpofbN9epCKwI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Md1MEPk3; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Md1MEPk3"
Received: by smtp.kernel.org (Postfix)
	id 9980EC4CECE; Fri,  8 Nov 2024 12:59:38 +0000 (UTC)
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id BDBB0C4CECD
	for <tools@kernel.org>; Fri,  8 Nov 2024 12:59:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org BDBB0C4CECD
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-539e13375d3so2408184e87.3
        for <tools@kernel.org>; Fri, 08 Nov 2024 04:59:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1731070776; x=1731675576; darn=kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JsPyyJbG2Cq7w2ug0KeDiBXDsGzn4kjiOes9fUf1cmI=;
        b=Md1MEPk3IX44yZYUFi/NRpeZ0hJZdPVeRhBzPFWcCfKwpHRLArpkaBpwuDveGO/mBE
         nqU0Oo4qvBvcE7RGjnKw242T/5PN3ICah3mCpFk5rsmcgDhk1nR6qHgT82ssNHC1cMJ3
         w1IH+soF+qv4UIgt6Z3Ijo6ZZ+Et5iXgcPks5CCs1WXu+Tgln4TSMLlNmOj31j7GChU7
         anIB3EJwAiy0y0opMmMkbieLkSx3jEWu7RaXwzivNcqaUFKVFRnAwkC/E1m3XeHEZTgk
         +uIUuBVOyut6NXz9mw8BxcrEOMlzR76Kn7f19zdUeKmGpeVDrqyjopkC/Nfr0jvMYUeA
         NQhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731070776; x=1731675576;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JsPyyJbG2Cq7w2ug0KeDiBXDsGzn4kjiOes9fUf1cmI=;
        b=osC8L6aGkTLL8sfL3op/2FqHg6X5MLgnJ4QaNAwKXlATSwBfyfQEOrMP22i2ZPIZiI
         UcWhHUzxY0MRXlDjx5I5nZx60rKerSRlRAd8tnPk/Fg5Kqay3LIl4OrQwcf99MVy5HEV
         puN3TQN4qSkOo4SU2f5IPZtFsmTqFU1NW29FIKS5ADjCUiaX8AbSt++Cn3Oo2rpr7jKs
         yliyGEe3lOkG8Y/m0b/8OZxTRmsPBtXja51wJxYQJnA5xGJ0oRFqyo2Xcm27F2ltL2um
         IPQQ1+FSUOMEidL3rvogn9sTQZ448slc7U6Yuz+OdTcP1J+ODJH5OXYaaw0FobTWswH7
         GwJg==
X-Gm-Message-State: AOJu0Ywa1mXTN6BzHHiVlLiJI0xXWj/8wEwiLZxc/8UCmiqxFklG5WRE
	aV+YzkWT9gGZocZGZ9GbvwnQJ6tOnXrbnrsAoV3GfY4auoGwQu6VZneB3Ob4GM9BgUWPx3tgk9E
	LevAaOhc+NzgjMkJP9fo4ecvPhB+qDw==
X-Google-Smtp-Source: AGHT+IFp4g1/EhPEzQFufZSJD/uHzUYL1MRBBFMYtsfQf9Hyo+2XIhp/f51Ms2XLOB24fqIBjn3vQxq/djShsBP8yk4=
X-Received: by 2002:a2e:7009:0:b0:2fb:6394:d6bd with SMTP id
 38308e7fff4ca-2ff20150277mr11417301fa.12.1731070775631; Fri, 08 Nov 2024
 04:59:35 -0800 (PST)
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
References: <CAJ-ks9nCK9G7NKPKncZ_29sJZA-=8SNjxZBhY0VacF8PzX8pdw@mail.gmail.com>
In-Reply-To: <CAJ-ks9nCK9G7NKPKncZ_29sJZA-=8SNjxZBhY0VacF8PzX8pdw@mail.gmail.com>
From: Tamir Duberstein <tamird@gmail.com>
Date: Fri, 8 Nov 2024 07:58:59 -0500
Message-ID: <CAJ-ks9nTv__ugwtbrkn-3ZGBq9sVe028d8q-u4ht+fJM10jdCg@mail.gmail.com>
Subject: Re: b4: cannot resend after creating branch from sent series
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc: "Kernel.org Tools" <tools@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Oct 26, 2024 at 12:29=E2=80=AFPM Tamir Duberstein <tamird@gmail.com=
> wrote:
>
> Hello,
>
> I'm trying to resend a patch I originally sent manually by importing
> the sent series into b4[0], but this fails:
> ```
> b4 send --resend
> CRITICAL: Failed to convert tag to patches: No such tag:
> sent/xarray-documentation-v4
> ```
>
> It seems that b4 uses tags to track sent messages but these tags are
> not created by `prep -F`.
>
> Is this intended behavior? Is there a manual workaround?
>
> Cheers.
> Tamir
>
> [0] https://b4.docs.kernel.org/en/latest/contributor/prep.html#creating-a=
-branch-from-a-sent-series

Hi Konstantin, could you please let me know if the above is intended
to be supported?

Cheers.
Tamir
