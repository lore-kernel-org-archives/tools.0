Received: from mail-ua1-f42.google.com (mail-ua1-f42.google.com [209.85.222.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB51225B695
	for <tools@linux.kernel.org>; Wed, 15 Oct 2025 14:52:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760539934; cv=none; b=rEl69Gu+kb0ou6G3VQUcMb2pgUpZCJZZqWLpd7OEpiJyS5u+OJL8nfuH6I2KZ6C5tbgTmkbkOlPuZN/3jxz+Ko1HkrW/EigozcfiOAd3N/x+DxFuiV+v4FLoJMfwMtf+5yKzckw4zgpl/aPOq24mmAhRISvb3Q8OOc1hp3XwUYo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760539934; c=relaxed/simple;
	bh=1kqAX2rcwNaKi+6UzSqv6Aq0Uj3jzK9hZC0Z+TrCL+w=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=gEH3l3V44oAQSo+9/Fnapd2+aSiMm1jJj0nFzQvUkdCeGuPZV48jLohgbTqDRUnHgfDj16WKUa5/h4hntBShcVN/S6eccEqt7vn2kqFw/zHMJgQcbhgeyEpcebXNgrxZSz8k4DUZsgqtVSQEYyyZGwccRHPAhZG0b5zg3AD6b70=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f42.google.com with SMTP id a1e0cc1a2514c-8e2e9192a0aso3823961241.3
        for <tools@linux.kernel.org>; Wed, 15 Oct 2025 07:52:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760539931; x=1761144731;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nkiZgYSH2v5VDAbN1rA71B09TZHDsX3Erj7BqbHlF4c=;
        b=o9518SaOwrUn9RIGFplNERuous/jYDE6t1mJKF6z2DH9zjnY2MquxT74HTmcPqslbi
         l3A/EgDAzdoy0N6NxswwpP4QgUOS8GccAzSlPLVlyLCsutt2IJ7kOPiM9DrE9GdGZzuj
         v3JJE9YKIMUwNBoRyZBMkKgY3+x0pGLxfXMyYBJ06O5JiG6Eh8rOhJeN7IJ52ZXSCAO8
         4PU0vPgBoFEdRa3r/dLawiD57uXNwj++wV8k3h2evYeSmUz1dSyn1KafuoLqvD/FQIkp
         JO7OEfikB1A1pplKUHHVrAx0ruQkWh6AlbcppcNMsOIQSurAF5D2k2+rGPbqjumN/nTu
         5NxQ==
X-Forwarded-Encrypted: i=1; AJvYcCUFNjHZGKWEmBrjwiVLCqTDNz7cldFKUnetw0YxGlcU7F6ijJjSKS3QHK0yKL/pBYCWViVkhw==@linux.kernel.org
X-Gm-Message-State: AOJu0Ywcj9mCL5KCNWjb8qe6YUq7AYF/mZfrGObxrASnq/gzIiA/l+Sz
	EZNf5aCfblEHIKeWacPmOLKz27R+jaG2IlreczWcz/uZ2pNFv/BKZY+TkPly+J2T
X-Gm-Gg: ASbGncvvN82wiYfA3b5DghWHzV7i8CIAC5P28vYtcy5sJw5JdVPo0jlfdmkcSZeml72
	ym6b2bVoHXSEfDuylHP849VPIIcPBajhjFb/FKB4ZfasCoAXqtnwXaW6tCbeW2gj7iLoUgW9FuL
	VmOxfGNlhsgKrXYLWmiuNFLdl2zGnnV4lvcOGJCQh9YMkEFgw2c8/Cd3Y8eMjKd5dHi7ur+MXly
	U7I3AqSnpxgQE8B/FrCRmLcNWMIOq10VSaMRbnYKhVu+AAXYBa6LGNIy8hoVlA3xDRltmWguIcQ
	m0P4khOAOTgecPfgFaKl2DCI+RNOWICN+2nX7sjJdk5VzKAYk8iTzZ1qe6EQpLGzDvmNr0rNdf1
	2um6FH1t1F4BJaqzj8J4bx+HpGhAGddg23vwW1HOsJbSe6G38u8VfooOPqALk8J9nVqm4V9BhQ0
	WYaopoEZQOteDZ7A==
X-Google-Smtp-Source: AGHT+IFGLnTPEeXvcm+GGfl6CBTY5vZY+TMZKuP8C0mdF2eS+GOIBNKfaZId3bT76PPdZAnMpykN9A==
X-Received: by 2002:a05:6102:6c9:b0:5c3:689c:257f with SMTP id ada2fe7eead31-5d5e238d08dmr12036691137.30.1760539931248;
        Wed, 15 Oct 2025 07:52:11 -0700 (PDT)
Received: from mail-ua1-f52.google.com (mail-ua1-f52.google.com. [209.85.222.52])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-930bf6b1248sm4526999241.2.2025.10.15.07.52.10
        for <tools@linux.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 15 Oct 2025 07:52:10 -0700 (PDT)
Received: by mail-ua1-f52.google.com with SMTP id a1e0cc1a2514c-8e2e9192a0aso3823929241.3
        for <tools@linux.kernel.org>; Wed, 15 Oct 2025 07:52:10 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWzC4woZ0OphT9IsJPsMN9j+b4cFgfpyJ8Y29LGzbzGi8CtbLDCvIKnJG4PzwDFx5ZgvuTxDQ==@linux.kernel.org
X-Received: by 2002:a05:6102:3e25:b0:523:d0d7:b964 with SMTP id
 ada2fe7eead31-5d5e2209e9amr11231444137.12.1760539930008; Wed, 15 Oct 2025
 07:52:10 -0700 (PDT)
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
References: <CABgObfY5agTRsB-bCqCYbA0erFn5cVbujtTNBiCti8g_68nCWg@mail.gmail.com>
 <20251013081536-mutt-send-email-mst@kernel.org> <CAHk-=whSShtPG1_+02Cc4yDuEJxVqX=G8tAx0gW7UjA7cuBp-w@mail.gmail.com>
 <CAMuHMdWxMhM1J3zHC8OkN_fd8XsJPFA6jM_3JFU=ySKhnX6ESw@mail.gmail.com> <yq1qzv49yb6.fsf@ca-mkp.ca.oracle.com>
In-Reply-To: <yq1qzv49yb6.fsf@ca-mkp.ca.oracle.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 15 Oct 2025 16:51:57 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVX58j6kfGBdv0gBnOSUvf5fVoe1q1=zva1fMo-4undqg@mail.gmail.com>
X-Gm-Features: AS18NWCC6I7_uk7YEJEFKuLbLYKvU-EvG3JcoLfg5kqX0W5yDWXybyMJbjRsO4U
Message-ID: <CAMuHMdVX58j6kfGBdv0gBnOSUvf5fVoe1q1=zva1fMo-4undqg@mail.gmail.com>
Subject: Re: In defense of Link (was Re: [b4] initial "b4 dig" to supplant
 Link: trailers)
To: "Martin K. Petersen" <martin.petersen@oracle.com>
Cc: Linus Torvalds <torvalds@linuxfoundation.org>, "Michael S. Tsirkin" <mst@redhat.com>, 
	Paolo Bonzini <pbonzini@redhat.com>, Konstantin Ryabitsev <konstantin@linuxfoundation.org>, users@kernel.org, 
	tools@linux.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Martin,

On Wed, 15 Oct 2025 at 15:51, Martin K. Petersen
<martin.petersen@oracle.com> wrote:
> I think it would be incredibly helpful if people could reliably click on
> a link in a given commit description and see everything that was ever
> said on the patch in question. Both before and after the patch was
> committed, any regressions reported at a later date, etc. And regardless
> of which edits were made to the patch as part of the commit/merge
> processes and any conflict resolutions. Also, to me there is a lot of
> value in being able to see "no, there were no follow-ups or regressions
> reported for this commit since I applied it N years ago". No data is
> also information.

Exactly.  And if all commits would have such a link, the "Patch
foo has been added to the bar-stable tree"-emails can be sent as
follow-ups, too.  One ring to bind'em all.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
