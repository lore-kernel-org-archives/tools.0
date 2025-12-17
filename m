Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F72A337699
	for <tools@linux.kernel.org>; Wed, 17 Dec 2025 18:14:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765995259; cv=none; b=tE6zoh6vdfR7kbvcK0cc+w1pBkNp7GLsPm1Wq6069VHKKXXfBGPLgot1CsV0BtvfG2kLWzHLtEiN+X7G3tbPo06yPrEbzCYUDQPaCFuksVuu37Y1Q5hNVVFyJ+gOWpn9Rsn1bENOIM9ceyAPskWGNF3NyMJMskRKezGqcUvzsvQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765995259; c=relaxed/simple;
	bh=mThxOOHhi49jPMUT2eNeHzkEXT6ETBV8NoQnXTxSRfg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JtA//3RDuJ1FZRfu5j5DIKOFb8iT8bOGap/SmO0aPJWcJbm/N+JpGdhKHWQezjqqcVBVL8KMNVuOhyjImMIOeuPftkB6xv8BshbYRiXQlh0KSzKnFJxoHe92ZFmgo/cakVsZzof9cLEr2WKCXrvT5GbFIhYBDQ9i/ZdIAMi758Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=J2ogfkkX; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="J2ogfkkX"
Received: by smtp.kernel.org (Postfix)
	id 68180C4AF0B; Wed, 17 Dec 2025 18:14:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 30938C4CEF5;
	Wed, 17 Dec 2025 18:14:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1765995259;
	bh=mThxOOHhi49jPMUT2eNeHzkEXT6ETBV8NoQnXTxSRfg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=J2ogfkkX44vPHH4bn0j6+wMHlpdtta+8PF1XmVxKz4fKxFskCh8ZO90FIiKzNxJ/I
	 0huXCMiLkwvtQJcMpNRkl2itzmZMSKd+UZEf64hX/hl+bhbIc++d8XX91iLlCJSrjl
	 TAmXpxhjsCVaGZncheBqhdmNxN2Bgtk49lyCKFts=
Date: Wed, 17 Dec 2025 13:14:18 -0500
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
Cc: tools@kernel.org, users@kernel.org
Subject: Re: korgalore v0.2 released with JMAP, IMAP, Maildir support
Message-ID: <20251217-illegal-lion-of-wealth-a68dba@lemur>
References: <20251217-attractive-stalwart-seahorse-de4e3e@lemur>
 <aULtg2SJVT7WAdvv@zx2c4.com>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <aULtg2SJVT7WAdvv@zx2c4.com>

On Wed, Dec 17, 2025 at 06:50:59PM +0100, Jason A. Donenfeld wrote:
> On Wed, Dec 17, 2025 at 10:21:27AM -0500, Konstantin Ryabitsev wrote:
> > - Local maildir: for those who prefer local mail storage.
> 
> Wondering: is there a difference between this and using lei? Should I
> switch my lei setup over to korgalore with a local maildir?

That's a fair question. The main goal for korgalore was to provide a way to
stuff emails directly into gmail -- which is not something lei can do for you.

However, lei does support native delivery to maildir, imap, and jmap, so if
you never need to touch gmail (or other OAuth providers, eventually), you can
just continue to use lei directly.

In general, the reason korgalore exists:

- sticks things directly into gmail, bypassing Google's notoriously hostile
  SMTP endpoint
- doesn't require lei for straight-off mailing list subscriptions -- can pull
  lore's underlying git repositories
- will eventually allow doing the same for centrally managed query-based
  pseudo-lists [see below]

But, if lei is working fine for you, please don't switch.

The pseudo-lists are effectively centrally-managed lei queries that we expose
externally like any other list. The idea is that instead of proliferating
subsystem-specific mailing lists that see barely any traffic, we just let
maintainers define what they are interested in, and then keep everything on
one of the existing larger lists. Think of it is query-based "slice" of
lkml/netdev/mm, etc.

-K
