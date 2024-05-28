Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01A4D75809
	for <tools@linux.kernel.org>; Tue, 28 May 2024 20:15:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716927329; cv=none; b=Ludyx8jzJLOl8/DIA/3QYQ1ladGXkFeeYkcC/raQ0BD6A+8fIEfRoqgp/fRyCORgiSUVyoug8vHa2bjJvW0U/QFdHADx3k6urd5edI32TYKA2UYIj0DiX6fvvqW3tsRscDcXYcYhYp5Sq8/yMEky4EWyt5CFYSCa4tlVe5wECGE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716927329; c=relaxed/simple;
	bh=iz5TgcMurmvl5LKerC5yb1dmpFxz78glyNoeT83TVrE=;
	h=MIME-Version:Content-Type:From:To:Message-ID:In-Reply-To:
	 References:Subject:Date; b=ArQ01JRwTz2NlHkisAvdt0wgar5EgTDNATeTbQHWZuGmMdmbL/F2g0wG7xTdZwCN2/+y9XPK820LKSc/GxNAmIaDuJyWXpNoYRtlDUoXeflSSex+53jTKrmedVYsbOcPCH0GHlTJy5RCROoqSwXoM5TheQQHRzT9vIK+TK/CeLA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UA9RYUtv; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UA9RYUtv"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 8E660C3277B;
	Tue, 28 May 2024 20:15:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1716927328;
	bh=iz5TgcMurmvl5LKerC5yb1dmpFxz78glyNoeT83TVrE=;
	h=From:To:In-Reply-To:References:Subject:Date:From;
	b=UA9RYUtvIurQDa4OBELPhyc2cgpY5m3Acx2tcGMHKlAj4Kzq61lBxLeM6jq62qjI5
	 3n45MAcWMdmqVDQIcKd9rLN7XjphdUZudUzDE8hi+vorjrsxRjTVt2bg/29JrXPLRM
	 mzXMbEJIf7Zc8ih/YJ9Q+eI56HsAMqEmgoLJHbNt+OwamxfHBo7mXTVgZA1bM4SCVe
	 dGVoDnoKAY6wrEarwRr8C4IorXR0kgYK6VqmJwebN2LVE/vwqVnd2+M3W+gl/nmcF6
	 3DAZmrChm/ljL/6GxZ27vswShLrA3+5Em/N+ffROHCYK4WMwoSkGAGw/Et0xNWPolL
	 2J+AZPu0DrccA==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 7B6DEC4361B;
	Tue, 28 May 2024 20:15:28 +0000 (UTC)
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
From: "Kernel.org Bugbot" <bugbot@kernel.org>
To: konstantin@linuxfoundation.org, broonie@kernel.org, 
 tools@linux.kernel.org
Message-ID: <20240528-b218910c2-d139806df322@bugzilla.kernel.org>
In-Reply-To: <177fedb6-241a-420c-ab5f-8b7ae4d7acd9@sirena.org.uk>
References: <177fedb6-241a-420c-ab5f-8b7ae4d7acd9@sirena.org.uk>
Subject: Re: Single patch ranges no longer understood
X-Bugzilla-Product: Tools
X-Bugzilla-Component: Infra
X-Mailer: peebz 0.1
Date: Tue, 28 May 2024 20:15:28 +0000 (UTC)

Konstantin Ryabitsev writes in commit 2ee9fb76c69ddf47c80038df9fe3f0cb4df4bd67:

Fix parsing non-negative single numbers with parse_int_range()

Fix a regression when parsing single non-negative numbers. Add a test
for this and other conditions, so we catch this in the future.

Fixes: 18e6921e8b ("Allow negative number in parse_int_range()")
Closes: https://bugzilla.kernel.org/show_bug.cgi?id=218910
Signed-off-by: Konstantin Ryabitsev <konstantin@linuxfoundation.org>

(via https://git.kernel.org/pub/scm/utils/b4/b4.git/commit/?id=2ee9fb76c69d)
-- 
Deet-doot-dot, I am a bot.
Kernel.org Bugzilla (peebz 0.1)

