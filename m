Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2F5D397E6D
	for <tools@linux.kernel.org>; Mon, 13 Apr 2026 21:57:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=10.30.226.201
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776117462; cv=pass; b=asy4048BBTpw3DHpWwYDAyRp+oGTJ2EMZY522boSB7ADfDslVwmpExxJGIg7MuFFRhYnuIIHO5cH8u9RYy5b7xs5DS6Cw37iXCuya6Fx4e+J03mTDfeaODJz+DBAuuREPvw1ZY+a1R5/R0q447FQtiqXsSpCLVD8PuS7UHrdAyo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776117462; c=relaxed/simple;
	bh=etQpLBMZXOt5Qlup+67iFF0bklb/QXJjeR6PqcH7ffc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=H2MY0ekH/CbOAUcrWKqAP+uPk9Vx07SfN60yxiwxrLBI5+m9pXsa+x8LiQfRCRgdNqnF2bV7JuNZeQgXF5b4r2h3ohJuucDRuLIT5B7Sqdb1xgAAH+SqbeT2IY6b5JTC/KrsQzglv+uAFzs703nszXHYyeDshg14B66Leo6WBAo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Hmlrc+Al; arc=pass smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Hmlrc+Al"
Received: by smtp.kernel.org (Postfix)
	id 838E1C2BCB5; Mon, 13 Apr 2026 21:57:42 +0000 (UTC)
Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com [209.85.208.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 4C344C2BCAF
	for <tools@kernel.org>; Mon, 13 Apr 2026 21:57:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 4C344C2BCAF
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lj1-f171.google.com with SMTP id 38308e7fff4ca-38e7d983f50so15180991fa.1
        for <tools@kernel.org>; Mon, 13 Apr 2026 14:57:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1776117456; cv=none;
        d=google.com; s=arc-20240605;
        b=BMkeUh7+Y9cf6h6XoLe80sSpkKgi203Eb1EtwVnUN1TxfhYys4ifa3dLolqBFl+7Tb
         AALKIk8fvOVX184fzMcnVIRtJp1PaAXnHrcAf0MCO5OPvjv/n7nt4J2CfnxWaBKNsN4N
         Xj7ChslNtzWof5VjdHOgx6OONWofHHvu3F/cviKWriNWEqhCn3CeDnYtcJxuGtVinzsZ
         /LniZyy3lkRnkzTbU1rZyei0ksNkn/h3kX7TI7ebTvyaxm+3sOfNZrOGHWwx4RHUcv06
         Qx/D5WkBez9WRJBPuD0HeqpLaV4XxZfcc95OAzjEuFTEiO+UkLEQFyu7MJZp6RV/Bshg
         x3og==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=etQpLBMZXOt5Qlup+67iFF0bklb/QXJjeR6PqcH7ffc=;
        fh=IJqJYq/8aA5bZ5zN54OMKN21XKKG5OJ3sR8aAJnlCLI=;
        b=Vto3qj/ltnXFysqRs+iFP8kWHBEiT5ZKwpqYo/7MmPrLhi88BKNybqSECX4OD6RMdH
         eU3Z1lqvuahpc1R5CU/Xvb7UpUrMSkBSz890ycRyLyVpSuoSR0UvtOggG2Up8KOBcYwC
         IhXpGzfylG62YaUVYRfoemqpeuFInIOdvot48xjW2OEY5p/lCxBBEjMJ31W54QiRHGVs
         N2OOfBcyMWthnB2XZR1vusoPUXHJpu8LHhbYZ7n6W2SgLENiNjPazM8HfC1MV7hCJGbI
         t2qusETG1fowX6PUmI+bcTqOkLDWqi6QKjAp7UFxCTmSjB/quKqO0zEqEqPKN+onS3pv
         WICQ==;
        darn=kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776117456; x=1776722256; darn=kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=etQpLBMZXOt5Qlup+67iFF0bklb/QXJjeR6PqcH7ffc=;
        b=Hmlrc+AlERKIenC67uEYTjdokzBrcSGJ4T0VIrkTjySD7zjk3VRE5kUd5hJzkftzo7
         tvBko036dFZV8BrI6eg8+lEv4Wm1VKOgb7QAp+JrYWSoF+E8jRMmONImY4s2/HoFCejQ
         JsptNXPLTiJto+U9wuVma2z6VLIFuWfpLGjPVz2H0F5qQ9kPOXGx7UOsQbLp4a8faJcQ
         StQRbtNS3qEKVpBwwVLJVqSLO3g1n1HDkyY5egdgGHbFhIcDjLQFClyd73ibMIFOgCuu
         dm76Nf7Q9vItMylNhQ51P6QkHCkKO2hD6tZlFNXg77VilR5mIApuSb6DOlDMMg52yf5P
         ywfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776117456; x=1776722256;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=etQpLBMZXOt5Qlup+67iFF0bklb/QXJjeR6PqcH7ffc=;
        b=BwDcwO+ENeFUb5tvRoEwaqWSOwLMoecCLbEQloUv1mtvP/eqytg50KwFG7Hb6ZtblN
         xGzKEKOhDOWsUIdWDI7RomFX8DULZjPplKcM5TATqslF3GnPFmEnc330UOKzn041TtrQ
         BAm/HtxQNW0KPq1bEzCkMwFgmEZBNoTSukT0CxXp4pqOQ3QQGuydlNwsrNeuONafaWfD
         0ZRC43s5ZpGfHfB0NIbEb+5F/BK998xo/1BMb9QZ5IJdHcFnhhv1GD7x3wX4WkFukIvB
         rzXyBV3OMt6H0B67P6ABshRk3Wg3w4EG6cniQUQ92ZL3TQouzI16WupDBZTC3NXxEFXU
         aw1w==
X-Gm-Message-State: AOJu0Yzyb6XvtEJiNGpMeQOiU9sympTiax8+z2CPZ1Vg35XcmNLUauyR
	tkU4nhs3r/+jn7tUie1gt/ncD+7poFFKGawC4p5CdP7kxnW4wnstGEcXl8yq2hxziRsZkYBENzu
	oo4VsMny8xBX0gBGoeGMPBuDfPMC0VO9H4yom
X-Gm-Gg: AeBDievfcD++k9QFH5d0BQfcILX/ZiwQ/0w1P5D6zI1Z8w1YtNtK7Ye5dl8e+bqI6+k
	jlj4TGipzN1j03+X2wg4RhMiEtR3sCe0AejroXA78+oF2d5iMKEBRUY77DJpd80/FpRZFWdfkVy
	XlrYd0mZRRUM/uPkkpKl359ODdSEe7lEVPVbGUvyRZLvLKqIt9Ke6gtzJCucK1rN+bQESo/V9b9
	ridX9AYNEYUH4KDuek1DI9y2OsG8OTl6rxGGyve/XKCqHE6p1is2gBx57cbKug3hKuFR/CrgNIH
	SQwwfqdtyPQ1+DCBfnmlxmNYCNnrHivyIq+2e7rvyBgDVhwHYH4Ig0IA+uKT4cf2XqeAFBxgonr
	dt7yP/QXAGj8JnSeXncr/jdbdNPUhV7GwM6Iz/Ymb3IOToHkJYtiE
X-Received: by 2002:a05:651c:198f:b0:38c:bf69:64e2 with SMTP id
 38308e7fff4ca-38e4bddb862mr42993111fa.5.1776117456132; Mon, 13 Apr 2026
 14:57:36 -0700 (PDT)
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
References: <20260410-harden-type-checking-v1-0-fcf314d9d748@gmail.com>
 <20260410-harden-type-checking-v1-1-fcf314d9d748@gmail.com>
 <177611517998.749969.8235396053359093909.b4-review@b4> <CAJ-ks9kr8QPp5jx8QRueN+XOCahTjvmMm1nK7KgbLK4+szbNmA@mail.gmail.com>
In-Reply-To: <CAJ-ks9kr8QPp5jx8QRueN+XOCahTjvmMm1nK7KgbLK4+szbNmA@mail.gmail.com>
From: Tamir Duberstein <tamird@gmail.com>
Date: Mon, 13 Apr 2026 17:56:58 -0400
X-Gm-Features: AQROBzBZyZ9SBZdvshaYPwKkMrLfvCxRTMY0QQu1JGtblrnLp5yRE292Doir2fE
Message-ID: <CAJ-ks9mnEqeNGPTPy9qC_6mgmxSLst4hMz9XoNTdainDCzxWrg@mail.gmail.com>
Subject: Re: [PATCH 01/14] Add b4 CI checks and mypy suppressions
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc: "Kernel.org Tools" <tools@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 13, 2026 at 5:55=E2=80=AFPM Tamir Duberstein <tamird@gmail.com>=
 wrote:
>
> On Mon, Apr 13, 2026 at 5:19=E2=80=AFPM Konstantin Ryabitsev
> <konstantin@linuxfoundation.org> wrote:
> >
> > On Fri, 10 Apr 2026 18:37:52 -0400, Tamir Duberstein <tamird@gmail.com>=
 wrote:
> > > Add a repo-local b4 CI check command and helper script that runs mypy
> > > and pytest so review status surfaces local checks in the b4 UI.
> >
> > No, this introduces a hidden vulnerability -- we're running a script
> > from the same workdir with code modifications. A series that modifies
> > tools/b4-ci-check.py will make the code run with permissions of the
> > maintainer.
> >
> > I am cognizant that this is what we do with b4 review and checkpatch,
> > but I already have a fix in mind for that, plus a check that will
> > specifically refuse to run a script from the workdir of the series.
>
> Shall I drop pytest from the set of commands, or drop this patch entirely=
?

Oh, I misread - the objection is that this script exists at all. Will
drop this patch.
