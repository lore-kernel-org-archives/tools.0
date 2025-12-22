Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 102C027E1C5
	for <tools@linux.kernel.org>; Mon, 22 Dec 2025 14:02:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766412134; cv=none; b=bolloHNe0UlTKj7nIQA2v4Am2GeZZ4n2UjC16QtWSLV1AXTydLSKXCuPFdTU7Cjh4UMKUBXYp+Fw2E/kglpaZRiNCauoXJm0HhJHWpOMxAk8o9W70hD+QNOMkSgt6/QHf94QUAszbFQa6cRzhkwHmh8Q2PfqMvnRbC+hsOcdi5s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766412134; c=relaxed/simple;
	bh=9PqyhGQDX93j8liY4bX98jGC3i5h063WUJZlFE9s6Ck=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ju0bYkMfKbv87v8N+k0c5YKwAHKNbv5CBNG5YK9IGXiOJgl8ZewzOXftI5l0Uk86tHcdPGWok8SlBoIWagFPHNVu5TYubWcm80B3wjAo3ujt4A8ndsLfI39YkYE9eKfPDcZq1U77S8B8xeW5Djt3nK/dfeS18xU55iSln1K7vLM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CBmu0eep; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CBmu0eep"
Received: by smtp.kernel.org (Postfix)
	id B7792C116C6; Mon, 22 Dec 2025 14:02:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A27D8C116D0
	for <tools@kernel.org>; Mon, 22 Dec 2025 14:02:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1766412133;
	bh=9PqyhGQDX93j8liY4bX98jGC3i5h063WUJZlFE9s6Ck=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=CBmu0eepFo2n9MeBVTcGZIDDbTTltzsKoRC44Y8Id200bchH6wHP/w/fX3vRQHSLn
	 9LCJFYP90sEd3PRHChvKkr1gjkWPS8/dh8Psd87Q5cqhPIvUwRZapt9AiXendasT6y
	 CBVRcSfRnNlKH3kscHfbdnma0yv8nCL+mZ9plXmKo6nfZ7PT1hoOkzQMcXAYHi52eA
	 mal5nE1afo1o4j12MCQ5hFJddjw+brKCkvehHHb+CQKE5KeuvVysE7G9yuHzHppi2U
	 jWkiePujn9g8KyNL/Q+Auew4vl3VicJa32msA+jCHEBIqjw9pGTSWQaAYYFd1WSyVK
	 uOHypKbNQJZdA==
Received: by mail-yx1-f50.google.com with SMTP id 956f58d0204a3-6447743ce90so3541760d50.2
        for <tools@kernel.org>; Mon, 22 Dec 2025 06:02:13 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCU1lQ1bF5VkUx7QtYsh6Liu8sv4zTVXLa61FTqpWluf5rxhVg5oTWUH+nB6U6YRz8Chp6k2Lg==@kernel.org
X-Gm-Message-State: AOJu0Yytq3hirnIG1vwUzv5ZvEMBqKkos+pqwZfv5YjZa49vQ/MCQ0Ro
	gMcMTrTS9MslTp4KPRsx3zT6L8OTdliLBx/ItSrTmTE+nXZ0YzLKmyCwnk75L0Mtckby7xYaH2M
	srP1RtzXw/qs41LMK1L41IGT2MaeJsQE=
X-Google-Smtp-Source: AGHT+IH9CodjmfcoGB7IeFju1GOOB9K/O/PbQHSGnrTx7yDjdAeH2G4rLurRm9YnF7+zpq53NgJKDlR8AAbfFGYQ4l0=
X-Received: by 2002:a53:da86:0:b0:63f:9c11:cfed with SMTP id
 956f58d0204a3-6466a842daamr6974603d50.32.1766412132985; Mon, 22 Dec 2025
 06:02:12 -0800 (PST)
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
References: <20251217-attractive-stalwart-seahorse-de4e3e@lemur>
 <CAD++jLmGuPxWLEcUaVMU9jCmEfrzUbgzMrFbd9uX+62avv9jmA@mail.gmail.com>
 <20251217-yellow-cormorant-of-debate-b55a75@lemur> <CAPKp9uY-BYKXAoWg8zPLhQjEHs4qqsW+qjYne7Qv1LKwL6BQUA@mail.gmail.com>
 <20251218-dove-of-fantastic-upgrade-c491ea@lemur> <CAD++jLk6=56izoMzfs_PVFvX3j9N+J6O1FGxrEg3wE78rOww4g@mail.gmail.com>
 <20251218-merry-azure-chicken-4d3724@lemur>
In-Reply-To: <20251218-merry-azure-chicken-4d3724@lemur>
From: Linus Walleij <linusw@kernel.org>
Date: Mon, 22 Dec 2025 15:02:02 +0100
X-Gmail-Original-Message-ID: <CAD++jLn=QckMx4QD=4fwQVcLYACJCgG0Hw6Bo6Wek4S4Ywn7VA@mail.gmail.com>
X-Gm-Features: AQt7F2qSwa7mU6ioE9g9Bl_guJJK8lTOonpwZKwZB6Bk7opfGD46Xea7K1d7rPE
Message-ID: <CAD++jLn=QckMx4QD=4fwQVcLYACJCgG0Hw6Bo6Wek4S4Ywn7VA@mail.gmail.com>
Subject: Re: korgalore v0.2 released with JMAP, IMAP, Maildir support
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc: Sudeep Holla <sudeep.holla@kernel.org>, tools@kernel.org, users@kernel.org
Content-Type: text/plain; charset="UTF-8"

I don't know if I'm doing something wrong but all imported
mails appear as "read" (non-bold).

In the code there is:
DEFAULT_LABELS: List[str] = ['INBOX', 'UNREAD']

so it appears the "UNREAD" labels was intended to be applied,
but it appears this isn't used?

Yours,
Linus Walleij
