Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C43C3383304
	for <tools@linux.kernel.org>; Mon, 27 Jul 2026 14:37:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785163074; cv=none; b=XKz8MFrpDS+wHKj6K5RpTfGF30Ih/UZ0FQMlKPWS+9ZWNnl4QvsepuCzhSts9OKM1y5cJ4gY743YGFh9iiH251TLGaX4MyW8PyiuphEAS6q4AIdFNVtnhXqU7E3bJWv5BUNSwIimZRDSlrIyqMdV9WIEpyJEGFlR14B3UIYa3aQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785163074; c=relaxed/simple;
	bh=C7PGmkfcHp5x9QVie/9lR6pAD4CU5l5fjkN4gOmpHc0=;
	h=MIME-Version:Content-Type:Subject:From:To:Cc:In-Reply-To:
	 References:Date:Message-Id; b=a1KdA6v4RXKQ08AREPV6+Ov/ZVFJv6v2hnk0+vnmE5Gg6RyXymMumkTexELAi4QTOzjDE7YrnedT1RmKBtfRAEui1Cisj+UWS8b2pi54BiRdKcSkss8asxhZhWSZYMT4LfxnvTIKKOl8hx9FILUjQrK5YzOBf2IPklOg+1p5G2M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nDeH6e+E; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nDeH6e+E"
Received: by smtp.kernel.org (Postfix)
	id A62D91F00ACA; Mon, 27 Jul 2026 14:37:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D17D41F000E9;
	Mon, 27 Jul 2026 14:37:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785163068;
	bh=lIqIz7Q1vcCmpEvKfCT3FtAbzkB10oGS+fpyXgmIiQc=;
	h=Subject:From:To:Cc:In-Reply-To:References:Date;
	b=nDeH6e+ES7SX689x7mZJCG6yILhaVp/rd2e3WQSUQrxQg9YJzTYr4gRXrUt0MLVnD
	 nj5xXVsP1UN6g+QD6Vkxee5Ddzd47yl5X2p3fBUcThoRr6HW+9lenQbZCzPX/agoZI
	 ljuhCoFjYilMVSvMomHDr/Kw1z9X7TOknZwwP0617ybsKwV5Qm0iw6jbzeeWgtr4e8
	 dTakOyL1QiHGHrRa+sKc9U10cIK4e1G0E5JODGngS7qA0lFRVHpjaI+wjRSpEbb7nZ
	 pmSCDnzWs+ZJWW689XI+RiJPLaNW5XAiDedosCGO4rUodWMs9lCCaaEaCbS+5g8EcU
	 f3Nxr1OPWCnBA==
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH b4 0/2] Detect naked cover letters that lack a 0/N
 prefix and diffstat
From: Christian Brauner <brauner@kernel.org>
To: Christian Brauner <brauner@kernel.org>
Cc: "Kernel.org Tools" <tools@kernel.org>, 
 Konstantin Ryabitsev <konstantin@linuxfoundation.org>
In-Reply-To: <20260701-work-b4-naked-cover-letter-v1-0-f651c2ffb63b@kernel.org>
References: <20260701-work-b4-naked-cover-letter-v1-0-f651c2ffb63b@kernel.org>
Date: Mon, 27 Jul 2026 16:37:45 +0200
Message-Id: <20260727-umfahren-klinke-mutation-b23efcc7258c@brauner>
X-Mailer: b4 0.16-dev-09492
X-Developer-Signature: v=1; a=openpgp-sha256; l=1649; i=brauner@kernel.org;
 h=from:subject:message-id; bh=C7PGmkfcHp5x9QVie/9lR6pAD4CU5l5fjkN4gOmpHc0=;
 b=owGbwMvMwCU28Zj0gdSKO4sYT6slMWSl51ofOSkgkqllsM3vcUihrbZp6JEJV1xidzqG/w+RM
 rv1/sPnjlIWBjEuBlkxRRaHdpNwueU8FZuNMjVg5rAygQxh4OIUgIn0XGRkmLZrZhTrpjaRe1+n
 ME4saO041CFRM8Ovu3Wt2uuKvvpEaUaG+W83si+93fRa4t0qz5tZVr0vGL8YPEjRuN7h3cy9a7Y
 +OwA=
X-Developer-Key: i=brauner@kernel.org; a=openpgp;
 fpr=4880B8C9BD0E5106FC070F4F7B3C391EFEA93624

On 2026-07-01 15:51 +0200, Christian Brauner wrote:
> LoreMailbox only recognizes a cover letter when the message carries an
> explicit zero counter ([PATCH 0/N]) or, via the in-reply-to fallback in
> get_series(), when the thread root carries a diffstat.  A "naked" cover --
> one with neither a [PATCH 0/N] subject prefix nor a diffstat in the body --
> matches neither test, so it lands in self.unknowns and is dropped, and
> LoreSeries.has_cover stays False.
> 
> The visible fallout is in shazam -M, which then reports "No cover letter
> provided by the author" and links the first patch instead of the real
> cover.  This happens whenever an author writes a short prose cover with no
> diffstat, e.g. Christoph Hellwig's "don't build bios/contexts over multiple
> iomaps" series:
> 
>   https://lore.kernel.org/linux-xfs/20260629121750.3392300-1-hch@lst.de
> 
> Patch 1 extends the in-reply-to fallback to also accept the parent as the
> cover when it is a non-patch, same-author thread root (in_reply_to is None
> and not itself a reply).  Requiring the same author and the thread root
> avoids mistaking an unrelated message the series was merely sent
> in-reply-to -- a third party's bug report, say -- for a cover letter.
> 
> Patch 2 adds positive (naked single-patch cover) and negative (patch sent
> in-reply-to a stranger's bug report) fixtures and a test.
> 
> Signed-off-by: Christian Brauner (Amutable) <brauner@kernel.org>
> ---

A solution to this problem would also be nice as Christoph keeps sending
me patch series with naked cover letters and I have to fight with b4 to
apply them correctly. :)

