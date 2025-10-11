Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 539E5F9EC
	for <tools@linux.kernel.org>; Sat, 11 Oct 2025 22:47:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760222823; cv=none; b=TLkESu7V8WylSw0W3QBmiCKE/VCzei7444Rn/7AwVNURoMTLgrq2fJcXsb5nHHuy+0BoQzz45j1oJ8HcN+r3cd3P3BiJWkZr8VIkxBO5ycnzdHiza7rEG9gGkZrLuvxsK/e6J+Yx5AntpbLtg4h/i8kHST+TUYt9PRPWGy7Jf4M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760222823; c=relaxed/simple;
	bh=a4TVTtJn7EJogIN7D50onrJ/uepWOXBVLtxpuCN/pPA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=vFsHC70dvyDRLEWkpcTH4BAxECPigx4I+LbAJo0qlo5S7aL/Ov14ZmJ9Tq8PNqNvUzumS7olnUS0LCIbK9QAXBjz1GO0nwdTndW13W2haetso8cCQCnc3OymnKUVDD7f9VPfaII+FKde31ZxlLNPyCc7Gt0N09WLcZl+f7CFK4Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=gh+8zwg7; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="gh+8zwg7"
Received: by smtp.kernel.org (Postfix)
	id 10229C2BCB8; Sat, 11 Oct 2025 22:47:03 +0000 (UTC)
Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id C5915C4CEF4
	for <tools@kernel.org>; Sat, 11 Oct 2025 22:47:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org C5915C4CEF4
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-6399706fd3cso4592155a12.2
        for <tools@kernel.org>; Sat, 11 Oct 2025 15:47:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1760222819; x=1760827619; darn=kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=brnw8K2402i3J0cHwdVF18tq3XDnIbX6elYFphf6Np8=;
        b=gh+8zwg79G7gOa66q5/AWbY9L2/At7rxYXLWsryoo7B06YByp0xhKXmb7tbd41ScN8
         PPZ+Mk4N3fYUTyw+XZX8kGdlGkBDqCPHwmxMLlppAVLHMsN+thvegnTiei/mpCgnk+IR
         bHUGUgYxZ+obzbJQq1s7nQelOHSHSpiwpiGxE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760222819; x=1760827619;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=brnw8K2402i3J0cHwdVF18tq3XDnIbX6elYFphf6Np8=;
        b=PZOOJJV/eX2zLjtJkKGJj5Z07S5drTe6UbCxJykg0ELYguwZghxXg4GwkL8ONURUYf
         t10qqYug6Y9kZ3EMBYXhnMl69L/YOb/Tz2pxohV2g98bey21YZBYcVELjXsyWb1POqyM
         0CPW1MnT7A8uML1US01W79nEKTHfqx6WWSIQBI3jB7+1/FHyQF6e9EbZnhR/Mu+iU43+
         T8wm5ssHfJwio8G4gzzlgJNRBVwHZaKH4UuFdH+5irpZPjy7r5DQiZQefwsKBP8RrVAt
         3H/tqUdsLlydh/9XLps8wqiCrVqssEf7RgmEpwmnk19UJoG8pczh2jiWdi+r/8ah5Von
         V0dA==
X-Forwarded-Encrypted: i=1; AJvYcCUrtVFsQt4mc0YXoOL5Gok7A66zJHkPhVHN/HLfkZvMQDjNygDCZmjFDLD0sGJZdFL1Z5gzZw==@kernel.org
X-Gm-Message-State: AOJu0Yw3+h1LynorIeW91piGqQVFZeNmoCdCmGdKAYKOp2byi8HrbQb5
	eScQ0hjr4rcOg57ZwugGs4nWzpzfDQgp4wEwLyozIUWpfHFLWyEMoFvYxaBwomq1GaGA30Wut0R
	QRGa1HFo=
X-Gm-Gg: ASbGncsdBbIaBMRaSEOiXoKi+xOT1jiQi9GWWOyfx1mITUS/4M8HtakMvDUng9LoYgb
	FsblR0rOB6vKhsjMVxply+pYc3YhIjzBvLzw6erGu7dTxDFTgnhD85Zg5wE3mCjYM0E08pIcbV1
	viFRuigLyLsq8b9BTnBXRI8WzAQH1wJCQBSvWA8GEWm0godnPZiqDBpyRDqHW4jA4p+5tmXpT23
	1VcvkVMLnSe2DxkLS/qnvCaHWAugEts4sw4pAGskHbflATEhUeO2fgFp3L/3e6lw0rQMrWtSheb
	LPDb4lUfu61aBoYQqdPQQ2gCIItAb7jnreqNAkHNzxCwQsTAuUkvfJaclzmJCx15l+yUZrNqVOM
	zdZCwZE8TuPk+UOr78Apj08Tfm1aJLLMG6JSVKAhPdPABR+09YjAyDzVyjtyv5HRXGoZOsogSdG
	WhC5uUPVzuP6i9beJUaxKNED4S
X-Google-Smtp-Source: AGHT+IGQRku4KBg4rMWM4xMYswUD0EaYTneV/glTN0Ts/dfVsgDLja/aVMKdMTtx/cYKp5ag7sFybw==
X-Received: by 2002:a05:6402:26c9:b0:639:dab5:d605 with SMTP id 4fb4d7f45d1cf-639dab5db04mr15863826a12.27.1760222818802;
        Sat, 11 Oct 2025 15:46:58 -0700 (PDT)
Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com. [209.85.208.53])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-63a5c1323ddsm5658707a12.29.2025.10.11.15.46.56
        for <tools@kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 11 Oct 2025 15:46:57 -0700 (PDT)
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-62fc28843ecso4616071a12.1
        for <tools@kernel.org>; Sat, 11 Oct 2025 15:46:56 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVieTtJR7geLLlT2ZKo45BwWvQBxfcBqKIekRQjsedg6YGePyQFzD2eqLwrW+NXy6ZWM2NaQA==@kernel.org
X-Received: by 2002:a05:6402:440d:b0:639:1ee3:4e83 with SMTP id
 4fb4d7f45d1cf-639d5b62b23mr14100076a12.8.1760222816605; Sat, 11 Oct 2025
 15:46:56 -0700 (PDT)
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
References: <20251010-muscular-camel-of-acumen-00eeaf@lemur>
In-Reply-To: <20251010-muscular-camel-of-acumen-00eeaf@lemur>
From: Linus Torvalds <torvalds@linuxfoundation.org>
Date: Sat, 11 Oct 2025 15:46:39 -0700
X-Gmail-Original-Message-ID: <CAHk-=wgNNVkgDco67tVceM87B7kkVZK=Oz8RZti1v6N2_+S+2w@mail.gmail.com>
X-Gm-Features: AS18NWDxIToUon1ho6MFxK7o5jChgFxf491HQ1u1bGkYqn6qxfSlqx52Ff_Czkg
Message-ID: <CAHk-=wgNNVkgDco67tVceM87B7kkVZK=Oz8RZti1v6N2_+S+2w@mail.gmail.com>
Subject: Re: [b4] initial "b4 dig" to supplant Link: trailers
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc: users@kernel.org, tools@kernel.org
Content-Type: text/plain; charset="UTF-8"

On Fri, 10 Oct 2025 at 13:48, Konstantin Ryabitsev
<konstantin@linuxfoundation.org> wrote:
>
> 1. We don't currently weed out AUTOSEL/stable backports, so older commits may
>    end up in lots of false positives for now. I've not yet figured out how to
>    avoid this without hardcoding it to be kernel-specific.

Why don't you just weed things out by the commit date? You know that
any backports will have a date after that, and that anything that was
the source of the commit will have a date before.

The author date will be fuzzier - because it might come from the
email, but it might also come from the email *containing* a "Date:"
line. But the commit date is reliable.

And by "reliable", I obviously dismiss people having their clocks set
wrong etc, but that seems to be happening a lot less often these days
than it used to.

             Linus
