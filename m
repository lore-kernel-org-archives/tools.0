Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DECA1233928
	for <tools@linux.kernel.org>; Mon,  3 Aug 2026 15:43:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785771786; cv=none; b=I58Fmjz6CStIIsc0myflb6UzE/KQWyh+0FLRi1jTcvQPQ7l3h1ftaK4PhNHmMTDdndolL0PSGXKHN1zAaGczIy2mvk8oKi/J6Vt/2tQazJcgfWQ9xgK0yIWZR399yRNo132/1Oywxke+o5kvg8Hr3hgg5sN1IHB5zeDV9uqCj9o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785771786; c=relaxed/simple;
	bh=n8x1TIV/b+2o+jbqEc8yEr4g+LBOHJlFMNoTeNQlL4w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nMRFr+8hnpKH6sdmaaLj70/zlFiFKJrtbN1TcOVUDviKSXfOxpTBl6MhL7WTAF2azhDdLaCJrFn5KrBWMvBFcsdHyWZR5Lpi07tREgH3CLateiIxmDWK/lqgQEkeV2w2eqSeHvfEwjbYcne7qxPNF4vpcTlFMKcvz/jehJocuno=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=Ot5UL7rf; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="Ot5UL7rf"
Received: by smtp.kernel.org (Postfix)
	id 6C94A1F00A3A; Mon,  3 Aug 2026 15:43:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0A7EA1F000E9;
	Mon,  3 Aug 2026 15:43:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1785771784;
	bh=KNNqrcKVLbPnG2jZXEfGIsbbhgb1FsoaMLf5AQqFLNw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Ot5UL7rfKVPnWYchIv+1r7ZmVFa4MUU5d5kixeChO4UKeK922hXUVT6eoAdAyOmq0
	 UdkCM4KsYfKP+Xu/lM0wcvlah3xJ7q/depnE5ZSWZtC0CW4LF4kmnryKfs1m9E6hWj
	 ncWuQbGgS5AdwgQ8mMvXfXQJWlXsaHZQlQ9f+dNs=
Date: Mon, 3 Aug 2026 11:43:02 -0400
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: Matthieu Baerts <matttbe@kernel.org>
Cc: "Kernel.org Tools" <tools@kernel.org>
Subject: Re: b4 review: reply to a patch note + misc.
Message-ID: <20260803-agile-bonobo-of-superiority-6791e9@meerkat>
References: <bc88076e-2629-45bf-ab20-242f823dde4e@kernel.org>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <bc88076e-2629-45bf-ab20-242f823dde4e@kernel.org>

On Tue, Jun 30, 2026 at 12:17:43PM +0200, Matthieu Baerts wrote:

Hi Matt,

Quick status update on your list -- good news on most of it:

> When a patch has a note under 3 dashes, the note is dropped when the
> patch is applied during a review, as expected. Except that it also means
> the note is no longer there when replying to a patch from b4 review tui.
>
> Do you think the "Reply" view could use the email from lore instead?

This one is confirmed and tracked, but not fixed yet -- I want to wrap up the
feature set for 0.16. Building the reply from the original message rather than
the applied commit is the right approach, so the notes should survive once
that lands.

> - I find it "too easy" to quit the "Review" view: I'm on a patch,
>   checking follow-up comments, etc. then if I hit an extra 'q', I'm
>   back on the "Tracked" list, switching back to another commit in git,
>   etc. Maybe a "confirmation" question could help? Or a different short
>   key?

Yes, I hit the same annoyance, so this is now fixed in master: bare 'q' now
just warns, and quitting takes a capital 'Q'. This is consistent across all
the b4 TUIs now.

> - When I press the 'review' button, I need to specify the commit/branch
>   for the new base. I usually prefer to apply it on top of the current
>   HEAD, but I'm not sure how to force b4 to suggest that by default. I
>   tried using "git config b4.review-target-branch", but it still guesses
>   something else.

Also in master: there is a new b4.review-apply-base config option. Set
it to HEAD (or any ref) and the base dialog will pre-fill with that
instead of the series base-commit or the automatic guess. The
auto-detected base still shows up in the dialog hint, so you don't lose
that information.

> - Could we eventually have a template for the replies? It would be good
>   to automatically add a header (Hi <first name>,) and a trailer (like
>   here at the bottom).

Done as well: b4.review-reply-template can point at a template file,
same mechanism as b4 ty's thanks templates, with ${firstname} and
friends available for substitution.

So: three out of four are in master -- only the ---notes one is still
pending. Thanks a lot for the continued feedback!

Best regards,
-K
