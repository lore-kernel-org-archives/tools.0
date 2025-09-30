Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13C2572608
	for <tools@linux.kernel.org>; Tue, 30 Sep 2025 13:00:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759237227; cv=none; b=hTjv/nRdz9NWLKqKEtRtmXrbKjpxYImDcS+3HcDgFDoBceUvK1zgsvvKTLpbOJSp6MwO0vcu3oT0K8TAiKfx7cXL5KqUfY4PrOSi4kYB6+VNqAMUSJ4N1sWjRwB3hEqzxf3BbZC6W4uSV9RJIsZT16T6a8SuPTwesTOCaTdkMWs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759237227; c=relaxed/simple;
	bh=SQeIck7UZPwqrL7SppPYdDf3x99hCu7x6b8UyckJ9Qk=;
	h=MIME-Version:Content-Type:From:To:Message-ID:In-Reply-To:
	 References:Subject:Date; b=RWFwBxzGINLZKBLu7+c3A5FRHxFB1TCA18F0AICHWeS2NUw32SBWNQdh8BN6l+r18soJZEMZUTEopSWQu1FeW64/sGZS5zxPakCpa6RXwX0tGEesOzODuMrtSmKQra5obfTfpnpI8TYMHUHFe17lVeebv+sDw9zUXRSDCoptrao=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WAWvglj6; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WAWvglj6"
Received: by smtp.kernel.org (Postfix)
	id C7038C113D0; Tue, 30 Sep 2025 13:00:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AEF89C4CEF0;
	Tue, 30 Sep 2025 13:00:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1759237226;
	bh=SQeIck7UZPwqrL7SppPYdDf3x99hCu7x6b8UyckJ9Qk=;
	h=From:To:In-Reply-To:References:Subject:Date:From;
	b=WAWvglj65fDJfibmwR0aEE+nTMDL7N9MWDYN4kWIV/IKxgfQ/zZjZfqsljmwbHJsP
	 g1fNwXebk+9yyv9f5IFOFbtMn6tcCfDDzaBsnGboBiwBOswTzTcEpl4QD6T6nLgWtW
	 M+ZmjOvZbGniU9SNZ5Sxd4kISjrhjZYLlVL9ZqLZM+vmWyyhAAYWMC8IP5fC0zKXMv
	 gAmqT1VfSlMdhEEMhjpPfV86NmBkk27qWr4ilQPyFwWsvP4YRUMYlIAev+R6cTlmIm
	 QW+sec9Wus9+gZ8+xaDoekaoWhvQRsREY2GC5n/1cLAqYBpHETIrmvZj5ivC155YwZ
	 K28m/3dsMV3JA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id EF87539D0C1A;
	Tue, 30 Sep 2025 13:00:20 +0000 (UTC)
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
From: Bugspray Bot <bugbot@kernel.org>
To: kernel@pengutronix.de, mkl@pengutronix.de, tools@linux.kernel.org, 
 tools@kernel.org, users@linux.kernel.org, konstantin@linuxfoundation.org
Message-ID: <20250930-b220612-86d594aa6d0f@bugzilla.kernel.org>
In-Reply-To: <20250930-groovy-soft-octopus-bd626a-mkl@pengutronix.de>
References: <20250930-groovy-soft-octopus-bd626a-mkl@pengutronix.de>
Subject: Re: b4: shazam: UnboundLocalError
X-Bugzilla-Product: Tools
X-Bugzilla-Component: Infra
X-Mailer: bugspray 0.1-dev
Date: Tue, 30 Sep 2025 13:00:20 +0000 (UTC)

Hello:

This conversation is now tracked by Kernel.org Bugzilla:
https://bugzilla.kernel.org/show_bug.cgi?id=220612

There is no need to do anything else, just keep talking.
-- 
Deet-doot-dot, I am a bot.
Kernel.org Bugzilla (bugspray 0.1-dev)

