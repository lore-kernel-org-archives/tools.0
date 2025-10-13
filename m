Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 964032D193B
	for <tools@linux.kernel.org>; Mon, 13 Oct 2025 18:14:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760379261; cv=none; b=Gi5MPuaeIqcfRaAYVmN4iFFbMIRLGWN0VZFmlQHtEYnPuYh2IB5hhArDgZ3X+Bnx+8fBDipIg5pA/xfw91nhtPA1JAjgw6DS7GEmoCYIuQAuuBNKxXI8iAthbQhH7XvSGo4HeQZTGfBo6lZ8ozqy8z2wlK1A+YJuJrBLwfABMTk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760379261; c=relaxed/simple;
	bh=8xmaliORb4EXJLK+FAASg7XT/SVb5hufR3qHU2wwTyI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=BWVpTnxPGQXHPLioNXOSuIRgO9FU04edEO9ZP6KK9m4L0czS3rVdZz+bQGv8LChc81JwG9qC4LFkT0CeMq7ubTmsL1Z10OqiwQ0l0B21CiRG/98QPFMbQIpxSA8gWNopqWPaGZ3S+l4Xembejqsgebyp2TsHNgU6iSuDc0aMSwQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=SL+61Jhp; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="SL+61Jhp"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1760379258;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=8xmaliORb4EXJLK+FAASg7XT/SVb5hufR3qHU2wwTyI=;
	b=SL+61JhpTXtQkJWDeUHx+eLi1y6LJzApo9Ntq2A4GmeMh65LEW+rbMCgZZi+eS3Mia+NOE
	tMrR3Kis6UQr16hD8B3dMXoxvrgrnIG2aXJu4xKvXAKykqmx1/wkejuVgmTT2RZ6SUN9Ex
	1IfBQO8Z4OE/Lqi5Gy2O8bxKoAE7lPc=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-544-0WvMYWnpOdCO-6AAdfIRvw-1; Mon, 13 Oct 2025 14:14:16 -0400
X-MC-Unique: 0WvMYWnpOdCO-6AAdfIRvw-1
X-Mimecast-MFC-AGG-ID: 0WvMYWnpOdCO-6AAdfIRvw_1760379255
Received: by mail-wr1-f70.google.com with SMTP id ffacd0b85a97d-3f384f10762so3867395f8f.3
        for <tools@linux.kernel.org>; Mon, 13 Oct 2025 11:14:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760379255; x=1760984055;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8xmaliORb4EXJLK+FAASg7XT/SVb5hufR3qHU2wwTyI=;
        b=J+Y8zu09Vk8Z91WqcmZZUqT7q9gt+QJfyQN72rhgNM4DIJXGCEWnDk8luQepMEuG5o
         wKsFkr2uXAVFEpqk/DabFv3FQXt5mfhEyzhoc4frtIJsqzDavg6VaDVcZgZt+PtRuSmG
         2nUXlbWVIGt6tGPLwR1DQR6LaIJGbIdHwib49eQkyImusXt/xmh7gUPvoYCUH93PCQ3N
         5L3GLRaEnQ88QP8LVnn03Wp/oXFNONj450ujxHk2kr9Orjm9jxtAl44cZ3j8WfjTOenp
         TS5vZtt2gGu4IaN+IXgQmX5JlUv6VbRxu/VZHUXOxJn3Omj0uTrP2ZDqwKiqWAHdcFt7
         M/9g==
X-Forwarded-Encrypted: i=1; AJvYcCXx2kcNfuGIQAu838puEQrbKUmw7yzK1kbTAqtyUihfT0MeWcx0L2ebx3f/45ADk5qIOhHN7A==@linux.kernel.org
X-Gm-Message-State: AOJu0YxT8j/yBRi+AgjlkSurdc0Zw3ICsDw2gPQgPnp3OmmwEpKFnnWo
	3rTeUZNpbWlCbp+x9PYx+s1Aix06iQJ/k4P+G64XVTAUcCZR1MWYEyifNrXy8By52+NbPer5m1s
	3AMdCrFXpGhvhQUVGfJ+UB0KhWCf0phGH6YbjgEudXE2aXroJVy0b/KrLE/+yGrKHAwny/VdxVy
	bK5HaREEAtyHEEtZ0m96lL4zOirjUubVIn
X-Gm-Gg: ASbGncuh7JBuoy7NfTh2K9YbCpQkoYh1IFHUpZh+wIakAzth/4DyJwEoygUxDLwLpc5
	9KR6YcS66Ami/7oSQG5CilU+agje6yXrji6mOPyZ4E6nesR/1yQYWomD5M4xumKNzc98rm/7jSR
	kzdp+HqKq4PuVfj/x4c9nTBZq7RJ2QNyrzdHgA2ZtjjdBBiRpMQ2WwMTOVqqHOFfrLEdgJ0pTyJ
	us3h9v/0/YmrH4RiTCIJtty
X-Received: by 2002:a05:6000:608:b0:426:d5ac:8660 with SMTP id ffacd0b85a97d-426d5ac8675mr6109736f8f.58.1760379254874;
        Mon, 13 Oct 2025 11:14:14 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGD6Y/OiDb39WqN4ZUTYHpKMqHvIPJBj/k//7ULrUTcgrziVAa5g0kaDmxC7uXoerGBN5LfqVmtIuEQIWyc3b0=
X-Received: by 2002:a05:6000:608:b0:426:d5ac:8660 with SMTP id
 ffacd0b85a97d-426d5ac8675mr6109719f8f.58.1760379254453; Mon, 13 Oct 2025
 11:14:14 -0700 (PDT)
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
References: <CABgObfY5agTRsB-bCqCYbA0erFn5cVbujtTNBiCti8g_68nCWg@mail.gmail.com>
 <20251013081536-mutt-send-email-mst@kernel.org> <CAHk-=whSShtPG1_+02Cc4yDuEJxVqX=G8tAx0gW7UjA7cuBp-w@mail.gmail.com>
In-Reply-To: <CAHk-=whSShtPG1_+02Cc4yDuEJxVqX=G8tAx0gW7UjA7cuBp-w@mail.gmail.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Date: Mon, 13 Oct 2025 20:14:01 +0200
X-Gm-Features: AS18NWDcit1rw4GQaWqUl6oypL_yb6SPyu4tOF7I3co6FVJ9--S2GlWhuPvorsg
Message-ID: <CABgObfZS--70UTOpSXo=JOZViN1jm4O6M92pu-6Qunif3v1Y8A@mail.gmail.com>
Subject: Re: In defense of Link (was Re: [b4] initial "b4 dig" to supplant
 Link: trailers)
To: Linus Torvalds <torvalds@linuxfoundation.org>
Cc: "Michael S. Tsirkin" <mst@redhat.com>, Konstantin Ryabitsev <konstantin@linuxfoundation.org>, users@kernel.org, 
	tools@linux.kernel.org
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: OFh8-QlhWRtRyoqfon35LjcT-fJtJVViDEBfW-tHmoU_1760379255
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Linus!

On Mon, Oct 13, 2025 at 7:00=E2=80=AFPM Linus Torvalds
<torvalds@linuxfoundation.org> wrote:
> My fundamental complaint is actually about the "mindless" part. And
> that' entirely unrelated to whether you call it "Link", "Message-ID",
> or anything else.
>
> I object *strongly* to any random noise that doesn't add explicit
> value.

I understand why you jumped in the middle; if you want to read it I
explained in the first message what value it adds, but I'll reply to
your point about automation specifically.

> But if it's automated and mindless and you're not thinking about it,
> it damn well remains wrong whether the "Link" part is renamed or not.
> Every single commit already fundamentally has sufficient information
> to find the submission

Yes, it's automated and mindless, but it's there *so that no one has
to think about it later*. Other information may be sufficient but the
point is that you don't have to "find" anything, and a click takes you
from git to lore, which for me are two views of the same world. Even
with "b4 dig" there are *many* extra steps compared to a click.

It may be something that you almost never do, because you interact
with people mostly via their pull requests, so perhaps your workflow
is quite fundamentally different? For a lot of us it's a very common
task to look up individual patch submissions from other subsystems,
and to reference or review them after the fact, and the message id is
*guaranteed correct*.

On top of this, the message id indirectly serves as an annotation for
series boundaries, since everybody is using "git send-email" which has
a constant format. It may not be the most precise thing but it is
surprisingly useful---and as explained in the top message, what you
want here is something that both humans and programs can use, either
as a starting point for analysis, or to spot-check common mistakes. An
alternative here could be to give a merge commit to each series, which
for example the KVM ARM tree does, but then merge commits are not
easily consumed by scripts.

> What's the real argument against "b4 dig"?

There's no argument against it as a tool. It's useful as a fallback
(there are always going to be commits with missing message-id,
especially simple patches committed by maintainers themselves), and
I'd love for it to develop "git range-diff"-like functionality too. I
think I'd prefer it as a browser interface that starts the exploration
from say https://lore.kernel.org/dig/COMMITID, though, but maybe
others prefer a not-pointy-clicky interface.

But you don't have to use the same tool for the easy and hard cases.
b4 dig is a tool for the hard case; Message-id, when present, is exact
information about the commit, and it serves *easily* multiple
workflows. Why discard useful metadata and then require tools to
reconstruct it?

Thanks,

Paolo

