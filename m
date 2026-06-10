Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E744E22A4E1
	for <tools@linux.kernel.org>; Wed, 10 Jun 2026 01:11:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781053863; cv=none; b=GmP11hvTv0KH0yPAl1ZJPB06Cm8YIN8AXQUnW613hADV39YLme+lPC1TKMU4sHSg4aRZ1ARb0/IHs7psWv9rH8ZqBfvdRoo5w5J5r/onfgAqIEnFJ4nUmNMjLooerX0dY5oUZlMfJ9Ej/rHYV4FCXvq236CMbiuNhNe01ONXvu8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781053863; c=relaxed/simple;
	bh=P87SDXJp6hsgoMjDW2Bc2VTxMunCPhkvuhc20jM5JIY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=srzlmYnY4d07NB6blAz7zJbZ6MGKQCJYQqOFHuecwuM7AAGDdBPbI0kgHkMY6n0fpn1mOWpK7tAcGv2ZcmejVSH/BsEMvZAUkVea+jkYMwXSnCpHDzVAgVWgM/8fkY69LwtjLVVJecIDY6+0jnmb1moBsCTtbgw2GInFNtodtdk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=c7KvG7PR; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="c7KvG7PR"
Received: by smtp.kernel.org (Postfix)
	id 9C38B1F00899; Wed, 10 Jun 2026 01:11:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5281F1F00893;
	Wed, 10 Jun 2026 01:11:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1781053862;
	bh=ngVhOd+tSlbUFNG+muwySIanTTey4k/O33rf0AvZV9U=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=c7KvG7PRl1XCBZxAL1r46tEZTzKu4W9KB7gppBxRMcsyx7M+hs7OlE3dccDkW9S/r
	 xwmmonkf/lzwU5R8i3PEih+4IdXFIQOojrHzHw+EnrTgFHG/lILRiSnngB2wBOm15+
	 AJrEv4KBHpbATe7VpJNz1cDsc3VgrHLwP6YL7vZo=
Date: Tue, 9 Jun 2026 21:11:01 -0400
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: Christian Brauner <brauner@kernel.org>
Cc: tools@kernel.org
Subject: Re: [PATCH b4] review: allow a custom Message-Id command for TUI
 replies
Message-ID: <20260609-loutish-busy-curassow-33ac37@meerkat>
References: <20260522-review-msgid-cmd-v1-1-facc71f2e084@kernel.org>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260522-review-msgid-cmd-v1-1-facc71f2e084@kernel.org>

On Fri, May 22, 2026 at 12:57:56PM +0200, Christian Brauner wrote:
> The review TUI composes replies and sends them directly over SMTP via
> send_mail(), bypassing git-send-email and therefore any sendemail-validate
> hook that would normally rewrite the Message-Id. Review replies thus always
> got a built-in <...@b4> id.
> 
> Add an opt-in b4.review-msgid-cmd option: when set, run it and use its
> stdout as the Message-Id (angle brackets optional), falling back to the
> built-in id when unset or on failure. Wire it into both the review-reply
> builder and LoreMessage.make_reply() so follow-up replies are covered too.
> 
> Signed-off-by: Christian Brauner (Amutable) <brauner@kernel.org>
> ---
> I love b4 review and I'm in the process of making it my default review
> tool. 2026 and kernel review is officially better than Github. Didn't
> expect to see that day tbh.

Oh, amazing, thank you so much for saying that. :) I'm not sure I'd go as far
as being better than GH -- there are still lots of sharp edges, but I'm glad
it's starting to shape up a little.

> All my reviews come with specific message ids and I would like to be
> able to continue using them so I would appreciate the ability to define
> a message-id generation command in the [b4] .gitconfig section.

This patch won't quite cover every possible case -- e.g. it will miss the
thank-you notes that are still sent with the same code path as "b4 ty". Let
me think of a more global way to plug this in that won't clash with
message-id's that are generated for series with "b4 prep/send".

Thanks,
-K

