Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24BEC195980
	for <tools@linux.kernel.org>; Fri, 17 Jan 2025 16:35:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737131714; cv=none; b=fxw2se/61X2liAHT9oNNTVcKh/JTI2+6BmLp5BxIUnTdN4/fmNB82PUTZ0wtkJFqDJALQAk6DqeHV4wYg/Y0Z4V4d4OkOAzL7M3QRLqiuVYrLSfzXYHYe5FHUmvjxVlLPZgw+RhT9pBO7cFSQURVFndPvU1savX/v0zzwqbpo6s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737131714; c=relaxed/simple;
	bh=5eyw21Idl5OqxiHuffvlEoz4VcI4JE9P7HGAaKiOnhM=;
	h=MIME-Version:Content-Type:From:To:Message-ID:In-Reply-To:
	 References:Subject:Date; b=eBx+JGhsWt9lCE0Z43myK+6pHgH1yUwHdVkxuPN3PM/kk3QmAfsgnOr1EqAfP0F0xZK82HlUFCctHTikKJIThdVM+cT/1JMsLxAHvCLk00C1IvtMro1flanllzgxdVogIWsVm9clA5G/WRGI+CBr20S5BHsvhdL/aK+Nlg78DTc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=a2xaDZoi; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="a2xaDZoi"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9C18DC4CEDD;
	Fri, 17 Jan 2025 16:35:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1737131713;
	bh=5eyw21Idl5OqxiHuffvlEoz4VcI4JE9P7HGAaKiOnhM=;
	h=From:To:In-Reply-To:References:Subject:Date:From;
	b=a2xaDZois9b3DgLlkbt7mMeaYwTrH1KS7CU7K+y92t46VUX4ritofFJwtuGygAfBo
	 padCIHaeoe/q+75M5zgY8rctAWHWIBz4NtNcBivCvNR/X01FYIBmM3CgMN0kXmnkbw
	 xnUIzPhPDIrTbawce0L/5z7bKY3mF9ywXvH6wrsscx2X7TcJEw/1rRfjYDuEMBg04O
	 Or2ztCa0auar43MMPvriuv+pYuN+H5duPvxDJ/b2UvxO/d3+aEuYB5mrUVMtXuDrBU
	 XPtLeplyT6+yI7AyuOi4GEM0H4PRkVsDKHe2ICW3HZbwKEMAz9FYyYAUasYilXlD8s
	 /nJGWuQRATyOw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 00851380AA6A;
	Fri, 17 Jan 2025 16:35:37 +0000 (UTC)
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
From: Bugspray Bot <bugbot@kernel.org>
To: rhanneken@pobox.com, tools@linux.kernel.org, tools@kernel.org
Message-ID: <20250117-b219706-36d000e50e55@bugzilla.kernel.org>
In-Reply-To: <bfb0c080-da20-490a-8124-799f2e9a41d8@pobox.com>
References: <bfb0c080-da20-490a-8124-799f2e9a41d8@pobox.com>
Subject: Re: patatt validate does not recognize patches sent with git
 send-email
X-Bugzilla-Product: Tools
X-Bugzilla-Component: Infra
X-Mailer: bugspray 0.1-dev
Date: Fri, 17 Jan 2025 16:35:37 +0000 (UTC)

Hello:

This conversation is now tracked by Kernel.org Bugzilla:
https://bugzilla.kernel.org/show_bug.cgi?id=219706

There is no need to do anything else, just keep talking.
-- 
Deet-doot-dot, I am a bot.
Kernel.org Bugzilla (bugspray 0.1-dev)

