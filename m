Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794757395;
	b=5hQTH6fVJqEvowOxvsF9ag2XutHtMzlcl1eQbaAMflPoMIXigpaSxfEt/jq4+cnH612u
	 +S7XNyo9zFaASyA4Ak04YLnUN3uRAoPCwSeGieCWtN+HCTkGcxp4Np+/VFUlsrQBoekb9
	 HQvtKHgfUdOSCAtsmhoir0OWN4+aTAM9ptIfRo5DsQcgBgU29UrY2Zxtav9lhEdgi3avh
	 dUFLNPgwEJAqvKoKUyq2c7f/ysx82xtPuY3urTmjWgli3PMyIhyoiRSYNy2RAu+fo15xw
	 lqOMJy64DzULyJq2Z9Q0jfemlKAt4K8v/V5yg/4M3vDCluBTZ6Ogcfa1wrQ9SKKvJ0Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794757395;
	h=Received:Delivered-To:Received:DKIM-Signature:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=nJnemaggczOr/KC6xyNvUFig+zssVz0AUQoUmkSdqFw=;
	b=wARlc3cMXzT+UYKkpwBtVAR9AS5wiYK4DADPq1bewc93iG6QIITs1QivDlFLLwu9c62k
	 IECh22X2fSS66VGTprzcX5zVr3nRLE3jntWT3alUttj5IOboOG2EA8jYukkU2h05Z3Rn0
	 lDvech2d/praqs11soYwsHNwlXHFopCdwkwtr520hS0HaohcK3QMJ2sc2eoLvU/bYC55B
	 HckWl0BSILfCi1DTn+TaL2QE/fo4jN2k3RoY82WOJsPTMNRUtEff0PT1zwTYSaXCJSN0+
	 tTHJq2KHBNr9fxG0iMUcw3fW1FfbXwbENIVVMByeoB3dA1RBtS8gJNH2euO62lXLFkg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Tlgj5r7+;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B933606A33D
	for <tools@linux.kernel.org>; Sun, 15 Nov 2026 15:43:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Tlgj5r7+
Received: by smtp.kernel.org (Postfix)
	id 4789E1F000C6; Sun, 15 Nov 2026 15:43:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 026481F000C4;
	Sun, 15 Nov 2026 15:43:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794757395;
	bh=nJnemaggczOr/KC6xyNvUFig+zssVz0AUQoUmkSdqFw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Tlgj5r7+G0Z9WETn7ht1XLgHgNg2hI2h4N03yo4DnKiB5vL0Lco7/vf8C2vL07nY+
	 UT5Gd/XCz1oXe8Y+1mQ7fEJUAbEd798oqXkDDhEQTajKRv6zjJNuKYaxgNULpsqDVn
	 inRvq93gjjvGjsKUStSRj6XtB5ZY3LygOJK8UhtuYdMw9Mg/eaDSVeaSz3IUSu+WGR
	 rlm3Oal4oUburknsOwpyg2xQnS8Mfty/l4E5aJzgOkVkGkjCi7njKnMyX1dZt9kHJg
	 QzJMwjqgJkgLLXmJcQ8jEfh4aREuLMp2rOQNkwxwcedW18Qjgqla5u0JSyL5mW5Vqy
	 JyMXITayDBjxA==
Date: Sun, 15 Nov 2026 10:43:14 -0500
From: Konstantin Ryabitsev <mricon@kernel.org>
To: Marc Kleine-Budde <mkl@pengutronix.de>
Cc: tools@kernel.org, users@kernel.org
Subject: Re: b4: include git notes [feature request]
Message-ID: <20261115-cherubic-eggplant-kakapo-0bc1a9@toolbx>
References: <20261114-rapid-diamond-skylark-6d6cc6-mkl@pengutronix.de>
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
In-Reply-To: <20261114-rapid-diamond-skylark-6d6cc6-mkl@pengutronix.de>

On Sat, Nov 14, 2026 at 10:33:47PM +0100, Marc Kleine-Budde wrote:
> I'm using git notes to track additional information for some patches.
> Sometimes a FAQ section for our AI overlords^w review bots, sometimes a
> note why checkpatch currently creates a false positive and a link to the
> discussion, etc....
> 
> When sending patches I want to have that information after my S-o-b, the
> '---' and before the diffstat. After adding
> 
> | [format]
> | 	notes = refs/notes/commits
> 
> to my .gitconfig, plain "git-format patch", does what it should.
> But "b4 send" doesn't. Is there a config option I missed?

The reason we haven't done this before is because git notes used to be lost
until recently when we switched to using libgit2 for history rewrites. Now it
should be possible, so I'll look into it.

-K
