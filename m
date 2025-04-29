Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3DD8259CA0
	for <tools@linux.kernel.org>; Tue, 29 Apr 2025 20:44:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745959441; cv=none; b=CSFRqo+szuRwlpaCA5OIdXL0hnNKh9Ay9mh+ce8otvmV5BWwvDysImljFS35vqwEOxcCKqRvjxaAwVcxc+yBDADtPmupItDR/KQBWRzefP/RxpRWJgDzRHXHID0cJC+G39UzzDs+/JgZUPPIE2QbuTB7nTq58sTlO6v3BlH945k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745959441; c=relaxed/simple;
	bh=ya0izjJntFxG+TOxEQ1+54X6N2B4jQYi+uKABJEnvEI=;
	h=From:To:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=RoI6mF5TBpr7mtUtCXNF4D+85yguPcpnKQuMV01V2+iU8SrgxdHwGF+DyNlPrbYRuzmjCS34X/uNm6qlxFmeD8ybJ2rGX4AiwRSAzwC/Gc1cQJciX0oDvkq6GFYqGyYDcr5f1U5qQOr7Sh6kj6BdszIp4YpY9wfP2igmbEOrJzs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=JaigtPlb; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="JaigtPlb"
Received: by smtp.kernel.org (Postfix)
	id 5EF12C4CEEB; Tue, 29 Apr 2025 20:44:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1C8A6C4CEEA;
	Tue, 29 Apr 2025 20:44:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1745959440;
	bh=ya0izjJntFxG+TOxEQ1+54X6N2B4jQYi+uKABJEnvEI=;
	h=From:To:In-Reply-To:References:Subject:Date:From;
	b=JaigtPlb3puEFWBvtTYkOmAghgjxJB31eWun+jj9jN53nrKvVlH04rMs4S6VbMcCv
	 UWQ866LFbE/bZql4FlPemgwXl2lFl9iM7U6ajLKCN6ous41RV2Kt0VI4HKEg/UeZUB
	 T0Nyjs4qFPXm1CGFrajHrIXL/qgfbBCSiUwAIrDw=
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: tools@kernel.org, "Rob Herring (Arm)" <robh@kernel.org>
In-Reply-To: <20250429134017.3796512-1-robh@kernel.org>
References: <20250429134017.3796512-1-robh@kernel.org>
Subject: Re: [PATCH] Fix misleading error message on cherry-picked patches
Message-Id: <174595943998.811561.8350872660327278654.b4-ty@linuxfoundation.org>
Date: Tue, 29 Apr 2025 16:43:59 -0400
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-64971


On Tue, 29 Apr 2025 08:40:17 -0500, Rob Herring (Arm) wrote:
> When passing '-P1,2,3' to cherry-pick specific patches, b4 erroneously
> logs error messages:
> 
> Unknown range value specified: 1
> Unknown range value specified: 2
> Unknown range value specified: 3
> 
> [...]

Applied, thanks!

[1/1] Fix misleading error message on cherry-picked patches
      commit: 64971039f772f9910d0747f8bd509dd425a76d64

Best regards,
-- 
Konstantin Ryabitsev <konstantin@linuxfoundation.org>

