Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 970C7364D6
	for <tools@linux.kernel.org>; Wed, 21 Aug 2024 15:51:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724255500; cv=none; b=FcF0A/sksqfoDPfSyeAF6tPnCIrO9hxOkGYY9/JTETezR3cRa/NjbEGeEhs7S2JCqu/sx4FP5ZeGrc7+TBIcxuOvUxb0bOUZ7RO4VDw00qVv83ZqMO40P+ILhRay4zYqSt7jKqCFrMYqKXZ2jVfH+QUhRMhNzaG3eltTQzkVuFI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724255500; c=relaxed/simple;
	bh=0ZuVf8UicJjGoOjrS1kaHlof54U+IFefI7QngOI+LzM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=C8O6td8JeCnxAHX0iY+aIpO5/PjSJoeN2OWQdojMrKH7I0VVNfzxWd7IA1TRPljRB3+LOXH0LGGYxWrA0pCQy6Cea8nQgcfsjQwxejPFjWplQkbaBzjmeoher2GGjOjNO1g0BU/QMdAVTkPZMVRKsQ+TNEHRX1+QvgWdPcxUxnU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EyXfk2tp; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EyXfk2tp"
Received: by smtp.kernel.org (Postfix)
	id 1FEBDC32781; Wed, 21 Aug 2024 15:51:40 +0000 (UTC)
Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 1434FC4AF09
	for <tools@kernel.org>; Wed, 21 Aug 2024 15:51:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 1434FC4AF09
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-70d2c0ee69fso92245b3a.2
        for <tools@kernel.org>; Wed, 21 Aug 2024 08:51:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724255497; x=1724860297; darn=kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rw35il3wqrPfk3+PB1QrxjqLPXeg68hQhN8XNlxHtpo=;
        b=EyXfk2tpnwTSpIT2V31BICx2WdgRJJsLS6Q3l8L3Zu0U1YwvrZPM4o4Z2qNI8B2dxH
         2um/A3GzrzISnF7+13Ik5VOwguOOqmwxzQmdtY8mRRauKbXBBcCqegx8d2Q9T8pylSAs
         XzPplfy4MivmrujHOiHPocclBrx2VUAr+/Oq/TWuriTkWk07iR+YFi8J884D0qgeCeQ2
         4FCYDx+d/jcNn1IYzxYBW/ejLTjdHwmp1oFdZYMCbKRvqaicOO1I7mWT9mi3ptE7EYAs
         IXH+u5Rn39hSZ06pemwqRvox3lB+/iPWk5NXDP7rLQJ0+t5ro2UqhDkDZJxmU4lhIP0T
         dskA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724255497; x=1724860297;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rw35il3wqrPfk3+PB1QrxjqLPXeg68hQhN8XNlxHtpo=;
        b=QZdUjk0ohDn65bcZZ5hlO6l+VHQ5t2BUT/jZFNGguuKGNGxCmkw0ucsG9rmKHEMD+N
         Xt5CQSWF4nCN7f/kh4s1zM0R8iJjnQJ2zKS+Mmc2ajCwueP+JVUCeYQohcdcbiFvoMZ4
         83PqxSfG4630x5SMlE6FBui86r2xvZ+Qk8EVgZSydQ5IUj22zWFdh9z9M630zetmlSGu
         h4/Y1qpEaqgEKNCd/oJGtF9qcGBwTo2pv+BkUBMjkdvQZho4pVkD6XMnw4ErW8BwqSyT
         YN+/yyvhY6MigRYV95TWl446vdK3liDTwCJCIwE3ub5jMatskTeUGAo45+0qBGth26V1
         D3EQ==
X-Gm-Message-State: AOJu0YyaFIC7ALFc7KMcIgGBsKk3fd7DHWKl1LS7V6hMga12rmnbk6ai
	jMnvkfkoTOnpCZS7YlJ304a2+Oi7qQZTzWaAap2iDsZqps3KqswTsM3LjHjU0OoFzlWAGEOB9lf
	eLsix25v5sVW86d6+Cyj11Svj7EB32Q==
X-Google-Smtp-Source: AGHT+IGLU5YP7vs8SdIOzp2tuMjp6q39S8UhXbC48tjmn+CjA2eDEyHx1nvBvQQcTJ73pMEr2Y7o5YQKfOpfYU6T5xI=
X-Received: by 2002:a05:6a20:8403:b0:1c4:d267:76ca with SMTP id
 adf61e73a8af0-1cada1a4829mr1762253637.7.1724255497215; Wed, 21 Aug 2024
 08:51:37 -0700 (PDT)
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
References: <CANiq72=y5OjbyDhh_W2FF_v_7mLGDkf3+TbpfYiSGMdWH=_KKw@mail.gmail.com>
 <20240821-colossal-amaranth-mule-2f314b@lemur>
In-Reply-To: <20240821-colossal-amaranth-mule-2f314b@lemur>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Wed, 21 Aug 2024 17:51:24 +0200
Message-ID: <CANiq72n73A0aUbrSHjtb+TB7+emEgjCezeUg3F=PJquyCtNg3g@mail.gmail.com>
Subject: Re: Non-deterministic bug applies non-existent tags
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc: tools@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 21, 2024 at 4:53=E2=80=AFPM Konstantin Ryabitsev
<konstantin@linuxfoundation.org> wrote:
>
> This "fantom trailers" bug has been super frustrating, because I can neve=
r
> reproduce it no matter how hard I try. I've seen reports of this and I kn=
ow
> that this is happening to others, but I'm thus far unable to figure out t=
he
> cause or see it happen for myself.
>
> In this particular case, the Reviewed-by tag from Gary Guo is valid, beca=
use
> it was given for this patch in v2 of the series:
>
> https://lore.kernel.org/all/20240801133055.6d127fd1@eugeo/
>
> We reuse it, since the patch did not change.

Ah, so that is where it is coming from -- thanks a lot!

Hmm... I am not sure that is expected, though. I guess it wouldn't
hurt to at least say from which version the Reviewed-by came from, if
it was not the given one (and ideally add the link to it). Something
like:

  =E2=9C=93 [PATCH v4 2/2] rust: init: add `write_[pin_]init` functions
    + Reviewed-by: Boqun Feng <boqun.feng@gmail.com> (=E2=9C=93 DKIM/gmail.=
com)
    + Reviewed-by: Alice Ryhl <aliceryhl@google.com> (=E2=9C=93 DKIM/google=
.com)
    + Reviewed-by: Gary Guo <gary@garyguo.net> (=E2=9C=93 DKIM/garyguo.net)
      ! Note: Tag added from v2 (identical patch) at https://...
    + Link: https://lore.kernel.org/r/20240819112415.99810-2-benno.lossin@p=
roton.me
    + Signed-off-by: Miguel Ojeda <ojeda@kernel.org>

Even then, I guess a patch could not be OK anymore if previous patches
changed something somewhere else. I think by default it is good to do
so, but the note would really help spot why (and alert someone else in
the very rare case it may matter).

> Naturally, I'm unable to reproduce this. I assume this has something to d=
o
> with cache, but if you can still make this happen, could you please rerun=
 b4
> with the debug flag and send me the output of the run where the trailer f=
rom
> Gary Guo is *not* inserted? E.g.:
>
>     b4 -d am [...] 2>/tmp/b4-debug.txt

I can! It switches from putting the tag or not quite often, e.g. it
could be ~50% of the time.

Sending to you both cases.

> I am unable to reproduce this, of course. I get the following:
>
>       =E2=9C=93 [PATCH v5 1/10] rust: init: add `assert_pinned` macro
>       =E2=9C=93 [PATCH v5 2/10] rust: list: add ListArc
>       =E2=9C=93 [PATCH v5 3/10] rust: list: add tracking for ListArc
>       =E2=9C=93 [PATCH v5 4/10] rust: list: add struct with prev/next poi=
nters
>       =E2=9C=93 [PATCH v5 5/10] rust: list: add macro for implementing Li=
stItem
>       =E2=9C=93 [PATCH v5 6/10] rust: list: add List
>       =E2=9C=93 [PATCH v5 7/10] rust: list: add iterators
>       =E2=9C=93 [PATCH v5 8/10] rust: list: add cursor
>       =E2=9C=93 [PATCH v5 9/10] rust: list: support heterogeneous lists
>       =E2=9C=93 [PATCH v5 10/10] rust: list: add ListArcField
>
> +CC the tools list for visibility and to make this a bug.

Sending you this one too.

Cheers,
Miguel
