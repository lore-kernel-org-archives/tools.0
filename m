Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E74552F5328
	for <tools@linux.kernel.org>; Mon, 22 Dec 2025 15:11:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766416301; cv=none; b=Y132K2gGwdX6AJA6lyDvXSkHAqjYWdzdcS/xTb5fF12407d1esVU8nup22eAVnDeIL0OLCywOGKbLkzByiBT3sfZbaLTviTSuv/M8i6PO54rsJKnaRlrEFtYq7VEQhWsWWTfTNWD6pxSCskwaFnksEAIns2egmh7YlG6z12E8J4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766416301; c=relaxed/simple;
	bh=H4CodB2itu/RgZQWS7C+BKSUfWHJ53Z6+YSsm4MbKvU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=meXCmE00Qqiw5hHloJhlVlkHVcmgL4+LLRKNHbppELetZgU2v0GMV5UCHq5wvWgsTXerCZdEkxbKZWQNhttLihDFCe2lwUjpDNoKj6dYphEbUk5wkWO4WAV3zJxu6DBWEZfWFc3k5JAf6WiGLLqvxZN9+pFTk5KnRyKW4hYfnD4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=awVtlfpc; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="awVtlfpc"
Received: by smtp.kernel.org (Postfix)
	id A4B74C19422; Mon, 22 Dec 2025 15:11:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8F214C113D0
	for <tools@kernel.org>; Mon, 22 Dec 2025 15:11:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1766416300;
	bh=H4CodB2itu/RgZQWS7C+BKSUfWHJ53Z6+YSsm4MbKvU=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=awVtlfpc8Gg/JQz3oJ32CIQ0wMsP9OBzO/Bjw8JDmxn0hmF5IBRNfQJa/X/UTRUbj
	 +/YqLXGKAFaW8oM5MU0erLhqqgeAlv98t/BRaYEcWTEXLdIHMeq3/9+Rk58s+XEw7u
	 ZfZAwuDdhgqbZAyObrIwhSjo8TRFpHIQQNdMUj+fn0S+BjhTF9Ra9ckE9YVyyuEsRA
	 nM1IIiBMXnbJseD8XjKCdOFx2FKxJLOwFz7CPRgFB9p1F/hFLOL5KzIJkDVydjp3ST
	 lAKusY2QpdtlaKheTGhnSKpL3MFiBK+g+h+XlAM7N9dv5PabmTdv+nP7qGteU7Zwvm
	 kiWTP3cFUT/Rg==
Received: by mail-yx1-f49.google.com with SMTP id 956f58d0204a3-6442e2dd8bbso3046499d50.0
        for <tools@kernel.org>; Mon, 22 Dec 2025 07:11:40 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWV66rP2GdtVZSxqqL1BYDbyxDLEtG0Xj7rnXU/ScqH2iwAFprbcFMKmuW2g2ulX8X2c2S3UQ==@kernel.org
X-Gm-Message-State: AOJu0YzjuXxdoxAlAurhdVt+Urpw8WnabeaAAr87xhI6g9nUgGZCwAXg
	7hbBLBS+898IRn54zY3U+wO4I+ZnoClqbIUYGZa8kwt4EiV02y0WtEt4/24Kig+Kvxp0m2I6BeB
	vTlK+KXuUT6dnMGqkCoKVIngE/uP6gEI=
X-Google-Smtp-Source: AGHT+IEtSOqaomHL2IrTjwt82zTkBn9geYNhfM34Lx6IAxF6L4RYOpiVQ9GUkH1saZfZ1O/vM8puUkINKEMA1Um5sYI=
X-Received: by 2002:a05:690e:4012:b0:645:68e5:11e0 with SMTP id
 956f58d0204a3-6466a87ec9dmr9899358d50.17.1766416299930; Mon, 22 Dec 2025
 07:11:39 -0800 (PST)
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
 <20251218-merry-azure-chicken-4d3724@lemur> <CAD++jLn=QckMx4QD=4fwQVcLYACJCgG0Hw6Bo6Wek4S4Ywn7VA@mail.gmail.com>
In-Reply-To: <CAD++jLn=QckMx4QD=4fwQVcLYACJCgG0Hw6Bo6Wek4S4Ywn7VA@mail.gmail.com>
From: Linus Walleij <linusw@kernel.org>
Date: Mon, 22 Dec 2025 16:11:28 +0100
X-Gmail-Original-Message-ID: <CAD++jLmJOEBVnYPX-Gjj2FSgHU7XZLiiMpvZMQcT5gWYeH7juw@mail.gmail.com>
X-Gm-Features: AQt7F2qohDYQiUp0bx6eKUr4rCrKECRMdcMEOBVP3sa-fpKjcCSc6r7yhEeIBiw
Message-ID: <CAD++jLmJOEBVnYPX-Gjj2FSgHU7XZLiiMpvZMQcT5gWYeH7juw@mail.gmail.com>
Subject: Re: korgalore v0.2 released with JMAP, IMAP, Maildir support
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc: Sudeep Holla <sudeep.holla@kernel.org>, tools@kernel.org, users@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Dec 22, 2025 at 3:02=E2=80=AFPM Linus Walleij <linusw@kernel.org> w=
rote:

> I don't know if I'm doing something wrong but all imported
> mails appear as "read" (non-bold).
>
> In the code there is:
> DEFAULT_LABELS: List[str] =3D ['INBOX', 'UNREAD']
>
> so it appears the "UNREAD" labels was intended to be applied,
> but it appears this isn't used?

This naive patch makes my imported messages unread:

$ git diff
diff --git a/src/korgalore/gmail_target.py b/src/korgalore/gmail_target.py
index eba025465f25..8e2fe3affea1 100644
--- a/src/korgalore/gmail_target.py
+++ b/src/korgalore/gmail_target.py
@@ -150,6 +150,7 @@ class GmailTarget:
             message_body: Dict[str, Any] =3D {'raw': encoded_message}

             if labels:
+                labels.append("UNREAD")
                 label_ids =3D self.translate_labels(labels)
                 message_body['labelIds'] =3D label_ids

Yours,
Linus Walleij
