Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A8FC253951
	for <tools@linux.kernel.org>; Mon, 23 Jun 2025 13:28:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750685309; cv=none; b=ZfNVKvKZVI+t25wHTwsPvGAj9ytxKHxH0UOtuL4I/p5nfaSvYtuf8Y1ydnw5MlrA6X/glyZ0SDvNlc23mBfVCUpiysPj2LAMTROmaV110/NyfLvSbD/ksO9W9nFUEMgMGI0Hvn6fKpXdEOSBg7//ulY9kGxWYNE++43GxoC1rCY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750685309; c=relaxed/simple;
	bh=M/05iL/gqplHdspF1H1P+EyauZRDiLKYUBnwAK+mrWw=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=MUQDQehAjAcQea9+IK0Idahbp77fOT4CJk+gNTrHfoS9Lu2OFC/RWTpQAGoFEYl3jQW64d8ZEpu7P5S+DTxF/PuokxlxQVoIYRJQcNxxP2TXtEIS8UNqjihfkcxTQXr+J/BBf1zvS6kGU9L50k8YkMvSTzysEwMIN2841RWWP4I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=n6WV78Cy; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="n6WV78Cy"
Received: by smtp.kernel.org (Postfix)
	id 131E6C4CEEA; Mon, 23 Jun 2025 13:28:29 +0000 (UTC)
Received: from mail-wr1-f74.google.com (mail-wr1-f74.google.com [209.85.221.74])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 16C1DC4AF0B
	for <tools@kernel.org>; Mon, 23 Jun 2025 13:28:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 16C1DC4AF0B
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=flex--dvyukov.bounces.google.com
Received: by mail-wr1-f74.google.com with SMTP id ffacd0b85a97d-3a4eec544c6so2097379f8f.0
        for <tools@kernel.org>; Mon, 23 Jun 2025 06:28:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1750685306; x=1751290106; darn=kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=M/05iL/gqplHdspF1H1P+EyauZRDiLKYUBnwAK+mrWw=;
        b=n6WV78CyqbbuMXeg4/3uvoLdGgWgdh+3LJwksT/jrJHRMQjBE2kSN0GCtMo5XulNSM
         ms/SVFJsDy28OJxuqNhEKvj/rDELhWfFobzhYfQPp3cyrvqgBkvC37QHkJKtn2iInjIL
         nDAacWkyUiDmwxfc7PIUpLZsJAeCJjMmrUFcIESxwL/dnbDytkCvkHcYk23vIVKzhg+w
         Cm1Xw8CX5jX1Rr5s8UVERZ5UX27GmOg3817dlbAde6w3WYQNarPDIlJHjdHkEykmMUbl
         Fcky2jckk+csThqobOQwvv7UTzX/m4sZ16CqaJtpJEOIkdaV8FbQFLIGZMGv+7jpcv4d
         g0Gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750685306; x=1751290106;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=M/05iL/gqplHdspF1H1P+EyauZRDiLKYUBnwAK+mrWw=;
        b=TDpIWLNtyNqSY/NQ2z9CUyl1GivSF4oevvNpm1HmRAfEoHJWqK7StbTgHQnScj1a20
         18X5EBou4tIc0D3oaUhmflGRyZQmfcc5iRVMftsXPiYCAhLpc+GjbGYB4T/zsMgQZHnd
         Bosj//VyQvFzZpe+6X4qSxwonPHEmJKs25oeNnJxzabHZI4GohwXFCh2GYABoL5OuU7y
         W8daGsd3vycITcwMxxsb0ayk4n/qB7KYT+tPKNJZpMnzdpfM38kfokAVYj4bqRijE0av
         WJbbUCqvWUlCojNRfTKp/CmLTnJi6TbdqmSA8gKbQwK90CdwWkrArqyAYfh8Uw3HC7Ml
         wZpw==
X-Forwarded-Encrypted: i=1; AJvYcCWaqh/NksMTX5qYlbR8tloelE3b1o0uY8L/QnCBxehJvDehz8W2vmX6DOlRjKZAJusUpJEwVA==@kernel.org
X-Gm-Message-State: AOJu0YxuNMh/q6MUGK3PcmFcHCAhtpMQ3PdAsGBvaBleIAJWXWKQ6pie
	227bHe1Sdk8UfW5uFEfu5sEVdLjESYWb+mQL+1Lgor+xthYgZvAhrfnrWFIt4JGFMj6EnBeIZpQ
	OVCtyFGPDyw==
X-Google-Smtp-Source: AGHT+IEQemU9U1qSUFKz2+7itsR5jiBLvrwnJtII5ZYSZrfv9r4t0m/l4xKKQuRElhwXLh7ukcOz5A85xW+D
X-Received: from wrck9.prod.google.com ([2002:a5d:5249:0:b0:3a4:e841:e092])
 (user=dvyukov job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6000:1448:b0:3a5:25e0:1851
 with SMTP id ffacd0b85a97d-3a6d12fb2dfmr10350377f8f.7.1750685306572; Mon, 23
 Jun 2025 06:28:26 -0700 (PDT)
Date: Mon, 23 Jun 2025 15:28:03 +0200
In-Reply-To: <aFNYQkbEctT6N0Hb@lappy>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
Mime-Version: 1.0
References: <aFNYQkbEctT6N0Hb@lappy>
X-Mailer: git-send-email 2.50.0.rc2.701.gf1e915cc24-goog
Message-ID: <20250623132803.26760-1-dvyukov@google.com>
Subject: Re: [RFC 00/19] Kernel API Specification Framework
From: Dmitry Vyukov <dvyukov@google.com>
To: sashal@kernel.org
Cc: kees@kernel.org, elver@google.com, linux-api@vger.kernel.org, 
	linux-kernel@vger.kernel.org, tools@kernel.org, workflows@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Nice!

A bag of assorted comments:

1. I share the same concern of duplicating info.
If there are lots of duplication it may lead to failure of the whole effort
since folks won't update these and/or they will get out of sync.
If a syscall arg is e.g. umode_t, we already know that it's an integer
of that enum type, and that it's an input arg.
In syzkaller we have a Clang-tool:
https://github.com/google/syzkaller/blob/master/tools/syz-declextract/clangtool/declextract.cpp
that extracts a bunch of interfaces automatically:
https://raw.githubusercontent.com/google/syzkaller/refs/heads/master/sys/linux/auto.txt
Though, oviously that won't have user-readable string descriptions, can't be used as a source
of truth, and may be challenging to integrate into kernel build process.
Though, extracting some of that info automatically may be nice.

2. Does this framework ensure that the specified info about args is correct?
E.g. number of syscall args, and their types match the actual ones?
If such things are not tested/validated during build, I afraid they will be
riddled with bugs over time.

3. To reduce duplication we could use more type information, e.g. I was always
frustrated that close is just:

SYSCALL_DEFINE1(close, unsigned int, fd)

whereas if we would do:

typedef int fd_t;
SYSCALL_DEFINE1(close, fd_t, fd)

then all semantic info about the arg is already in the code.

4. If we specify e.g. error return values here with descirptions,
can that be used as the source of truth to generate man pages?
That would eliminate some duplication.

5. We have a long standing dream that kernel developers add fuzzing descirpions
along with new kernel interfaces. So far we got very few contributions to syzkaller
from kernel developers. This framework can serve as the way to do it, which is nice.

6. What's the goal of validation of the input arguments?
Kernel code must do this validation anyway, right.
Any non-trivial validation is hard, e.g. even for open the validation function
for file name would need to have access to flags and check file precense for
some flags combinations. That may add significant amount of non-trivial code
that duplicates main syscall logic, and that logic may also have bugs and
memory leaks.

7. One of the most useful uses of this framework that I see if testing kernel
behavior correctness. I wonder what properties we can test with these descirptions,
and if we can add more useful info for that purpose.
Argument validation does not help here (it's userspace bugs at best).
Return values potentially may be useful, e.g. if we see a return value that's
not specified, potentially it's a kernel bug.
Side-effects specification potentially can be used to detect logical kernel bugs,
e.g. if a syscall does not claim to change fs state, but it does, it's a bug.
Though, a more useful check should be failure/concurrency atomicity.
Namely, if a syscall claims to not alter state on failure, it shouldn't do so.
Concurrency atomicity means linearizability of concurrent syscalls
(side-effects match one of 2 possible orders of syscalls).
But for these we would need to add additional flags to the descriptions
that say that a syscall supports failure/concurrency atomicity.

8. It would be useful to have a mapping of file_operations to actual files in fs.
Otherwise the exposed info is not very actionable, since there is no way to understand
what actual file/fd the ioctl's can be applied to.

9. I see that syscalls and ioctls say:
KAPI_CONTEXT(KAPI_CTX_PROCESS | KAPI_CTX_SLEEPABLE)
Can't we make this implicit? Are there any other options?
Similarly an ioctl description says it releases a mutex (.released = true,),
all ioctls/syscalls must release all acquired mutexes, no?
Generally, the less verbose the descriptions are, the higher chances of their survival.
+Marco also works static compiler-enforced lock checking annotations,
I wonder if they can be used to describe this in a more useful way.



