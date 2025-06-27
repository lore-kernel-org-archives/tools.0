Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB56C2EB5BD
	for <tools@linux.kernel.org>; Fri, 27 Jun 2025 17:49:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751046597; cv=none; b=mBuczbpvJlXCK48Tb2rYoSMdqI7tttPLJ7gi7eQKBA+Pwm3CRziBBHnXjbBOcKGGReRsOcdlyP+isSgYTAe6S/964aJzHustYSw1ZiBqYUkzX50buSW5ODAleopH0Y3s2xcjm78QqelBnNry26cz+nG6X6fSvf/D1bFF4b9cMPg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751046597; c=relaxed/simple;
	bh=E1ZVAtO3mv7NV6UbHR6OtQHRwekeDOR8m/HKBEvoxfk=;
	h=MIME-Version:Content-Type:From:To:Message-ID:In-Reply-To:
	 References:Subject:Date; b=SkJuCdN3yGmIUJFHhIxpYRlnUq1GZHj/YgU/FSGiuDszYf00pUIFSFFK+YKY5AVYnwmjQIuLqOOIY4cYox1WMF/U/I5Bm0qxgqoJfZimdV+lzavU2s0W2Fku/XwV4EVrhMFyNCJ3w4FrYBVwlQUyYEUKJurpSPHmuIR0MNa/xlo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=u9MXrYwM; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="u9MXrYwM"
Received: by smtp.kernel.org (Postfix)
	id A1067C4CEEF; Fri, 27 Jun 2025 17:49:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 86B98C4CEE3;
	Fri, 27 Jun 2025 17:49:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751046596;
	bh=E1ZVAtO3mv7NV6UbHR6OtQHRwekeDOR8m/HKBEvoxfk=;
	h=From:To:In-Reply-To:References:Subject:Date:From;
	b=u9MXrYwMRMdLJQ4KrRhU2QlVVArKtIICYFBjnXvPpOw4AKjwIWXi6+FWlQY83P+to
	 nyl7U4DmZMgedqQVepJGYmt43M4uFXS7e5KtPh1ClM4TImb+OUtbx3nhYMIIDln3Vf
	 mCrwNhpyBPCCjjxctAs3ns4Q9ZPPx7In7BRkAi5DUZ/iXO4Kf67OeZ0Jv0n+5vG4EL
	 FXGNaOZJwdrumnAvkDuLU+n+dCq6cDQdG4rxTBoKSbc7lUxYUXQ0L6TOAqr1gUzL1Z
	 KNlvWMg3kgndcYv21cgURLA9Z9hE6BJWDjMOPiXSGfeJ41hcYVXakPJ31h+AQaiCGn
	 nAibSsB8kLAvg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id B1BA7380DBEE;
	Fri, 27 Jun 2025 17:50:23 +0000 (UTC)
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
From: Bugspray Bot <bugbot@kernel.org>
To: juri.lelli@gmail.com, tools@kernel.org
Message-ID: <20250627-b220285-b8799a3ca05a@bugzilla.kernel.org>
In-Reply-To: <CAE-h8tF9rp1B22YhC6PPUFntst9BEZzcCiyy-Mzjq2pQwEnAgg@mail.gmail.com>
References: <CAE-h8tF9rp1B22YhC6PPUFntst9BEZzcCiyy-Mzjq2pQwEnAgg@mail.gmail.com>
Subject: Re: b4: Fail to send series with smtpAuth none
X-Bugzilla-Product: Tools
X-Bugzilla-Component: Infra
X-Mailer: bugspray 0.1-dev
Date: Fri, 27 Jun 2025 17:50:23 +0000 (UTC)

Hello:

This conversation is now tracked by Kernel.org Bugzilla:
https://bugzilla.kernel.org/show_bug.cgi?id=220285

There is no need to do anything else, just keep talking.
-- 
Deet-doot-dot, I am a bot.
Kernel.org Bugzilla (bugspray 0.1-dev)

