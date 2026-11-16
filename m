Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794841573;
	b=eGns1XeZUCFGI7gVta8DLQi1BbyIwsCCYX/3QqZe1i7/m7+98n39vsy51KyYFUkwhHys
	 HgS8p4YsxAR1TNeNkTmvzexeMTnWABm/euvNmBYj1i9ilonvLqXAhBgcSf5MiQYotxXgX
	 OMESQXnlD3SSko5DKaiRXgEBNXp0s3YZX70r81vETS9KTumGKVK0ZJU7ytBF44GMZxwOG
	 f26Wvvv4RMabMUvQz4/5aaAkjmsXmZ2wchE6bjktIGLgJBCNaV4QKNbCBR/NZRc9HdgHw
	 oZr1Yviqvuen54onl87ki2xU6GKCoXYiy1BLPZZuExXELXGt1MLOy6PYuhnSJazpLOQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794841573;
	h=Received:Delivered-To:Received:DKIM-Signature:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:Content-Transfer-Encoding:In-Reply-To;
	bh=A4ejsSLqtT05c0PFDQWsA0PS+WXJInyC4lFzs/A7TLQ=;
	b=r5sACkxNJ5s0nAaFYw2L7Ks+OThnthmtzCUlk0FFaOAoQ1BO1eagqk57DTlYXhuo2VBE
	 6GjVJ/gUacvAg6rLA+39TraYa4UFPtivk9EH7sQc5XO8hherot/Bp0t8j6LRnE7LONGUV
	 P9veSRKVWdl45Gao9l4KeJRGZgQ0kma36RTr6oUz4v822XwnoZ7aboLfgJ0PWyYNdNYCW
	 aDfdenDimREzLc2/wUgXJtsmooa/+ijAj6kbxaE6dBQdySUbW419AZj9hAbvu6Ji65T93
	 TZFM9BviZz9Iz0/r2xmQ7NEfAu4mQaGcYHKx9qOfyD+N2y/2Vv5+S6hY/FJfnyX7gDg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=kCX6QkgO;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F5F2606A31C
	for <tools@linux.kernel.org>; Mon, 16 Nov 2026 15:06:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=kCX6QkgO
Received: by smtp.kernel.org (Postfix)
	id E97421F000C5; Mon, 16 Nov 2026 15:06:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A19181F000C4;
	Mon, 16 Nov 2026 15:06:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1794841572;
	bh=A4ejsSLqtT05c0PFDQWsA0PS+WXJInyC4lFzs/A7TLQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=kCX6QkgO9gO5q0+NueeUSA2aW5/vN8fYgxf/Txd+GULc2gReEIcc18tKS4yWiwtHe
	 OIE7wVLF7tqKNRT1hM8EHa8+OsW+WqL3DnjCBx8RGZ2PTh4bYB3ZwvIUqpXwj2oUhK
	 EGch+Qy2vYxlZVyqVwKq5fmXc3KFIuuQaGUFF7Hw=
Date: Mon, 16 Nov 2026 10:06:11 -0500
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: James Hilliard <james.hilliard1@gmail.com>
Cc: "Kernel.org Tools" <tools@kernel.org>
Subject: Re: [PATCH kgl] Preserve original dates when importing messages over
 IMAP
Message-ID: <20261116-authentic-attentive-cricket-b046cf@toolbx>
References: <20261025-submit-imap-preserve-date-v1-v1-1-91ac2f5b502e@gmail.com>
 <179451279186.1693101.3646569244001837281.b4-review@b4>
 <CADvTj4oqJCvC1CoX4Dw=nXtCR4GYS5JiTNL5--iRKjCqG2FWzw@mail.gmail.com>
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Post: <mailto:tools@linux.kernel.org>
List-Help: <mailto:tools+help@linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
List-Owner: <mailto:tools+owner@linux.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CADvTj4oqJCvC1CoX4Dw=nXtCR4GYS5JiTNL5--iRKjCqG2FWzw@mail.gmail.com>

On Thu, Nov 12, 2026 at 04:07:04PM -0700, James Hilliard wrote:
> On Thu, Nov 12, 2026 at 12:46 PM Konstantin Ryabitsev
> <konstantin@linuxfoundation.org> wrote:
> >
> > > IMAP APPEND currently omits its optional timestamp, so the server assigns
> > > the import time even when the message has a valid Date header. Archived
> > > messages consequently appear as newly received in clients that sort by
> > > INTERNALDATE, including the Gmail web interface.
> >
> > In general, I would consider this a feature, even if this was not really
> > intended. I would specifically lean on this in a scenario where we
> > perform a "yank" command -- someone would routinely be yanking an old
> > thread and they wouldn't really want to go hunting for it in the middle
> > of last month's mail.
> 
> I checked the other targets, and there isn't currently a consistent
> date policy across them:
> 
> - Gmail API imports already use a valid Date: header. The target omits
>   internalDateSource, whose API default is dateHeader [0].
> - JMAP imports omit receivedAt, which defaults to the most recent
>   Received: timestamp, or import time if none exists [1].
> - IMAP without an APPEND timestamp uses import time.
> - Maildir preserves Date: but creates the file with an import-time mtime.
> 
> Consequently, importing the same archived message through Gmail's API
> or through IMAP can give it different dates in the same Gmail mailbox.
> Preserving Date: for IMAP would align the normal case with what the
> Gmail target already does.

Okay, after more thought, I think your reasoning is good. I didn't take your
patch series directly, because there is already code in liblore that handles
date header parsing and I wanted to use that instead of reimplementing it.
The latest master should have the functionality you were looking for and I
credited your submission with a Link: and Co-Developed-By.

Thanks!

-K
