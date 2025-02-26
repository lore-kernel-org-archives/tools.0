Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF25A25A65F
	for <tools@linux.kernel.org>; Wed, 26 Feb 2025 21:38:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740605889; cv=none; b=D5V70Gxoa+7trSts99YOROiV51ZXWx4cIel35tSzIUxgIbYWB0tPL3MZWcjvVhx2tI6/2vb05aX6eM4uZ3y55AcMID1LZcnu5yq+UsyKnfnKgjVfWo9Gf/AHib3lUxL7J8I5SkIKkRgmax+0JpUUDG2V61+v0m1Eg03TXO0gE7w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740605889; c=relaxed/simple;
	bh=ZqBestMUPFwTqZdVmhC1VxizcqbeFwZ7xmoJVpNXomU=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=QirKRtSpbGUqkxBDX6J0ETMUiW6u8yvBT7BcYLsZcbSkO9AIBMrIOP43ZC7vP2bc+p4dElHimw4ut6QFst+ZzkTPH9A/6NX6lPgNilOCzedoWtmS2kfzCP4GvXkxH1uMSeZXmfJtlRFMOvvKFuVZNJUSz4L4bQF6uza0ek/QsfA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=SF3BVP7y; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="SF3BVP7y"
Received: by smtp.kernel.org (Postfix)
	id C5378C4CEE9; Wed, 26 Feb 2025 21:38:09 +0000 (UTC)
Received: from mail-ed1-f73.google.com (mail-ed1-f73.google.com [209.85.208.73])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id D9369C4CED6
	for <tools@kernel.org>; Wed, 26 Feb 2025 21:38:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org D9369C4CED6
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=flex--gnoack.bounces.google.com
Received: by mail-ed1-f73.google.com with SMTP id 4fb4d7f45d1cf-5e4b6eba254so133789a12.3
        for <tools@kernel.org>; Wed, 26 Feb 2025 13:38:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1740605887; x=1741210687; darn=kernel.org;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mGqPzZNS1V+n4kBOnix0o1ofeCkSUT4nSjjh84WDIMU=;
        b=SF3BVP7ywyrx6xXsakoQftgyKw1YpHYNWghXH4eZpBUPaIzk36ZZnCoAJHJCsyf3mp
         YLayI58sqxmiI+TwoUSMEy16S8FWJ1PMQqsG5/iAKG+F79QzKp3DLzRNC+etehO9k0MN
         w6+p3eRJvHArVvfBUpNLjCyfUFeZgqBLBoUEgZn2k+/V6H+OhALN4pdDggw90wQI4Iwf
         YI0n1T3k33Yo2MooYROLMSLeOGp4iFlvXPpXYLtK7geoq6kCs9lFrPEfTvbrfp1+7jS1
         er9m5FiXDzvnL+OFoJ6gAuAowuS7wBM8S+611TjOHqOevhPQGi1xwxY+5a4Vw5U64F8J
         /Gsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740605887; x=1741210687;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=mGqPzZNS1V+n4kBOnix0o1ofeCkSUT4nSjjh84WDIMU=;
        b=wEDZqPG6owcgZqY83limNEpNpn2f+kvXqWE3WJlSczWRJ7h5dV75BlQl0l3+WvRgvc
         fuDr7l5WU9AOyAONQzKO6NsSw8V3dWBRjlfJF/RxtuxPRSYN5GWM4+QE6Hi3lwQxFKyg
         XyB8EYhsrQlwgBHmlTIymiqxJINr2FWf4UPJg085yJ826NyZeBocThLxerK7FPmbpBSQ
         lpiWFiGqx6Hr5ErIt4JyEsGjhiB3usBsDbk0J9wkYbrwSoRY7imcJOr7o9EwuZ26Pif2
         zJtWADkw8KQ4xVDS1bOpirtZWgmaF/NsDxGFSXA1GLCig3baBDZphRAGPtRcbMOxF+yh
         d5qA==
X-Forwarded-Encrypted: i=1; AJvYcCUKx3L7hXpEz4KVc/Yui0x1JNXj7HyEEZn1v+PrgJBvppD9+hl2TJtIGr/+yUMYRQQ2+SmZ5A==@kernel.org
X-Gm-Message-State: AOJu0YwQriotJSJjLSumJQOtufilnv1VbAbuPKLB0P/Ik2nlKK2cRN0F
	OQdamUj7Im6tzw46HQewHwp5dkjgrauKob/zYh+I0AqUb38mf6Ul7o6is0oYWz8a0GktmZAx4tK
	kFg==
X-Google-Smtp-Source: AGHT+IHLcGqlDtLI8Hl2GI2lBKNlphlk5lHlGNFGlyXSH6D0Fyvmh2EVwHw6XlBi6AYMqakwrDecEE1k1u8=
X-Received: from edat28.prod.google.com ([2002:a05:6402:241c:b0:5e0:9ff2:9ffd])
 (user=gnoack job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6402:2347:b0:5e0:8064:b42e
 with SMTP id 4fb4d7f45d1cf-5e0b7223106mr23870685a12.25.1740605887315; Wed, 26
 Feb 2025 13:38:07 -0800 (PST)
Date: Wed, 26 Feb 2025 22:38:05 +0100
In-Reply-To: <5xijgm2hkedx2tu6fjt67ozf2rmvjz6z4zvvcvokymc3hlc6of@xqpnvf23ia2s>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
Mime-Version: 1.0
References: <20250124154445.162841-1-gnoack@google.com> <20250211.Ree5bu6Eph2p@digikod.net>
 <22olfm76rcgjfs4vrr3adtbznsnz47kaehlr3ljn6e5jkc6waq@ue7azstxlwfv>
 <20250211.ieSoo7Phe5oh@digikod.net> <3unkhxarmiddobfjvojx4sdpgitjld26udcagka2ocgrb6c2jc@dcg4w5yk5mut>
 <20250211.oavooPhap9OX@digikod.net> <7vl6uylhzgkokl42bz36d5g3krcusqf7mdy4bd7tblcjckatrw@ullu2kblovji>
 <Z794dm_xmViQ_lFF@google.com> <5xijgm2hkedx2tu6fjt67ozf2rmvjz6z4zvvcvokymc3hlc6of@xqpnvf23ia2s>
Message-ID: <Z7-JvY4DP-CswCyF@google.com>
Subject: Re: [PATCH 1/2] landlock: Minor typo and grammar fixes in IPC scoping documentation
From: "=?utf-8?Q?G=C3=BCnther?= Noack" <gnoack@google.com>
To: Alejandro Colomar <alx@kernel.org>
Cc: "=?utf-8?Q?Micka=C3=ABl_Sala=C3=BCn?=" <mic@digikod.net>, linux-security-module@vger.kernel.org, 
	Tahera Fahimi <fahimitahera@gmail.com>, Tanya Agarwal <tanyaagarwal25699@gmail.com>, 
	Daniel Burgener <dburgener@linux.microsoft.com>, tools@kernel.org, linux-doc@vger.kernel.org, 
	linux-man@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hello!

On Wed, Feb 26, 2025 at 09:57:58PM +0100, Alejandro Colomar wrote:
> On Wed, Feb 26, 2025 at 08:24:22PM +0000, G=C3=BCnther Noack wrote:
> > On Wed, Feb 12, 2025 at 04:06:06PM +0100, Alejandro Colomar wrote:
> > > So you could really use man9 for internal Landlock stuff.  Even if I
> > > think generated documentation isn't ideal, it's better than nothing.
> > > Being able to use man(1) for reading kernel documentation would still=
 be
> > > a nice feature.
> > >=20
> > > And while I can't run all the linters that I run on hand-written docs=
 on
> > > generated pages (because generated source necessarily triggers many
> > > false positives), I could still run some, which would trigger some
> > > accidents in the docs, and would also detect bugs in the software
> > > translating the docs from one language to another.
> > >=20
> > > So, I'd still recommend you considering man9.
> >=20
> > This is different to the BPF helpers; Landlock's existing man pages doc=
ument
> > user space APIs, and the largest part of the kernel-side .rst documenta=
tion for
> > Landlock also covers only user space.
>=20
> Huh!  Why does the kernel duplicate what's already in the manual pages?

That duplication is *precisely* the problem we have in Landlock. :)

(If you look at the patch series I've been sending with both the patches se=
nt to
linux-security-modules@ and linux-man@, you'll see the duplication,
e.g. https://lore.kernel.org/all/20250226211814.31420-2-gnoack@google.com/)

Documentation of user space APIs is not unusual in the kernel documentation=
,
there is the entire subdirectory Documentation/userspace-api for it.

=E2=80=94G=C3=BCnther
