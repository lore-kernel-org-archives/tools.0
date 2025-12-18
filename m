Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F97A30FC22
	for <tools@linux.kernel.org>; Thu, 18 Dec 2025 18:51:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766083908; cv=none; b=Qc9Pe7TUNenVRpoQfI68Bn9mKmo5A2dzZUw46N1kdWPShatM3I7sglag6kFg1P9jKqM0R9drT9d9FFX0K3IV3RuxZYUDgGU5aOVuFCfiA5NwsHN2xPcWlV8z+xegCVUPKX2JxGZkLLuB/GLvy10IP0Ew8ybf9DqZOPfzVyLDGZ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766083908; c=relaxed/simple;
	bh=MCcJ+XBftgPKZbgdyMyhWCim/wAS8Qku1RWuA/qnTrU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=EISjMkVZsXYgQKpLS4n3epIjyo4LaCXNU+8cd8YeXD7Fsjl62g5VO7HrcjB0m6QQQ36jOuwrYwx32hh9ddHxINEdkp6hiU2AR5TG8PaVgKMfDjnAmeK1sngaozzGtCAzS8oV0jVq4wbN1YpS/R1Lm09UN3p3X4rUNKWcVKfuBnM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Am+5Xlhh; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Am+5Xlhh"
Received: by smtp.kernel.org (Postfix)
	id 4AEB9C19422; Thu, 18 Dec 2025 18:51:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 35903C4AF0B
	for <tools@kernel.org>; Thu, 18 Dec 2025 18:51:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1766083908;
	bh=MCcJ+XBftgPKZbgdyMyhWCim/wAS8Qku1RWuA/qnTrU=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=Am+5Xlhhaqibz/3Fgbkkr6+EJRWUXyd2niulqkL95AfNqqThoKg1fYsa/P22HollV
	 JMd5GiDC2BbZwmF2zOIyLFF2hrsceEW4lq8b/ZWabPVMX0gvNEme3nGM5ubstIjzbZ
	 IjwukUUEdpurQ3KX2v8Cw1eAFVBnGEvGuAsdSJZsMF4zhiVIQ2CwQ64sXB9SAkl4cz
	 KBEnUAm6owL1EcpL7LwxZNdJrqVDCG8CXfdbbJr/oLj4EQbo9U7/ij5V/B6TsWRbfL
	 FpPCsSmvd93hR/H7jVr332PVZJHgeW3QFTn+ZLE+Do84NW/zZL/afkhacdH6np23IK
	 H3Tlh4G5qOdJA==
Received: by mail-lj1-f182.google.com with SMTP id 38308e7fff4ca-37b9728a353so11381741fa.0
        for <tools@kernel.org>; Thu, 18 Dec 2025 10:51:48 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWxApSqdM0EFXQnAghS3sasSUSnD+hZznBcvvmYmQ9qswGoYhol7NmdWj0dYOOl4GXeo1wgAA==@kernel.org
X-Gm-Message-State: AOJu0YyPxBamxp4tSyZrmBxxIx5o/onuWwFOZ+HtvYZHGx1r2M0R3ytH
	8yxwAc3Ybt7Lxgv3AQOEvg6ZdnXxRJG8WtbNSbM1gxIeNWpB2w4v7QkxXGxPxK3t2M51w98qhRD
	H5Qxsg3hEQd1LpKi4Yte5v+K2e5iUR3Q=
X-Google-Smtp-Source: AGHT+IFfiRL10Wc5CknZOHNAtqpLf5OzvXOoalE0uR7+lYh9b2hxNJ1ibi1/5TE5sZojBO6WZom+AZiu6j9UJQdZ65U=
X-Received: by 2002:a05:651c:b23:b0:37a:5990:2ba8 with SMTP id
 38308e7fff4ca-3812161517dmr1139121fa.23.1766083906540; Thu, 18 Dec 2025
 10:51:46 -0800 (PST)
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
References: <20251217-attractive-stalwart-seahorse-de4e3e@lemur>
 <CAD++jLmGuPxWLEcUaVMU9jCmEfrzUbgzMrFbd9uX+62avv9jmA@mail.gmail.com> <20251217-yellow-cormorant-of-debate-b55a75@lemur>
In-Reply-To: <20251217-yellow-cormorant-of-debate-b55a75@lemur>
From: Sudeep Holla <sudeep.holla@kernel.org>
Date: Thu, 18 Dec 2025 18:51:34 +0000
X-Gmail-Original-Message-ID: <CAPKp9uY-BYKXAoWg8zPLhQjEHs4qqsW+qjYne7Qv1LKwL6BQUA@mail.gmail.com>
X-Gm-Features: AQt7F2rjDz4Kh1SdAVxq4u5Z1YGylP7PMVPBONV-y6NksGRSCAoelMQ_hlqjGX0
Message-ID: <CAPKp9uY-BYKXAoWg8zPLhQjEHs4qqsW+qjYne7Qv1LKwL6BQUA@mail.gmail.com>
Subject: Re: korgalore v0.2 released with JMAP, IMAP, Maildir support
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc: Linus Walleij <linusw@kernel.org>, tools@kernel.org, users@kernel.org, 
	sudeep.holla@kernel.org
Content-Type: text/plain; charset="UTF-8"

On Thu, 18 Dec 2025 at 01:57, Konstantin Ryabitsev
<konstantin@linuxfoundation.org> wrote:
>
> On Thu, Dec 18, 2025 at 01:24:51AM +0100, Linus Walleij wrote:
> > With a simple LKML inbox, I got this error:
>
> > [...]
>
> >   File "/home/linus/.local/lib/python3.14/site-packages/korgalore/pi_feed.py",
> > line 386, in feed_lock
> >     lockfh = open(lock_file_path, 'w')
> > FileNotFoundError: [Errno 2] No such file or directory:
> > '/home/linus/.local/share/korgalore/lkml/korgalore.lock'
>
> Ouch. Yeah, this should fix it for you while I push out a better fix:
>
>     mkdir -p /home/linus/.local/share/korgalore/lkml

I am facing a similar issue where kgl yank works but kgl pull fails
slightly in a different way.
I started it with kgl, version 0.2.1

-->8

Updating feeds  [------------------------------------]  0/1
https://lore.kernel.org/lkml
Traceback (most recent call last):
  File "/home/sudeep/.local/bin/kgl", line 8, in <module>
    sys.exit(main())
             ^^^^^^
  File "/home/sudeep/.local/lib/python3.12/site-packages/click/core.py",
line 1485, in __call__
    return self.main(*args, **kwargs)
           ^^^^^^^^^^^^^^^^^^^^^^^^^^
  File "/home/sudeep/.local/lib/python3.12/site-packages/click/core.py",
line 1406, in main
    rv = self.invoke(ctx)
         ^^^^^^^^^^^^^^^^
  File "/home/sudeep/.local/lib/python3.12/site-packages/click/core.py",
line 1873, in invoke
    return _process_result(sub_ctx.command.invoke(sub_ctx))
                           ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
  File "/home/sudeep/.local/lib/python3.12/site-packages/click/core.py",
line 1269, in invoke
    return ctx.invoke(self.callback, **ctx.params)
           ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
  File "/home/sudeep/.local/lib/python3.12/site-packages/click/core.py",
line 824, in invoke
    return callback(*args, **kwargs)
           ^^^^^^^^^^^^^^^^^^^^^^^^^
  File "/home/sudeep/.local/lib/python3.12/site-packages/click/decorators.py",
line 34, in new_func
    return f(get_current_context(), *args, **kwargs)
           ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
  File "/home/sudeep/.local/lib/python3.12/site-packages/korgalore/cli.py",
line 714, in pull
    updated_feeds = update_all_feeds(ctx)
                    ^^^^^^^^^^^^^^^^^^^^^
  File "/home/sudeep/.local/lib/python3.12/site-packages/korgalore/cli.py",
line 461, in update_all_feeds
    updated = feed.update_feed()
              ^^^^^^^^^^^^^^^^^^
  File "/home/sudeep/.local/lib/python3.12/site-packages/korgalore/lore_feed.py",
line 143, in update_feed
    feed_state = self.load_feed_state()
                 ^^^^^^^^^^^^^^^^^^^^^^
  File "/home/sudeep/.local/lib/python3.12/site-packages/korgalore/pi_feed.py",
line 597, in load_feed_state
    self._perform_legacy_migration()
  File "/home/sudeep/.local/lib/python3.12/site-packages/korgalore/pi_feed.py",
line 136, in _perform_legacy_migration
    highest_epoch = self.get_highest_epoch()
                    ^^^^^^^^^^^^^^^^^^^^^^^^
  File "/home/sudeep/.local/lib/python3.12/site-packages/korgalore/pi_feed.py",
line 220, in get_highest_epoch
    epochs = self.find_epochs()
             ^^^^^^^^^^^^^^^^^^
  File "/home/sudeep/.local/lib/python3.12/site-packages/korgalore/pi_feed.py",
line 206, in find_epochs
    for item in epochs_dir.iterdir():
  File "/usr/lib/python3.12/pathlib.py", line 1058, in iterdir
    for name in os.listdir(self):
                ^^^^^^^^^^^^^^^^
FileNotFoundError: [Errno 2] No such file or directory:
'/home/sudeep/.local/share/korgalore/lkml/git'


-- 
Regards,
Sudeep
