Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6395A24167F
	for <tools@linux.kernel.org>; Tue, 30 Sep 2025 22:30:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759271412; cv=none; b=TnbD0arUx2OHUk8XPx6HxlCuHQ7nietMuIU16CvTDEyCCVOtezgTpsVAtjNtL4tEQ836tUalG2ToM6S//ymy6I6cdU8eyokk5iQCnCb/PhwAbvK3dL6BAvbbBDl0XGTR+2oB0lRWPTUlhxVbKED1i/lW6ySIx5/D7OQsft57bf4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759271412; c=relaxed/simple;
	bh=RBWzANgkXzqrOxv259IS3E5ctBb6R9RuHyRkD2Aps34=;
	h=From:Date:MIME-Version:Content-Type:To:Message-ID:In-Reply-To:
	 References:Subject; b=l9Bc9l/t3W5B/OEiTdVXdD4bRBt+3OiF73JEb0UcqEnf3M5l9tGKtWj9/kBWhzDHHS4Hb40b+4miidVnisl55bxO3AHyXkGhUcHhUs5bdNhsMdXOWDcGGuZpV8hSu8cBm0fQDiQDQxzuP1K5Hcf9kQu3xq30yWR2bf2cXyCndNg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=vLnLYiyZ; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="vLnLYiyZ"
Received: by smtp.kernel.org (Postfix)
	id 4725BC113CF; Tue, 30 Sep 2025 22:30:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2999FC4CEF0;
	Tue, 30 Sep 2025 22:30:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1759271412;
	bh=RBWzANgkXzqrOxv259IS3E5ctBb6R9RuHyRkD2Aps34=;
	h=From:Date:To:In-Reply-To:References:Subject:From;
	b=vLnLYiyZ9FQyVguQ2Wlw+ECbLAisFll1Ey/n+XDJj/LyQL4JLA66xXFLReDnFHlRM
	 uotL8djePgUz5ABppXli3aYxW2zpU1kfrxFo4nO0mCjpTFL55i7qybd1yrD/lwg5BL
	 VsXhiwM/cfFBDxN1yld6OFHJ8m69R7ER5La5t7F0cttBnZteBFTcy7pchD5JCbiiyv
	 bWLLXpSPlZb1bT9F6A92EcLlNyDS9tlNKw6iXzC9oDZYjxJBapxLnqoMoYdh0QqUP8
	 LrWLsaUXcyqiIRrTMmRNBwzZWk3xgZBVpHzd8B+6YRP7h/lVtTeuiRgZu/cBDcc0vU
	 DW4+yrkGnt24w==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 3879D39D0C1A;
	Tue, 30 Sep 2025 22:30:06 +0000 (UTC)
From: Konstantin Ryabitsev via Bugspray Bot <bugbot@kernel.org>
Date: Tue, 30 Sep 2025 22:30:05 +0000
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
To: konstantin@linuxfoundation.org, tools@linux.kernel.org, 
 robherring2@gmail.com, tools@kernel.org
Message-ID: <20250930-b219672c2-c7e4ae042365@bugzilla.kernel.org>
In-Reply-To: <CAL_JsqLLOnpAHM38Bv05JdC1o0rS6eUG6WXgPHfnChs2n+AuWg@mail.gmail.com>
References: <CAL_JsqLLOnpAHM38Bv05JdC1o0rS6eUG6WXgPHfnChs2n+AuWg@mail.gmail.com>
Subject: Re: b4 shazam base-commit handling
X-Bugzilla-Product: Tools
X-Bugzilla-Component: Infra
X-Mailer: bugspray 0.1-dev

Konstantin Ryabitsev writes via Kernel.org Bugzilla:

This is now fixed in 8c0f498752924b3d8ae9ee12bfdc2471c6e64515, but I forgot to tag this bug. I'll also backport it to stable-0.14.y.

View: https://bugzilla.kernel.org/show_bug.cgi?id=219672#c2
You can reply to this message to join the discussion.
-- 
Deet-doot-dot, I am a bot.
Kernel.org Bugzilla (bugspray 0.1-dev)

