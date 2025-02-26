Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C5682745E
	for <tools@linux.kernel.org>; Wed, 26 Feb 2025 20:24:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740601468; cv=none; b=r1NhJ/nAqccmyHLoWf6UYWqKkkw5ok2P4TtZnaV4Ym25Wu/DFKYF3iB7p1i3pl3cfD+GpdEi2jTzmKg/XhiecBnX/5Zr4GS2EQLi5Fkd5QAlTBEQlZqTf4SIX8iVHldFldLjni0hGerZ1qZN8aDD8Nhk5l7xFceb49ZkixyFQk8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740601468; c=relaxed/simple;
	bh=iFWhRPyJmvvsiybpf94Dpp37+uigPtTulNHGuHIzrH4=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=F7e2uN+Zue7dpNNlsOlUHYoaJzds7LDOCtLSUMwyUBgSegXYXOjMkbnzRdnMipnB+v3amKC/wGGEq3ZAsnrt/2+W9GxOrZiZ461ShCd1+fE/Rbhojl1SRCc5ZMbBbeEKI82eXguVd6/62CIdRiNjZ/c0zoI80vKtwwGrgRMevys=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=vNlHOutE; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="vNlHOutE"
Received: by smtp.kernel.org (Postfix)
	id 7680BC4CEE8; Wed, 26 Feb 2025 20:24:28 +0000 (UTC)
Received: from mail-ej1-f73.google.com (mail-ej1-f73.google.com [209.85.218.73])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 80D8AC4CEE7
	for <tools@kernel.org>; Wed, 26 Feb 2025 20:24:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 80D8AC4CEE7
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=flex--gnoack.bounces.google.com
Received: by mail-ej1-f73.google.com with SMTP id a640c23a62f3a-abec83a498cso21072766b.1
        for <tools@kernel.org>; Wed, 26 Feb 2025 12:24:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1740601466; x=1741206266; darn=kernel.org;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=j5HjEmf6zI3uVsACPtj0IDjnQzDbyRsoOFTng7ArnK4=;
        b=vNlHOutE5pQcS7dm/9J0KusIcZ3G42hni99g/hSauMkHFiFPDQkWueMMzJubBIjiy2
         NXhMBoMZNuMJxzZdLA6JBTu5Wy70yO0cq6CafnQ97XIjdj+bbOMi1gKAitqYlIP/B11J
         RYn4bv6rdvPQg5P+wtlusEadoZiVi+X7HdyQK1crxObfDTc0RsA0GQnYrq37uHespQda
         2sjBO16WDRqXjlERDTxVl6VRzhQ8WwtpimAF3GOcmxKmId2P1guIziA26muXxEkNoshW
         OU0ZnCxm/6+cZTT0FC7Ltj45PbBf6a4hVEBd2nsYXbncf2de+N+Y2Wne4Mnoi8coesZS
         neHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740601466; x=1741206266;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=j5HjEmf6zI3uVsACPtj0IDjnQzDbyRsoOFTng7ArnK4=;
        b=qx3CBLNTaZqcTyhwIKsXpKoDqQcf6rnTW5i/xCHGvCm+BGBJ/+zwc9e2Tjny0kLxe4
         mssA1EZqEA6tB7yuimSTdZ13O7YjAl+sPlQKuAidzq8sRaeHnUsKGLA1QN5l3nTMjo1V
         lyL1i114BS0B+hpr8JFFwMcEq31+tQnS2W+SdDtFTwNa+zZY6WzcMPoKHgi1TKW1K1aW
         Od7WzUuoEEmb364v+30W2UpyOHK5HksF225c4ukY6Q+Yc9VDiltJnSKBXA+urkjyW7Mo
         QVm71M3O5hH9RzIam+fP2J/7JHJWNdMyh5L74Gd8wGl4jYUQegL17LAxLia0w7wWFOLy
         s7gw==
X-Forwarded-Encrypted: i=1; AJvYcCU2GykTm8vTi7Mfo5uxc7RdMMTsFZbmpE5e17pRyi3ni68trbSB/iYIXT4Ns1zCxDYfLlJ69Q==@kernel.org
X-Gm-Message-State: AOJu0YxAFKXRChWtmqQcEY5wvyQxYwL4zjVJGk8rfWlje9m5qsvj/cMc
	W2qdlwQ+4MvaZ/XwTLUCvkTALl0SAAY/I8m/jAGt7Nxpp4qOnHbv40MXqvSz9TQGqDYgImoP/hz
	9sQ==
X-Google-Smtp-Source: AGHT+IFrxoll1MD7UHqls7EiRvzGp8NMB0IfiuwW4ozw145cHL5lQA37kDHTx8jx1EQOGS0Jj44sXGKknIY=
X-Received: from edben26.prod.google.com ([2002:a05:6402:529a:b0:5e0:40e5:1607])
 (user=gnoack job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6402:40ce:b0:5de:dc08:9cc5
 with SMTP id 4fb4d7f45d1cf-5e4a0d46bccmr6357700a12.7.1740601465988; Wed, 26
 Feb 2025 12:24:25 -0800 (PST)
Date: Wed, 26 Feb 2025 20:24:22 +0000
In-Reply-To: <7vl6uylhzgkokl42bz36d5g3krcusqf7mdy4bd7tblcjckatrw@ullu2kblovji>
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
Message-ID: <Z794dm_xmViQ_lFF@google.com>
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

On Wed, Feb 12, 2025 at 04:06:06PM +0100, Alejandro Colomar wrote:
> So you could really use man9 for internal Landlock stuff.  Even if I
> think generated documentation isn't ideal, it's better than nothing.
> Being able to use man(1) for reading kernel documentation would still be
> a nice feature.
>=20
> And while I can't run all the linters that I run on hand-written docs on
> generated pages (because generated source necessarily triggers many
> false positives), I could still run some, which would trigger some
> accidents in the docs, and would also detect bugs in the software
> translating the docs from one language to another.
>=20
> So, I'd still recommend you considering man9.

This is different to the BPF helpers; Landlock's existing man pages documen=
t
user space APIs, and the largest part of the kernel-side .rst documentation=
 for
Landlock also covers only user space. Only a small part of the .rst
documentation is about kernel internals.

If I understood that correctly, section 9 is supposed to be document things=
 that
are relevant to kernel developers, right?  So it doesn't sound like the rig=
ht
place for the documentation that we have?

=E2=80=94G=C3=BCnther
