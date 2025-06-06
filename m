Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 142AC1DF247
	for <tools@linux.kernel.org>; Fri,  6 Jun 2025 03:14:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749179691; cv=none; b=PZGjJQkxuvRUghDuwx/xZFeR8lFMnNa66AIZgqKX2yO0bMpWMi+kdLPOJFVBi9jykQdTFO8dnKOTrN20MgpVdfNZjyVr+chjMIPXn8AJulZvK19bhJTcjBlatWYb9K4YTwJdyc+dhhoY0cxLkzuibU01u1RbX4JY2KzWRZzFhxA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749179691; c=relaxed/simple;
	bh=3CFj8OhzcFJ5zeshhT17zSzixo5tCi3O96E2j0OMck4=;
	h=MIME-Version:Content-Type:From:To:Message-ID:In-Reply-To:
	 References:Subject:Date; b=IoVWW3i82C9jiufMMDeES05NHU8IWHguoNGFfVH88vrZwTGbXp67nWYlH/ORlatSHp7FhoLxy5RZxc27Qxp89hvIgYE0sL2/flca6OznKiNtR2ajKPo0ttOb3HSVZW6DsdBi7nxyuF2YNfxjkZ6v/HRFo1WEKS2oS78X//gRrUk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kKAlnAV7; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kKAlnAV7"
Received: by smtp.kernel.org (Postfix)
	id 9E2F3C4CEEE; Fri,  6 Jun 2025 03:14:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 87CDEC4CEE7;
	Fri,  6 Jun 2025 03:14:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749179690;
	bh=3CFj8OhzcFJ5zeshhT17zSzixo5tCi3O96E2j0OMck4=;
	h=From:To:In-Reply-To:References:Subject:Date:From;
	b=kKAlnAV7BHmm3VFATUqYAWYOHBUe1YNZKlzHcQ7nE3xcZPSF2tCF7V9P/sVYMgtRJ
	 hNlzTGygy90o8iKh+ABTIM2XRW5fYYAspe9XiTKspDlUI5OIyS9h44Ugkmowek1UFl
	 qxtlHGEYKZaKG5mrUvGCr0crEb3awCNMTdSuHgjL57Q6N8gIxuDdoqbj1A8bIxz9hk
	 ZaJbsLR82sUXyHriZtt6zvJ9/4FsmSBNaAKtK1qeU495idBov940KKNp+50cmDR25l
	 b7WIZ7IwdFg4uN+RRByl2s/k+C6bonG91akL6wyPar9I6Cq4tNfBRU91hCwwR14C+Y
	 2BorTxE8pvh8Q==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 7445F38111E4;
	Fri,  6 Jun 2025 03:15:23 +0000 (UTC)
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
From: Bugspray Bot <bugbot@kernel.org>
To: tools@kernel.org, jeff.johnson@oss.qualcomm.com
Message-ID: <20250606-b220201-33d1a0a7db34@bugzilla.kernel.org>
In-Reply-To: <811aed03-7717-4e04-98d5-e91f05df26e1@oss.qualcomm.com>
References: <811aed03-7717-4e04-98d5-e91f05df26e1@oss.qualcomm.com>
Subject: Re: Need clue: b4 working with dependencies
X-Bugzilla-Product: Tools
X-Bugzilla-Component: Infra
X-Mailer: bugspray 0.1-dev
Date: Fri,  6 Jun 2025 03:15:23 +0000 (UTC)

Hello:

This conversation is now tracked by Kernel.org Bugzilla:
https://bugzilla.kernel.org/show_bug.cgi?id=220201

There is no need to do anything else, just keep talking.
-- 
Deet-doot-dot, I am a bot.
Kernel.org Bugzilla (bugspray 0.1-dev)

