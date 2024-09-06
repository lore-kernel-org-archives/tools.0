Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBEB81D0DC0
	for <tools@linux.kernel.org>; Fri,  6 Sep 2024 14:25:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725632719; cv=none; b=ZtcWvvidbL3nIQ9gvPLCIs11YrONFg+9JswsvEJFmbVK0cEAie27HIiHqjvW1i0se6ajclaBRAfZULsyCaB36+haET6LDzDB17hfb0RawLtKplmpQCenUIuVCbVHVNtA92cFaUWiAeJJt2abOv/AIaRTNfrKRSg2khQnCgw8lSs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725632719; c=relaxed/simple;
	bh=UJvLLVqCS9/nmhwtj81E29YOrSAVyYNvRtyprO8DHSg=;
	h=MIME-Version:Content-Type:From:To:Message-ID:In-Reply-To:
	 References:Subject:Date; b=nbsLFteDgFZloLQ3PoQZQ2/epnFt/EJL5TGdA4Nsh9LLEW0bgY15Jgvlkkop8vU6AKuNlrSkhrVA71ZeQLbvBJGFgJcjbkZemdQJdL7IYZ4A2E5WstneXGcjVtTGbRUIb2EyQfzTnvWwNHGw6J24PFYSBFaog1qZA6xZ0bJBEkE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=uDX96c+Y; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="uDX96c+Y"
Received: by smtp.kernel.org (Postfix)
	id 5A52EC4CEC7; Fri,  6 Sep 2024 14:25:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3D6C9C4CEC4;
	Fri,  6 Sep 2024 14:25:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1725632719;
	bh=UJvLLVqCS9/nmhwtj81E29YOrSAVyYNvRtyprO8DHSg=;
	h=From:To:In-Reply-To:References:Subject:Date:From;
	b=uDX96c+YfhwVzEE1SsOd7rrdikCpJtTmnBRKOu/C7Wgi49lX06xIH1wvcb5A+hryr
	 keqGrQAFRnx2BUgo9Vk+CXg0RRIqx6W6ifDzuMpJkwPZkfNU9OWJOi5q5jfmR3UWsI
	 qTeW+8jHMIT1eL2YC7d6MBlqGL5g5Z0NraEosMiRgXjrgj1RJ1/pp2GRvSlhgUliaR
	 7zX5B8ABZNVCxrEkPUZkEQess7/RaurZYlEfwaEOj6gwlS3hr2JkKDMHCU2C06UWoH
	 pLQYqd0GgR4hZ/OxfjCAojh750bI+dmXFQZxcM9+kSg7gYAEL/I4MsZLumlWJgmJsl
	 VQq3ewzkkXI0g==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 3CF693806644;
	Fri,  6 Sep 2024 14:25:21 +0000 (UTC)
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
From: "Kernel.org Bugbot" <bugbot@kernel.org>
To: khilman@baylibre.com, tools@kernel.org, konstantin@linuxfoundation.org
Message-ID: <20240906-b219138c3-138cafcaf1f3@bugzilla.kernel.org>
In-Reply-To: <7hh6by34mx.fsf@baylibre.com>
References: <7hh6by34mx.fsf@baylibre.com>
Subject: Re: b4: message-id from deps added to cc list?
X-Bugzilla-Product: Tools
X-Bugzilla-Component: Infra
X-Mailer: bugspray 0.1-dev
Date: Fri,  6 Sep 2024 14:25:21 +0000 (UTC)

Louis Chauvet writes in commit 77eaedc7de548fdaa289c51f62278633bd815d01:

Remove message-id from cc list

As the algorithm to detect mails to add in CC is very simple, it also
include the prerequisite-message-id to CC as they look like mails. In
order to avoid this kind of issue, filter out prerequisite-message-id
lines.

Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
Reviewed-by: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>
Tested-by: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>
Closes: https://bugzilla.kernel.org/show_bug.cgi?id=219138
Signed-off-by: Konstantin Ryabitsev <konstantin@linuxfoundation.org>

(via https://git.kernel.org/pub/scm/utils/b4/b4.git/commit/?id=77eaedc7de54)
-- 
Deet-doot-dot, I am a bot.
Kernel.org Bugzilla (bugspray 0.1-dev)

