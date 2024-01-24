Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 254A6171B0
	for <tools@linux.kernel.org>; Wed, 24 Jan 2024 00:00:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706054431; cv=none; b=Q4QByAKX1E+VR0FqFIwtWRDVIBjzbjppCobsal/iC1q/hTn6sqcl0VkE8imyeRsJ+xCx4Ec8YJMLSHU7uWv2+9NCgmyFBXyfNcms6o6m0fZ+9z7Gmgw5GgjP418d3ZmhgaE/OmAjYCKyQ04StgtRBegf2fHK+n2zLM+6RIn5Lic=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706054431; c=relaxed/simple;
	bh=TLQaaFxnWlq9cafQKpA4F9IRjSuxKZ+Sa6wayr/cs+4=;
	h=MIME-Version:Content-Type:From:To:Message-ID:In-Reply-To:
	 References:Subject:Date; b=Hh6+eJMTFw+KTZw8sUFFKSll9VOBbsPgQiIijfjHdEb4kWjT5PUGLHW84BgAFyvGpk/Sg0bmGhs0II1rya2dz72cmR34x2VnWFhQBWyI5oAXumODJ2VP89RWImS/Z/iq2BiKmlE9nJgRBldZAjfVVBbOcWUjb0UQyqREsmnCQKQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=F9WSMvFR; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="F9WSMvFR"
Received: by smtp.kernel.org (Postfix) with ESMTPS id AB8EDC433F1;
	Wed, 24 Jan 2024 00:00:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1706054430;
	bh=TLQaaFxnWlq9cafQKpA4F9IRjSuxKZ+Sa6wayr/cs+4=;
	h=From:To:In-Reply-To:References:Subject:Date:From;
	b=F9WSMvFR5uGMHHArVmtWw2mqfDecCuIbxykKVyQtdTbj/YU/0B5DZ19SFGupRBd54
	 k+zoFoCna0SYeJSYwqFs3G4fiROgTsw3MTpYrdbIiLkiXpgrsDyg/VNkLg3qzGWcYD
	 dr8J6nuPAmtzL185ibR+O5WF0Z+SGSoOWhv6dAyNqv+RqVcvy3YUB7z3ReBnM9AXYz
	 MkeyAMcsm1SYTqtiCS498Vwu5rsav0aFy3TDP+LY0SLkEAwJ58Cfr6L9xm0psyr60g
	 oX/DP4wpol4LAZWLT29Wj/gskGje+Lgfou/E2S45GpDSWyrI9WMnoyC9x66jZSNz6l
	 YBKFX3G9VWrqg==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 95165DFF761;
	Wed, 24 Jan 2024 00:00:30 +0000 (UTC)
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
From: "Kernel.org Bugbot" <bugbot@kernel.org>
To: broonie@kernel.org, konstantin@linuxfoundation.org, 
 tools@linux.kernel.org
Message-ID: <20240124-b218408c2-3e81178c47a1@bugzilla.kernel.org>
In-Reply-To: <47699f5d-4ba3-4438-8a78-ab6c3345840a@sirena.org.uk>
References: <47699f5d-4ba3-4438-8a78-ab6c3345840a@sirena.org.uk>
Subject: Re: Scripting support for telling if a b4 series is sendable
X-Bugzilla-Product: Tools
X-Bugzilla-Component: Infra
X-Mailer: peebz 0.1
Date: Wed, 24 Jan 2024 00:00:30 +0000 (UTC)

Konstantin Ryabitsev writes in commit a684c77f981daa92f7f0460dd5178cdd2ae2d81f:

ez: show if the cover letter needs editing

If we have "EDITME" in the cover letter, show 'needs-editing' in the
output of "b4 prep --show-info".

Suggested-by: Mark Brown <broonie@kernel.org>
Link: https://msgid.link/47699f5d-4ba3-4438-8a78-ab6c3345840a@sirena.org.uk
Closes: https://bugzilla.kernel.org/show_bug.cgi?id=218408
Signed-off-by: Konstantin Ryabitsev <konstantin@linuxfoundation.org>

(via https://git.kernel.org/pub/scm/utils/b4/b4.git/commit/?id=a684c77f981d)
-- 
Deet-doot-dot, I am a bot.
Kernel.org Bugzilla (peebz 0.1)

