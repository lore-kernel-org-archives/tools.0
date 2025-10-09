Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4312205ABA
	for <tools@linux.kernel.org>; Thu,  9 Oct 2025 15:37:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760024233; cv=none; b=RjVg3Anu9/eIAddg4ke994ebHx4XQPnYzVj1664/5SlKDkxYIeqDpX+0t2bHynRSxE4ZFPAIeoLL+AgtqMBDkc2atSlVXP6EIvBEJjGUN2MZ7F6DaUc1iYgGdnX9Epr5yXOr8arVuepgMRCsGtbF3GMrV+hX0WrRZklk6Zg62SI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760024233; c=relaxed/simple;
	bh=nFwVybGhWgSIB2V3EGHGn6GcP6taTH27LE8TBtj1VC8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ohtX5BL8ylhhvaYpI5ixtPGP0/h1P7Doq83G+Vsg2NjKb8YPvn1Jf2G8JK+luto1v+cu7SSHmKagDGlq6LjsVaRVHzp9mIjOUQiKsqJ0Yo7VzdJnwmEcUFjYhqqvvBjuCm6fNYdv6rZ7qqPq/kxCe+R8gmxZ0KijCgHiQmDxlRs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fm2bS4Ec; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fm2bS4Ec"
Received: by smtp.kernel.org (Postfix)
	id 4049BC4CEF8; Thu,  9 Oct 2025 15:37:13 +0000 (UTC)
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 5D347C4CEE7
	for <tools@kernel.org>; Thu,  9 Oct 2025 15:37:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 5D347C4CEE7
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-b4f323cf89bso196454666b.2
        for <tools@kernel.org>; Thu, 09 Oct 2025 08:37:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760024230; x=1760629030; darn=kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nFwVybGhWgSIB2V3EGHGn6GcP6taTH27LE8TBtj1VC8=;
        b=fm2bS4EczVDpOuv3qnRRwPYNrdb0kR0KUwyyBC1gM3dgifUgHl4SVlYdhkvVGb2NXy
         T3elOEq3Gnu+ugvOfQRADqWzJTDRqBN/sdsdeSfZLUPqSFUmLeWrHre4+bcygBZ/e45S
         jng15jk9TFZ3CG6eUxGLSkK3XDeIeOUyp1jIuTsUw3viBoVcZXXFp3z2gwjsaZyFeDWt
         t5nBG3QVWNowzrldTIaCUPB8j/F/CK+IKotZm0KhDv10bmXLt4c0TVhC1VMoZCnSFdX4
         lxbI/3tFLp/xnqYe50FeRJtPzyzr9TRABGAkL/yjjpG11dqSFdj7eg6bMzr4OYfwqlGV
         +IkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760024230; x=1760629030;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nFwVybGhWgSIB2V3EGHGn6GcP6taTH27LE8TBtj1VC8=;
        b=fNu3BWLSnuU5ntgyMp2M/FOLt5wejVYf++VHIz7QVFTEplnaGIfCblJqvQYXeO7wnM
         /MG7a13bBTsCByLggGDYOJC8ow9m2E5venK/1a5ukAaBPMarArsyIgvMu/jA/YcMxI0O
         PUO/AJEtnomphgvzjkEMqRYLEnrnf5wEZu9uxtC6DZzIDW4APcD7ps2egatONjLv3J3T
         Mwsr+N8uqdND/71D1hEGwGL8+ZdOYmGAsF1Cr4nyT+xtBEKOI3XZk4ErgcBCG0AmUL5S
         LACnjU+HM2gUp29cDfawFTqFygXO41XNVIvaGyT+6A+7BvsFwDXSrmWxFIn6bj7LOws8
         dp4w==
X-Forwarded-Encrypted: i=1; AJvYcCXsoLgyGIJ3dU4wn70bPqXxShIaRGrBSKqoGclvTuS3TPRhkxBJYBD5ebTCGBskgWSmhFlp0Q==@kernel.org
X-Gm-Message-State: AOJu0Yz3PvlYktqLjUk8zLukagv9H4i3oVz1+5hnnMYDKIfTsKP8muyC
	TDCIWm8MYMbjkD5frZTzfua3fLjQjcWvBI4fRyH78b9YgKlBI/zpmYEoMyVhs0Jg10T3v600Lmk
	npkluLp/U56z5QStBp4pj6/d5ckTyVQ==
X-Gm-Gg: ASbGncsxewzYTqOFQhRlIHQzD3BIijjjOoTATt5zk61yzIMgwA4f3N6DipGc5WMwmY4
	oAkYYtHZvy34BdS5agbXE+qu0ZKRMpRzsYRgasKAvr6BdxkkQwBG9HluyaXtcc2TNPPt/M9FJXU
	rPdTXAupFY9ACI7j3JEIQdygZh0aE3uxMMK6eeUcHpgw8K5IF61SxHrSfGLGRifFaDajbz8Pzzu
	0ir38BRLRUEIiZbzAXbmiid49xxq4BRVRExeF9wAKr/QVVVOc6arRlwtmDMTozf
X-Google-Smtp-Source: AGHT+IGG1yT1w8RxR9MUzUXXbxrFo1RyNHW7dG2dOZ116ISki/7x2vEaqY2kGJ+5cZ5w3vfs5l3bo9LDj/LHIaCm484=
X-Received: by 2002:a17:906:c14c:b0:b30:ed1f:894c with SMTP id
 a640c23a62f3a-b50abfd044bmr894303566b.43.1760024230347; Thu, 09 Oct 2025
 08:37:10 -0700 (PDT)
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
References: <CAL_JsqLLOnpAHM38Bv05JdC1o0rS6eUG6WXgPHfnChs2n+AuWg@mail.gmail.com>
 <20250930-b219672c2-c7e4ae042365@bugzilla.kernel.org>
In-Reply-To: <20250930-b219672c2-c7e4ae042365@bugzilla.kernel.org>
From: Rob Herring <robherring2@gmail.com>
Date: Thu, 9 Oct 2025 10:36:59 -0500
X-Gm-Features: AS18NWBXo4Fbmu-8A49dk-bQLvHEJfKlS5p_CWPlspt2yRHyJCKg0EzDxrFxC0Y
Message-ID: <CAL_Jsq+Jxxyo=A9DtywQShk-LJ6x5QjwJ1D5+5-Y5CdYk--Ynw@mail.gmail.com>
Subject: Re: b4 shazam base-commit handling
To: Konstantin Ryabitsev via Bugspray Bot <bugbot@kernel.org>
Cc: konstantin@linuxfoundation.org, tools@linux.kernel.org, tools@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 30, 2025 at 5:30=E2=80=AFPM Konstantin Ryabitsev via Bugspray B=
ot
<bugbot@kernel.org> wrote:
>
> Konstantin Ryabitsev writes via Kernel.org Bugzilla:
>
> This is now fixed in 8c0f498752924b3d8ae9ee12bfdc2471c6e64515, but I forg=
ot to tag this bug. I'll also backport it to stable-0.14.y.

This broke some of my scripts. That's due to my parsing of the b4
output to get the base commit which changed. I can just fix it, but
that's obviously fragile. So what's a better solution?

What I need is to run tests on the base commit and then run tests with
a series applied (and perhaps with each patch applied 1-by-1). Then I
can get just the new warnings. b4 can select pretty random commits as
the base (e.g. tags/v6.17-2-g8ec5a066f88f), so selecting a tag doesn't
work.

Also I found that what HEAD is influences the results with shazam
-H/-M options which I find not desirable given that otherwise doesn't
depend on the worktree. I sent patches addressing that a while
back[1]. Even with those, I loop over the last 7 linux-next tags in
case the series doesn't apply. It would be nicer if b4 could try a
list of branches.

Rob

[1] https://lore.kernel.org/all/20250108231203.1209721-2-robh@kernel.org/
