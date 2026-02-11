Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A77F2989B5
	for <tools@linux.kernel.org>; Wed, 11 Feb 2026 18:35:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770834937; cv=none; b=MkJgL66es9rDQH8nNRcnsQP7p9mdERXyeU4cqj+XoQ4pjsgmz8mxa1CfPKU+B4siAoX1EYCembokGTRP/1tegIIaTh0iuthKkiM6A+mKMEUm/rS+TVHvYpOVpJFwWj7dqVPVlw/GQy+79bfXJaE/YlIi04oNgX4drL1CgooODDU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770834937; c=relaxed/simple;
	bh=+Nsc7VpFBJ4B7ZtPloshINt7SaswXWrCh/0bycPln0M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=J9CeT4o/yuU26sk/AIPxYQ6AgAzAGuG+yFKT4ZY8Ka6uFq0tEv7Hy2YfTGdPce9hRzNyN8JdB+kBblHo+2oUWOtADB0T16nwjdHUb1161nGoTn/RhOVhlx9TBrOf10nmheYQ1xjMIL82ch9+2p/t4TXv/32klPWnbd++/ko+Pkk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b=HxAA63dd; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b="HxAA63dd"
Received: by smtp.kernel.org (Postfix)
	id 0D0C9C19424; Wed, 11 Feb 2026 18:35:37 +0000 (UTC)
Received: from mail.alien8.de (mail.alien8.de [65.109.113.108])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 0643EC4CEF7;
	Wed, 11 Feb 2026 18:35:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 0643EC4CEF7
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=alien8.de
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTP id DA53E40E035A;
	Wed, 11 Feb 2026 18:35:29 +0000 (UTC)
X-Virus-Scanned: Debian amavisd-new at mail.alien8.de
Authentication-Results: mail.alien8.de (amavisd-new); dkim=pass (4096-bit key)
	header.d=alien8.de
Received: from mail.alien8.de ([127.0.0.1])
	by localhost (mail.alien8.de [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id ylLAKmtdZMPz; Wed, 11 Feb 2026 18:35:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=alien8;
	t=1770834926; bh=kAZpsjD6yPn4BuP+wZijpcO9GwWghx8Ani8uAWoreOE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=HxAA63ddsGlR4p/ap701ISV5wFI9vWDcRo5Z/I/bZ0sBJ6ydWmSMuNC48Nh4VdPBm
	 aL6GBgF8PlcEPXtpJ2LGJhvRlaDY7GXU18HvjRzZVyDccnA4KUut9n8MiLm5hpq6aN
	 Ugowuleh/Eo4iz8AVjfv/E3hpaotwQxj41yRznde9msuToBo6jjD5IfZ4dt+SHwen1
	 XUDSoZnxjlqV/fnfXzPhxPiLBI3IKeYbnDeCsPIMUhOzAWCdkrthEArkSwaKCxOnUx
	 UwNtsouFCf8ArdkgbDpmuo+OLAzitk4tOzyR5g8a1XumNg6CVuA4hqDpR1AGpmXhq1
	 vf8NuyEbC1UtKNo3Ud2oyOnLrA62964MMFTTE+E6SIlYdmlejNaQUQuNPE+AiE90tB
	 83L2n5aHQyyWYUaqTRL+j0kHwPIyDyilcc7HyJQNUTjEmLzIyohl3cmwYuS1OxwXjn
	 R8ELWMPu43WyotY5bXWWSRqtOcBIGFIkC3wa45bQgA6ITS3NQkZUzI5/Qq1HGuVA2R
	 a4I14MZxr8KyH+TyNAnnjrsNCHQVWn7EyBVlPq3wKe8PicqRYKhugZQ3xV7wLouJJj
	 y2rp4DPl1wFcMZU3Arr9CgCYmYgleCBRwsc6qhDs7NLLo7YfSQKT1Jb1r4bbj1hIzo
	 Xe09H/TF0BhJZIXwgXei1Yng=
Received: from zn.tnic (pd95306e3.dip0.t-ipconnect.de [217.83.6.227])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature ECDSA (P-256) server-digest SHA256)
	(No client certificate requested)
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with UTF8SMTPSA id 1E6CF40E019D;
	Wed, 11 Feb 2026 18:35:23 +0000 (UTC)
Date: Wed, 11 Feb 2026 19:35:09 +0100
From: Borislav Petkov <bp@alien8.de>
To: Konstantin Ryabitsev <mricon@kernel.org>
Cc: users@kernel.org, tools@kernel.org
Subject: Re: korgalore v0.5.2 now available
Message-ID: <20260211183509.GEaYzL3U2BhUIsAJ9b@fat_crate.local>
References: <20260211-courageous-ringtail-of-judgment-ae8c68@lemur>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260211-courageous-ringtail-of-judgment-ae8c68@lemur>

On Wed, Feb 11, 2026 at 11:10:05AM -0500, Konstantin Ryabitsev wrote:
> Install/upgrade via pipx:
> 
>     pipx upgrade korgalore

Do I need to do something special here?

$ pipx upgrade korgalore
korgalore is already at latest version 0.5.dev0 (location: /home/boris/.local/share/pipx/venvs/korgalore)

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
