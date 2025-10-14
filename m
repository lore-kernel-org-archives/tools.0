Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 190CA238C1B
	for <tools@linux.kernel.org>; Tue, 14 Oct 2025 18:41:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760467290; cv=none; b=kh4rwFV5uiB8//IJimvHamdpCoQ0kO/JlceKsSDb8rSUdTc8QKG8ed+WwkQDaba2CaGuSdnLzZ5cWUdRmMO5wvOiEuJveREJUqm97ZQ///OOipI7cmGOQMnEY0qy3v/hCmFHGOCnsvIgMYUA1I/J0kOyFGpbTV1tE8VpYT0fgDc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760467290; c=relaxed/simple;
	bh=lFmAwWB4iTxVJ+s+RBh+UAn7i3sXj7LdoDA5xeFdBcE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=IQcM9hIV53XQXNhnPO06rOV0FSCWMu6bGE22zYruiK4ji4tNnZZR5KIpFsPNcDiUeKuMenS5Uf5ezZIIJc0VnhqkzpaeOzAYXHWPQIaSTzqP4VXC0Ai3rgx+Kdtenvk5V7AQOBL86ls0uOKrG9E/nD7oknaM3FynG0wF0l2I9AQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=Zx3aQKNT; arc=none smtp.client-ip=209.85.218.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="Zx3aQKNT"
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-b3b3a6f4dd4so1037740966b.0
        for <tools@linux.kernel.org>; Tue, 14 Oct 2025 11:41:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1760467286; x=1761072086; darn=linux.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=NQdGU7NET8xeoC3lBVxQP1X/kUwPFtldVrp3xVCbjLc=;
        b=Zx3aQKNT2axumdQ1E84gyoU3VnDk99fmPeG1Any/0JTWxxNJIC5Ps8EQTX+lg8/EsB
         hYCDf+l45/3o+l1bDGY9u866aXjQ7YA7SmGuLDtiWmfmy62w8XMnyCLc4xYssAwp1gWT
         zE/4mDh9RNJmYBjv3zRo44863MdnHmbEK0hyk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760467286; x=1761072086;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NQdGU7NET8xeoC3lBVxQP1X/kUwPFtldVrp3xVCbjLc=;
        b=LU/MMhi8pYh2y1fLMd3Ie9EDofCXhGEIhGpCu0+uwdci0KyAgM4QavbfnANOJGiT8n
         V1/+EeEgxRgx2yXYEGVSTdX5vB4U3khVn4mypODgZ7atfhA0CGuD/APSpAQjBL4K1Dr8
         hlVD9GdFw+PAPwLh57psnexP/hIj2bae/H4YEj2fb04fZQQ3anAk4RS/QaNDyiqluPMA
         LMBy4hiE+YifM+GY+SkrYAJeq7pB9bXNYKcdfhQrxVseF9B2aa/O+c1A69r6+Z8UJKE8
         DFJ9flGXkmLhZk0XFZgLYTTUoZPh+xLZUhpWJknnQf2dwZXuIr8iNvj8PAOuT7pBCNFA
         brbw==
X-Forwarded-Encrypted: i=1; AJvYcCUjH5tGFmjKKkiA/1iLZTk5iiBfGHqGb9hViOqT0UloRGqE3EIXN9xeAVccG1NSaColVDt/kg==@linux.kernel.org
X-Gm-Message-State: AOJu0YxitKJe2WksQcAs3CydlpLh9o5mRCGfLhHamSedRuFyzQnAe/s0
	FpOT87DoMLmT8Qkc8Ty2CMgTJsjd4oTaYDtoIfHxP+G7B8OPQR31JWmMYsbQTTBVxHYhuA3Dfnd
	v/kLj6e8=
X-Gm-Gg: ASbGnctXJ2KHAx98Y5qf9XRyfGgWK4Krap86vpUTlaS2zaa2gSKPKHSDsHfNkLDxsva
	/IiguJd+yN/i3UpC3RC869A/BIwWwF6Iea6q7cV4vWRqMjx8IzQc7hgxvlLn+bXyYZo9lWnpjSK
	DUWswbJmD0V1QVuCVt57c7orqR+vvI9SeC4/aKexkfbTxUZHLkWdagppVD20h4yfw4MrF+AFd83
	BGKv2bsuQjkJk9KmDhnF4b3NDPf0mv1L4KKloIzg5hDUCzX7uPIux5OPW6vmdlW/mI/ntvB4/iH
	WaF9w23ND8J9rj0wpnGWQTYyDakTj5Xzt8+maHvp69r85ydgjXIU8r+JM4BGIJfDgVDOfc48MNz
	+GFVMuZydaoRZCibwCFiQnTmtyJ07tSWP62nZ6a0tXxtRMZKA//XlJF7A7o4ApFww0SVKam2faa
	Kf+KGWnsnN2lWMKJc1mx+Mcu4X0hT35zoScYc=
X-Google-Smtp-Source: AGHT+IFX6E5JkOF2P2gmxGCQ3//fz9AkBMb2nq56j5MuNvNyPLLYcpX0ToXLuocvy0gyO7ecCWzoHw==
X-Received: by 2002:a17:906:7313:b0:b09:2331:f150 with SMTP id a640c23a62f3a-b50aaa9bc9fmr2722670766b.16.1760467285902;
        Tue, 14 Oct 2025 11:41:25 -0700 (PDT)
Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com. [209.85.208.54])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b5ccccb49c4sm36862266b.57.2025.10.14.11.41.25
        for <tools@linux.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 14 Oct 2025 11:41:25 -0700 (PDT)
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-634b774f135so9116141a12.2
        for <tools@linux.kernel.org>; Tue, 14 Oct 2025 11:41:25 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCU5xWBvSQeBiUnc0XjNEbCLEWoxA+7BIkxhKHtAlATYbjO6coDHXRuIs9wolmMzR3rV0++nug==@linux.kernel.org
X-Received: by 2002:a05:6402:518a:b0:628:7716:357c with SMTP id
 4fb4d7f45d1cf-639d5c4fe6fmr22205318a12.25.1760467284779; Tue, 14 Oct 2025
 11:41:24 -0700 (PDT)
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
References: <CABgObfY5agTRsB-bCqCYbA0erFn5cVbujtTNBiCti8g_68nCWg@mail.gmail.com>
 <20251013081536-mutt-send-email-mst@kernel.org> <CAHk-=whSShtPG1_+02Cc4yDuEJxVqX=G8tAx0gW7UjA7cuBp-w@mail.gmail.com>
 <20251013190418-mutt-send-email-mst@kernel.org> <CAHk-=wjioLpTroP=5cUQsVmDb3BtKnn5QToBX9Qy2dv_VYTZ0w@mail.gmail.com>
 <20251014062426-mutt-send-email-mst@kernel.org> <CAHk-=wj1rRqLm0upJVx-EPR_rN8W37kKTgzUSONUbm74mJhwig@mail.gmail.com>
 <aO6Q8A5DKNA-g1Fa@agluck-desk3>
In-Reply-To: <aO6Q8A5DKNA-g1Fa@agluck-desk3>
From: Linus Torvalds <torvalds@linuxfoundation.org>
Date: Tue, 14 Oct 2025 11:41:08 -0700
X-Gmail-Original-Message-ID: <CAHk-=wgMiV1VSGK8Yv9mKe6JSVSnUpWBPzvMMRnELYrQ0hCzkA@mail.gmail.com>
X-Gm-Features: AS18NWCt30wNzDajdhfzPMDU15U6JOggq3gziIrTOpSNNebhXtboXf_Hpsy3uIQ
Message-ID: <CAHk-=wgMiV1VSGK8Yv9mKe6JSVSnUpWBPzvMMRnELYrQ0hCzkA@mail.gmail.com>
Subject: Re: In defense of Link (was Re: [b4] initial "b4 dig" to supplant
 Link: trailers)
To: "Luck, Tony" <tony.luck@intel.com>
Cc: "Michael S. Tsirkin" <mst@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>, 
	Konstantin Ryabitsev <konstantin@linuxfoundation.org>, users@kernel.org, tools@linux.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Tue, 14 Oct 2025 at 11:05, Luck, Tony <tony.luck@intel.com> wrote:
>
> While there may be many archived e-mails with the same patch-id, the one
> that was actually applied is "special", *if it is part of a series*.

No.

You are arguing as if this was a "one or the other" thing. And it really isn't.

With the link you only get *ONE* submission.

With "b4 dig", you get *ALL* of them. It's not like you lost the one
that was applied, you get more information.

And I'm arguing that if there were multiple submissions, those earlier
submissions are relevant and interesting and often have *MORE* email
replies associated with them than the final one.

IOW, your argument seems to be "the applied one is special, so it's
the *only* one you should see".

And I'm claiming that's a completely bogus argument exactly because it
claims that the one that got applied is *so* special that the others
don't matter at all.

That's BS.

Because the older copies - and the series they were attached to - are
still very relevant.  The discussion that caused a v5 to become a v6
is not irrelevant just because v6 was the one that was applied.

In fact, it might be very relevant indeed if it turns out that v6 was
buggy, wouldn't you say?

This is why I think all the arguments for "the applied series is
special" is so utterly pointless pure sh*t. You are literally arguing
as if some "b4 dig" wouldn't find that last version *too*, and as if
older versions suddenly became irrelevant.

It's intellectually completely dishonest and pointless to claim that
early versions aren't relevant.

             Linus
