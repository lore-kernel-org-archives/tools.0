Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB28B34CFCC
	for <tools@linux.kernel.org>; Tue, 13 Jan 2026 16:53:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768323225; cv=none; b=MVtJbsw3O83jew+QynZZSmgZrEaN9umwgHmBp5LRB3rFhCvhbVc0+iNAfv/axwRe3V+3h80NM1UNMVnZCUFWXqkqBhZ8thgR08AJD/YUlxn1xEkK3ImbPWLttFjo0/dS/LIXpP6SD1Xo1i5AuqARrMIdqn9ii5PJAC2YJHqAW8Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768323225; c=relaxed/simple;
	bh=uwpaHHnFuQ1HYZce1syUMmJwpZFmnzoaZv8Cc6cFewM=;
	h=MIME-Version:Content-Type:From:To:Message-ID:In-Reply-To:
	 References:Subject:Date; b=HIRfHTKOiPAoG/bDjyNQ0LYCs9snljLvIis/Ql4vCVAtk/RNCWLmoFFWdjEdsx+nAkhErbF2J19wROIFqp3eCPS6p2HcPMLgc4Od42CVBgiMpFh2klg4Rf++mhQl+SPh5bmjH2PflyVjBeGtu+0UND4pAOJuLeJKaNwYJaJZvaY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kG1norwn; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kG1norwn"
Received: by smtp.kernel.org (Postfix)
	id 92736C19423; Tue, 13 Jan 2026 16:53:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7C0C7C116C6;
	Tue, 13 Jan 2026 16:53:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768323225;
	bh=uwpaHHnFuQ1HYZce1syUMmJwpZFmnzoaZv8Cc6cFewM=;
	h=From:To:In-Reply-To:References:Subject:Date:From;
	b=kG1norwngxD78rlqEe5D9dzrsMf+cDhQUtTH+2IMVzaPbcfCIwbMw0Nnr8RbAqpgT
	 VKKnuuh8yLlvV+oyNCntusHubZakoPP8fqctyipHwFZUfnbFEpV1MJtkPMaPZYenLB
	 Fv2KfhSgBNtvZpu43MAnXCJPYWa+jjqLvHbymgdbQeVjTx1LRxold/h4Mw75MLoAXo
	 O/27VZV3ZDtHNGxxuEZ0X3Mr9yCSxihhb7uO3a/MxlCs7ZyeJyPorlxATTk1BMavSj
	 QQ2PoOmrqDv+45cjcbYPz3hvClx+rNNBuaqvtpucWzi7SPcf7/xYAoTaz933UP4pD1
	 le8+pxckL06vg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id EB6403808200;
	Tue, 13 Jan 2026 16:50:19 +0000 (UTC)
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
From: Bugspray Bot <bugbot@kernel.org>
To: konstantin@linuxfoundation.org, tools@kernel.org, users@kernel.org, 
 bugs@lists.linux.dev
Message-ID: <20260113-b220974-0422b80f5be2@bugzilla.kernel.org>
In-Reply-To: <20260113-valiant-dragon-of-dignity-d98cea@lemur>
References: <20260113-valiant-dragon-of-dignity-d98cea@lemur>
Subject: Re: korgalore: small taskbar app ui
X-Bugzilla-Product: Linux
X-Bugzilla-Component: Kernel
X-Mailer: bugspray 0.1-dev
Date: Tue, 13 Jan 2026 16:50:19 +0000 (UTC)

Hello:

This conversation is now tracked by Kernel.org Bugzilla:
https://bugzilla.kernel.org/show_bug.cgi?id=220974

There is no need to do anything else, just keep talking.
-- 
Deet-doot-dot, I am a bot.
Kernel.org Bugzilla (bugspray 0.1-dev)

