Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1D5D14EC73
	for <tools@linux.kernel.org>; Wed, 15 Oct 2025 14:37:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760539066; cv=none; b=N3aRyh+W6sZyssC085vGf97qFAgcoUamuuWzxNOcTTiLMmT/O3aN4G74TuD7lrmeFvCRaWz0RJFTYxwdgyur784yd/K62G/iZpwKLHUDmk57OxB7v9lzTI2MiObRXZOjcLfYQkR/QHNRRzT7HFFGsupniDiFlNkVT/Yb/YsxjQs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760539066; c=relaxed/simple;
	bh=vT6j/8mRWwzRlOSs869F3P7Z8QC8sz3ahAQrq80vHUA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=rlLbmBbxDPrNqnWIYhc/u2CSY4yi7SL6Vv/sFwvB/89U4LV57E1b7m/vU4guzr/18/9qobiNcs5pExbDxkVsXAwpvpqPHg1LfSQnwF7BkJT0NUo5h2pFMY+5952TBaYZjb5whLRj6des2ADwYDPcT9yzrB1NSXa2cbdPOa9WhGo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=d3P7xUu4; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="d3P7xUu4"
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-269640c2d4bso11890135ad.2
        for <tools@linux.kernel.org>; Wed, 15 Oct 2025 07:37:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760539064; x=1761143864; darn=linux.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vT6j/8mRWwzRlOSs869F3P7Z8QC8sz3ahAQrq80vHUA=;
        b=d3P7xUu4iFeNOTKO65sTIPkZF7rbyw1ylvry/Lg5aWW7TYW3ARD7DwOo3UKkvhhGVM
         tSTD+1yZk0kRtZYeADLss4sfQCuzzYIpNPfNk9TZifKiviwihCkY3TV0KqCHrQ5XClwD
         maL2cGHCjhixxjyZcLzAIkWmpe1/ra+4a6u7Z2PFNdpVILyQgdUgsmjRNEgkN2mNF2kO
         mYGV2B5apvNDLupMs6U6V8Vn3rQa4lkLfNURJ3OeuYmJNcJMLfoMe324iGltr87PaDY8
         r/QSk+WCTuithwQ6tJ8fvrqq35YsuatDa6Kat0NUs+NPEVk0RtS9pOBFcp/4h3zHa5Tf
         ZTZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760539064; x=1761143864;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vT6j/8mRWwzRlOSs869F3P7Z8QC8sz3ahAQrq80vHUA=;
        b=uI8fBMtkEFZzdKAOaLkdcW/0nT8wIeCvzUvX7o5Mllmn/eG7L4xH+yb9ewujn4opRr
         IeVeLGVV6Me9oZXfb+flGigrTBS5EZAnCeIsD1qPDhD1wCjKgHA5z10PBcVcCu/msVg8
         kuePg9WCYeCPeoNPoiLLo9oDEBxxHhcN+9p5ivfjENg+Lz4jh1TGTEiXL/Z8bp8InNJX
         mtYcN6qGIkNqlEWLBzOYfQxE5Xlj4adxjTrmXUvgaiqW8Kh5I8DfItPV4kRResvBl84n
         8hsjJVfZYba9govDU+DuueqJOIFmK1+iu7gn8fvVWFpjTJmK7K3DS8MDSREBg6j7pwm6
         y6wA==
X-Forwarded-Encrypted: i=1; AJvYcCUfPv3JwuYRMrnBxKIlkHrn8js6XHjVSKVBp4LSNC6Jdw2aOzq1OCIsRhQ1MMHmYL1LOQe8DA==@linux.kernel.org
X-Gm-Message-State: AOJu0YzZooOhJKAG/AydGFY6oOt8klsxSY84RnatIDIssFL90T9vbjrB
	QGTcKxkn7XGNlQBEQLWo5RMcUANWgnrYvO6OWUX+6NRF8fDEq8OKyenwI+8NQ+hIs7WQ6uiPfGN
	/IAv5DoFFXEkI5sBZGH//RjinUpdDbFU=
X-Gm-Gg: ASbGnctenUqWbZCQc8/wKRa1Sofg+/g6gLF9mmCFbQxSXDtFSU29dIvE96foupg5icT
	U+csAY+eJuqTjqxTa2U0X0dvoO6Sj7GiY6xkVfAu/1F/dRRp9G2ze78B5jGpTlycTlDPudMcCEs
	kQJSh2YqbKUzGxPEs34uh1rq07dfTkDWNQPrS6v0IX/BRixwUI12IieaduGTTw75YhaxTIXHkLT
	845YOMmWkK75CzYnUdUj76KkKz45/Kp1dMlUgh3CS/CbNOv2EtFXHVuM/Ic/hm+lYXrQsthykP0
	f75RcKhugFwySE5jF3Ev4DGO8eWD1Cj0Ai7DVVMeh9hf
X-Google-Smtp-Source: AGHT+IF/5Q2Lpslbvk0XurHjEBMXpG0YqEOzvKcKxWpXcNBPDUB78iq1/5mP0EOZYVwuKycJJFDGNWOAqtSzAZXAjJE=
X-Received: by 2002:a17:903:3b87:b0:269:80e2:c5a8 with SMTP id
 d9443c01a7336-29086ad2d37mr20143605ad.7.1760539064107; Wed, 15 Oct 2025
 07:37:44 -0700 (PDT)
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
References: <CABgObfY5agTRsB-bCqCYbA0erFn5cVbujtTNBiCti8g_68nCWg@mail.gmail.com>
 <20251013081536-mutt-send-email-mst@kernel.org> <CAHk-=whSShtPG1_+02Cc4yDuEJxVqX=G8tAx0gW7UjA7cuBp-w@mail.gmail.com>
 <CAMuHMdWxMhM1J3zHC8OkN_fd8XsJPFA6jM_3JFU=ySKhnX6ESw@mail.gmail.com>
 <CANiq72ka1y0YXysRQtuqnzc0i5FSbrGjKwprrXQpozwDOV3khA@mail.gmail.com> <aadb0515-4024-40c0-8024-fcdd029a3029@sirena.org.uk>
In-Reply-To: <aadb0515-4024-40c0-8024-fcdd029a3029@sirena.org.uk>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Wed, 15 Oct 2025 16:37:31 +0200
X-Gm-Features: AS18NWAb5p5vi6C9hbldEBJaHRIFs5i9oPw-T7Rng0bfymBbC3UQTWw-hZoL03w
Message-ID: <CANiq72n+CZURF2cZo3_j49gXUbvYhT7sA2gFJsfOaPNUrC2+cQ@mail.gmail.com>
Subject: Re: In defense of Link (was Re: [b4] initial "b4 dig" to supplant
 Link: trailers)
To: Mark Brown <broonie@kernel.org>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>, Linus Torvalds <torvalds@linuxfoundation.org>, 
	"Michael S. Tsirkin" <mst@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>, 
	Konstantin Ryabitsev <konstantin@linuxfoundation.org>, users@kernel.org, tools@linux.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 15, 2025 at 2:11=E2=80=AFPM Mark Brown <broonie@kernel.org> wro=
te:
>
> Ccing people makes sense but doesn't need something in the patch body,
> and especially doesn't need to end up in the commit log.

I agree, i.e. I was talking about specific cases only (that are
manual), not the vast majority.

Cheers,
Miguel
