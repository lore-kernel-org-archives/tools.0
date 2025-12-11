Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B91521DF27F
	for <tools@linux.kernel.org>; Thu, 11 Dec 2025 05:42:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765431738; cv=none; b=oJZh+H7h1jVTgxZGMLyf8mw2Z/23FKVnAJO91uqFMbQI4Hf9uwjbY4CntB5CsrxPQDnSxv8hT91Gh+x9be2xH3U8EIyGzTsPSPnGMha7azeFXtvxLMg3wRAhLvUcR2sIgKMB2FwraXmhqFApvlRcIufrwQPMC87ms22nIaD0RHo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765431738; c=relaxed/simple;
	bh=BLvbaymIE9tDpZQBim33zsoSJ/pYl7u0IrGy1Il8xCs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=U5BETnEGBbFdIi14XI6Dga77I5tjcVl/1nRMFMXDQ1MpqOvcLvh//MnQFfZwXuXSbOdY3oqN3B2MGdSZjJl+ds37SgRwwPdftnKsSosTBXMOZjws9ioD9+sjY6cFdR0529t/gjR7qiDMcSW7jpyar7616VzbdF96lGbOsD/CyAk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=w8zMZ9Ki; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="w8zMZ9Ki"
Received: by smtp.kernel.org (Postfix)
	id 6F718C16AAE; Thu, 11 Dec 2025 05:42:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CED4AC4CEFB;
	Thu, 11 Dec 2025 05:42:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1765431738;
	bh=BLvbaymIE9tDpZQBim33zsoSJ/pYl7u0IrGy1Il8xCs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=w8zMZ9KihOTRmnjccGdQJVAqpm69KZzHnIWQ9uvAEZx2h+75TecuxkNSVIy+UJTWr
	 1GMV8dJb/LdCC4O31Ikw8J7U+GjHcFWvuudMUitpSLk1DUPNgxs/oDKDbqmLKdL0j4
	 0bJ2IlQTdMuQLsdbMfEWfwTUo8mtCZjbIQ4gvJwA=
Date: Thu, 11 Dec 2025 00:42:15 -0500
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: Rob Herring <robh@kernel.org>
Cc: users@kernel.org, tools@kernel.org
Subject: Re: korgalore: a tool to put lore/lei messages directly into gmail
Message-ID: <20251211-rich-elephant-of-symmetry-a709e2@lemur>
References: <20251105-mottled-bizarre-marmoset-b055ae@lemur>
 <CAL_Jsq+yvzTU6ibC_nNsadSoWMJ2SLknpBMoSFBt2zKoCAX9Rg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CAL_Jsq+yvzTU6ibC_nNsadSoWMJ2SLknpBMoSFBt2zKoCAX9Rg@mail.gmail.com>

On Wed, Dec 10, 2025 at 09:17:45PM -0600, Rob Herring wrote:
> The first issue is that the 'master' branch is hardcoded, but git has
> switched the default branch to 'main' in newer versions (I'm on 2.51).
> I just did a s/master/main/ in korgalore to work-around that.

Glad to see someone else try korgalore. :)

I didn't even know lei follows the defaultBranch -- the latest master should
have the fix for this.

> After that, I still don't get any messages.

That's a bit disorienting, I agree -- the first run simply initializes things
and doesn't actually import any mail. The main reason for this is that a new
lei query can return a LOT of results and we don't necessarily want to stick
them all into the remote.

I'll think about how we can make this less confusing.

> Then I do a 'lei edit-search' to get more messages because I won't get
> new messages otherwise, and run pull again:
> 
> debug: Loading config from /home/rob/.config/korgalore/korgalore.toml
> debug: Config loaded with 1 targets and 1 sources
> debug: Data directory: /home/rob/.local/share/korgalore
> debug: Processing list: lei-my-patches
> debug: Running git command: git -C /home/rob/lei/my-patches/git/0.git show-ref
> debug: Epoch 0 refdata: 9cf28456372cc07cf84f337ae4ee066f94b2072d refs/heads/main
> debug: Running lei-up on list: lei-my-patches
> debug: Running git command: git -C /home/rob/lei/my-patches/git/0.git show-ref
> debug: Epoch 0 refdata: 42c36f6d0cde3902e679fec019007639b2bdf6aa refs/heads/main
> debug: Running git command: git -C /home/rob/lei/my-patches/git/0.git
> cat-file -e 9cf28456372cc07cf84f337ae4ee066f94b2072d^
> debug: Running git command: git -C /home/rob/lei/my-patches/git/0.git
> rev-list --reverse --ancestry-path
> 9cf28456372cc07cf84f337ae4ee066f94b2072d..main
> debug: Found 131 new commits for list lei-my-patches
> critical: Failed to process LEI list "lei-my-patches": 'NoneType'
> object has no attribute 'get_message_at_commit'

Thanks, this is because I didn't test the situation where there can be a lei
source but no lore sources. It should be fixed now.

> But I still don't have anything from the original query.

This is a bit more surprising. I'll run some tests and see if I can replicate
this.

> Finally, is there a way to get a maildir from the same query directly
> from lei? I suppose I could just use offlineimap from gmail or just
> setup a second identical query, but neither of those seem ideal.

Right, the goal is to eventually add multiple target types, including IMAP,
JMAP, mbox/maildir, etc. I started out with just gmail because it's my most
pressing need.

-K
