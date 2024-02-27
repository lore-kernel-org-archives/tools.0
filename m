Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 123A155E50
	for <tools@linux.kernel.org>; Tue, 27 Feb 2024 23:36:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709076977; cv=none; b=f+xOEXLPV08/H5PsyzdDmkQrvuFmHVanEUdL1uyn7CLdvJq+A6tSwljLDPsHNU6aJUE7wDg29r3aF+wIL7C+seP51aaesgDbe3jAQnrPMBcVnpyxi4+9St/f6EEK/xCa5mnEBtn0DQ0hbpLeiVAz9W9Hn4O1uLw6Ekzlpm3rrMo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709076977; c=relaxed/simple;
	bh=jxG6LpvJFPMwKvthVAFYMswdtFgvTmCuOhxQBi1sjoA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=XpmqTitLtfbo6t8kilvoSrSMmdkyJy1JAMNpzK/XtD0w9s1qTl43FrG2FMM1aa1ln6TH88+Ejgu4SsZ+z/5bVlpJSS1valLvd+AqfyGlKt8QBWF10Bs+7vH0qxvZs1hHIo0H8zgetbJ3o46H6+dvxWgzGF5aJo3+dgwdZMnqI1A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix)
	id B30DDC433F1; Tue, 27 Feb 2024 23:36:16 +0000 (UTC)
Received: from mail-ot1-f46.google.com (mail-ot1-f46.google.com [209.85.210.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id B37E4C433C7;
	Tue, 27 Feb 2024 23:36:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org B37E4C433C7
Authentication-Results: smtp.kernel.org; dmarc=fail (p=none dis=none) header.from=pobox.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ot1-f46.google.com with SMTP id 46e09a7af769-6e48e42a350so1980809a34.1;
        Tue, 27 Feb 2024 15:36:15 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709076974; x=1709681774;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LdI2X8i39h7lNyezT3MNte/xo0yw1K+6IRHFFnRsFAM=;
        b=C7FZIl9Z8BmORi/qn71PTLADLPGe50sR6C5NyF3uH1mv0czXaqlXQrl5scmzHypALZ
         ErGtVlZ9YdqUE0BjwKECGIEOr916Ahjpjy+Zou5PMZi7+OhO1uUyT+hJIVmJxp+HYhWQ
         nwR8dQc/vh3WrQBCHoZaRHZTnffdwcLf4gy1fvYuO5H4QWV802b2lxAlEBy982SE7e8O
         TJb2tnJNmvL9dEDVbNNQkUEeaLs1rzvz2tDIJVoXvNTgqcQC/wKVtwB3RF6hJUvspvgD
         xpn9UK2hq3NkllvO4Ytq3L9Gu30v6pgAKrsoq06XtEGf+uz4TVyMjn59mm9jvl53vPci
         Nk3g==
X-Forwarded-Encrypted: i=1; AJvYcCXDbYBrZZGF8Yja/RMZZthMddCu1v+jVRhGBX2JIAM4Uvj6U4IEInOqo9x5k/tWmvGBaSKmGGYRKHO3qU4lqOju
X-Gm-Message-State: AOJu0YzzXubnZhP3hNOmVRt6zK9kv+lGYgAtEjil+stIkgU4klJJ6eH8
	LMahgi+i/sFT4vUryMNpt0Qic0PnFPcDAKPKwSYlmiyLnu//qwmwlco4CDiNojLkY0XmPrQhUyT
	m0HeSWfEtzX7EXHz1LCDs+A31aRP5MZlE
X-Google-Smtp-Source: AGHT+IGGwElNmh27FqvwDGj9r5hA5yZwhzuu4R0bYdvNk7mMgtBQMdmthqifTbSV2eD8aL3D0LZ7POKzTvcRFsJNmhk=
X-Received: by 2002:a05:6871:a4c7:b0:21a:5866:f619 with SMTP id
 wb7-20020a056871a4c700b0021a5866f619mr13577837oab.27.1709076974454; Tue, 27
 Feb 2024 15:36:14 -0800 (PST)
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
References: <20240227-flawless-capybara-of-drama-e09653@lemur>
In-Reply-To: <20240227-flawless-capybara-of-drama-e09653@lemur>
From: Junio C Hamano <gitster@pobox.com>
Date: Tue, 27 Feb 2024 15:35:56 -0800
Message-ID: <CAPc5daVFWQ0eUrZb+JHiUUAnmME6fwBpc9-qjtRwtCm20dp2JQ@mail.gmail.com>
Subject: Re: Toy/demo: using ChatGPT to summarize lengthy LKML threads (b4 integration)
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc: users@kernel.org, tools@kernel.org, workflows@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

As somebody who (1) did not read the actual thread and only read the
text in the demo, (2) would probably not understand the details being
discussed if he read the actual thread anyway, hence (3) would not
know if ChatGPT in the demo were merely hallucinating, it was a very
nice demonstration. Of course, you are interested in knowing if people
find it "useful", which I unfortunately cannot offer much useful
input.

On Tue, Feb 27, 2024 at 2:32=E2=80=AFPM Konstantin Ryabitsev
<konstantin@linuxfoundation.org> wrote:
>
> Hi, all:
>
> I was playing with shell-gpt and wrote a quickie integration that would a=
llow
> retrieving (slimmed-down) threads from lore, feeding them to ChatGPT, and
> asking it to provide some basic analysis of the thread contents. Here's a
> recorded demo session:
>
> https://asciinema.org/a/643435
>
> A few notes:
>
> 1. This is obviously not a replacement for actually reading email, but ca=
n
>    potentially be a useful asset for a busy maintainer who just wants a q=
uick
>    summary of a lengthy thread before they look at it in detail.
> 2. This is not free or cheap! To digest a lengthy thread, you can expect
>    ChatGPT to generate enough tokens to cost you $1 or more in API usage =
fees.
>    I know it's nothing compared to how expensive some of y'all's time is,=
 and
>    you can probably easily get that expensed by your employers, but for m=
any
>    others it's a pretty expensive toy. I managed to make it a bit cheaper=
 by
>    doing some surgery on the threads before feeding them to chatgpt (like
>    removing most of the message headers and throwing out some of the quot=
ed
>    content), but there's a limit to how much we can throw out before the
>    analysis becomes dramatically less useful.
> 3. This only works with ChatGPT-4, as most threads are too long for
>    ChatGPT-3.5 to even process.
>
> So, the question is -- is this useful at all? Am I wasting time poking in=
 this
> direction, or is this something that would be of benefit to any of you? I=
f the
> latter, I will document how to set this up and commit the thread minimiza=
tion
> code I hacked together to make it cheaper.
>
> Best regards,
> -K
>
