Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B53551E505
	for <tools@linux.kernel.org>; Thu, 18 Dec 2025 00:25:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766017502; cv=none; b=i+GzeVwIZvKfXDxKKT+N4c4ZoJZCwMaXnUKvA25to9lqiZ/meiFx+HQOkKTz/uWwp59Q603+NM9ANG+ShWP4ff4T5GwOJDD3/V1Ny7ySfLO7LzsxqhpDy38qKNq2RrDW0dZioKa5XPHwh2vVqtmspbqzo6vNaBSk+87B6Jhets0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766017502; c=relaxed/simple;
	bh=LuAcXkicXBJSOA+jiC0sUZV1TjDU1vIz5rA1vDBp3Ko=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=k+MOmlfqqQj6CCLFyNtrwEjvq0eS6NCVyCZOwGb1ezZNbWBMGLJ58c15I+nqE5rZiCgqKuGs7bNFcm7dilMI9QLQqaL69gOt5yZhVeusdbjM9fszXRjC/4IKSFd6FE9JscUqU/0de2NFWAwYz/0NSvCHQeZ2v+9sSinya6lvn8E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=A0IyICsH; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="A0IyICsH"
Received: by smtp.kernel.org (Postfix)
	id 9E955C116B1; Thu, 18 Dec 2025 00:25:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 88F33C4AF0B
	for <tools@kernel.org>; Thu, 18 Dec 2025 00:25:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1766017502;
	bh=LuAcXkicXBJSOA+jiC0sUZV1TjDU1vIz5rA1vDBp3Ko=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=A0IyICsHoKo6qN5H+Gbo7NkzHrESW7jP9RPAfGB/kzCf4giX3YJnbi5CTUK29FNVB
	 E/KtP/G7RhgRdaXAbMi/qo7dTpSJTsIHviI4OoZoHJZnpfzPuBiVjtUatgW39J+pcC
	 mwFikfWI9aFqCTi6pOz/WdskNmu0flDCh9CPRhtfWtxu2ZaZk1OamJd4P2XoyGiS1R
	 MdGEBM5SyxZ71yGusirkSwtOHGYqr6ekMp7e5MDLH+25H//X2aoqB/9RjEpZaEzI0M
	 JdgRpJPbs+cjYt3wLTh6Bpeohq8OcTAVV+AVlaGLrU7IAhvSDUvKRYuuuPPw1zU+jO
	 VWtAWoZioo7ZQ==
Received: by mail-yw1-f176.google.com with SMTP id 00721157ae682-78e7a16e4c0so215067b3.3
        for <tools@kernel.org>; Wed, 17 Dec 2025 16:25:02 -0800 (PST)
X-Gm-Message-State: AOJu0YwEENCdXq+Ok4KStCCfsn47HheDqs70bCpov51ClM6vQ03BJZsS
	9X4TEgYjUhsmrUbK4PV08Or3dDIwMURwNdnplcktNFIgADxA7DwjyJta8eNTbOM1al9NyTJ34s+
	yFgdxCuYasqt7TnpjWPDwzX03ROFfRsg=
X-Google-Smtp-Source: AGHT+IH5sjTmSWGeXVQjZNpQhu6BuEMa7nRJ0XbKj7iOvSH0O/nqreKx7F4MBnpxAGDnqjlxAQmrPpUU0J3IWQoDvKA=
X-Received: by 2002:a05:690e:1388:b0:63f:ab4c:9603 with SMTP id
 956f58d0204a3-6455564ef60mr14461641d50.45.1766017501855; Wed, 17 Dec 2025
 16:25:01 -0800 (PST)
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
References: <20251217-attractive-stalwart-seahorse-de4e3e@lemur>
In-Reply-To: <20251217-attractive-stalwart-seahorse-de4e3e@lemur>
From: Linus Walleij <linusw@kernel.org>
Date: Thu, 18 Dec 2025 01:24:51 +0100
X-Gmail-Original-Message-ID: <CAD++jLmGuPxWLEcUaVMU9jCmEfrzUbgzMrFbd9uX+62avv9jmA@mail.gmail.com>
X-Gm-Features: AQt7F2omVC4ilpnRynEFxxS7q_ELvjoksfG5hgUY3HEZ3iB_--bFEAfZA1J8pWc
Message-ID: <CAD++jLmGuPxWLEcUaVMU9jCmEfrzUbgzMrFbd9uX+62avv9jmA@mail.gmail.com>
Subject: Re: korgalore v0.2 released with JMAP, IMAP, Maildir support
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc: tools@kernel.org, users@kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Konstantin,

I set up korgalore and auth and all.

kgl yank works fine!

kgl pull doesn't work.

With a simple LKML inbox, I got this error:

$ kgl pull
Traceback (most recent call last):
  File "/home/linus/.local/bin/kgl", line 8, in <module>
    sys.exit(main())
             ~~~~^^
  File "/home/linus/.local/lib/python3.14/site-packages/click/core.py",
line 1485, in __call__
    return self.main(*args, **kwargs)
           ~~~~~~~~~^^^^^^^^^^^^^^^^^
  File "/home/linus/.local/lib/python3.14/site-packages/click/core.py",
line 1406, in main
    rv = self.invoke(ctx)
  File "/home/linus/.local/lib/python3.14/site-packages/click/core.py",
line 1873, in invoke
    return _process_result(sub_ctx.command.invoke(sub_ctx))
                           ~~~~~~~~~~~~~~~~~~~~~~^^^^^^^^^
  File "/home/linus/.local/lib/python3.14/site-packages/click/core.py",
line 1269, in invoke
    return ctx.invoke(self.callback, **ctx.params)
           ~~~~~~~~~~^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
  File "/home/linus/.local/lib/python3.14/site-packages/click/core.py",
line 824, in invoke
    return callback(*args, **kwargs)
  File "/home/linus/.local/lib/python3.14/site-packages/click/decorators.py",
line 34, in new_func
    return f(get_current_context(), *args, **kwargs)
  File "/home/linus/.local/lib/python3.14/site-packages/korgalore/cli.py",
line 738, in pull
    lock_all_feeds(ctx)
    ~~~~~~~~~~~~~~^^^^^
  File "/home/linus/.local/lib/python3.14/site-packages/korgalore/cli.py",
line 463, in lock_all_feeds
    feed.feed_lock()
    ~~~~~~~~~~~~~~^^
  File "/home/linus/.local/lib/python3.14/site-packages/korgalore/pi_feed.py",
line 386, in feed_lock
    lockfh = open(lock_file_path, 'w')
FileNotFoundError: [Errno 2] No such file or directory:
'/home/linus/.local/share/korgalore/lkml/korgalore.lock'

My config:

### Targets ###

[targets.personal]
type = 'gmail'
credentials = '~/.config/korgalore/credentials.json'
# token = '~/.config/korgalore/token.json'

### Deliveries ###

[deliveries.lkml]
feed = 'https://lore.kernel.org/lkml'
target = 'personal'
labels = ['korgalore/Linux-LKML']

Running on Fedora 43.

Yours,
Linus Walleij
