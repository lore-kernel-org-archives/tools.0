Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6ED3C27732
	for <tools@linux.kernel.org>; Mon, 13 Oct 2025 12:30:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760358615; cv=none; b=Grq0CbiLbKDolUmuG7FdpCQxJIVflwck/b3CEuZD2ypNu6A5brBKHSZXOnoxVPpU31xrbnroB8IprJBEzayTinLhGNHmhLZsKE5nHBOgtLr6w7rSOwuj8+tWpSUTG7X8HrQEna6d0mURXs4+PCKVZE1/ZShM2bOxDY2qA4Xyego=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760358615; c=relaxed/simple;
	bh=lwMlmkkS9yUyx/dYCNbgckG7Wvt1KEt3hk5CaA/6NXk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=nYkD9tHrYEUN4MoK9hhriPp5R8CUGGxtnaIVWD7fuOnwjqrEIVHspnwn2PxniiE82xYTfObeqkVaTTPSE2b8Ma8qM1V8sHJP4JwYcgOMS99PhaCff1AR7vvV7SlzD1y3rJT+UOH+wGO7+tGU0ByCH1ArE+OV16pRAkFiJSGFW2c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=RstTVpke; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="RstTVpke"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1760358612;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=qgGEbwXbTJEm0y9hIFBflOeeDrA34nTV0ChPQCT9GaE=;
	b=RstTVpkeaRPrdNNsepPjynIySdp7/bVRVUWR9JA0/KSPSd2fnlo6LItchIHc5w7rYaluCW
	/1B4pCkmbZd/VNkrAsV4CqhRj4WVgKzMcKf/nBLPrykdfGQBS0K+MJ+0rhpz6bW8D+6iUr
	a/RWFm1YwfQbpwqGJhzGEYtISBwg1lg=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-317-FH7kL40_OrihWptFAoR_4w-1; Mon, 13 Oct 2025 08:30:11 -0400
X-MC-Unique: FH7kL40_OrihWptFAoR_4w-1
X-Mimecast-MFC-AGG-ID: FH7kL40_OrihWptFAoR_4w_1760358610
Received: by mail-wr1-f72.google.com with SMTP id ffacd0b85a97d-3ed9557f976so3879042f8f.3
        for <tools@linux.kernel.org>; Mon, 13 Oct 2025 05:30:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760358610; x=1760963410;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qgGEbwXbTJEm0y9hIFBflOeeDrA34nTV0ChPQCT9GaE=;
        b=fzZe4QZ1mZOVUWq65WEhBBd6tjxH0UcBatX3C0azHff8EfS010+3WRkVpBGwXajy0i
         QgYLESJxjmo0OyDmjwF9SWLKDfgRe/BcorgYCRHfFLxPGEanedARZz9Usc+U/IN+K0RO
         hGJKKcr0gqwz0MOvUYw6/AM8wVI1xlgGUSJkf9rXbH0NG6jm6Oh5EbWlEaIYphPTM2jU
         BPl1M0ouLe1sh3Gd1Vjnj+rsBygrV3SjS/5IEga6KKEaPFzDD6cKhl0tcIK+qQCClDl1
         /VxNfWRrznOvyH1E2r88+TvbSHiCQIRQtOSStRBnkXa2/cOIxUP/vspgPEFNYKyufqZE
         F8iA==
X-Forwarded-Encrypted: i=1; AJvYcCUk+e4j4hyXY0CkqF2mJKDbQZAGVigWbTWhwqtsd7z7pgCZxNRxVJjL0FxpbOohcGLDkZVeXg==@linux.kernel.org
X-Gm-Message-State: AOJu0YxA7lk+CIc4qwjqV4FBFJAtzN1tgqbpAWCJOPcpXtOYkkqMCOwT
	DQkbICnFbGOpEMAndQiLkGch6l3x1K3bUeQvZD0WfEvCmY8ww+QboQvKW6pn1lVWQWr9oJwRkHA
	xgcnf8+py8CQE7Er5oOZwMiyBOFybMRz35m0hKpelHjuuIIeFUmrcP9JAIhwBigYAoJwURjrBcA
	P9KuEsuor1u9iHWqRLcegM2Vbg46UqnbTKSixYIrrk8Mc=
X-Gm-Gg: ASbGncuv5VcYo6xliD6GZmNaVrduyuvO0GEoYHWSV+54mFRx9ZUXsBIvw+m1+nq1qa2
	xPWHjWU275PAux94zGX6IK2ClXrdCblIsLUhN3XgvzAQS/+DEuXeD5jyXNyO2Nrykvm+RiSjsW4
	EbrYZexikE8ZoKRwbK/4FcZVu5znjrmfoHOrKzg3TbImSmcYybcFaGwX49p7DH7uldRiO+m884Q
	5NEnIwZv8tHL+Q5FVRHHpIX
X-Received: by 2002:a05:600c:3b1f:b0:46e:4340:adf7 with SMTP id 5b1f17b1804b1-46fa9a8b3c0mr151701525e9.8.1760358609560;
        Mon, 13 Oct 2025 05:30:09 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGCh4oE2+S6E3GarQPykVrGNQTSi+sRu8QlfbzjoKVWnSdBcL/YZF+74FkoLypPHHB/qjuw6X8ybpNZFFbqPFw=
X-Received: by 2002:a05:600c:3b1f:b0:46e:4340:adf7 with SMTP id
 5b1f17b1804b1-46fa9a8b3c0mr151701245e9.8.1760358609074; Mon, 13 Oct 2025
 05:30:09 -0700 (PDT)
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
References: <CABgObfY5agTRsB-bCqCYbA0erFn5cVbujtTNBiCti8g_68nCWg@mail.gmail.com>
 <20251011061351.GB23024@1wt.eu> <aOoyhUzNDgwiyl5s@finisterre.sirena.org.uk>
 <20251012232725.GC3938986@ziepe.ca> <d884ec6d-856c-4dce-b8bf-cb6116c87bcb@kernel.org>
 <CABgObfaL1Pki1QCgO_vb1Ex_1=RgVwzOmD8Z+q_KnPw3jHwBpQ@mail.gmail.com>
 <19d8800c-c48d-4b98-ae4c-f52053b97ac5@sirena.org.uk> <4f9d75f4d024bf9340f5d6936a2a2dd73c6eb1f3.camel@HansenPartnership.com>
In-Reply-To: <4f9d75f4d024bf9340f5d6936a2a2dd73c6eb1f3.camel@HansenPartnership.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Date: Mon, 13 Oct 2025 14:29:56 +0200
X-Gm-Features: AS18NWBUMrpjlICUIu_LwWGtyG-hu1AOpVTWPtatHrz9vRP-UQ1YqyVXDjUl94s
Message-ID: <CABgObfboX1k8FxERevPc-BkNegEJuQVd0E1OjznCkk1BqxQQfQ@mail.gmail.com>
Subject: Re: In defense of Link (was Re: [b4] initial "b4 dig" to supplant
 Link: trailers)
To: James Bottomley <James.Bottomley@hansenpartnership.com>
Cc: Mark Brown <broonie@kernel.org>, "Vlastimil Babka (SUSE)" <vbabka@kernel.org>, 
	Jason Gunthorpe <jgg@ziepe.ca>, Willy Tarreau <w@1wt.eu>, 
	Konstantin Ryabitsev <konstantin@linuxfoundation.org>, users@kernel.org, tools@linux.kernel.org
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: BKDMVFz6Zymac8CFpgD9JPEbh2AgquA0zwGgDCGUNdQ_1760358610
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 13, 2025 at 1:55=E2=80=AFPM James Bottomley
<James.Bottomley@hansenpartnership.com> wrote:
> Well it's not like he isn't reading this list ... but since this is a
> process issue, the forum for discussing it (or rather forcing the
> issue) would be the Maintainer Summit.  I can propose it, but there'll
> also need to be a certain amount of bravery in the room.

I'm an optimist, but maybe not? Linus has his own way of reading the
room (cue the Rust issue of a few months ago...) and is definitely not
a reply guy.

There are enough people from a variety of backgrounds explaining why
it's important for them to preserve the message-id metadata (*not* the
Link trailer - the metadata is the important part). *Discussing* it,
as opposed to making it a flag day where a standard is set for all
maintainers, seems like a waste of precious Maintainer Summit time.

> Can I also take it that if a face saving compromise is needed then
> everone's tooling can work with a message-id trailer?

Sure, that's trivial but Linus probably hates them more than Link[1],
and only last year he advocated using Link and "b4 am -l"[2]. :)

Paolo

[1] https://lore.kernel.org/all/CAHk-=3DwiD9du3fBHuLYzwUSdNgY+hxMZEWNZpqJXy=
-=3DwD2wafdg@mail.gmail.com/
- that also answers Michael Tsirkin: "If that message-id _is_ public,
then it has a link, and it's much
easier for people to check. Ergo: there is absolutely zero reason to
ever use Message-ID. People need to stop advocating that sh*t. And no,
I'm not at all happy with the fact that apparently vhost and kvm has
made it their thing. Paolo, Michael, Takashi, please put useful links,
not those braindead message id's in your commit messages.

[2] https://lore.kernel.org/all/CAHk-=3Dwi4Rq9QOEdwNL3XPgPEiLZRAFqfdgmDxAEp=
n_ba19KXpA@mail.gmail.com/
- " the actual fix is to *NOT* use "git am -i", but "git am -l".",
there's a typo there and the two "git am"s should be "b4 am".

