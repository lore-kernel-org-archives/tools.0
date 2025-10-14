Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B4C445009
	for <tools@linux.kernel.org>; Tue, 14 Oct 2025 01:24:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760405051; cv=none; b=E1o9CSkDYCiJASbl4gupBXkcV3j7IfHBSjvrPmjh6JyEyNb8ipWFrsHf/ddmJhW0h2MnrEXSGTyhH7jKNHreAaha7ILdEIfEw2H/Q1T1gPdh1Zacxz1QyteJbtjr9LqxJS06p3dcMjl4hLlSLThlZGY+UVfaNswCFxl1iwLGPRI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760405051; c=relaxed/simple;
	bh=Rm3WnqP9i/45vTFH0+F0yFjK3i+H2IHw97e8q6e8GaY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=PjPRW73JMAHjxyPCn3hlrooX5xnrCIW9ltTgnLCtgP2OkRyCmPe+Qlc+k3wPpsrKgyZ/Y7aoksqdBwcpQHBuV0gtU0jET2sXjw+uQsXCUch7IMALPEmcYnxPOJe0VDEpE5Ss8TufWUVMchP9froAY619DeEjqjuU5EPb2uD04M0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=AjlRL2zm; arc=none smtp.client-ip=209.85.218.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="AjlRL2zm"
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-b3e7cc84b82so891656866b.0
        for <tools@linux.kernel.org>; Mon, 13 Oct 2025 18:24:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1760405047; x=1761009847; darn=linux.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Jrn4kv2+NwcG9qidn6pYk1f6aX+PLv3GE4FNXdPuQcs=;
        b=AjlRL2zmKDCIJzpRIryx4AaighsUDmD7lbF52xtmDujRBFmw4jnF7eoFIpalwxfcrX
         Hf6Vb2i7nGoQobdff8IVvzzlqGOs4wTHJ3ZE8AMDQHNWxIw9wzKsQYq2tgIeAS0UHZbr
         r7BXWnBG36oa0JLNa39YFDUbAkOFwErkXmv6Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760405047; x=1761009847;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Jrn4kv2+NwcG9qidn6pYk1f6aX+PLv3GE4FNXdPuQcs=;
        b=OU/cpJloID88gALGSK3KQ7k11BYcqriVNdWpUj3QqMocq9j7kgc6z69j8UgcV0D9eA
         wEtSehM8pm435TK+bn18iYl+USEzMq7XOoDS4qQg+BLThiIpDYkrpWNtZvgwU+0WpMKL
         ZrvG6BQn4Dd9nx2dT8DCFTVI68by62BUu1qxqqwBDLNRlStiFnPP8BqiVbPX1dQz1XWp
         MVC1QqnCc/4Jlp9T8lds3DEk6Z72Ngsmwv1rRD2OJUw7dWOOC5PqKatQfKBon+lprCj4
         3AD/j/q2fu8T8Wq1aXbWFeFwKdA9C5RsDL6LgcKnUFGLAse+m4QFUdH9b7g8ohkAk5ZU
         0eJw==
X-Forwarded-Encrypted: i=1; AJvYcCVcdWG59UCbVWdGiaTiIRsdojgeGu6IJMZgaMY4MY5dBANtw9Fpg+8zD/9NsoyKPACtOor8nw==@linux.kernel.org
X-Gm-Message-State: AOJu0YwAyTONRquAiA715YCVtYG1Z98qscDsQ6S7N8gC7B9dSfTiUBoY
	0jxd1onSYgWWUwsCdgN2eMezc5yQU5CMDzfDxulrOye59fPIUul/3Yu9fuVtrkjNO/htfZwA7sP
	QJ7mqSQM=
X-Gm-Gg: ASbGncsvc2yhQ6EWKSFU2PWu6RXJzEJLdKnucYH0E8kdeHNQnp/NZqOQ94TqGAM1P1A
	shXiLwNodnJDzqCTV8+M6LxOxN28fD8pGRd+U+UbTcQQGqs3kMc8hCaTM1oyhV9f5/fnGQBkgok
	5r7teuGcw4JgR88K+zDSSmHMFeoC/UMGthxTbKTjxYRPyq3dJLZYDBPZgaGNkaELb9WFkIL5DXl
	LSl2KTq9zM4jEClle0gDdp9PesvkBkgkiVUJnyrpoqVDUyHhGRzwGJNMqgIzQ87BHazfFhdCarf
	BR0QWdjqSlaOERS1Ct5H03GnSLhrlf3kneb6uidhOasa3dpXMGUCAL67bqO0TiBsGIvcJla2n3F
	FNo6fYra9k1kn7MGhPkloVd9PuHjaRl+96537d+hZCChWJJjfn+H+O/4okUWu6pdhjy1iRNhT3S
	8zVcu6cmaZ0jZc/A==
X-Google-Smtp-Source: AGHT+IGR5Lh0ks7erEDGRheDrsSFetRZ5Jbe+P2A4hzPGAjfWt5v5PRBJ+ZEqxsOA0EXDA0H2Th2yQ==
X-Received: by 2002:a17:907:da2:b0:b30:ea06:af06 with SMTP id a640c23a62f3a-b50aa8a92d5mr2449549066b.24.1760405047056;
        Mon, 13 Oct 2025 18:24:07 -0700 (PDT)
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com. [209.85.218.42])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b55d5cad8adsm1061597266b.7.2025.10.13.18.24.05
        for <tools@linux.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 Oct 2025 18:24:06 -0700 (PDT)
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-b3e7cc84b82so891651866b.0
        for <tools@linux.kernel.org>; Mon, 13 Oct 2025 18:24:05 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUUcIXOXwKxOsf8XcPp81UAfK36bg51Ev5y/4dGti6k75VlLkRo7jkP6TxG19FUZYCQ36Or8A==@linux.kernel.org
X-Received: by 2002:a17:907:9492:b0:b45:8370:ef08 with SMTP id
 a640c23a62f3a-b50aa8a92famr2586723166b.17.1760405045576; Mon, 13 Oct 2025
 18:24:05 -0700 (PDT)
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
References: <CABgObfY5agTRsB-bCqCYbA0erFn5cVbujtTNBiCti8g_68nCWg@mail.gmail.com>
 <20251013081536-mutt-send-email-mst@kernel.org> <CAHk-=whSShtPG1_+02Cc4yDuEJxVqX=G8tAx0gW7UjA7cuBp-w@mail.gmail.com>
 <20251013190418-mutt-send-email-mst@kernel.org>
In-Reply-To: <20251013190418-mutt-send-email-mst@kernel.org>
From: Linus Torvalds <torvalds@linuxfoundation.org>
Date: Mon, 13 Oct 2025 18:23:49 -0700
X-Gmail-Original-Message-ID: <CAHk-=wjioLpTroP=5cUQsVmDb3BtKnn5QToBX9Qy2dv_VYTZ0w@mail.gmail.com>
X-Gm-Features: AS18NWBo6S3oUdFZuCt1fOF4W9xK9DdYqrey34mQ_3qVAUrCcPkaRpmjdaIb_Y8
Message-ID: <CAHk-=wjioLpTroP=5cUQsVmDb3BtKnn5QToBX9Qy2dv_VYTZ0w@mail.gmail.com>
Subject: Re: In defense of Link (was Re: [b4] initial "b4 dig" to supplant
 Link: trailers)
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>, 
	Konstantin Ryabitsev <konstantin@linuxfoundation.org>, users@kernel.org, tools@linux.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Mon, 13 Oct 2025 at 16:09, Michael S. Tsirkin <mst@redhat.com> wrote:
>
> Well I for one would often ask the contributor to repost
> modifying just the commit message.
>
> The only thing distinguishing posts then is the date?
> Doesn't it seem somewhat fragile, to rely on date?

I wouldn't rely on date. That's the point. None of those emails are
any special. Not the one that was applied, for one. Because if there
are multipel; versions, the commentary on the *earlier* ones are
likely as relevant - or *more* relevant - than the one that was
applied.

The primary thing is the patch ID.

And if you change the patch as you apply it, at that point *you*
should point that out. And at that point, by all means say "original
at XYZ, I changed it to do ABC".

See? It's not that "Link" lines are bad. What is bad is *pointless*
link lines that had no thought, were added by automation, and don't
add any actual information.

            Linus
