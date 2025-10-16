Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7C3821B9F5;
	Thu, 16 Oct 2025 07:30:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760599821; cv=none; b=EfUXx6UK0cEPprNniG4THFpwIkme6BvnoXtA+JDFw3Xf5Jmfk6qDNi1gVEvsUZh9SPBdA5ncHDJYdKrnn07tA0sBx1/IPs6EVp97khZ+ybHeAxJGCz7Au2xZR2c97njiG0uQTzBbw4RxQoXaZiPnZGu/phh/aeQpH7EKDx/FwvA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760599821; c=relaxed/simple;
	bh=em49V0iXChPGL62AD+Z36Cf2wLqLUXczApK/yL5AdZk=;
	h=From:Date:MIME-Version:Content-Type:To:Message-ID:In-Reply-To:
	 References:Subject; b=eZxcoBTKVLRHQpa90MCafe8Ur1WsPuElEGUceRAEj+yC2vK7DYPegKmxUjZfqJArPvJVf+fXhbeBAqbEtRWmWr38wi0ipwIfXZTCD0FfGFAAmOIO1YJIIAdp6gIqFw7jlCBi7qAJrF8+GykxaW0scvphlctMCqKfAUAcBZmvaqc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=W67WlgJN; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="W67WlgJN"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2F3B3C4CEF1;
	Thu, 16 Oct 2025 07:30:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760599821;
	bh=em49V0iXChPGL62AD+Z36Cf2wLqLUXczApK/yL5AdZk=;
	h=From:Date:To:In-Reply-To:References:Subject:From;
	b=W67WlgJNBaAmRD9immezp1J2I+qjpK3JPQC9MwBOXrSdamXB9BJASgy4Da/OsT8O5
	 9MxFJPvLxSMaTvwayWtuQGNz8u1lvNMIjs/N/3SGnt5Odqe7tSat2zn/c/PTPq3okw
	 MhHxVaTGTs+hnUhcMsg9uaXwaoxboSKzontyM1iSVW5eZ/b0QvOlrFgqmlshSvZiWL
	 e034xwZljn+6IX88to0U0r7BNZbyxdftZGSXFGP8jgbEwIeSoY9iP1DapeshvKftKR
	 GtzN5/70e7kqJfnSzHhlIsLQ0zltpBeHIERM1s5KmyG6K+Adww8qDKLQDy/YhyDfch
	 7nBwoFKxqjRwg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id B199C3822D46;
	Thu, 16 Oct 2025 07:30:06 +0000 (UTC)
From: Antonin Godard via Bugspray Bot <bugbot@kernel.org>
Date: Thu, 16 Oct 2025 07:30:06 +0000
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
To: bugs@lists.linux.dev, konstantin@linuxfoundation.org, 
 erik.schilling@linaro.org, tools@linux.kernel.org
Message-ID: <20251016-b217642c3-2f4bd8619ca5@bugzilla.kernel.org>
In-Reply-To: <CTPW75Q2ISUN.251ELTNP6RB22@fedora>
References: <CTPW75Q2ISUN.251ELTNP6RB22@fedora>
Subject: Re: Allow sending prefixes before [PATCH]
X-Bugzilla-Product: Linux
X-Bugzilla-Component: Kernel
X-Mailer: bugspray 0.1-dev

Antonin Godard writes via Kernel.org Bugzilla:

FWIW, I sent a patch for this a couple of months ago:
https://lore.kernel.org/r/20250627-send-presubject-v1-1-f8e11fda1543@bootlin.com

Still applies on master as of today and has been working for me.

View: https://bugzilla.kernel.org/show_bug.cgi?id=217642#c3
You can reply to this message to join the discussion.
-- 
Deet-doot-dot, I am a bot.
Kernel.org Bugzilla (bugspray 0.1-dev)

