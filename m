Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCA3A199384
	for <tools@linux.kernel.org>; Wed, 25 Dec 2024 17:15:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735146906; cv=none; b=p6IEPpC7ufzFxqU56WMJIplJHbP+PxXpehIq8u9zsP1RZ2ojHegd7zOlmoX2cuJrxSp7SthwrEufJsUNjtkmuWBs/H/j7KrMTHPyjQVf3aLN6Cqv/lHq0ZXNNM5Gl3LBrILfNdXGIvK3FPkh5R7L72S3lGIHPhCJL8u9KchGHAk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735146906; c=relaxed/simple;
	bh=ChzGYdRICiZsXIqEdsXl1UlqxSdLRA8SXnuRLatE2XQ=;
	h=MIME-Version:Content-Type:From:To:Message-ID:In-Reply-To:
	 References:Subject:Date; b=jvzmWuVc3PX4zv3/3uCa41KL7/V4wrGWENoOHlgsorEX56huNCVi1Veg52ggZXk3jRfnCZ0RYdDFg4H1Nu48/VTieMGQFyFtxZhKEx1i6Vq6vCqO+AokopZwEfWmsypeFIRcYHhuJXOm3/rPHK8ltgrbdFD2iy/PZ6FDE1YSXvQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=AMhfh2YJ; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="AMhfh2YJ"
Received: by smtp.kernel.org (Postfix)
	id 737AFC4CED2; Wed, 25 Dec 2024 17:15:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4EAEEC4CECD;
	Wed, 25 Dec 2024 17:15:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1735146906;
	bh=ChzGYdRICiZsXIqEdsXl1UlqxSdLRA8SXnuRLatE2XQ=;
	h=From:To:In-Reply-To:References:Subject:Date:From;
	b=AMhfh2YJUJWPnzvLe6GVvp3POdrUbnQZwQTtkIZpE52Cptcn/Z5Qkprch+w5nqcGJ
	 KbEq5s7p02zZqjwpA3refO1qKNzUSlSQR2Ki/+ONu2E4P3O+nK0qQmhff5K1fMmGfg
	 Rfk7frKRsjzbz9+2ZiT9voS2oIRmFoxq657B+eE8u1rg5dW2lbWQo/9KBbat7M4r1Y
	 UjQoGMiXfsy7bJKBsolTD5n1E/BhYQCm+ttjczZm1TcN0J1O2KmwJ5ps9UJjB8c92G
	 5ALKtDD1kYMsPNHrKCnDRtbVAVxr/9z9mxkl3R7Ou7+XdEQ29G57Y6QMsZIlQnO49q
	 NxMmt7DD5tXmg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 38AA0380A955;
	Wed, 25 Dec 2024 17:15:26 +0000 (UTC)
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
From: Bugspray Bot <bugbot@kernel.org>
To: jiaxun.yang@flygoat.com, tools@kernel.org
Message-ID: <20241225-b219633-6f74f2dc23b5@bugzilla.kernel.org>
In-Reply-To: <af457861-6d07-451a-a4a3-9f52062f95b4@app.fastmail.com>
References: <af457861-6d07-451a-a4a3-9f52062f95b4@app.fastmail.com>
Subject: Re: b4: Should send-series-to supress send-auto-to-cmd?
X-Bugzilla-Product: Tools
X-Bugzilla-Component: Infra
X-Mailer: bugspray 0.1-dev
Date: Wed, 25 Dec 2024 17:15:26 +0000 (UTC)

Hello:

This conversation is now tracked by Kernel.org Bugzilla:
https://bugzilla.kernel.org/show_bug.cgi?id=219633

There is no need to do anything else, just keep talking.
-- 
Deet-doot-dot, I am a bot.
Kernel.org Bugzilla (bugspray 0.1-dev)

