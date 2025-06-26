Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CA2128FFEE
	for <tools@linux.kernel.org>; Thu, 26 Jun 2025 17:24:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750958696; cv=none; b=FQr5oxt+Y5y2FKLX+x5+sfwhul6RBVGorEoNMnfiOPVUSd5/P/Zd/Wa6UwABvsNjv4kzMNIviSTUK1eTWRuJAnIRhWPbLTkh1Q8F+TaEA8yS9sKhG3EXIbf2ZG0wXtgK90UrDPFoK/cMj1n6t4JpJfHRRQq5Ndc5NHZa/ELfJ64=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750958696; c=relaxed/simple;
	bh=v8UmoxJDl38kFxauy2FQ3SHa3JGxyG7OPtiyEFn0L7w=;
	h=MIME-Version:Content-Type:From:To:Message-ID:In-Reply-To:
	 References:Subject:Date; b=kCkhXOymkVZREpxsI7RFFJpzcWujoF7qThCZ2q3YxU62gOklRGlkWfJI3pKsuAWqM4d6auq7BSNdGvnoOfyJJi6ziDOE28eDh16zAxTLljoi2aMKWAzkwLB1WyKuF18lT7FhxiCaYjPzkyVQXNWZvaW2vhSU1r8nuMmxSWwknho=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=rHU+3iEb; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="rHU+3iEb"
Received: by smtp.kernel.org (Postfix)
	id A4902C4CEEE; Thu, 26 Jun 2025 17:24:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8DC5FC4CEEB;
	Thu, 26 Jun 2025 17:24:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750958695;
	bh=v8UmoxJDl38kFxauy2FQ3SHa3JGxyG7OPtiyEFn0L7w=;
	h=From:To:In-Reply-To:References:Subject:Date:From;
	b=rHU+3iEbBJLMzOhT6KnaoANhymxlF5ipdu72ceeXUUfDcnLeJACanBXZZcvEvprLt
	 7CEAODIRCyNSDff3CBxNHJEE6sV0JBeD1ZTFpMByFwi4cXC0gs4VY2Y0J+IYb6ywLq
	 s8fuyYzLQGOiE5HUrd6Knb82Yh3oQ6ZiIdIQfC9PYbdZ6WxppSVZtiqPcNIsW2ZvBj
	 UKZ96dEOA8lGY7r/mMre8Ym/tA/K7IuySI08nWYogf97MmnUp/a/LmqUAbsbrjKmL9
	 yEmk22b14z2Tr7760UvlP6ZtiJdXCwhuEv4Qvv2kjW+imOlZiOC1aXiGQxg+RLwMiB
	 FLrIBFPfvLYVA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id EE6E33A40FCB;
	Thu, 26 Jun 2025 17:25:22 +0000 (UTC)
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
From: Bugspray Bot <bugbot@kernel.org>
To: davemarq@linux.ibm.com, konstantin@linuxfoundation.org, 
 tools@kernel.org
Message-ID: <20250626-b220276-1cd47cf09855@bugzilla.kernel.org>
In-Reply-To: <87sejmk0j7.fsf@linux.ibm.com>
References: <87sejmk0j7.fsf@linux.ibm.com>
Subject: Re: b4 send --resend broken by
 8cae1088cf605a12ed3207e7743fadcfa95c252a
X-Bugzilla-Product: Tools
X-Bugzilla-Component: Infra
X-Mailer: bugspray 0.1-dev
Date: Thu, 26 Jun 2025 17:25:22 +0000 (UTC)

Hello:

This conversation is now tracked by Kernel.org Bugzilla:
https://bugzilla.kernel.org/show_bug.cgi?id=220276

There is no need to do anything else, just keep talking.
-- 
Deet-doot-dot, I am a bot.
Kernel.org Bugzilla (bugspray 0.1-dev)

