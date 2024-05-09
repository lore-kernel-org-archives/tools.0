Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D985B3AC2B
	for <tools@linux.kernel.org>; Thu,  9 May 2024 14:50:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715266226; cv=none; b=XE3RvlOhpq0z094uiUZvfJplbKWQV8IrZB0A8TQe5PX9nkGnh57vUeRrNsN5CRxLHWcQ+OyrbltcmxkiqldjInoYatSdE4VMcP0wbjRodYagooWg75Bf06kXeSRGnEQWMOJqOPgydYNoTgiI8QvrbgO4kCko4gYNokTTrQGCmZc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715266226; c=relaxed/simple;
	bh=JVmXKdMYlQblLAjR0r/6nqv606iJyZquxo9XmOlXkJ4=;
	h=MIME-Version:Content-Type:From:To:Message-ID:In-Reply-To:
	 References:Subject:Date; b=UaC5SkB5rDs4LC0sFOoYLUowY+gIhijCDcNTfn+brcLqc/pyXxlov+RB7c3557UuGyaQFF4kcOOMaO9WcWeNx/V3nSymIa/6Cz46TD0WhLCCzNmQuzyNo6+urfM+UzL/WB+1/40SPrk26Ie80u8J/C3rJdq8VDWK/cZRpGjp16o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PBGaTC57; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PBGaTC57"
Received: by smtp.kernel.org (Postfix)
	id 9CA7CC32781; Thu,  9 May 2024 14:50:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 81867C116B1;
	Thu,  9 May 2024 14:50:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1715266226;
	bh=JVmXKdMYlQblLAjR0r/6nqv606iJyZquxo9XmOlXkJ4=;
	h=From:To:In-Reply-To:References:Subject:Date:From;
	b=PBGaTC57YPOFLT9Us5rCWVu4GRx3IG8cplSKE67o57E+Sfl8LCRnyksKD5AIzr4RW
	 csPX1iFK9e2SEFml4+QsiamHedLgmYEg0Nk3ppMvziG5BJnTF/3Lo9SDSyEDpm+92w
	 E6jLRGJ4UCXPY45duPH2igkXZeWnb49/BcIITMdd+MylsEw4wnwvR0iuhCMuf4c4kj
	 rQR9kiT2vXnMNEsRpmR5NLc7QoyG0fPRFNFtibWWyoE6pe986T5zBozISFkhBHIH8U
	 Umc3yNLdLzsWhArZxXiU6RsP5Io5OiWwGjOAm+ag2C7xJDeK4FWDnfXIx+Yu8oxITF
	 GzRm5WDLEJNfg==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 6FDFEC433F2;
	Thu,  9 May 2024 14:50:26 +0000 (UTC)
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
From: "Kernel.org Bugbot" <bugbot@kernel.org>
To: tools@linux.kernel.org, konstantin@linuxfoundation.org, 
 andrew.cooper3@citrix.com, tools@kernel.org
Message-ID: <20240509-b218824c5-411e972423e9@bugzilla.kernel.org>
In-Reply-To: <2510008e-23d5-4c15-a16c-be9de549a425@citrix.com>
References: <2510008e-23d5-4c15-a16c-be9de549a425@citrix.com>
Subject: Re: b4 shazam not stripping ---
X-Bugzilla-Product: Tools
X-Bugzilla-Component: Infra
X-Mailer: peebz 0.1
Date: Thu,  9 May 2024 14:50:26 +0000 (UTC)

Konstantin Ryabitsev writes in commit f3d47b4f92dfbd09106b06ade5020458a339d960:

am: fix incorrect parsing of non-git diffs with comments

We were not properly handling patches that were a) not generated with
"git format-patch" and b) contained a comment after the main commit
message (where the diffstat would normally go). This fixes it and adds a
test case to make sure we catch it in the future.

Reported-by: Andrew Cooper <andrew.cooper3@citrix.com>
Closes: https://bugzilla.kernel.org/show_bug.cgi?id=218824
Signed-off-by: Konstantin Ryabitsev <konstantin@linuxfoundation.org>

(via https://git.kernel.org/pub/scm/utils/b4/b4.git/commit/?id=f3d47b4f92df)
-- 
Deet-doot-dot, I am a bot.
Kernel.org Bugzilla (peebz 0.1)

