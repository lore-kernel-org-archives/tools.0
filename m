Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 661972D7398
	for <tools@linux.kernel.org>; Fri, 20 Mar 2026 19:37:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774035435; cv=none; b=WfHYZBlAjlzIZjf7vZYm9c3DheY1rHLsalD2WXaY+cUsWhhC64CDA9N8Naq2e/vpbn1ErJ7ijlWPxWo0loePTg3kOVuhIsSATooxUvwI2J1WWkcfM200KyLnw/nvKnra28szrDK9d5z75NiVdyo/Pd+9T/roWE3Jrye10OZf60w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774035435; c=relaxed/simple;
	bh=upPk68caYYNjVV9u/o6dK11Ev3pnxFYvrIp+sY2JDVQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EQVJN0vyBoWPTmHPQdOJMj+ZrF8Py+3YOhwlNeYEw0XU2qeXXQK/m7Z+h0ODhW/NkKae4f6QhwwGvauK7kQqhr8CrR8cclAIlZUTXPS7cQf210AvY+2LDNRp/8sahah8tzakazX1NZ8OEG5GP00iv1OWMPCqBzXNn0qOTfw6T2g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=Qbdst9gv; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="Qbdst9gv"
Received: by smtp.kernel.org (Postfix)
	id 39351C2BC87; Fri, 20 Mar 2026 19:37:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1B4FEC2BCB0;
	Fri, 20 Mar 2026 19:31:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1774035067;
	bh=upPk68caYYNjVV9u/o6dK11Ev3pnxFYvrIp+sY2JDVQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Qbdst9gvcUAiTElcNxpeAfhgMObyrnkkJejH4MLE+FNY4uZg9r8iDO8+J/g4YmTMV
	 Y5HDDzP+4ZWBbCYuciedT4t2gAEhuvMRIM+ecVBLN08/Hrcmo61BwLPj5f6UIIX1LG
	 d2yotcdt3aMqYaK4c+O75KxdE2ZQ//af1+b20+ls=
Date: Fri, 20 Mar 2026 15:31:06 -0400
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: Louis Chauvet <louis.chauvet@bootlin.com>
Cc: users@kernel.org, tools@kernel.org
Subject: Re: b4 review available in master
Message-ID: <20260320-puzzling-pig-of-opposition-a8b61a@lemur>
References: <20260227-imported-aromatic-guppy-ad3dca@lemur>
 <24351d92-3f8c-412b-807d-ed7ee0b1ebf6@bootlin.com>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <24351d92-3f8c-412b-807d-ed7ee0b1ebf6@bootlin.com>

Hi Louis,

Thanks for the thorough testing and the excellent feedback! I've committed a
number of fixes/changes in master that addresses a subset of them -- the
others will need to wait a bit, because I'm trying to get 0.15 out for wider
testing.

> When forcing drm-misc/drm-misc-next base, the check fails. I tried
> to force the acceptation (^y), but I got a git am issue during the
> branch creation

In theory, three-way merge (-3) is already enabled for all git-am operations
in the review TUI, so this should work in the current master. I don't know how
recent is the version you used for this, so hopefully the latest master is
already doing what you need. If you still see it fail, please send me the
exact error output and I'll take a look.

> - Add a way to see application logs (notably git errors)

For now, my recommendation is to press "s" to suspend the UI and drop to shell
-- you can review the b4 log output by scrolling up. Ctrl-D exits back into
the UI.

> - Copy don't work in the tui

This is a Textual framework limitation -- when mouse support is
enabled, the TUI captures mouse events for scrolling and clicking,
which prevents normal terminal text selection. Launch with
--no-mouse to get normal copy/paste, or make it permanent:

    git config --global b4.review-no-mouse true

I've added a visible tip about this to the getting-started docs.

> - Add a "quick shortcut" to add trailers (t -> r/a/t/n -> enter
>   instead of t -> arrows -> space -> enter)

Done! The trailer modal now accepts a/r/t/n as single-key toggles
for Acked-by, Reviewed-by, Tested-by, and NACKed-by.

> - Add a way to disable the scroll animation

The scroll animations come from Textual. You can disable them globally with an
environment variable:

    export TEXTUAL_ANIMATIONS=none

or just smooth scrolling specifically:

    export TEXTUAL_SMOOTH_SCROLL=0

I've also added a "Customising the TUI" section to the docs covering this and
other Textual tweaks (themes, colours, etc.).

> - Scroll using arrows/pgupdown/jk don't work in the "send email"
>   confirmation list

Yeah, that was a bug. Fixed -- added j/k, arrows, space/backspace, and
pageup/pagedown bindings to the send confirmation modal.

> - Add a config to disable "autosnip"

This one is tricky -- there's a certain threshold where this more or less
becomes a "just open it and reply in your email client." :) I played a bit
with adding #!notrim and #!verbatim directives, but ended up with a bunch of
new bugs that I want to avoid in the roll-up to 0.15. So, I'm going to sit on
this for now and brainstorm about how and if we should implement such set of
features.

I've added the remaining items (auto-detect existing trailers, cancel
background processes on exit, batch trailer selection, keep trailers in-place
in reply editor) as planned for 0.16.

Thanks again!

Best,
-- 
KR
