Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45A753B0AE7
	for <tools@linux.kernel.org>; Tue, 11 Aug 2026 22:13:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=100.103.45.18
ARC-Seal:i=3; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786486426; cv=pass; b=rOnauFdbb49i0d3j3nS7/OgjfR8mae9C0f0w4/Sk7taXrMFbqNbzPwbhHH7in3tbCIacSRGrwv3i9vI/WGiLR0/7dFmjJpu/5dhwSWkQTZuq9A53x3ttJlU3de1MHM6nwLbYQL5j9ciojUTao/05KMlkRkvGxEGSVZegL72KJyE=
ARC-Message-Signature:i=3; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786486426; c=relaxed/simple;
	bh=W2/6oU/E7SnoNmRzH/SDE6FA74XcSBsdOkPyd/Kh3so=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Eek5uK/+F3m2OXw9OPmsZo43D16k6mD+Gge3Sm1m3omH3n19eQfLExfx3GZKw2HQhRe5SXBr+7h7vnWE6GXemN/O8LWRcS0Z7tZHkIJ8FsZ/gKvdhNb+o7t1zwzLmo57+qOThbkvclSKnorvf5EuaBoNBhEe4QU3gAkS9nnkZBU=
ARC-Authentication-Results:i=3; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YhPAMfx7; arc=pass smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YhPAMfx7"
Received: by smtp.kernel.org (Postfix)
	id E34181F00AC4; Tue, 11 Aug 2026 22:13:44 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.214.179
ARC-Seal: i=2; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=pass;
	t=1786486424;
	b=GhR37q4hnF0trlPiPQcuq3ezO688X0+qacWVUNZQwE1KiCPtulxOkB7nZV0RKA/zaKM6
	 z/NlPl/5yPVTHy2xrrGATkKVDk7ohyDXKBCrdTL7sUN1mNfXCZEABGjNLkZkuDz+20LqD
	 cXdUiVQ5I6P2FC92PY7PB+sv+RvsQcXLlsGdfRh2KFWS6ViQcMA7FsWdd5bq34FAT8YUE
	 EbatpSSphlxTXH9t4xtU2cKOUyv4f8PmSViueRhu90sFkNlz4oJ2SU5KVc0SAmBocJ4ti
	 FL0GZux+3zUDhJGVOoF0W9m1jR9uB/OWo2/8bbiq9+6SR7YqX64LeuXE6l7NrV1mwWA==
ARC-Message-Signature: i=2; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1786486424;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=W2/6oU/E7SnoNmRzH/SDE6FA74XcSBsdOkPyd/Kh3so=;
	b=eRe/a0tG2qKnJ1P47vteRpykKhbjNqcLEsZ7yXqUQPy5hlyTFt7pyJQBVpvdWTtISVur
	 u4LKQTsELeDFAwgG3/oSr3Ja2XUBeCB7Vu9Vy5iNJ3TpQvjUpjhAf+BpPFeoTbrp3gWAK
	 hciVkGfvO+XT2Uw+b/9TpLnYtCdf8y5UgSNQzqNyI2otke/DJMsrkkDu+g9pvTqoQHJAm
	 o8jdUy7r6EYS5c8Gx8ag5h8gaeXMHt51gAyF7A1gHHypVB4BmWlxDHhl5UtCvCl14DB32
	 EWAnMaPVO7+O8tKVPs8V9FM1M0fj7sIdikjs/edBZSoUD05wwIwe/1r1KIdQgOlJf6g==
ARC-Authentication-Results: i=2; smtp.kernel.org; dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=YhPAMfx7;
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.214.179
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 56E611F00ACF
	for <tools@kernel.org>; Tue, 11 Aug 2026 22:13:43 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=YhPAMfx7
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.kernel.org 56E611F00ACF
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-2cf110997efso1272905ad.2
        for <tools@kernel.org>; Tue, 11 Aug 2026 15:13:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786486422; cv=none;
        d=google.com; s=arc-20260327;
        b=R//4TsNFYzLAyzEbhbv+5vmqHfXi5bzw3kcU6oi0qjONwRd6XUXMs1jW9dBp7ho6rh
         7Fs0tmw7kU4Z7uRyH+U+WGseuFO+NNlijZxGW4m5JIweS7K5csPhDMWWATByMOIVlYc7
         70PyJRHxqfKaRa9YseOiFTHvtet4YcCUpErLe2vLkYg615TygAByXaBB+sFyHWGw0S73
         l4gDjV0JYfyGcnLaTcBHOzW1GqY6WIqaxJAg03Uao4PtrydOGuVO+qEX6lLjTOp9kHvC
         OBoUpCEeizPQ1Vt/ygJbCy6azj7BsQfgBbbHK7oRkwS2j360gWebSsOzkYbmaPy+sNFX
         PTVA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=W2/6oU/E7SnoNmRzH/SDE6FA74XcSBsdOkPyd/Kh3so=;
        fh=NPEgSYDt101QjURLhvhXtaHjCu7LhtXI0otZgh274ps=;
        b=sMiIQ56oMPrH+wIjZARxCON2adlrEnNWSrKG2202mY1GHQ4EU1wmlzZ4QqPf7nEgIQ
         fmOPQJPmxnQpELDhCRj2nQWQnQ4G6TuSmP215tjxeofjglt6O8AphPCLBidGdZEXdp4i
         /5VVAdFcEjkXL2bc0ewF0N75zPREBor/66jOslMSSWMoW578U/4R5BCtb2qGm21rxvEt
         M3Cu+5esHx1rZbpF6kJQh5qN276pDXlPwZ8p/rOAT2ZMaLFpPQ9reIIe24H4x5r4Haaq
         olHQ5n1XZlf+9a10vFXhd6HJqiGFABTtoRw/lnU0yCR5L1Q3QHMFDA+GWnIhicuhQ+Nz
         fKrA==;
        darn=kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786486422; x=1787091222; darn=kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=W2/6oU/E7SnoNmRzH/SDE6FA74XcSBsdOkPyd/Kh3so=;
        b=YhPAMfx7C6js6sL2knxr+Gu0ztQuQL0gX8rvtD+sI+XLMi3IG+jo2x+VdSZ1D6lNNz
         AzU8lAbWrnm5RtPZOL4662ahMyg9jGv9aHiJzRSXUTZyxPFbjk93UWLQtfoxaXcOYOo8
         r/jNvb79gQLoBTBzhGLV7MT0qnpGTGMcMyYNcXDv7p+woipC98WruD0RHWtgvOspsaM0
         8zS6t+vd0e3PXcyMAz1BdValHWIM+c9hlWKuUA2aTO8R3lPlttwjAVspw0Fl/DUpqlT2
         xuZs38h3M6b49riOQvJfGRw9i9Pn8zcsGG6d8x62D/i0CcBZi9fyg8n/T4BPPGSG5Aye
         mqSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786486422; x=1787091222;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=W2/6oU/E7SnoNmRzH/SDE6FA74XcSBsdOkPyd/Kh3so=;
        b=jOTcSnN9qMkU/vP0RgrVW5C3hgZEHvYOXYUdpULqkDi/B9aF5gVKRblecg0zR8Yg9f
         KEeTZshAzJp+yIAMntq4R55z75KsYNWwfr7yCKe5YhRlLHDNhTDxyKC1310wx9AWeZcq
         yi4VbUzmzmcKtF+2iIcdDioariKzhsTXWyIl63jYuFXW3edxZRHZUjvQXy4zSbq1vc1x
         Gfe2pUtsSBailjSThBz9//f9ZsileR0q74cbPApmBYEbN6GLIhTAlVUxwfjtfnBME/c0
         z4GhjkSoswU+EJjsucBzuUW4f5FgEX+zTnJDQ0WoA5AsJfHgboLsyLoJHL+UYcO/rHuT
         qSxA==
X-Forwarded-Encrypted: i=1; AHgh+RqXLojtAx4Lz7FBO1e1JYCvbGHh5DFhV5TEGdViwQoUAEd6bA9wJsYBx7l+INt92efdsFJVcg==@kernel.org
X-Gm-Message-State: AOJu0YzZWdsWew8jPCPg0n6D3jXRmS8gu7MaC5yEqqWY9ijpx992qhyB
	Bgmlo19w5GlZaC20Rh3jMOhTqFazaSdaf8cdaTn+23y/sU7DUqq7N2AuOrL3IMeGY8kKOAPsQdn
	5vfiREYX9hanvQisSTm6CwiGh91kyOSs=
X-Gm-Gg: AR+sD10Wm2HPMDCd2oUcxA18L/irpy/bh2N7UUO5ottnAVVsyDKiRBFTNCUPdq1MKxG
	yHhB/FfcAz4PicBT3ZV2b3uoJEi0PwCt5phPjj93Ekcpt6u+B8IUxJ+N8eFR7kLZOxlSNfRhqZf
	3eZ99wILy4jiT7V6v/hSKzkWREkGWiFWy6GdX4JxfNXZkA1XQ85qb2CWJ1jwNZ+7NdLEiKIQ//R
	fQsM3U3W7L87qLIVHPG+p7sWLeyIFpAWmIBSc9BfhmK7oOhap28zyiqZ4CqVZdDFAa22KhPnI7L
	DolZabwrDw3+y4AmajGpQyfHBM+cbpX5TYQ+87Jk0alyA1l0kGjvZxjQoppgHwKZ4SY11l/QTlo
	s/AFsr2mw6MWIFv7MIZJgflOaUK5GVl0b+BPxVlol6/p2t1fZlVfUv5Q7+waH
X-Received: by 2002:a17:902:ef0c:b0:2d2:a952:2628 with SMTP id
 d9443c01a7336-2d3456ccb29mr5130705ad.2.1786486422513; Tue, 11 Aug 2026
 15:13:42 -0700 (PDT)
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
References: <20260603160910.159307-1-laniel_francis@privacyrequired.com>
 <anqsTVj5QGYGiEQ9@monoceros> <20260811-garrulous-serpent-of-agreement-cf9b19@meerkat>
 <CANiq72mb0RK=2Oaipzas9UZQiEy7FW331dosH0+cFKuVQNE6Hw@mail.gmail.com> <20260811-famous-convivial-iguana-d4b104@meerkat>
In-Reply-To: <20260811-famous-convivial-iguana-d4b104@meerkat>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Wed, 12 Aug 2026 00:13:28 +0200
X-Gm-Features: AUfX_mxmO2Kt_BTUTcV2EXxHGCyIy663HbvVAP9RurhqTTrI3f50J2EGAHSXNPM
Message-ID: <CANiq72mcieV_SmvraqcNNYVOQOppzrjRtkNdpvdv5hOKfZkuJw@mail.gmail.com>
Subject: Re: [PATCH v3] rust: pwm: replace `core::mem::zeroed` with `pin_init::zeroed`
To: Konstantin Ryabitsev <mricon@kernel.org>
Cc: =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <ukleinek@kernel.org>, 
	Francis Laniel <laniel_francis@privacyrequired.com>, 
	Michal Wilczynski <m.wilczynski@samsung.com>, Miguel Ojeda <ojeda@kernel.org>, 
	Benno Lossin <lossin@kernel.org>, Gary Guo <gary@garyguo.net>, 
	Alexandre Courbot <acourbot@nvidia.com>, Boqun Feng <boqun@kernel.org>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, linux-pwm@vger.kernel.org, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
	tools@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 11, 2026 at 11:17=E2=80=AFPM Konstantin Ryabitsev <mricon@kerne=
l.org> wrote:
>
> Unfortunately, some prominent maintainers indent their code review traile=
rs,
> which is why we have to pay attention to those.
>
> I generally recommend using "|" when adding trailers that aren't part of
> actual code review, e.g.:
>
> | Fixes: abcde12345 ("Foo bar baz")
> | Reviewed-by: Alex Dev <adev@example.com>
>
> These are guaranteed to be ignored.

Sounds good, thanks! I will try to adapt :)

Cheers,
Miguel
