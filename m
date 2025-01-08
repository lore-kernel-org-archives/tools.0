Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BD6C2046AA
	for <tools@linux.kernel.org>; Wed,  8 Jan 2025 21:10:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736370610; cv=none; b=HDSAq+GekOZqiDT50zGBE0v1xUS4DLe5PMYhhANJ0HtLYMpmoGHbOFYMYmgHTj9cbUPhdwQR2piiq7BOLZ+JYAN08sma4A8JHXjfFMkS0InTae8Ee049iso6+Pj1FJRyqlfPvvzdkN1famTbY37lX4lWdkB3pws0S4psQoWMHgk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736370610; c=relaxed/simple;
	bh=8/yf1FDzYVgRR5ZHlRrw2v609u24zlJikcnycuxqNqs=;
	h=MIME-Version:Content-Type:From:To:Message-ID:In-Reply-To:
	 References:Subject:Date; b=Ujv4n9C4tvrj0gpi3GpIllDDsa0c6rm0wTAQnhoBI5ZEMHtXrFSqm60dTErq8tgtaXNEKiOXDcmj1zYG0nl4ifRYYPt243NJlFZR+LD/607kw4ai3EATMK6NZOcUvKvuKI80Rjf5ojLk4WLK0tZ6FrJ1Hb5eveUJrGlf3reSz3g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=rqi1p4EM; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="rqi1p4EM"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 92E34C4CED3;
	Wed,  8 Jan 2025 21:10:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736370609;
	bh=8/yf1FDzYVgRR5ZHlRrw2v609u24zlJikcnycuxqNqs=;
	h=From:To:In-Reply-To:References:Subject:Date:From;
	b=rqi1p4EMWrt0PoOcGrikbfpJPTEnEuMuGYm0/F7rgGMwTS7E4zl/0TIKVFYn4IqC7
	 ln5gFW6c6bGOrQ/8qYqW5mp7DvunEXEFHRG1S50R6VCobTGiqmdVmKM93FI4rzH+Jj
	 7O/sAWjw/fmgMICTrr2sMA+009DJiJHpLRX4r+IApWPM/PIo6AE9I9ct8yigz4cdrd
	 lfNF3wXJfQHFnGZo5i7xs4/7hGrevb2jQ8/81CzP0gow9OaJ1+yQjRj4aaFYmWvWoo
	 BsRe6githr+OzvWmuSQV9aXUrlr2z088qMyaFVQF8Bdb+ktsH8qFH+/54V9GxdltqG
	 G3eBfi84C0x2A==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 3A51B380A965;
	Wed,  8 Jan 2025 21:10:32 +0000 (UTC)
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
From: Bugspray Bot <bugbot@kernel.org>
To: tools@kernel.org, konstantin@linuxfoundation.org, 
 tools@linux.kernel.org, robherring2@gmail.com
Message-ID: <20250108-b219672-589ccafddb6b@bugzilla.kernel.org>
In-Reply-To: <CAL_JsqLLOnpAHM38Bv05JdC1o0rS6eUG6WXgPHfnChs2n+AuWg@mail.gmail.com>
References: <CAL_JsqLLOnpAHM38Bv05JdC1o0rS6eUG6WXgPHfnChs2n+AuWg@mail.gmail.com>
Subject: Re: b4 shazam base-commit handling
X-Bugzilla-Product: Tools
X-Bugzilla-Component: Infra
X-Mailer: bugspray 0.1-dev
Date: Wed,  8 Jan 2025 21:10:32 +0000 (UTC)

Hello:

This conversation is now tracked by Kernel.org Bugzilla:
https://bugzilla.kernel.org/show_bug.cgi?id=219672

There is no need to do anything else, just keep talking.
-- 
Deet-doot-dot, I am a bot.
Kernel.org Bugzilla (bugspray 0.1-dev)

