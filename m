Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A5FC25A655
	for <tools@linux.kernel.org>; Mon, 16 Mar 2026 07:06:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=10.30.226.201
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773644771; cv=pass; b=WcUCaDdzhZE/sbacUvF4P7g5dYkjvaU4SslPxC0EhEwXdlCexpgSbNuZGR7wxbw0NDdb3XIeC/58V5WwJP01Tl7n6E7CjL+NoJ61IWJcLyE6IMuqp4RxLBiyEZkMyspmZZoxWZzI9/5JNuJwn5EHsquNjZ4KBYLu8TkLEuLq9zQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773644771; c=relaxed/simple;
	bh=DWa/MwbMbU4Cgy8HcLpzA6KnltFCFdwdVTLoxcjvQIo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=hLP/kaOj2tPoOcDWbeowz5XG4EDb/7AKQmjgd0/2tSxkdGFIOG+YTU4ttPPzaXnOBYTnbOjvxYXo4FUxfyx8SpKmefVyJ4MT5itOddynMjV9Mib8+bfhrBxVnEMEw3tg4lT+/al0ytf6ETY4SC/RmHWeqU/B/ZpGfmOzurxe2lk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=BJbWjkhK; arc=pass smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="BJbWjkhK"
Received: by smtp.kernel.org (Postfix)
	id 15E3EC19425; Mon, 16 Mar 2026 07:06:11 +0000 (UTC)
Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com [209.85.208.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 7281AC4AF0C
	for <tools@kernel.org>; Mon, 16 Mar 2026 07:06:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 7281AC4AF0C
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-lj1-f182.google.com with SMTP id 38308e7fff4ca-38a3fd333eeso33991981fa.1
        for <tools@kernel.org>; Mon, 16 Mar 2026 00:06:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773644766; cv=none;
        d=google.com; s=arc-20240605;
        b=NkNLCblCzCHvrccnzCj9OcBmEB/dvOOTMbHSpLZ2cKGAkWvKSD1xZvu+LoFMPZI4LW
         XFurvbc8G60D0B5jP1I42Wn7J4dnA1XTpSJ8msNGqDYCknqEczFTasdsE7JGGtjok+MF
         xjuHfdfzIU8iOXl758V36v7C63TqM8aThl6C146aS+1vX65+Qcvi1Bbcuk6chtAvEz+D
         rB1jtC6c+ZYWhgw7iUDX5lzmzF0c/bs0LBkr0XuLXA1Qm4kQiBbEK/63o+OYjmHvmk8N
         bP/0q92qU//IupP2qlDpqPvB0BTP0A0q3j5IA7cPJ8oppHjuIetP6sujPK0SPw+hJtgT
         knDg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=DWa/MwbMbU4Cgy8HcLpzA6KnltFCFdwdVTLoxcjvQIo=;
        fh=ayghbocQh6Fqdty9QvGE+NiGw8G3Ktw6f5hhsb2kztQ=;
        b=XmswBzFGFtwQIHbCxRLQU/cAeStSr8XhHpZuNGX7dxIhMTdhBUz4UwtUs/fYGQTFyF
         EzuC5BiH+Fsjx3DHBCl+r/TTuQ06aQrLZfvIJ6TJoDtboBkPIyscBTua02ktsCIEfOn7
         TIlhG+4PTKs0uh+i8uICF3DMVFQsgNjP7Hocp0k40Jr7ouD8ZZ5tcT+81J7qGddpRqIL
         ts1QHWlPePYdVPzZcJpkxyvx2EqJSvknPfEvlOEtSBlVdNBNjHAxOylpqiShqSh/2XWa
         ahtjDlSTDdek7gZQ/EbVB7O9fVBO/87S4DoW61p/T+NiU4lhBY6hTF+/r1e3GqiRdR4S
         EPig==;
        darn=kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1773644766; x=1774249566; darn=kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=DWa/MwbMbU4Cgy8HcLpzA6KnltFCFdwdVTLoxcjvQIo=;
        b=BJbWjkhK+ocsj+/DFy8Bdkb0x/wBt3Jpmn0YBMmHINgUS/Oy7AlFTHpH0uV1JQzjrH
         yoEGB+G0ejqH6EgBngST7OG7Yy1DVbgR0YzA4RRUYUSVPxM8ZMvEEyl0lyjCx4ZuQfq+
         lx7OQJb1Y3TFy6XV4ReSNXiVKujUhVNbNgwqGw1qJ7mBn2lRIOuJpAjPEDl6eDBTYRgH
         6Tka8ecIbApoM6ZCFPSfcT5w1QpyViRtXH12XRrd2p7P+hLwTb5FZL+40PN7UASvJvC2
         BPI7stFLCWbdkIqAxXamjynQkj3+h6TbdCa0il/6odZ3QDvN7CSwb4DA/iB8l+9dBaW3
         Ufsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773644766; x=1774249566;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DWa/MwbMbU4Cgy8HcLpzA6KnltFCFdwdVTLoxcjvQIo=;
        b=mwbmRnpQ89AYrS9w1icM81xLCtcRwXTZjj+NDIgcOU84cGJfV3aeN6eg84GXd7odcr
         ZZgegrku/lygWl0UCoY0xlzZXbtJ1iWTAccyQcljp1TKx4G/rB1d5JZ12PlpYxx7mZah
         OGC1Xs+m3jmtwwxLT08g6t4bhGRkV2d9kp3k/FGzqrPXzF0jcWEYNbT+8e/WteN9l/DP
         RIFWw1ggVwEAbqLgRm01st2Q1NwU9SmwP6zBg3/Sft5uKqyPBUCVcwxmQgK02JOUdBL6
         S0OYuX32vil01DV1jgotaiWE4OJayhzFexB1Qn5MdtK8PvHLVgxQ62Ay/MtR1NTIr8W+
         m6Mw==
X-Forwarded-Encrypted: i=1; AJvYcCXjUGpnA1qywfNVvKc1LyKwt61RYS31XXxJWo3fMRqBrVHnvN4CD4nqdqxwQtvF378dX6v2Xw==@kernel.org
X-Gm-Message-State: AOJu0YzSNy56YyaN1r9TnXyORVjUZxZWaxViAHXeo6ChFXuzxnNGV/tY
	p/rTrWCGv8S6Rd0UaxVOnlF8rEGSrfHyo5jWsr1OuN7r+yGefQT3E6qQqjlhcTO0Vzhh2xc/FN4
	Cb7pRwki26hgZQFoDMiEIVTrH5Y3VCsFOnuc0Fs8N
X-Gm-Gg: ATEYQzyQlTvc+Ev70FTTGfo28OFBRoMJmhJQ7Ot5duJPchyPelck5S+bfh2piStkQax
	YdAr9hdgiirKlARsF/9X4hQeyxASDxGygKKEnvBWMk2o8SKlaA/TEEs92SKSQuQw2tSRm7Ig6F3
	26nNfAdj07Sro76z9niQJ9GRlOAzszobvaqA74K0dSwrIKowFV48dEILLQoDsdPDk72QqjUsaB9
	nfZ85po3HQge90XT2146lLD96Znh3Md2ow1ZPfnklWtz57JX5MhSWeQBPn8vgEIS8xQv5l2ru+J
	e/n0VBLN0G4hPr5QQcwkOAkTG9HcXJj0x8wT7GjSnbUhTl/coT3chkKYOzFv9qftefjiOA==
X-Received: by 2002:a05:651c:4356:10b0:38a:2db9:eb72 with SMTP id
 38308e7fff4ca-38a8864c94amr30667511fa.16.1773644766146; Mon, 16 Mar 2026
 00:06:06 -0700 (PDT)
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
References: <20260313150928.2637368-1-sashal@kernel.org> <20260314111822.63a2ba4a@kernel.org>
In-Reply-To: <20260314111822.63a2ba4a@kernel.org>
From: Dmitry Vyukov <dvyukov@google.com>
Date: Mon, 16 Mar 2026 08:05:53 +0100
X-Gm-Features: AaiRm53tuutFjpddzDm8MgJQk_X6I9zzb6Uz-8-_BFX3BICSXZm9HxgKcE0xoPQ
Message-ID: <CACT4Y+arWePyxnV3hWk5RanWZpoc7=ALQ6DV_2MCuQkNoTtJUw@mail.gmail.com>
Subject: Re: [PATCH 0/9] Kernel API Specification Framework
To: Jakub Kicinski <kuba@kernel.org>, syzkaller <syzkaller@googlegroups.com>
Cc: Sasha Levin <sashal@kernel.org>, linux-api@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-fsdevel@vger.kernel.org, linux-kbuild@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, workflows@vger.kernel.org, tools@kernel.org, 
	x86@kernel.org, Thomas Gleixner <tglx@kernel.org>, "Paul E. McKenney" <paulmck@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jonathan Corbet <corbet@lwn.net>, 
	Randy Dunlap <rdunlap@infradead.org>, Cyril Hrubis <chrubis@suse.cz>, Kees Cook <kees@kernel.org>, 
	Jake Edge <jake@lwn.net>, David Laight <david.laight.linux@gmail.com>, 
	Askar Safin <safinaskar@zohomail.com>, Gabriele Paoloni <gpaoloni@redhat.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Christian Brauner <brauner@kernel.org>, 
	Alexander Viro <viro@zeniv.linux.org.uk>, Andrew Morton <akpm@linux-foundation.org>, 
	Masahiro Yamada <masahiroy@kernel.org>, Shuah Khan <skhan@linuxfoundation.org>, 
	Ingo Molnar <mingo@redhat.com>, Arnd Bergmann <arnd@arndb.de>
Content-Type: text/plain; charset="UTF-8"

On Sat, 14 Mar 2026 at 19:18, Jakub Kicinski <kuba@kernel.org> wrote:
>
> On Fri, 13 Mar 2026 11:09:10 -0400 Sasha Levin wrote:
> > This enables static analysis tools to verify userspace API usage at compile
> > time, test generation based on formal specifications, consistent error handling
> > validation, automated documentation generation, and formal verification of
> > kernel interfaces.
>
> Could you give some examples? We have machine readable descriptions for
> Netlink interfaces, we approached syzbot folks and they did not really
> seem to care for those.

I think our reasoning wrt syzkaller was that not all interfaces in all
relevant kernels are described with netlink yml descriptions, so we
need to continue using the extraction of interfaces from the source
code. And if we have that code, then using yml as an additional data
source only adds code/complexity. Additionally, we may extract some
extra constraints/info from code that are not present in yml.

Realistically system call descriptions may have the same problem for
us at this point, since we extract lots of info from the source code
already:
https://raw.githubusercontent.com/google/syzkaller/refs/heads/master/sys/linux/auto.txt
(and LLMs obviously can allow us to extract more)
