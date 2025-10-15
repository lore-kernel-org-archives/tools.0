Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76393307AC8
	for <tools@linux.kernel.org>; Wed, 15 Oct 2025 09:38:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760521138; cv=none; b=Pf7jXAlBzCuqzmjHVGCUkJpBBAdiH3cI+/hx+ERV9/t2sjk4ONIlhvNMYwA+yQjotCPCELIjeN+1rltdzr20a9oJm0O82kESrNvgD9DktYUcQ0t3iAdyKaEBatOEoKVCt1kdYdoCGUjYwvWMCvnpslssNKqQHDckjHNCwEQqkZc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760521138; c=relaxed/simple;
	bh=xIFMyi10lWwv8Lr/7qT9Ya/B/TApcAJejnhep+Y0ko8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=TbQM0X2SLgCX6XPy0iCh3N/Fqr1Otr1lL5DOBgIFSIpVan1nti58waSxn6XgpUn1h6Fktgo39RVFOLtQNjMzzpODUICjmXvgW6bCSJHoPU+ucbp5d6oZ38Ek7UHYA3Cz9QmaGrrn9a3u0+T0dmKmqWm71utKzj5/zR8VEDWG3ic=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Xc68OngO; arc=none smtp.client-ip=209.85.216.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Xc68OngO"
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-339d7c401d8so1044394a91.2
        for <tools@linux.kernel.org>; Wed, 15 Oct 2025 02:38:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760521135; x=1761125935; darn=linux.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xIFMyi10lWwv8Lr/7qT9Ya/B/TApcAJejnhep+Y0ko8=;
        b=Xc68OngOIQX9E90hVg7RCHopRLULRIwf+btpN4whnDQOwPLcDeg7qkEaOa381KulQN
         ZwHaW55gptR+HiF2/k1s9reNoi+Or7A2uY7PlOZyBB02H6DLfmO8u5wW6Eql6H4s24JV
         cJCBvEe1DqhuPwq4yhy5oolKFSnABU3WqWZqR9QZxV6G4TUB4YwQrgZgUCNushaZ/Dbr
         CFqTMzrUPwPEyA1QWCKEW49uRrQlXEoZF0ISBKqU69A2gfcpWH4PsRpWpOIILmF2sQAe
         XMVO5Qgi4n4ejjd0+qV/Pe4FmH2eHowkULwkcsH0IN1+rs3TnMPRXgDHVoXjq8cPDLqc
         qLdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760521135; x=1761125935;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xIFMyi10lWwv8Lr/7qT9Ya/B/TApcAJejnhep+Y0ko8=;
        b=FaeuV+H5H8M++ydvPvyysUVaV0uXOrGebdqFwBNpkdYyMspdZl7FPJJKodQ02uOstG
         3Em9Lhczd9X0assNm8TPDNQu/kF3ZcYYsbxjWAcV1q86a0RyTL+1B84ReRCGIvkAVpZM
         tdlQtmEoNcIrHrc2529k5CvMGV9l9IuPkNJkfFJ5ZYcS/Ao7ZKIxDmrqholAXTmeQ/fr
         DqjD5TXnx6tzm1bNDrmIIHUrymLYN+Kug3z6A2eebG5n+LTHZx1mNzuJxSrjDP8JS3I6
         zk35Nha1h58HKy0/8ZIb1jEw43+Un5loGhX7nMStwRmt0mDLA4D5U0SYs5P/jODKnDby
         hQCg==
X-Forwarded-Encrypted: i=1; AJvYcCXeEkJt3C7SgSoCGQNJSsDjeQZz38t13khm5WNbU/ZoAqqlmVCUdGxGCBTUdoT1VLuaH1NR3A==@linux.kernel.org
X-Gm-Message-State: AOJu0YxWNuZq/Dp6eNw5Ddzrz/50/DEJ7/Jr9BBCxYEBQDOytzm2bWca
	ZfGSHwHs72K9yROHoIR9/to/RbjDZPtWCXHvSwV98RGJVefCzioWjENDseelYalEhMEVmaH/HLm
	Fw1/NoPKH50DC/z4r/BfqF8EQagVN4L4=
X-Gm-Gg: ASbGncuGnI3G/+zLicu9aEDyjepFkk1FIjBWbOiQVFrR1pvegSBPgGA3guZBn7X7yCl
	5HuO9AKCK0fhAFn5N8dS5Ch3SypAQM8RYvpUfq+rg5N1Jnc+3smbiyVFTarF+71HKNbfy5LZSMO
	xQC1OO/Cr1STIqNODteKCF5fR6MP20fgwWaIBMxi29WE8mm9Jw2M1Eh2SlmTkZVxP6DVP+r478/
	PYKlabE8BDMKu3aJAjJkfHX8Vs2/Zvno+HIo6HdFWc2jkVStLn5banvxVD7MkRws0sL0g1Df1QO
	KN4XQGXLZwtPxvIpCcWTh7Kvw+qRDRZzxs767X5FLVQM9ZbsSdP9IFbN5QoYzcSZYQ==
X-Google-Smtp-Source: AGHT+IHOpFcN1J30iAVZAz7OicVjsXTjx0OiU3FOgyxpP9LOCoyzvN7dwm0hu5wFWYWqEPtjHaOtGXiQZI0CIJ65ejo=
X-Received: by 2002:a17:902:d491:b0:253:a668:b638 with SMTP id
 d9443c01a7336-290273c598bmr211243705ad.2.1760521134491; Wed, 15 Oct 2025
 02:38:54 -0700 (PDT)
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
References: <CABgObfY5agTRsB-bCqCYbA0erFn5cVbujtTNBiCti8g_68nCWg@mail.gmail.com>
 <20251013081536-mutt-send-email-mst@kernel.org> <CAHk-=whSShtPG1_+02Cc4yDuEJxVqX=G8tAx0gW7UjA7cuBp-w@mail.gmail.com>
 <CAMuHMdWxMhM1J3zHC8OkN_fd8XsJPFA6jM_3JFU=ySKhnX6ESw@mail.gmail.com>
In-Reply-To: <CAMuHMdWxMhM1J3zHC8OkN_fd8XsJPFA6jM_3JFU=ySKhnX6ESw@mail.gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Wed, 15 Oct 2025 11:38:41 +0200
X-Gm-Features: AS18NWA-ENHEKAmK-LIU07oQpt8XtcUh7V9_d9smhvn3GUV3ji-w4vkNJhyM2q8
Message-ID: <CANiq72ka1y0YXysRQtuqnzc0i5FSbrGjKwprrXQpozwDOV3khA@mail.gmail.com>
Subject: Re: In defense of Link (was Re: [b4] initial "b4 dig" to supplant
 Link: trailers)
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Linus Torvalds <torvalds@linuxfoundation.org>, "Michael S. Tsirkin" <mst@redhat.com>, 
	Paolo Bonzini <pbonzini@redhat.com>, Konstantin Ryabitsev <konstantin@linuxfoundation.org>, users@kernel.org, 
	tools@linux.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 15, 2025 at 9:37=E2=80=AFAM Geert Uytterhoeven <geert@linux-m68=
k.org> wrote:
>
> FTR, I dislike the use of Cc: in patch bodies.

Yeah, when they are added automatically as a big block (e.g. 10
lines), it is not great.

Personally, I use Cc: when I think someone should be explicitly pinged
for a reason. That is, people that may want to provide comment but
that wouldn't be Cc'd otherwise from `MAINTAINERS`, e.g. typically
from external projects.

Cheers,
Miguel
