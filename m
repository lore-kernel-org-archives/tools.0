Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 688D521D3C0
	for <tools@linux.kernel.org>; Wed, 18 Jun 2025 20:59:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750280394; cv=none; b=CaXh6fPZ4BOgMHRD0h0jIBNzE3aGf8iPhepNdFLHhpZqs43fmiaVlAXnb5aIY0Yg8fwnV+nVeoemrP+E3aijdma5EuBZJXhetwx5y5Rv78rmfv1ItlF/YB+cClT++5lkwFfiYrfDTgCQDsFsxA6YlNWpqDSrXLto7itBmC4O4m4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750280394; c=relaxed/simple;
	bh=JCKGD9/3C9bG3D+jUWH2/f+fYyUPR5/sH03eFAFIsr8=;
	h=MIME-Version:Content-Type:From:To:Message-ID:In-Reply-To:
	 References:Subject:Date; b=UL2aolbAfKata2vobso243tY8X8OMHnFJOpunBNyH0TQ5J+9jXocl6AuCGE+veQUYR1e/G819X7u2pydNmV/+7bLlzU+aVW/winEpOCQEt9o920lgdy7d7Lx/V3UceLlDw2ViDv2ZxyCgT9Y1x/01yB5kLPHf0u/Y3Cbeq7warQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Pu0G41r3; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Pu0G41r3"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0E418C4CEED;
	Wed, 18 Jun 2025 20:59:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750280394;
	bh=JCKGD9/3C9bG3D+jUWH2/f+fYyUPR5/sH03eFAFIsr8=;
	h=From:To:In-Reply-To:References:Subject:Date:From;
	b=Pu0G41r3bDYJZ5Kmv8j5i3/yWO5mBcF45VlPQU7hws2M9QrF7JZF2rZiAYYV60t4w
	 20c1ZUOBk9qiBXEHPiuhWqm1zI5MpoQLKQST16DS3lmNcqX2MwqRLPYeVPfH0g9iLj
	 BvXA+L5hYb6BUoyW2sIHZE+qxVyOyODe/+rFmiPaAdVzOjxwhjEKfwpvRC0hZ/V+Vj
	 SDBdTWDExpfD7inGpZgsdLNmvwxNL5fdk0vF5mwnPT3VojNLp2KjmPm4M+8mFWo5NS
	 QiGW4M7CJA1gv7W6d+bzzRH4At/oZsAdf7BdSWn9CvzipnL0rRwKs24M1ST5qN1IoJ
	 FLqsnqsG2r9rw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 74D073806649;
	Wed, 18 Jun 2025 21:00:23 +0000 (UTC)
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
From: Bugspray Bot <bugbot@kernel.org>
To: tools@linux.kernel.org, robherring2@gmail.com, tools@kernel.org, 
 konstantin@linuxfoundation.org
Message-ID: <20250618-b220247-2d4c2bede3e5@bugzilla.kernel.org>
In-Reply-To: <CAL_JsqJJBZL1w-HLwr9nL4Zh50KnwOFHCE_m_hcvwnkVPH-S=w@mail.gmail.com>
References: <CAL_JsqJJBZL1w-HLwr9nL4Zh50KnwOFHCE_m_hcvwnkVPH-S=w@mail.gmail.com>
Subject: Re: b4 cherry-pick behavior
X-Bugzilla-Product: Tools
X-Bugzilla-Component: Infra
X-Mailer: bugspray 0.1-dev
Date: Wed, 18 Jun 2025 21:00:23 +0000 (UTC)

Hello:

This conversation is now tracked by Kernel.org Bugzilla:
https://bugzilla.kernel.org/show_bug.cgi?id=220247

There is no need to do anything else, just keep talking.
-- 
Deet-doot-dot, I am a bot.
Kernel.org Bugzilla (bugspray 0.1-dev)

