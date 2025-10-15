Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 101441494D9
	for <tools@linux.kernel.org>; Wed, 15 Oct 2025 17:01:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760547684; cv=none; b=YUQD7QtDbsY+V5RmpswZeNtHZ0ZNsbPwF63d+CPpBd+fQS7jspUUB9zju1S+sHj6OjVEg10m5OzU+83WhBJaZTxddGZKkTplVySMuYeFBg5GX2A0IF4b0+p3iSFn1bsPF1tCbmIGKTJhOfgK5aSiYYcpwBrrZEEOZFuxaXFG3tg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760547684; c=relaxed/simple;
	bh=c/eGURZ5H6I5U0aoY0CWci1oKQQDohHSsQPzFR0hpvA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=h/QcfPgUpcoM4tcgeUc6WqLC8Lt3zhmGZvZ6IOhaxnwYXtRrbQAXnA+IAV6QPQO45XmfSo8c7dIRRwaD3KjjNv+b/bUp40/mNK6CE31dEd1TPVmEe/SO0/atqp7WH4ut4uzAICtT0gsz7Ti/adsVacpsiFM5psuoqOPO+iAdjFA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Z9vf2qQw; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Z9vf2qQw"
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-26816246a0aso12892525ad.2
        for <tools@linux.kernel.org>; Wed, 15 Oct 2025 10:01:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760547682; x=1761152482; darn=linux.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=c/eGURZ5H6I5U0aoY0CWci1oKQQDohHSsQPzFR0hpvA=;
        b=Z9vf2qQwVM0nFX5+z1PslCk1uBDUjz8hsq8UjxOFr2ySo+cqy4yULNdvpmTvQ8/JjU
         e6ePfyRc8RocbKD5VaqdaPKEC67i0n2kkOgKNh3moo1aSpar/2i/oHKFq7IBrgZh1pHi
         vlVR/tZhk3Kw5bmi+q6Tkujn6MSLbn0opfMiWTd3OdbQTTIiOOlFVbpzNzP6w3dsBzgj
         vikimNUtJxqiKX7fzbFQLCBgLc0F3axwJAwlPlqwm9hveKy6TaAURL5tLz9zzhaDnMp/
         37Wdt3ETeL1EOl6knr6BHomynS2xnsaWE3clPUDeRe79Kul21fDmbStzaxhPzHMNkEmy
         EZHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760547682; x=1761152482;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=c/eGURZ5H6I5U0aoY0CWci1oKQQDohHSsQPzFR0hpvA=;
        b=v9vy5N/dWQQsmSa/YY0gKMFghn3Vlljf5wssyuKuRi2Ha5gWiW8wJyLGT+W/t0zF3U
         U93T2yKBm8lj76dItjoBhFmGuWmHforI15sYAHWvSvF6h2aNB5NORLTg9UFaXHCMbIcO
         ulNNyYHOAjkn7XprGQXmrDP8Up8TUzgen0KKvUdOGewZeihL0XoFcnv/xRVrpiMc/yyn
         uOPM50K92LlyCHYKzuUENyEHlWLFi/ksNcGVA98miyf7AzexTKc3X7ffVm6hr4/hOSFW
         7ZSVwABGeWUVijuottCm9W8t0i4PNwV1s6O81+8J+U8LV6rZy9ekptxR9/luuyVHeOyQ
         rPWA==
X-Forwarded-Encrypted: i=1; AJvYcCWUeMlyUKhYtm0TkTMzU2Se5GTPeCz1QanZR0xv9XVYLQxsmTtmwfTdPOtFThRQls87wk6IyA==@linux.kernel.org
X-Gm-Message-State: AOJu0Yw4rG9Wy5dKY7rOw5HbET2nwrr7w9tDT7Ogzqi0DEUUsiK4i7E6
	3eJBigHkRvG2svA+ALarLjIv3bCDB/1pys8yA1VHbAWk+5/j0O3L13WPjPd/GsNNPcSh1A4fep3
	XRi//Lmyq1u9KougAloWiPfYJIte0ps4=
X-Gm-Gg: ASbGnctR8lfB2xRngghYPVyJsfAq9vnUVrgmc1junnXRRnGrqCheFghdTtnLHsYnLDl
	R6cSIx7HnGEpbm7lM8/jMCdx8woMIuh6WZyjQ0PTsCWPByNKTTV8VSFXqx1F4ljL/Gqb7B3oT8l
	3WEvQg+lONVUITrJVqj/865n/4tqv1tE6SRN2fJ2xhmywPFbRU1NxQR7VS37JSWP4+XZFH4hTj9
	yCMczYDFej30APS8khc/8/jLWwt5bTFkEQQ7do/BW0K1vBaWhmzi89Z+NGGAFgraVvnWxZyGNCk
	yJPO5B7jWcyYx8Y3KP4n+mSIJsRSzhCH7eeCNCSI3l2/
X-Google-Smtp-Source: AGHT+IFGGA5MotZ+K3j1WNpbNOiUXTl9AU2iFlHdiXYr0aA4MCAEBp/Lws91IT/gSOhzdSyXKOfk7YzGqkTZvcpmToQ=
X-Received: by 2002:a17:903:18b:b0:27d:6f24:ceb9 with SMTP id
 d9443c01a7336-290273e17b2mr207666865ad.3.1760547682175; Wed, 15 Oct 2025
 10:01:22 -0700 (PDT)
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
References: <20251013081536-mutt-send-email-mst@kernel.org>
 <CAHk-=whSShtPG1_+02Cc4yDuEJxVqX=G8tAx0gW7UjA7cuBp-w@mail.gmail.com>
 <CAMuHMdWxMhM1J3zHC8OkN_fd8XsJPFA6jM_3JFU=ySKhnX6ESw@mail.gmail.com>
 <CANiq72ka1y0YXysRQtuqnzc0i5FSbrGjKwprrXQpozwDOV3khA@mail.gmail.com>
 <aadb0515-4024-40c0-8024-fcdd029a3029@sirena.org.uk> <2991ae006906913c10715a9673ac53a4ea557728.camel@HansenPartnership.com>
 <20251015151447.GD3168635@noisy.programming.kicks-ass.net>
 <20251015111816.728bfda7@gandalf.local.home> <20251015155346.GA3287345@noisy.programming.kicks-ass.net>
 <20251015115917.5e031880@gandalf.local.home> <20251015160622.GB3287345@noisy.programming.kicks-ass.net>
 <9a07d307-ede5-404f-aff0-9f28f591e0aa@kernel.org> <20251015124408.1cc44dcc@gandalf.local.home>
In-Reply-To: <20251015124408.1cc44dcc@gandalf.local.home>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Wed, 15 Oct 2025 19:01:09 +0200
X-Gm-Features: AS18NWBUUpGoDQvQlw48RAzoGsx8DXu2CEqRIm74knLhVGoiA1sTnwoDQKTjnbA
Message-ID: <CANiq72=z+KP5305wRoJAbfcRxYHueiTv02aqsxfZHHEKRnFckg@mail.gmail.com>
Subject: Re: [workflows]Re: In defense of Link (was Re: [b4] initial "b4 dig"
 to supplant Link: trailers)
To: Steven Rostedt <rostedt@goodmis.org>
Cc: "Vlastimil Babka (SUSE)" <vbabka@kernel.org>, Peter Zijlstra <peterz@infradead.org>, 
	James Bottomley <James.Bottomley@hansenpartnership.com>, Mark Brown <broonie@kernel.org>, 
	Geert Uytterhoeven <geert@linux-m68k.org>, Linus Torvalds <torvalds@linuxfoundation.org>, 
	"Michael S. Tsirkin" <mst@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>, 
	Konstantin Ryabitsev <konstantin@linuxfoundation.org>, users@kernel.org, tools@linux.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 15, 2025 at 6:44=E2=80=AFPM Steven Rostedt <rostedt@goodmis.org=
> wrote:
>
> Yes, could we have a way to denote in MAINTAINERS if a maintainer wants t=
he
> entire series or not?
>
> I see people complain about both (like Peter and I are now).
>
> I don't want the entire series and Peter does. If we can denote a way in
> maintainers and have get-maintainers have some kind of option to make a w=
ay
> to send patches, this would be great!

That is the kind of thing that is meant to go into the Subsystem
Profile field (`P:`), I think.

But, of course, only some subsystems have written the document, and
even if it is there, it is unlikely that someone reads all of those
for treewide contributions (vs. contributors that often work in a
given subsystem).

So I think you would need something more targeted, ideally something
that tooling can automate.

Or, well, nowadays, with AI, I guess something like `b4` could read
those documents... :)

Cheers,
Miguel
