Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1895303A20
	for <tools@linux.kernel.org>; Tue, 30 Sep 2025 13:10:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759237831; cv=none; b=Dgdz7Sil4n0foy2CiEP6JsUuhlVgxNRTDFiCf8kC1+kXDlWQxqTY66o2idipnesdb+M4RI4NYV3TAtsQPPXeCOnxpamw6XBc45O6hv2e7SiUYAXXdJkm2yUI8Dnp0WuWiOF9cKx6wpl/PkJusOZWEa1UB+vV6gwoYnuIJ/T/DwE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759237831; c=relaxed/simple;
	bh=xG5SX72uHGfC5tNtCvs/TquTuZfmKaH1oDNsYnmb0OQ=;
	h=MIME-Version:Content-Type:From:To:Message-ID:In-Reply-To:
	 References:Subject:Date; b=K8KpYm9ZoVTynfXWwZu8Bln/ItGs0Kq/DKtFEDfrFsG7VKg1acZhc0TBBIZLVpOawIYndlhD+lHnZHrZUfoqzIDvqC037TZ+5CyndWigUSqnhLlDa+8xzIekcEfSL2jY9NDCtp4HdAWXxTDZzHO5pFwzZvXzzFHGee2aGk8QKMU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=K2n4tocK; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="K2n4tocK"
Received: by smtp.kernel.org (Postfix)
	id 892D4C113D0; Tue, 30 Sep 2025 13:10:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 72702C4CEF0;
	Tue, 30 Sep 2025 13:10:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1759237830;
	bh=xG5SX72uHGfC5tNtCvs/TquTuZfmKaH1oDNsYnmb0OQ=;
	h=From:To:In-Reply-To:References:Subject:Date:From;
	b=K2n4tocKmte2vqzCwU8egPP/V4EUY4U18FIka/bY+VvzuKr2+0R/plrv2L9G29OMv
	 F0Fi7NfGg7zMjYgiFcpBgOgJwlzxqBLUwXz0/y+yr8W9muFpZRvIYwWrWllEM8ohlt
	 0yyMadTe4TH2afPRQTb2+BlPNgSM36c5Ua6gfZjuX8K02GILyLMoyU+zJSZ7ouhpo2
	 o2W9aRaT50Fd45KEe58gjQRsuG1fRFzFhM+bZRnSLLzsvl02CCRHaftO8HOkyrJ12o
	 JOyi9lYVqXfgMbLLjX+01gR0uftSvrqzDMDySvvoPHY/2gdQitGW9d58GkbvkstoHH
	 KWOZi1fv3xwAw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id B458339D0C1A;
	Tue, 30 Sep 2025 13:10:24 +0000 (UTC)
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
From: Bugspray Bot <bugbot@kernel.org>
To: tools@linux.kernel.org, mkl@pengutronix.de, 
 konstantin@linuxfoundation.org, tools@kernel.org, users@linux.kernel.org, 
 kernel@pengutronix.de
Message-ID: <20250930-b220612c2-ecfedf4c305c@bugzilla.kernel.org>
In-Reply-To: <20250930-groovy-soft-octopus-bd626a-mkl@pengutronix.de>
References: <20250930-groovy-soft-octopus-bd626a-mkl@pengutronix.de>
Subject: Re: b4: shazam: UnboundLocalError
X-Bugzilla-Product: Tools
X-Bugzilla-Component: Infra
X-Mailer: bugspray 0.1-dev
Date: Tue, 30 Sep 2025 13:10:24 +0000 (UTC)

Konstantin Ryabitsev writes in commit 2354af10a8e8db91806377f8ef6ea3770e43b0dc:

fix: ensure pmsg is defined before the check

Ensure that pmsg is set as None before we check for it to avoid a crash.

Reported-by: Marc Kleine-Budde <mkl@pengutronix.de>
Closes: https://bugzilla.kernel.org/show_bug.cgi?id=220612
Signed-off-by: Konstantin Ryabitsev <konstantin@linuxfoundation.org>

(via https://git.kernel.org/pub/scm/utils/b4/b4.git/commit/?id=2354af10a8e8)
-- 
Deet-doot-dot, I am a bot.
Kernel.org Bugzilla (bugspray 0.1-dev)

