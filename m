Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F0C6EEB3
	for <tools@linux.kernel.org>; Thu, 23 Oct 2025 20:20:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761250839; cv=none; b=TP3MESQXQIo9TWXDrvcxpv59/KFUY2qG5+3o2eGUFbFXRmT9FGu08NIDa2z0q1Egut6FK62Yltg15BTBtMQzUFhmFRA/uqhtg6pqon/g9o3ED2MRjpk5Cc4Ijo/D2hSNjAAhKa/GrHzDf4duorzJyVxI3TqlcO4vHHYHBTPNV7s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761250839; c=relaxed/simple;
	bh=EgsP2nkdck5H2oWzaOomxVTOZYUmFtX19K2iy7Eaje0=;
	h=MIME-Version:Content-Type:From:To:Message-ID:In-Reply-To:
	 References:Subject:Date; b=BE7sLCT/pddpW11kQg6oj3Kzyb1CN27CZ9NiNB7fSWaRtxEFaTFJBBk6/dc8Xc9vfleFbJcZlXYSnEQoRNp50GedvZQAbbxqsVA7IrkWqgpfc9cDulhBp0iwrAj/Rw5xnsoFP/rYKNFvM+Oq+dZqARlQYe2YyEPZQfiC09xlR7k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Pwe0TpH9; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Pwe0TpH9"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C5D84C4CEE7;
	Thu, 23 Oct 2025 20:20:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761250838;
	bh=EgsP2nkdck5H2oWzaOomxVTOZYUmFtX19K2iy7Eaje0=;
	h=From:To:In-Reply-To:References:Subject:Date:From;
	b=Pwe0TpH9naJbpDGUBVZj1YOR++5BWu1E7yET6NwVezjciVHaaA/QgsAXe2683MQaY
	 E1QqBgYNLQmNzaQZlQ5OfkAA7XeytgWd7j9oLeTZc0wjgObW61vB7VxDoev7D8DOAl
	 tccZ+MTvsHrNhHE5NI87rwM52Dnu4Z3aKPrm0nFstIBNhYUf4RGtHAZslUN3Y1kYAV
	 N2J5MRWEoKpuhhY3uKU+g9miVSF5X5R9XOJkXlKu8+BdpybChxBb04ll70z14yo+mO
	 TOArM7I4XcoEUVeIkev4jPbmny17nnpvBnrDYZ1rIkoyxO8l2OCBiCy3vq56Xr3Ca9
	 9zn/4ZsLpB4GA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 37CA2380A95E;
	Thu, 23 Oct 2025 20:20:20 +0000 (UTC)
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
From: Bugspray Bot <bugbot@kernel.org>
To: tools@linux.kernel.org, tools@kernel.org, krzk@kernel.org
Message-ID: <20251023-b220695-d9204014c015@bugzilla.kernel.org>
In-Reply-To: <ee6bab51-84cf-42c4-8ace-dd895f7d9318@kernel.org>
References: <ee6bab51-84cf-42c4-8ace-dd895f7d9318@kernel.org>
Subject: Re: b4 prep (via pipx) does not recognize branch on >=0.14.1
X-Bugzilla-Product: Tools
X-Bugzilla-Component: Infra
X-Mailer: bugspray 0.1-dev
Date: Thu, 23 Oct 2025 20:20:20 +0000 (UTC)

Hello:

This conversation is now tracked by Kernel.org Bugzilla:
https://bugzilla.kernel.org/show_bug.cgi?id=220695

There is no need to do anything else, just keep talking.
-- 
Deet-doot-dot, I am a bot.
Kernel.org Bugzilla (bugspray 0.1-dev)

