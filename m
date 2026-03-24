Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E3A73B3888
	for <tools@linux.kernel.org>; Tue, 24 Mar 2026 18:41:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774377678; cv=none; b=Olt4BHxIt2IaG1oZeYCzuQeiVvEdkV+9odXGSnQUVfU47C9rTPJnHXr9J5aWlOoK6wcFkgw2pKVkQnTuKQUNhiN9V3Y2OQN0C+GjqUyRsl/lC0MLAzpsk1kJxHxSHajjOddDNx3WZup58Qjh1VVFMhM6eoQJS5iG9xB9+ZBXjrM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774377678; c=relaxed/simple;
	bh=U8tiEFGD8hzWRhiZza8CPTa4tbVmgjRwBsFUEKBk/ys=;
	h=MIME-Version:Content-Type:From:To:Message-ID:In-Reply-To:
	 References:Subject:Date; b=lI/XWmjJ/dIvVIl5hdo8aKLp97YU+cp3NB152CoT2wPkI2U83/lku6z/c82S+zhto9u4WojFDL1HPXWWlB6ljGuXaws0FzF9X0uTT/3aLToozlyvPpfhtCcHxvWEeIaOZ3j+vTOmswSECa9v9uQxQiXMEUyM9pNh1NC6ZhJ6DnM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EcTdwLX1; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EcTdwLX1"
Received: by smtp.kernel.org (Postfix)
	id E4FC0C2BCB1; Tue, 24 Mar 2026 18:41:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CE972C19424;
	Tue, 24 Mar 2026 18:41:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774377677;
	bh=U8tiEFGD8hzWRhiZza8CPTa4tbVmgjRwBsFUEKBk/ys=;
	h=From:To:In-Reply-To:References:Subject:Date:From;
	b=EcTdwLX1TzZk9W2Q8Rf5Nh/rerdqAIzmdsHdXVsC9RyQdA63z6UJVOUk/t1S9GVIl
	 dSiqLeCym/9C3sB+reAXAsPe98Hl5xozEV+89gT/w90dAAPam2i0EUO1tUQN5x5pAt
	 EtfS7l5co/BZWCiopLWnlqmLd2i1xW1x9yiGeyrALwnvHxZo+Jvi7zY1Uqxk4MWDHC
	 JEyODTf0Ooi3MvW83bm6fMjaem09XxxeIhvLVZYVSKYjmO0OxzMZvgoh+ho70mXrXZ
	 pVGSxGOwQSEcwH8Src2+XFYNIlHviPwuJExrarAjMK0K2qzsUna2zb/qgx4G0h84R9
	 UTyc5rtKlaeUQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id BCBB93808203;
	Tue, 24 Mar 2026 18:41:06 +0000 (UTC)
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
From: B4 Bugbot <bugbot+b4@kernel.org>
To: tools@kernel.org, mricon@kernel.org, broonie@kernel.org
Message-ID: <20260324-bd4c6cc1-ebcd35ad0b42@git.kernel.org>
In-Reply-To: <c5b1ef7c-047f-469e-bf5b-bd385b21bc32@sirena.org.uk>
References: <c5b1ef7c-047f-469e-bf5b-bd385b21bc32@sirena.org.uk>
Subject: Re: More non-interactive operations
X-Git-Bug-Id: d4c6cc1210e4a7bc7a891810f8b4f5912dc4cc5dc0f8dd58178b6069cd9c4775
X-Mailer: bugspray 0.1-dev
Date: Tue, 24 Mar 2026 18:41:06 +0000 (UTC)

Hello:

This conversation is now tracked by b4 bug tracker.
There is no need to do anything else, just keep talking.

--
Deet-doot-dot, I am a bot.
b4 bug tracker (bugspray 0.1-dev)

