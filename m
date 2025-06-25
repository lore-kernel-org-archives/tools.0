Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89AD4F50F
	for <tools@linux.kernel.org>; Wed, 25 Jun 2025 08:53:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750841581; cv=none; b=pfKrgFF+H+sBPuXI1FGZVd3dSsn5vkpUX9r2gNkszoWs8nrOgvQxAknhyfsfMfcBeqZqXY27/JIpEP8mdslc44Q6zGWQ8tWJdsX9IyE2lAzyVUPvxKwxiYR5/jXnTR4b35tsKKToIO9N2Z/pG6qkJjJ4oRU7s/TK7e3IJutk8pg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750841581; c=relaxed/simple;
	bh=/aGMiSWgswdb3PxpszlBovn3np9bIPgjxtNCoeUpgjw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=MkczhHxC0l8Ap4p7irTgYozBA5RDVv187UE326TkTRgD5nQahSQeDNoYYIuopsIjAsD4nMhBz5IOJNkaKChLGDUtSZ/7n4qm+mBEsr5keVYVi5OgyMJi7JkdQj4gUD9/39oYosbPTsGn7WtfUIuphOxTqNtqMnG6hVFdLefQiwE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=jOP0mioB; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="jOP0mioB"
Received: by smtp.kernel.org (Postfix)
	id 1A25AC4CEF1; Wed, 25 Jun 2025 08:53:01 +0000 (UTC)
Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com [209.85.208.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 46E20C4CEEE
	for <tools@kernel.org>; Wed, 25 Jun 2025 08:53:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 46E20C4CEEE
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-lj1-f171.google.com with SMTP id 38308e7fff4ca-32b5931037eso10540811fa.2
        for <tools@kernel.org>; Wed, 25 Jun 2025 01:53:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1750841578; x=1751446378; darn=kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=/aGMiSWgswdb3PxpszlBovn3np9bIPgjxtNCoeUpgjw=;
        b=jOP0mioBmLpUGEUSDnnpbEMqARwzv3xwD3Nc1xDYGKSfNU7lBCMpJfHx9wI6RDM772
         8qKSIWpVYAWqvvo0xhQZ3a6YoPIqwpg7XKScveH7tURNhvUgmB57f/7kE5Ff6b5qoOkq
         ibByNaEszoUvLVeAn4taHLPqpOhrdXNGgmumj5rviBn59gvhPmM+A4aAAlwj/3ifDUwe
         RggVr0B8CH70b6NRn4pbQlqAXGGucDNIwFBxuxlsBJ0hJ6XN5h+dD2K1dA7jxOcsLsIu
         oiLITv3kV/KvvbiygRzC14+wHtKfV3TRIvGhKkzO1CmZaKCwD/35iSO6nFf5tkTQfnKg
         R8+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750841578; x=1751446378;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/aGMiSWgswdb3PxpszlBovn3np9bIPgjxtNCoeUpgjw=;
        b=YmiiA8UNOTxzStc4svQUheZX+xr1KrQWdOjbPHlKVhpBHOPebHxKF2njvuZDZIpwq3
         6jkfcR4vRNW8A/Gad1eMXcVVK8ttA4X2nzA9sLOYHWmcXro5VSBmDEiQRn3vr5XcgN4X
         h8FTedP8WtD/9FCYIJG20AQFaEesIWtBqxdm8PAVVl/yNaNlIwWJ+dRIkseegyIFjXnl
         RNHSiGnDCutFBRIDe3rzScfimuuvu8S5eGoPVFb0auSK3E8/77kVfG3yQB1g4SY1YdHy
         X+pLvXxQIIZXdYW2exF1YX2unFT2ixJibuG4AI/orfBxWZrrq4lb25MP7+EpcnsYmWTL
         alXw==
X-Forwarded-Encrypted: i=1; AJvYcCXq0Oqa9MvlfQBTjAByJpV5dgXuSZiveyNi6eEKUS8Ed2LrAiIc6lt1h5BVfEj1LRdiew3WGw==@kernel.org
X-Gm-Message-State: AOJu0Yya9V1zbxcVy8UBAjastY+ysQuBXGbjCzqUjQQ83thm4OSIXaRo
	d7GZ8KwQHd+AmqaFXnUnilzgmbxD8jW/i7QhWYUNb2YyjUYwS4N8KukvYxgJHJJKpm7kQGtcjyr
	jXqRZ2GqrD//VgfR/46ppxjDBFZsycjCU0KRISOyt
X-Gm-Gg: ASbGncsqpcBxvzyoOKh1rLnilTByzmu4t8vlf6TMit17Tp4RZAlyEguZmKxOvDskOB4
	qQgEcJQXBwxv3Mh4g+xIMZCm9HRQ+9eRAjU64v4pqYnl7aCttzN5dZMgKbyv4M1LLr0FS+fKon5
	G6V53cjFCCD2esdjpvBvXgyIARft2oVa0FjyspInfoVLZDMY9oBhl1Zk0vZwYZ0oJkkN1xlaGIm
	RWa
X-Google-Smtp-Source: AGHT+IHn5jN08ujo8GoOIZXJyGKEDPnWbpxEqhAfrT8jEIaoiQ0R+LhHX8niQOlMCvkzPsyqSYJbSovaD/ar3ODPJFY=
X-Received: by 2002:a2e:bb98:0:b0:32c:bc69:e918 with SMTP id
 38308e7fff4ca-32cc641db52mr4677001fa.1.1750841578106; Wed, 25 Jun 2025
 01:52:58 -0700 (PDT)
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
Date: Wed, 25 Jun 2025 10:52:46 +0200
X-Gm-Features: Ac12FXzXBIFSLBsUnXVDMCaUxIQVjV8jup_taqhSUWe1Psb2MF0u58GMi7noczg
Message-ID: <CACT4Y+Y04JC359J3DnLzLzhMRPNLem11oj+u04GoEazhpmzWTw@mail.gmail.com>
Subject: Re: [RFC 00/19] Kernel API Specification Framework
To: Sasha Levin <sashal@kernel.org>
Cc: kees@kernel.org, elver@google.com, linux-api@vger.kernel.org, 
	linux-kernel@vger.kernel.org, tools@kernel.org, workflows@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Tue, 24 Jun 2025 at 22:04, Sasha Levin <sashal@kernel.org> wrote:

> >6. What's the goal of validation of the input arguments?
> >Kernel code must do this validation anyway, right.
> >Any non-trivial validation is hard, e.g. even for open the validation function
> >for file name would need to have access to flags and check file precense for
> >some flags combinations. That may add significant amount of non-trivial code
> >that duplicates main syscall logic, and that logic may also have bugs and
> >memory leaks.
>
> Mostly to catch divergence from the spec: think of a scenario where
> someone added a new param/flag/etc but forgot to update the spec - this
> will help catch it.

How exactly is this supposed to work?
Even if we run with a unit test suite, a test suite may include some
incorrect inputs to check for error conditions. The framework will
report violations on these incorrect inputs. These are not bugs in the
API specifications, nor in the test suite (read false positives).
