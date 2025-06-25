Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C051B28466E
	for <tools@linux.kernel.org>; Wed, 25 Jun 2025 08:56:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750841778; cv=none; b=Cej0ZkfEgedkwQS8wxWPNAcWXpeDlG73txWa7OWHaToil3XemM8b5cvfbqKad1UvAszXEgtnH00C03P/loWHu2UzZV6Pqh/HgifD4Mlzso4Rnv5lyYyC15ENyerSJO8WGdzLfT78Uu3r5HzvQLWP2RXdsAZacXleTbta38Q7uog=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750841778; c=relaxed/simple;
	bh=ol6hG/xIb5bYbNO2SBhx7LVEvxidce1MZgkT1Tx5R7U=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=hh3KtNE+MG7gTxHtQSseEgR3p7M0zJBrjlIZZahmYln4TfaDhifpAiCkO5VWPXBdoNzRNsI26UnaNT1UZ9rZTgZzwZ0y2XVp8zwIywL9NV4pyu3E8rZZ3bRRvFwiuQy360ob0SgMqcAZ4xLFlo/cFL3z3F2p2BMMr0tuOFvmFow=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=05j5TKqb; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="05j5TKqb"
Received: by smtp.kernel.org (Postfix)
	id 9B023C4CEF2; Wed, 25 Jun 2025 08:56:18 +0000 (UTC)
Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com [209.85.208.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id D6EB8C4CEF1
	for <tools@kernel.org>; Wed, 25 Jun 2025 08:56:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org D6EB8C4CEF1
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-lj1-f181.google.com with SMTP id 38308e7fff4ca-32b553e33e6so54530001fa.2
        for <tools@kernel.org>; Wed, 25 Jun 2025 01:56:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1750841776; x=1751446576; darn=kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=ol6hG/xIb5bYbNO2SBhx7LVEvxidce1MZgkT1Tx5R7U=;
        b=05j5TKqbo1DegqwzfD53C99I4t6VVfA3rveirEugfwQPYYN5c8QSZFzY/rGzB8tNFl
         EKYaIDtaK2JtZEP7PMm6SaYUl8hzhn7O86i0CoU5DE/WVO/GSz6Szk8IDu6HOf9YSFAq
         +t2s5drisGVBgpIiYWyFgNSIwsmNl66rt55vWS2F11ghIceMvveHIvxjw6VkFxf/Lx19
         t5bRsPNWtDarvTMOJnHrEbgNSykRvTRq9YXbM9wTFAymDG2pPJKtzHoJIAZFM/gH0yLO
         tFlolnzzUWVKH3UcZFtzz9BFuZruuMudzb+C1i4RGHkEXqjHGqMr5zlSyRo5HC4SfD4O
         Ja0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750841776; x=1751446576;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ol6hG/xIb5bYbNO2SBhx7LVEvxidce1MZgkT1Tx5R7U=;
        b=LdyO+4FQW+CeF/q9P0bUgk4kBsiyOEG+JZvg26HVSOnG69PrTD9P80RwtzSR7ob+X6
         ZKqAi728wIbgRtXBX8v1NEC4fuwMv97zMFoEKAbCWaX8Bz6N1beLWF4KgZaPXDRHh/t2
         B7fEu4gVSTr3sh+BCdyVd1YaUFAt8Rpe+JezjGZth9XMDsMCrI7ZDIi3x92H0vl5tgT8
         PY6Y5VS3MJcB4Qyc9Ecj7Ty2pnlgNf2sJyiNeLfXvUzykiiFMBnhGVafuApuUmTiEcMH
         mz8vO7cK4Vt4EK1NYjNc4u5oK7zooC4mXGd6YJlHHeOf9nmirVogOj4ha4XAlaKr2ZMf
         7M2w==
X-Forwarded-Encrypted: i=1; AJvYcCXQfALWeblzTMkBgC6s4JbjKWa0jC0VsB74lJxyYOtGAOlmiMejWimHS1czAZUo3v9ndk29rg==@kernel.org
X-Gm-Message-State: AOJu0YyhrpCQcyChf8Vlx1sXmEakdoeIALDKz6Rd/nYr0+kTb3m74ivC
	Igcz9tQM91rcBNwX94HWvBQjAzWiPsNY09bzNwM/Ud45VFl81nLbzBZSVJ/dBHI1gfwm6TXzFfs
	ny/lK+tkeJ+QWayRVbvrVeCPbzqUvHkPxMa5s39xK
X-Gm-Gg: ASbGncues5NQwgTb3nBy5cMUy4B6y/+r9BCMs0Wab0oqoR2Vzf7l7HabZoMsz7usgEc
	urCOfJKiuhpI825pprH4+iuxg8QEwKGUtX2WNuzGQ7janrdfaxXjwOzX9a0j9U6PkmmUClrRK0E
	Pb0qAuYSYxvZafuyhWv8f2evA8zZSOpYsIJNq8hdw00B7iW2gJjfzO6JtQKboDgwAh40aZTvov9
	Lny
X-Google-Smtp-Source: AGHT+IFpgMsBCJNfJjNTqTcRqyvaAq9toiC+ROW42NXwQoaO1HLVScBehwrjaxIyE7j0rk+vG9CVwK1uxS5kBraTZEY=
X-Received: by 2002:a2e:8a90:0:b0:32c:bc69:e91d with SMTP id
 38308e7fff4ca-32cc6591e04mr3745431fa.39.1750841775748; Wed, 25 Jun 2025
 01:56:15 -0700 (PDT)
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
Date: Wed, 25 Jun 2025 10:56:04 +0200
X-Gm-Features: Ac12FXwcV14oy7Lg0QTHJjjjHfOFa5hONjjoyvSSHa4vsJdvjxnzlzXvHlNTG4A
Message-ID: <CACT4Y+bV-3HgNOAd+f7W0RBU2-qoocpMCepKhLEb+BcyiJM5Mg@mail.gmail.com>
Subject: Re: [RFC 00/19] Kernel API Specification Framework
To: Sasha Levin <sashal@kernel.org>
Cc: kees@kernel.org, elver@google.com, linux-api@vger.kernel.org, 
	linux-kernel@vger.kernel.org, tools@kernel.org, workflows@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Tue, 24 Jun 2025 at 22:04, Sasha Levin <sashal@kernel.org> wrote:
> >9. I see that syscalls and ioctls say:
> >KAPI_CONTEXT(KAPI_CTX_PROCESS | KAPI_CTX_SLEEPABLE)
> >Can't we make this implicit? Are there any other options?
>
> Maybe? I wasn't sure how we'd describe somthing like getpid() which
> isn't supposed to sleep.
>
> >Similarly an ioctl description says it releases a mutex (.released = true,),
> >all ioctls/syscalls must release all acquired mutexes, no?
> >Generally, the less verbose the descriptions are, the higher chances of their survival.
> >+Marco also works static compiler-enforced lock checking annotations,
> >I wonder if they can be used to describe this in a more useful way.
>
> I was thinking about stuff like futex or flock which can return with a
> lock back to userspace.

I see, this makes sense. Then I would go with explicitly specifying
rare uncommon cases instead, and require 99% of common cases be the
default that does not require saying anything.

E.g. KAPI_CTX_NON_SLEEPABLE, .not_released = true.

KAPI_CTX_NON_SLEEPABLE looks useful, since it allows easy validation:
set current flag, and BUG on any attempt to sleep when the flag is set
(lockdep probably already has required pieces for this).
