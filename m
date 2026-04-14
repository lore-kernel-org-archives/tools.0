Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1154C2BEC34
	for <tools@linux.kernel.org>; Tue, 14 Apr 2026 23:39:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=10.30.226.201
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776209965; cv=pass; b=ly/Iff8TUquI/59wsWZtsudgQd7c2yW79jXQ2b8ozPZKIUfPpmtvald6EulfHJYtKsxwe5FSswUxh+KYcRp7vlfk8MksX4kbmyryIFezVgKvWd4ziJcUdP1zojopKNBpiz0KLCvQql9kZ6tx6MSDFGs3THRXZG+VVrGUY3RTb1Q=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776209965; c=relaxed/simple;
	bh=IVji6x5gwpJKQrsoMUjNv6OHwaXRStzPlFtaZ/O/jzg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=UeDD1zhLR+DfrFiO4CmixyUFxn8meCwW+gvK4pNcRxZpJu1WK6wqyUy7Hp49XFTkOjKqgjj3UBza1DHjJnxEonnHTWPkUTb/EbIFrrusyG7DGzICa4CaVT0vezYgiwOkxO42uwIcAV4ZeqpMzSBmi/g1hTAzY4pGVgs9UTaEBlo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PJTSjPzj; arc=pass smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PJTSjPzj"
Received: by smtp.kernel.org (Postfix)
	id B7F2DC2BCB3; Tue, 14 Apr 2026 23:39:24 +0000 (UTC)
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 07FF9C19425
	for <tools@kernel.org>; Tue, 14 Apr 2026 23:39:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 07FF9C19425
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-5a3cee3a271so5941944e87.3
        for <tools@kernel.org>; Tue, 14 Apr 2026 16:39:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1776209962; cv=none;
        d=google.com; s=arc-20240605;
        b=K52/a4dEbwkeDWfphRAv68YZoJrLnLo8fTFypyCWCf2aU1Wr2jz19lILCDhilPhiVG
         rgr+ABPXHxyYkP6QaJ3rEo4e9fN3swUV93TD+HB8L9DjdWRBNydiyq+Def5QUbSdoDrt
         5Fv3aZonIQ5LsUODSJJqoIsD3ybCKAKNmpLchxjA1jDgWmO4VBya928UeG28SvRCNeKZ
         OOzyl+RYMnakNhXOrcTFILdc+BmjeB+qV1aVp4rRNvU7wlYSDvcJ5UtzODkmnPHsetCS
         kHLKWD7jTPl0PhKo0wjFtJd42hXB3C+wPr43XaxEKfLba5M8JMO/aYrSS2wvcScAsdvf
         Cl7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=IVji6x5gwpJKQrsoMUjNv6OHwaXRStzPlFtaZ/O/jzg=;
        fh=IJqJYq/8aA5bZ5zN54OMKN21XKKG5OJ3sR8aAJnlCLI=;
        b=c/ZVQfoHes3F3yig6oxqmH5Hrte+FWK45zimjhtis7D47zfsoqBycgDiFAO2UqP9Py
         n/WiQqdnOWGPxOLe1BcpjRZHQyEcBAMFrO4Fi6NETG0Y6gGvpkMXQ6ho6c0H5rgWCF6b
         Ntyrb2VOA5YFk8vclkMXrbdhaMH6KNCHGbEnqwTm/beiRzC3OguzE9uysPsUyCVzFM9w
         L3KnljfniA37T8OvxLvYS+400r6k+KqQYqLFGJi9KF+lfsAEK8cNpa9z/5On1Kh6EgJN
         osn4Y4mgYx4spB8DxMVtgPiJkoynq3QPKWfba6gG7evCG4pm5XKjKp56m29i+vVu3Uza
         Q3aw==;
        darn=kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776209962; x=1776814762; darn=kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IVji6x5gwpJKQrsoMUjNv6OHwaXRStzPlFtaZ/O/jzg=;
        b=PJTSjPzj2b/CUe+7bIRocwP0ILOwh4g89cIRDXC9dM+B2nQbT6xvmeqvLZPkS7zSYE
         qqEaqg+4MUUohafs5Yi/Mqv/N7+yzH1aZ/R6+HI+RX3FiiFmyeuIh79mXzJyiGw/xBgl
         H0owdd2+Gz9gmv+ggFDiiFdxOQRxNun6bZoYK6cz6ddDM/t4fqXR8hsLaYbEovF2uKE8
         oSvNb7lyTDvJZIkg1vVlaoqdvNGaeAPAx+FKVaLdWqo8M4cijuSzKmxQIFpq45uFdS5g
         ZFnkVhmU8HaRkmx14Tp3mPlntJ7ak4k2tDr+xWrHQf63qeVg9cpa1P/oahy9WNAN0Cro
         5QfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776209962; x=1776814762;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=IVji6x5gwpJKQrsoMUjNv6OHwaXRStzPlFtaZ/O/jzg=;
        b=SHCM9SPRDj5X7svW1xP2wSWPP335YkS2adxo61Yf1SI89B9d/OuCoyvGoAttvI+ZEB
         0qEoxWlaNxMB1UTXerD/nGk5xoGwML5t5FP4BBHhvh4hafNNcJlI1yAGCWF2r0RjJMhQ
         ERJxM0a8WF5YQUJkjy1pO7VMfTTtbaeHukwg1upnAuMUh+mOecGwAwmGPGEoVn8qOpKG
         RFME0QFEoSqYVqb/m/CRc27hB7BCbujP1L0waJgXff4OFCpuqusjGPMS3U7pj8mSY1y6
         EL/ZRSTjbuQG8xqt5wAQPLwQvrDw6brP7PlwBwmi6CCVoxkrstrtI4gv4W2LCPzzVezU
         0A4A==
X-Gm-Message-State: AOJu0Yw/rxTwxgNJZQUjhwl4W7UKI9vv8zIZiumze0xxfPfS/H/VXPzO
	1hQrthCMSF4EwkovPlDTZzs6jaqqxrcYNk+a1t1weJeBTwTtpgaR71Q5/yt4O69LB73HcLzIX9y
	bnAGBVrHYWj5XKiz+TQ2npv3ptNaYhW4AJnla
X-Gm-Gg: AeBDietbD2M/usLCcCEFtaMhDQyieVcNOIjvrMeSEw/noYOjL8lL0ROJ1kZZhoeTsOT
	UBXscm0gia5vfZce/CWwQD3dkj4XvL2vRi9r4exHP/nQFmZ3QRLKJ1xITUrlNVoCYczcBX6J1X4
	EAXFg5WvZyxnp8Ki2Xuk5YqZ8oJhTszjxjRY5R+6qBUvObJhYBBJr+3BUIADUZXyvj6CZ1oo4i2
	nyWMUS4UXDjOIBUmxWyulsi1Qb8rmOIwy4g5GN4oAWqYA5+Z+0H4tvok5qmaObAw7whuA5rltuE
	S037hwGHJ7jfSmZ2WWqeQZYYkQYJNWlRcpZXr8xb1yBM/L1wD4I8bjtYi++5e0159IVdKzJWG2J
	K5BcRT9cTL6gphSQv5w==
X-Received: by 2002:a05:6512:b99:b0:5a1:2332:68f with SMTP id
 2adb3069b0e04-5a3ef6e2732mr5344403e87.0.1776209961853; Tue, 14 Apr 2026
 16:39:21 -0700 (PDT)
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
References: <20260413-harden-type-checking-v2-0-1ba6056288d9@gmail.com> <177618771367.847180.16159053169602920819.b4-ty@b4>
In-Reply-To: <177618771367.847180.16159053169602920819.b4-ty@b4>
From: Tamir Duberstein <tamird@gmail.com>
Date: Tue, 14 Apr 2026 19:38:41 -0400
X-Gm-Features: AQROBzAf5WiYdPw9d5H0w_TkfzJipeD-HCRv3WULtqVRq_KmNdvIULFsk57Mkvw
Message-ID: <CAJ-ks9=sT+7_D+QnN6RLid-1izKLWZqTcPwqVB+dAdRr3Ns5_A@mail.gmail.com>
Subject: Re: [PATCH v2 00/14] Harden local type checking and test mocking
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc: "Kernel.org Tools" <tools@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 14, 2026 at 1:28=E2=80=AFPM Konstantin Ryabitsev
<konstantin@linuxfoundation.org> wrote:
>
>
> On Mon, 13 Apr 2026 18:08:14 -0400, Tamir Duberstein wrote:
> > Harden local type checking and test mocking
> >
> > This series raises the local quality floor by making the type-checking
> > tooling stricter and by removing test patterns that rely on unsafe or
> > poorly typed mocks.
> >
> > It starts by wiring the repository into b4 CI checks, then adds ruff,
> > pyright, and ty so the same checks run consistently in one place. After
> > that, it removes suppressions incrementally by making the code and test=
s
> > more explicit and better typed: typed keyword forwarding in
> > from_git_config, a typed authheaders integration, and test-local
> > subclasses instead of method reassignment.
> >
> > [...]
>
> Applied, thanks!

Thanks! Should I revive the b4 series, or wait until you've bumped the
liblore pointer there?
