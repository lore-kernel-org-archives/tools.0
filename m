Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F0F21DFFB
	for <tools@linux.kernel.org>; Thu, 15 Aug 2024 14:30:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723732229; cv=none; b=rwiersMaeO+1zu2N0XSV9XPW6CucjO18OcUHbSXrmB9+I6rank/3RT8BsYG3DMO6+NeBSbm2AeZJLljgTpwXNtIdr1+508+J3m7rK9o8OYNM6SXK1dTudcG4YvymARVVg7Cd5yLT7WsFldfVwPHwE8bZuJgJHHBht65RPop0/JI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723732229; c=relaxed/simple;
	bh=YQUH8O6aOl4UEzqO7g1Msuq/Q9wJXruJsPZnSNkUEsQ=;
	h=MIME-Version:Content-Type:From:To:Message-ID:In-Reply-To:
	 References:Subject:Date; b=DyhRMaL7BaiNWvgKh/GEAzNS30DrxsJB4VRM1X51oLt+g4+gznTUnG4wOCg0L6NfrDXnM3qvtq+Y9rZhdmGNmyecN+ZfHGzf9EJiTfmD2pkaFHPsQ73b7Sh+VJ96I1Vu9ZVyZuF+LUdCIeD4pkXnSJdg3JsyJpcB0HU32LX/KY8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mKpsbc1Y; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mKpsbc1Y"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0193AC32786;
	Thu, 15 Aug 2024 14:30:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1723732229;
	bh=YQUH8O6aOl4UEzqO7g1Msuq/Q9wJXruJsPZnSNkUEsQ=;
	h=From:To:In-Reply-To:References:Subject:Date:From;
	b=mKpsbc1Y8zrTphdmjveRjMQoqDitXLYhrCvzpZc1P/2NMMCxZymik1+8UVijSSh0H
	 HeeVoln0YX42xDQjluO5duhGDf1t5Oc7G/5DcA6tEFBp8GQbI/CuOK7Oerv2ez2KDa
	 uBMXIQ5IkuSjwF+flHPgwgZmmcC9SWBpSbDhKPbWFHJD4b1ZrqJwppf2OggAdhJWAL
	 Elt3aiYC4tTeHy7V1Y0qJjZbonsl/+f5s3rzMxbesn8588jFzjDw7vEJyu6OtFg/9v
	 LxG5WiaQ4nuVRjDJzsO/P2473HGVDusDz5E0nri1pxbcHtcbiS9aFz+m1zTqZTwitg
	 LgeLAn3KXOL1A==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 7147F382327A;
	Thu, 15 Aug 2024 14:30:29 +0000 (UTC)
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
From: "Kernel.org Bugbot" <bugbot@kernel.org>
To: broonie@kernel.org, tools@kernel.org, konstantin@linuxfoundation.org, 
 tools@linux.kernel.org
Message-ID: <20240815-b219164-b90bc9bc8bbc@bugzilla.kernel.org>
In-Reply-To: <0c57ec83-313f-45a5-b0a4-eeb7c9081241@sirena.org.uk>
References: <0c57ec83-313f-45a5-b0a4-eeb7c9081241@sirena.org.uk>
Subject: Re: b4 failing to pick up cover letter
X-Bugzilla-Product: Tools
X-Bugzilla-Component: Infra
X-Mailer: bugspray 0.1-dev
Date: Thu, 15 Aug 2024 14:30:29 +0000 (UTC)

Hello:

This conversation is now tracked by Kernel.org Bugzilla:
https://bugzilla.kernel.org/show_bug.cgi?id=219164

There is no need to do anything else, just keep talking.
-- 
Deet-doot-dot, I am a bot.
Kernel.org Bugzilla (bugspray 0.1-dev)

