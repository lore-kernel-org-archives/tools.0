Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A448446542
	for <tools@linux.kernel.org>; Fri, 24 May 2024 20:25:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716582304; cv=none; b=VVje075hWP7pKLNknRkH1jg5vR4LJ6RY8H2eSTtoWY7Lx8dYLOLumygjRJEMJep3gzf2oIGSYVg5bqBnQFm3WbCrE7ICN9FSRU77qfjVw+Nwz6Y7kf11qkdMjppJ7G0E5cDrARMjn56AOqwEZI3+h04JmKphMg9CTeWkTcMesn8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716582304; c=relaxed/simple;
	bh=EYlgdoac7qK1rht+8xuGq/u68zO32tmYhBr5jicdtu0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SEsnEvDRkMfchp+b3p/9/ISgypvpXptRzKemrjF2guQLeucokItF/tqr9b7w2PfELNttC0v+IJNsIUR0C1I81TkHS30qUILEAlctQI7TQrabjbQJByLjTxMT/r+Ac7gxDlyFmiX5teyo2NjgADIQmMvO2z0MGUENisCzNleSDqo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=OFGhQmme; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="OFGhQmme"
Received: by smtp.kernel.org (Postfix)
	id 3DA3BC32782; Fri, 24 May 2024 20:25:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EE248C2BBFC;
	Fri, 24 May 2024 20:25:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1716582304;
	bh=EYlgdoac7qK1rht+8xuGq/u68zO32tmYhBr5jicdtu0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=OFGhQmme3JHAJwvQ1ttEHLibk0wEwpB3jv2j4+QdT9MqUrZWXqOcxR6yWaRqHBmRn
	 +pdYbOceBy2T7b1MHfs3PCTwuUYrwCg0TiAHmPyVbVVHFX/S6ApiV905XLwFHfnVMu
	 hHSLwitTmimymQ3EC/XYjOMZUpeHujkHlNmOgKrA=
Date: Fri, 24 May 2024 16:25:02 -0400
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: Quentin Schulz <quentin.schulz@cherry.de>
Cc: Quentin Schulz <foss+kernel@0leil.net>, 
	"Kernel.org Tools" <tools@kernel.org>
Subject: Re: [PATCH b4] docs: document b4.send-prefixes conf option
Message-ID: <20240524-radical-silent-seal-8d1cb5@lemur>
References: <20240524-doc-send-prefixes-v1-1-c6465822ad8c@cherry.de>
 <20240524-great-fanatic-whippet-caec89@lemur>
 <20240524-nebulous-ibex-of-finesse-c2ec8b@meerkat>
 <2e1d55cb-6692-4ea3-86b9-06e2af45f739@cherry.de>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <2e1d55cb-6692-4ea3-86b9-06e2af45f739@cherry.de>

On Fri, May 24, 2024 at 05:07:53PM GMT, Quentin Schulz wrote:
> > 3. switch prefix management to always be in the subject line of the cover
> >     letter, as opposed to being stored in the tracking json
> > 
> 
> That's an option but then it'd appear in git log.

Not sure how you mean. Yes, it's in the git log, but since it's just the cover
commit -- it doesn't really matter?

> Additionally, I'm not
> entirely sure everyone wants to blindly have all strings matching '[.*]' in
> the subject line be applied to all other patches in the series?

Well, it's stricter than that -- it has to specifically be at the beginning of
the subject. And wouldn't you always want the same prefixes across the entire
series?

> I would go for 1., probably because I thought of it as well and that 3. may
> add a lot of corner cases and I'm not sure how to handle them?

There's another option of just using --edit-prefixes the same way we do
--edit-deps, but it seems a bit overkill to kick off an editor just to edit a
couple of words. :)

> BTW, I also had a "surprising" issu when the cover letter title is the same
> as a patch and I added a git fixup, a git rebase --autosquash would try to
> fixup the cover letter rather than the commit, which makes sense, but was
> not expecting a git conflict at that time :) So if we go for 3. maybe that's
> also a way to add some logic there for that, if that is a "problem" worth
> fixing.

So, you mean the cover letter should always have a subject like:

    [COVER] This is the cover letter subject

That could both help visually distinguish it in a git interactive rebase
session, and then clearly show where prefixes should be added.

-K
