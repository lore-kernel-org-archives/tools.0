Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F16119CD0B
	for <tools@linux.kernel.org>; Thu,  3 Oct 2024 15:15:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727968534; cv=none; b=aOcXQqPx/BiwAiyK2gUrlxWW05BogKs0m3hCPMOwaWOPRvJEtXsGfnAKbrgWy9vLvDVQIMfDkc+YAq6WWQC9fjcDW8pJ8XpeeFiUUjRwq6a0Mt9GY5x/wvz+fwdzyEagYZADZOornpP3HQg+BLtX3HJ+uJna3a8AIntbWt9VuZc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727968534; c=relaxed/simple;
	bh=9nlrXTFnP71fZDt9M62FyVVRgAhirZ50UjZq+rrvMAk=;
	h=MIME-Version:Content-Type:From:To:Message-ID:In-Reply-To:
	 References:Subject:Date; b=OEGnBFstDxxIE2318gO0A1MYIymQ8c/U3sVSP8IyG8rRYAxDvNhYRZL17bNvj6rl/Qw6u2tO90ilubj1ApHeg8NPIq4o1FCCBLMrd4jw/bgcO2KsG9cNU4FCHvI10CWxqlmMaj4xOK+gRHCeNZJ0RWE/TAAbRMXNf+Wltg2xfmQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=p9JHrV2S; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="p9JHrV2S"
Received: by smtp.kernel.org (Postfix)
	id 1BF79C4CECE; Thu,  3 Oct 2024 15:15:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0543EC4CEC5;
	Thu,  3 Oct 2024 15:15:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1727968534;
	bh=9nlrXTFnP71fZDt9M62FyVVRgAhirZ50UjZq+rrvMAk=;
	h=From:To:In-Reply-To:References:Subject:Date:From;
	b=p9JHrV2SZZ2QMyI29kHZ00FsvhQhI6G41MjzMMTEY100DdOAJzH00w4jvh2LXh+y/
	 yu5muiyh/99ypi/8Kf5yZac/YepFnxS1WkosMChWPA8nnJ0C/pOplCfQlkI7WdCzFv
	 xD7qqR/EkOPWyHezYMS//v3hbJFssD+bYfyPjqTqRHgZp/ZI9C9gyGBUha6B1qjnB6
	 ElvjeBl5f7Klo7wAGQwgV0hzGWd8IXP2G3Wtokr2mHxjaFwMqQhfAAl4sUOw9h+Dcs
	 yib+Lwb3WinTZl/iUFxyLhM4o2WNzVcgP7klpH4DMd3ALVZa5UaOQbmCr//BIfrSaR
	 sydfkBhlToW8w==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 781593803263;
	Thu,  3 Oct 2024 15:15:38 +0000 (UTC)
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
From: Bugspray Bot <bugbot@kernel.org>
To: tools@linux.kernel.org, konstantin@linuxfoundation.org, 
 tools@kernel.org, broonie@kernel.org
Message-ID: <20241003-b219342c5-8e29889738c9@bugzilla.kernel.org>
In-Reply-To: <98450a13-1339-41e1-87b4-3db7387906c7@sirena.org.uk>
References: <98450a13-1339-41e1-87b4-3db7387906c7@sirena.org.uk>
Subject: Re: b4 trailers --update picks up bogus trailers
X-Bugzilla-Product: Tools
X-Bugzilla-Component: Infra
X-Mailer: bugspray 0.1-dev
Date: Thu,  3 Oct 2024 15:15:38 +0000 (UTC)

Konstantin Ryabitsev writes in commit 9b746db767927ead0cc10b54b668f7bf72bb4eae:

ez: do a patch-id match when pulling in trailer updates

Address two important limitations of trailers -u:

- trailer updates were applied even if the local patch has changed
- trailers sent to the cover letter were applied to all patches in the
current series, even if they were sent to a previous revision and the
commits no longer matched

Reported-by: Mark Brown <broonie@kernel.org>
Closes: https://bugzilla.kernel.org/show_bug.cgi?id=219342
Signed-off-by: Konstantin Ryabitsev <konstantin@linuxfoundation.org>

(via https://git.kernel.org/pub/scm/utils/b4/b4.git/commit/?id=9b746db76792)
-- 
Deet-doot-dot, I am a bot.
Kernel.org Bugzilla (bugspray 0.1-dev)

