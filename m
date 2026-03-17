Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52655345753
	for <tools@linux.kernel.org>; Tue, 17 Mar 2026 19:58:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773777501; cv=none; b=O2xTiH/7JB23ErtBdw4+cueVkZKZNEANebnCyMX+UlwJW1n8aFvgsoj3tjKZ7B1UWU7ZJACgIAI0eSR9xOXGHaWxF19UcW7xXGnVt8hUpXr1yO0aV6kW1TYexcC8XZU7JSySWk7wGodH7/gtr3ZQZuV7zE7evrwY7W7BwjquVX0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773777501; c=relaxed/simple;
	bh=U8tiEFGD8hzWRhiZza8CPTa4tbVmgjRwBsFUEKBk/ys=;
	h=MIME-Version:Content-Type:From:To:Message-ID:In-Reply-To:
	 References:Subject:Date; b=i6F7gTWYxrYXgxmG2PTNGfmng/Sr98+hp/+ifr/D6JwUuGHco94OZ15mVe0hf6yrLpQrc009ZEaHHFb5OIfLhL9Bax5dOBzRiN7F7OHIjLAkGVKdi8V5U9/7kbt1GPDK+zoVmjsr3qnQC7UBwrcZ/d/09IwH8et9GX9o72D1q7s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mBRcfNOg; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mBRcfNOg"
Received: by smtp.kernel.org (Postfix)
	id 0811FC4AF0B; Tue, 17 Mar 2026 19:58:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E48D5C4CEF7;
	Tue, 17 Mar 2026 19:58:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773777500;
	bh=U8tiEFGD8hzWRhiZza8CPTa4tbVmgjRwBsFUEKBk/ys=;
	h=From:To:In-Reply-To:References:Subject:Date:From;
	b=mBRcfNOg8XplxizRTqMzPsRWWud6R6TA45ISNuut3pof4F6NBTNDkIRiAUPvJCQUg
	 oOJ0nkk/5GAHlfeUMKZSbTwp8BVdNrbbN9Gzm6qoRebf6JCKXG0G3k7bllwTOwiw3W
	 N0TKpR2DtgLjJbFQHY8q+rRe1pENnJe0XiRBuFdWLaHq7xZYhkwZQgy7nufA1xQhft
	 iHMNfjTwMJ2NDoc/K8Yd9XAnsCIg4gNkHtME96ej2CsyvEbs8e6Psfa/bhLgL2ZCC2
	 YspLdafJQpIVww3bmPIy9XURSjk0IVVUvKjfQrZehN1AjpNvKG9cv7WcgLVBhFQ+zZ
	 cnIfOTpkQ2iiA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 428FC3808200;
	Tue, 17 Mar 2026 19:58:14 +0000 (UTC)
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
From: B4 Bugbot <bugbot+b4@kernel.org>
To: mricon@kernel.org, broonie@kernel.org, tools@kernel.org
Message-ID: <20260317-b4a2fb75-b9a4fa993f6d@git.kernel.org>
In-Reply-To: <069aac52-a9a2-44e1-bdbb-eabc82e23641@sirena.org.uk>
References: <069aac52-a9a2-44e1-bdbb-eabc82e23641@sirena.org.uk>
Subject: Re: b4 review handing of rebasing issues for new versions
X-Git-Bug-Id: 4a2fb759cfc2f44cbf9e652089fcce2386dceacf2f3df3fc93445e09cbc6c98d
X-Mailer: bugspray 0.1-dev
Date: Tue, 17 Mar 2026 19:58:14 +0000 (UTC)

Hello:

This conversation is now tracked by b4 bug tracker.
There is no need to do anything else, just keep talking.

--
Deet-doot-dot, I am a bot.
b4 bug tracker (bugspray 0.1-dev)

