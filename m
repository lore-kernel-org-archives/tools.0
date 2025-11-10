Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75DA42FE57B;
	Mon, 10 Nov 2025 10:20:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762770053; cv=none; b=s0Psh7BiMXRICO6m13Veu9XSOYYEbLHoe1pmRhAifMKNZ3qp9CmwLhG0XUDia/72XOlAVouopgy9QpXG5yV+p3bm9EZWdVQLPWv6JukKqxJasPoNRb+iN8O3R9iPj4i1zkw4O+zRxwRVYMOkcm8+uhcAoce7hZJBDycR217nppY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762770053; c=relaxed/simple;
	bh=iacjyDPQRqo+gSe172sya9Wu4lZTB9+f+VdpDmEqISs=;
	h=From:Date:MIME-Version:Content-Type:To:Message-ID:In-Reply-To:
	 References:Subject; b=aLqAGqeHCYQgzipYTicYjD4HV+0wrR+2zje2eMGkY/WHsiP9XRyTjni+IbSQO0dBWy8iuD1gUhhPe9H2JvnqJV8GzhRA06fdaOMgtlTK2lA02cqkTjTTRGxYQtkmPG6EszbkeQ+KMH1nVS/CRW9T7gnG1QFWmZKGoB41zHjep+E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=klvdoRm1; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="klvdoRm1"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F0034C116B1;
	Mon, 10 Nov 2025 10:20:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762770053;
	bh=iacjyDPQRqo+gSe172sya9Wu4lZTB9+f+VdpDmEqISs=;
	h=From:Date:To:In-Reply-To:References:Subject:From;
	b=klvdoRm1Nhls4tNKgGVqLIyvQK7zkTybXKuUoo03+7J2f6vj0QrAkMwZVpPCnDdm5
	 U6NEHYfRjT3SPDveFyVdA4A+c0DwZsgcBXxX1DgQpIUQBqnYzMsywuuD/twsUYEHcR
	 itAWGhHlGREs72nBbn7maUPnzGSdVm1O1QHlDn5t4ua/u0GBaVu5Xq1g8u3p9bwAuz
	 UOL0KBXqWfzjG7LXuh9YC1yEPHqDiCqf0OVvbcxOFg4NajO5fs7P3DzkIiqxA3+2r2
	 7UtWjPzbecpRcLkTyluGicDLBAze2Rp9mPt2Jn/xhS/Ci+IHTz1dVDlnxoWSoFSj+n
	 KeCgKBUjbnwDQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id EEBE13A41000;
	Mon, 10 Nov 2025 10:20:24 +0000 (UTC)
From: Louis Rannou via Bugspray Bot <bugbot@kernel.org>
Date: Mon, 10 Nov 2025 10:20:15 +0000
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
To: bugs@lists.linux.dev, tools@linux.kernel.org, 
 konstantin@linuxfoundation.org, erik.schilling@linaro.org
Message-ID: <20251110-b217642c4-7e2aa1795fa3@bugzilla.kernel.org>
In-Reply-To: <CTPW75Q2ISUN.251ELTNP6RB22@fedora>
References: <CTPW75Q2ISUN.251ELTNP6RB22@fedora>
Subject: Re: Allow sending prefixes before [PATCH]
X-Bugzilla-Product: Linux
X-Bugzilla-Component: Kernel
X-Mailer: bugspray 0.1-dev

Louis Rannou writes via Kernel.org Bugzilla:

The issue in patching the --set-prefixes command is that when it comes to make the cover, the LoreSubject class is parsing all the [foo] in its title, considers them as standard prefixes and moves them into the PATCH bracket.

View: https://bugzilla.kernel.org/show_bug.cgi?id=217642#c4
You can reply to this message to join the discussion.
-- 
Deet-doot-dot, I am a bot.
Kernel.org Bugzilla (bugspray 0.1-dev)

