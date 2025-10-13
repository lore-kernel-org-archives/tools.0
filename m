Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C349E2D7DEA
	for <tools@linux.kernel.org>; Mon, 13 Oct 2025 18:53:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760381614; cv=none; b=kn4XIKMbLz68PYAs/usFvTFc9yVUbjI4fs26OdNjZ8d9oJhot+8NZ7Qx5KbVYxeMe0NKzbtUWLj/8wFe5AdJk3F+xli2Fk05TrsJ4Wz2h+XwtxI1I0Oql6cZYsP4ueRpMTlp8xGFqh+jca0FkY3+nPDLeYAbsYpHYuuKCTkhF6g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760381614; c=relaxed/simple;
	bh=a9RJKQ1IRoazNDBlIba3FgGPVeDo3Ah00SJNwvAk9w0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Uvfs9GP3scxxeu7spehAPFgcah4s9tF8eM3xZa6xhz02Yo0GZsvIhiZjacDZi+WIaqXc4j09+GE9RjQtyipk/oPTZym4f4KuDo9yvnSd+GF5uW0VW1Ub8ZFH5NKx/xBJciooAoDTgu9SE7giJGOPI1i2/5cmPld3hoopb+ZWOsE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=h6CoSPq2; arc=none smtp.client-ip=209.85.208.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="h6CoSPq2"
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-63163a6556bso8969111a12.1
        for <tools@linux.kernel.org>; Mon, 13 Oct 2025 11:53:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1760381609; x=1760986409; darn=linux.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=HcmoTcEPpRpN4vo7TyIl1DUlC6LqteTEfqmzamj4Fzw=;
        b=h6CoSPq2sfidbqQFcuq3eHWMgCfscR9L/njCW3obSKUSTGCEt8KicHexhcd8rKoajg
         SuPSuatDiWI7uE7vhXbYibFRiLrs0LXq4CbJJfzgaBlGLK6Ck5jGEMsn6pC3ZSIpW4JZ
         8k8l2Xjf5WSRQjaJPecBlH6OyD8Ts/1zQQ+hU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760381609; x=1760986409;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HcmoTcEPpRpN4vo7TyIl1DUlC6LqteTEfqmzamj4Fzw=;
        b=kXGZBIB73iNppMjNeAf0SV/iR3VVEQ/rsyULJ+LapJP5w1SlUlYCzGqiOl/2su3Rq8
         O01F0xmV6lZM6PIQQfpE4wXAY2TuCSFI9yz5s53SHHC2zLuDbbmcGJ//5iBkL6tF13SG
         Ahr5eMPVMmyu236OfFmQVFfnczOliBgBjCyPQa6NuaIuZEoeKOWFoMBNV6X/1prhCWXd
         n95WAoBZjpLheUUMC30Weifk/pKIc01cTI6VzwwP4EE6PL8yw0E3QeUVkGOjtfUxfqae
         L8X+01xSbuQoZheOrzZwkIwhChofVM2UhtZ/wEZDXYybknzPok4xnnksF1/eexoEYVIU
         IF1g==
X-Forwarded-Encrypted: i=1; AJvYcCViHCN+WX1BL5C+xw3d5EX2RTAUfdOmvoLqmS2QNNEe5HHRnLnbWY409NxIVLBrMKuLlVrAgA==@linux.kernel.org
X-Gm-Message-State: AOJu0YytU6Tr3eUHqNj9+u+1mJuADNjWtWOrzxkVgpLrlrQoen1v4oc1
	BjHbiuFJacIfT4pBguAbI8EVHyKJ+Z4XMP2A48oMmX6Js70jQGjhZwdoCv3newIw2vKc2mbpEE6
	y/+rIeZM=
X-Gm-Gg: ASbGncvfllekjQjbvtVj56PEjFublnTAdLWbBwUvRH5bw6EO85cioaaSopSHi7A6n8m
	ec0Hr1D4NcVvYWYQT84VK6+Vl0Usq3nNhn3AlilUuuS7rQcdHzhO8KyOP75VGx9tWGLAE758AWm
	NKFAhsN30DbZUdWh5T7+beGbEUgMqGb//KAfuQ1EuOUO9eyZMkR6lgNJ8vTa7KygR86Kflun0Ac
	a/iemMUkh5umWAOgUDg5ZqLGOzs00ChSCZ1u6fRG3+X/b4ah8YO0U9hR1ZslfxaomEHhJLvQHR1
	Bf+RSsie8u4FlXf2IN0N+QRtdYoi1/Ag2E1j/NJsGPw927wT402glMIW98O3ne66nZCogBoGbSB
	leP8JnigC+1vDLPdzYiBZVafWJjN3cfd3xL/K8gbZGPrnKUBKP7kI6u8IB1r5LUZthzkA4AcwJ4
	EP08GGlC9ePZ9vFQ==
X-Google-Smtp-Source: AGHT+IE2kVm81JyqCibx/wwctjo+aNjwKNeqO44D/1qWEgIOx4xOJ0uKBxRZ3JbyCB2c/U7++3AQZQ==
X-Received: by 2002:a05:6402:d09:b0:62f:3721:fc8c with SMTP id 4fb4d7f45d1cf-639d5c7019fmr18258821a12.37.1760381609384;
        Mon, 13 Oct 2025 11:53:29 -0700 (PDT)
Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com. [209.85.208.54])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-63a52b0f3aasm9213306a12.13.2025.10.13.11.53.28
        for <tools@linux.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 Oct 2025 11:53:28 -0700 (PDT)
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-639df8d869fso8536365a12.0
        for <tools@linux.kernel.org>; Mon, 13 Oct 2025 11:53:28 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVKQL8TxiCYJD6lOpRTiJ+toKVHUQSM5UMHFKfN2o4NEcpNE1s9vTcXZjguLJl/OEOopipKWA==@linux.kernel.org
X-Received: by 2002:a05:6402:50d1:b0:631:b058:bef0 with SMTP id
 4fb4d7f45d1cf-639d5c52eddmr20148404a12.32.1760381608154; Mon, 13 Oct 2025
 11:53:28 -0700 (PDT)
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
References: <CABgObfY5agTRsB-bCqCYbA0erFn5cVbujtTNBiCti8g_68nCWg@mail.gmail.com>
 <20251013081536-mutt-send-email-mst@kernel.org> <CAHk-=whSShtPG1_+02Cc4yDuEJxVqX=G8tAx0gW7UjA7cuBp-w@mail.gmail.com>
 <CABgObfZS--70UTOpSXo=JOZViN1jm4O6M92pu-6Qunif3v1Y8A@mail.gmail.com>
In-Reply-To: <CABgObfZS--70UTOpSXo=JOZViN1jm4O6M92pu-6Qunif3v1Y8A@mail.gmail.com>
From: Linus Torvalds <torvalds@linuxfoundation.org>
Date: Mon, 13 Oct 2025 11:53:11 -0700
X-Gmail-Original-Message-ID: <CAHk-=wg4WfbXs-kMOAM7FmQ0w8q3KO9DC8CWLg1WPnoaZW-Wiw@mail.gmail.com>
X-Gm-Features: AS18NWDhqvGd4BTpbBIzJXzuDpnW--xf6PPTeROTk4D-jY8dLPFOexZ52K9st90
Message-ID: <CAHk-=wg4WfbXs-kMOAM7FmQ0w8q3KO9DC8CWLg1WPnoaZW-Wiw@mail.gmail.com>
Subject: Re: In defense of Link (was Re: [b4] initial "b4 dig" to supplant
 Link: trailers)
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: "Michael S. Tsirkin" <mst@redhat.com>, Konstantin Ryabitsev <konstantin@linuxfoundation.org>, users@kernel.org, 
	tools@linux.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Mon, 13 Oct 2025 at 11:14, Paolo Bonzini <pbonzini@redhat.com> wrote:
>
> Yes, it's automated and mindless, but it's there *so that no one has
> to think about it later*. Other information may be sufficient but the
> point is that you don't have to "find" anything, and a click takes you
> from git to lore, which for me are two views of the same world. Even
> with "b4 dig" there are *many* extra steps compared to a click.

So the main argument is literally the "click" vs "command line"?

Because this argument is clearly garbage:

> and to reference or review them after the fact, and the message id is
> *guaranteed correct*.

No. The message id is one random message among potentially multiple versions.

There is no "guaranteed correct" about it. It may be *unique*, but if
there are multiple copies of that same patch floating about, that does
not make one of them more "correct", and not seeing that there were
other versions might well be just hiding other relevant information.

I see the same patch series several times, and I see people add
reviews etc on one version, and then those tags are (hopefully) taken
into account in the next version, but generally when that next version
is pasted, the thread on the first one is *not* part of the next
version that is posted.

So your "guaranteed correct" link is really just "guaranteed unique".
And not in a particularly good way.

> On top of this, the message id indirectly serves as an annotation for
> series boundaries, since everybody is using "git send-email" which has
> a constant format.

Ok, that's just strange. That's not how any of this should work.

I do wish more people used merges for series and put the series cover
letter in the merge message. Now *that* would be a real improvement
for bigger series.

Arguing for parsing the message ID as some kind of series thing is just sick.

Anyway, I can see the "click vs command line", although the only tool
I personally use where that would make a difference is "gitk".

But I assume you use some terminal or IDE that auto-converts text to
links for you? I just cut-and-paste regardless, so I don't see that
issue.

                 Linus
