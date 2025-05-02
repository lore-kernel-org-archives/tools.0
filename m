Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7B4C1F1301
	for <tools@linux.kernel.org>; Fri,  2 May 2025 19:59:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746215987; cv=none; b=VFcZPioAbKX5HRUQtN4HSpFwrnFwzZwGkxIyJxNPxyzQ70WMka1D0S0rHZe/jCP8YnA8MxB+Qd0uUbDLO0Ap4kOwFahHbVI7J9ji6Aa0HPJbwDvqoZpNjzVViO0ulcHz7LFMW7WiMJZsdOQI4wjazDgq7uUkRU08C1rh3a+vtF0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746215987; c=relaxed/simple;
	bh=QXUsL36qI2Dt94N7gy9BkvwNHCvQhE0dAq66uDKtjq4=;
	h=MIME-Version:Content-Type:From:To:Message-ID:In-Reply-To:
	 References:Subject:Date; b=k+NwVinXn7Z9n5NhcDu8rJEh26UbcF/gfg+w23T1LsFVya3HC4Y3yO5ecqxVYcMhQ3QNW6OMJYl1tk6W0pD6pa6MCmUFi4OR3+P9Iso2ExmrfwiHx2wPiim9ONYKwx8JcQnZxvOkC4nIMwCu4Q1Cg0Js8DC9ZNiEh1UjHRR4d74=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=i2VkxTUv; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="i2VkxTUv"
Received: by smtp.kernel.org (Postfix)
	id 572F9C4CEED; Fri,  2 May 2025 19:59:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 35EA3C4CEE4;
	Fri,  2 May 2025 19:59:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746215987;
	bh=QXUsL36qI2Dt94N7gy9BkvwNHCvQhE0dAq66uDKtjq4=;
	h=From:To:In-Reply-To:References:Subject:Date:From;
	b=i2VkxTUvJuiRgQpW+T8g673U5lBJRgmcOM4PwVePD8YL8pCTnC4Rte8VXMn4EXnAK
	 4zA0+OOiWlK1zECxhaIJVQ83FSMl47DX6wiPmW2MORXrM+VoU1cYuJGxxXeCW8FCvf
	 M745okEISEgx7BDXXIJ/tkVRPu6XaxAn3n+jeZ9ZaQkv5/UynotBjFAk0b5FZ+qbmi
	 N4y7sCLXm9WY0Z6CE5vLAO0I6CDJbynCE4i3TnQKyx8/8R831WyvoAK2u0E5wC3bqI
	 9gI0Ql1EDUScAR9WdYbYMxJ2jjrPH7Da5sIKiQ9fycJI0rg0sn+RYAiLAjXpua5Nlv
	 N9qbVa/lDVa2w==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 74E9C380DBE9;
	Fri,  2 May 2025 20:00:27 +0000 (UTC)
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
From: Bugspray Bot <bugbot@kernel.org>
To: users@linux.kernel.org, tools@kernel.org, wens@csie.org, 
 linux-sunxi@lists.linux.dev, konstantin@linuxfoundation.org, 
 andre.przywara@arm.com
Message-ID: <20250502-b220079-d33a525e89aa@bugzilla.kernel.org>
In-Reply-To: <20250501-wakeful-kiwi-of-poetry-59d4bb@lemur>
References: <20250501-wakeful-kiwi-of-poetry-59d4bb@lemur>
Subject: Re: b4 thank-you letter shows incorrect repo URL
X-Bugzilla-Product: Tools
X-Bugzilla-Component: Infra
X-Mailer: bugspray 0.1-dev
Date: Fri,  2 May 2025 20:00:27 +0000 (UTC)

Hello:

This conversation is now tracked by Kernel.org Bugzilla:
https://bugzilla.kernel.org/show_bug.cgi?id=220079

There is no need to do anything else, just keep talking.
-- 
Deet-doot-dot, I am a bot.
Kernel.org Bugzilla (bugspray 0.1-dev)

