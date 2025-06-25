Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F335285C94
	for <tools@linux.kernel.org>; Wed, 25 Jun 2025 08:49:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750841363; cv=none; b=IqTOG7RY+c7bxSdVvYLJNtaYFPb7qEKq27HRdfli2CBEiSSeWFWoMEw48NytlaiKpBBWZQiuy1+zII3pQlqwA2s6Lgk3MOvP/9GkmTJ0FV2vOTFRoD0UCLo8P59dFrsKVDQe5CfwJYgos5QHBgZIridsA41cJnH3G1DItGsqPoE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750841363; c=relaxed/simple;
	bh=nvqiVYP05gkX+45rgrHxV9tn7/eugPV0r4GU2p4dxOo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=A+rJWlBg6xZamqiSKOpqs2Ewsx3LRV2CFA/xII0P9gD4TEUEDaMAED/0r1v1R5jYENB8gyHxYin7tbEiAsBts46ou00bFm/t0xvoeXaig5ukSCiL6O6a2QzXk73pcmQr532DE+TOI09fSX10O4uJleOCemP3CkD8UE8xn4RReXM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=XDMt212+; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="XDMt212+"
Received: by smtp.kernel.org (Postfix)
	id DFCFDC4CEF2; Wed, 25 Jun 2025 08:49:22 +0000 (UTC)
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 1F497C4CEF1
	for <tools@kernel.org>; Wed, 25 Jun 2025 08:49:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 1F497C4CEF1
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-54b09cb06b0so6581920e87.1
        for <tools@kernel.org>; Wed, 25 Jun 2025 01:49:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1750841360; x=1751446160; darn=kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=nvqiVYP05gkX+45rgrHxV9tn7/eugPV0r4GU2p4dxOo=;
        b=XDMt212+++hmF7dxfx1P9e1qNCg+v/++JRxbq/3AG74Ab0wdFURLejndg+8Cyr/iBK
         zIJEoXwjEJCVA+0g37qFr/PfIchMPx2TX/1KQ42PWCzuClsxZs1RlVVaDr+KA/NMNrEn
         Rl88Nuy0gjjP0DGmMnQo188i11kPorHwXtUUlpSj9nL6GPWJXnsw3WD6EkXeEt/Hr8z/
         LEvTYVCZA2p4heEHnV4Tk8g/hQHuve0CGNp4FaEAoGBJZkfO1Og8Cfe4YZwhTfsww+Dn
         9uh0NgFuPcgPwtI3KbQO2EzrLRdZBN40KQ55xjfvq0tBRIhXTFS9eEWNyCMUHJNq1ijz
         BIAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750841360; x=1751446160;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nvqiVYP05gkX+45rgrHxV9tn7/eugPV0r4GU2p4dxOo=;
        b=mDZjcEuA3JtRCKlrnjuFnQGDm2XuTgmprWOPbdfxXBVcJiEQAnxIhfU+85ypRYbbXb
         CoHoN9T9y9zg4yKQoMNoSafY6jNmfzHM2vaUOArQjj5j51eKYPYH4S8ga45ug48QmFF2
         EOUzPR/l7TTwIn3WmRBYJdzjs3VxvKznr7aeLjrEnX2xyyTwbTuv3iPx0bxhYLhPI4cX
         X/0sNXOb7TA31lUci58f9C6O/vJ/vZN5Zj9YRwBKboRZU7AAl/SE0ISGnbhNxJJdjZqg
         JculifLa+d93KofVaNP9S2sYRTbotBmkWREovrHxAXULtb2lqbNOWc4Iv7/a9XLRmFhc
         W6Hg==
X-Forwarded-Encrypted: i=1; AJvYcCWCg8SOt1n4+VK7MD63NCbwQjoXAVF3nptP4tEimAEWKU8MniLjKkH2vSj2Bucz3F0ta3BxUw==@kernel.org
X-Gm-Message-State: AOJu0Yz9cxwOQMwmSAplfSl6kyewoE/9uZe65B6/ajFZ8LnbykT6sJ+a
	aUlhXrN8mNP9j9l2mbUwK5jQEkZMUqgfkTBgR5zvTlE+may4guCiR97bWTE5m90c6z/vZK/lsdD
	ZlqSwRPGm/QMcR5wX6R2WCDYp6L/o/XDPiF3ieolW
X-Gm-Gg: ASbGncuvhXSFbjqyimj6Lg80f0PYZVCGSkgJiDJSkqhedbevC2JQ0bMCzzsjYzsg15l
	xHeCJgoeRQwqEqqsVpouhedV7wLM8BaAPyoZK7E1MdtKd0h34cjUsIqKY78tiKKMDtw2FuCV+NI
	bcDBHz5ni3RB31y5YZLgq3l/f3YZSr8f2X+Q02bXsgvykhctUks5mZEs0g8/KJ5B/vjp4ACrzkv
	KXP
X-Google-Smtp-Source: AGHT+IH4sD/iS/Fz3AfqY3JjQJ0QSUCwWLiwTVvoLWsrtxEtv0ZKRiY1/QvBZtg02yo3iOHVwYxluGoF+g3P5vNH4Zk=
X-Received: by 2002:a05:6512:334b:b0:553:288e:149 with SMTP id
 2adb3069b0e04-554fdd1b64cmr554545e87.27.1750841359942; Wed, 25 Jun 2025
 01:49:19 -0700 (PDT)
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
References: <aFNYQkbEctT6N0Hb@lappy> <20250623132803.26760-1-dvyukov@google.com>
 <aFsE0ogdbKupvt7o@lappy>
In-Reply-To: <aFsE0ogdbKupvt7o@lappy>
From: Dmitry Vyukov <dvyukov@google.com>
Date: Wed, 25 Jun 2025 10:49:08 +0200
X-Gm-Features: Ac12FXxVCyTc9FCprJeDUTUo0n_vww4UVwL3_j6F7uN0V-VcezTdw6FnkszO8VA
Message-ID: <CACT4Y+Y_RQX55fNTLAjEQJYp3TY5a1yYZjx42BYu=vfObWzTBQ@mail.gmail.com>
Subject: Re: [RFC 00/19] Kernel API Specification Framework
To: Sasha Levin <sashal@kernel.org>
Cc: kees@kernel.org, elver@google.com, linux-api@vger.kernel.org, 
	linux-kernel@vger.kernel.org, tools@kernel.org, workflows@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Tue, 24 Jun 2025 at 22:04, Sasha Levin <sashal@kernel.org> wrote:

> >3. To reduce duplication we could use more type information, e.g. I was always
> >frustrated that close is just:
> >
> >SYSCALL_DEFINE1(close, unsigned int, fd)
> >
> >whereas if we would do:
> >
> >typedef int fd_t;
> >SYSCALL_DEFINE1(close, fd_t, fd)
> >
> >then all semantic info about the arg is already in the code.
>
> Yup. It would also be great if we completely drop the SYSCALL_DEFINE()
> part and have it be automatically generated by the spec itself, but I
> couldn't wrap my head around doing this in C macro just yet.

At some point I was looking at boost.pp library as the source of info
on how to do things. It provides a set of containers and algorithms on
them:
https://www.boost.org/doc/libs/latest/libs/preprocessor/doc/index.html

Sequences may be the most appealing b/c they support variable number
of elements, and don't need specifying number of elements explicitly:
https://www.boost.org/doc/libs/latest/libs/preprocessor/doc/data/sequences.html
A sequence then allows generating multiple things from it using
foreach over elements.
