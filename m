Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44A552D9EDE
	for <tools@linux.kernel.org>; Fri, 27 Jun 2025 17:39:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751045997; cv=none; b=bEej7BMbGigr2BYYyAmVfkWWTCcV9fSf15E9jnKjxp91vnWw/nIlKrfYE9A5lqJOsyAgBAov/GsgAaReSQrmeL93sy7TttNztJVBCS7rpgArYrj/UPD/khqzN0Vx0l/HIw0vEmhn2m08v0seXxuogQtwuWjsVmq5s0wHxVWn6HQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751045997; c=relaxed/simple;
	bh=CXomFUlzB+uYyOWtEaFHgBDbtkIXz17nlZBWz+8lWu4=;
	h=MIME-Version:Content-Type:From:To:Message-ID:In-Reply-To:
	 References:Subject:Date; b=d3nTJkFD0M3ogzGWpaPMik+6fqxVH1A5JdiCvriB5ddHIwThBYj/Z5fqJIhWvD4JV5qCn0WKQeY0eGz1iLVMIMjijIPlWXineoEJeFlGwWJ3ZFdy/Q2IpyxFOa0amo8Vct+20vvEfbrmdO4BJkbzkimIUEuWvNwf6WsSPW7xncY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QK70Uefq; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QK70Uefq"
Received: by smtp.kernel.org (Postfix)
	id 3C7E1C4CEEF; Fri, 27 Jun 2025 17:39:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 24735C4CEE3;
	Fri, 27 Jun 2025 17:39:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751045997;
	bh=CXomFUlzB+uYyOWtEaFHgBDbtkIXz17nlZBWz+8lWu4=;
	h=From:To:In-Reply-To:References:Subject:Date:From;
	b=QK70UefqTzVlbGzxOATo+QNJuYp3Y/NMK0zYcJlYD3J9QZ5DxPaEtskQu4X83Wl62
	 hkrGOsv5qpDMG9vBPMsVwX6mnopZeZXnd1xjozegt54rpf1NVod83HSVEt8R3LDuny
	 syQ1B/DeEBAQudMlCW3Iy9isnoZppAOGi4Xg1EkTuqYVg7DDaB0eK6+vxqyVwSyARx
	 MsmHgADQyVO2i3IbfgXApLt5LlCEdzLwmxFXz5w9DiOBY3jP2S9OCNNCAIX7nVVpza
	 wv3dllkxeB2bpU0c4fMVshRHaSxeJVhPMBL4d/vXHHrGoas99kSwEUqo/U/aTYfSUX
	 TgKnRpScDHF5Q==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 385A9380DBEE;
	Fri, 27 Jun 2025 17:40:24 +0000 (UTC)
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
From: Bugspray Bot <bugbot@kernel.org>
To: broonie@kernel.org, tools@linux.kernel.org, 
 konstantin@linuxfoundation.org, tools@kernel.org
Message-ID: <20250627-b220283c2-70fc7bd48619@bugzilla.kernel.org>
In-Reply-To: <2491bc09-da6c-43dd-b8ce-e5c137294f68@sirena.org.uk>
References: <2491bc09-da6c-43dd-b8ce-e5c137294f68@sirena.org.uk>
Subject: Re: b4 trailers doesn't work with imported series
X-Bugzilla-Product: Tools
X-Bugzilla-Component: Infra
X-Mailer: bugspray 0.1-dev
Date: Fri, 27 Jun 2025 17:40:24 +0000 (UTC)

Konstantin Ryabitsev writes in commit 0c7bd8a7ec090ab34b3406a46742004bd94fc30b:

mbox: fix backtrace when we can't find the in-reply-to message

In certain situation we may not have a parent message when processing
follow-ups, because they were sent to a previous revision and the
patch-id no longer matches.

Reported-by: Mark Brown <broonie@kernel.org>
Closes: https://bugzilla.kernel.org/show_bug.cgi?id=220283
Signed-off-by: Konstantin Ryabitsev <konstantin@linuxfoundation.org>

(via https://git.kernel.org/pub/scm/utils/b4/b4.git/commit/?id=0c7bd8a7ec09)
-- 
Deet-doot-dot, I am a bot.
Kernel.org Bugzilla (bugspray 0.1-dev)

