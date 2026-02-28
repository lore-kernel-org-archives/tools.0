Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 712662D47F1
	for <tools@linux.kernel.org>; Sat, 28 Feb 2026 16:00:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772294437; cv=none; b=iUt7aSivo8E0n7QubPK6kJS6/2q/iIeo+xrCS98oE/Za4nxvUCLm7VATwV13DOQ09rLp0iHCN5rdPj75GPhBpktvviXcJI/1htkVCqMqPClUJJZJGhi5g7jOziSVEzljp8nB+cHmejktQjwo9SrzhhSGHY5VxvVs0iKwYVbQc98=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772294437; c=relaxed/simple;
	bh=iaNSpVp230yahh9YET61YhjAWh/gBCxm2E7lnrYUxwQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FyuCc58DVcx1PaLhBoRmnBn/df90X7QXJvA57s8rsekMEjeoGg9y72v5tnS6iGFVsZgOdiCw1sYns3tyBqn/p6RWHfIrbppkn0+1t0Vpn7EjVCS54+Jn6RD4QNpUHP6SHKdn5tE35rkx5ptcfF7fRI4pjxV4jWBtHJoFv4zSJnY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=t03/XQTi; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="t03/XQTi"
Received: by smtp.kernel.org (Postfix)
	id 1C311C19424; Sat, 28 Feb 2026 16:00:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E0313C116D0;
	Sat, 28 Feb 2026 16:00:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772294437;
	bh=iaNSpVp230yahh9YET61YhjAWh/gBCxm2E7lnrYUxwQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=t03/XQTiDe4wXzdNT3QQit2KjgXM2DAIqk7Lf64yHfkw4LxMdbsOaZ7sDenAk8iD8
	 B7osq3n0rdnTl5chNDjKp4VDj7mnV7Y7LQolBzcmT9Mk0KUVA7LCtDsaruyuJBuHMJ
	 0wiN1mfbiA3wtRQR3is/6SNfZZEWoGbUCtDG9CLAx1B3QaX+wI0ZBv7t3rzog/lAz0
	 h+4Ap7MqQNQTqVantpIakA75mKXY2Ae5srU48FktjUK+xZaPmschIM7kzgwzrPGAYL
	 iHvGpKn3FyO5ieSp06KZahHfZSjKEYmuZuNfxglPtL2IMQ93PSfgQz7PQQZjxSEv2o
	 ef01W2uqbuqFg==
Date: Sat, 28 Feb 2026 11:00:33 -0500
From: Konstantin Ryabitsev <mricon@kernel.org>
To: Mark Brown <broonie@kernel.org>
Cc: users@kernel.org, tools@kernel.org
Subject: Re: b4 review available in master
Message-ID: <20260228-prudent-otter-of-justice-702586@lemur>
References: <20260227-imported-aromatic-guppy-ad3dca@lemur>
 <aaMF3GQvC26DsqQf@sirena.co.uk>
 <20260228-bouncy-truthful-muskox-bcb0bc@lemur>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260228-bouncy-truthful-muskox-bcb0bc@lemur>

On Sat, Feb 28, 2026 at 10:47:21AM -0500, Konstantin Ryabitsev wrote:
> > On Debian stable:
> > 
> >     class ReviewApp(App[None]):
> >     ...<1351 lines>...
> >             self.push_screen(HelpScreen(_review_help_lines(has_agent=has_agent, has_check=has_check)))
> >   File "/home/broonie/git/b4/src/b4/review_tui/_review_app.py", line 138, in ReviewApp
> >     _GRP_REVIEW = Binding.Group('Review')
> >                   ^^^^^^^^^^^^^
> > AttributeError: type object 'Binding' has no attribute 'Group'
> > 
> > where python3-textual is 2.1.2-1.
> 
> You're right, looks like the stuff I put in to make the status bar look nicer
> pulls in textual >= 6.0, released in Aug 2025. I pushed the fix that sets the
> requirement properly, but I'll also check if I can make it work with what's in
> debian.

Actually, this was a straightforward rewrite -- the latest master should work
for you without a custom venv and the textual package available in Debian.
I've also confirmed that it works on Fedora-43 with python-textual from system
libs.

Thanks for the report!

-- 
KR
