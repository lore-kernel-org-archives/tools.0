Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1558C211A05
	for <tools@linux.kernel.org>; Fri,  6 Mar 2026 19:34:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772825690; cv=none; b=WVTlg9skk0+NDhvy7b414y5SAA5aDKc7lfZevBYgVuxsQUM1UqJH6PYCAc0bDxE0d3UT6oxn+Ap/vLxfAUSL99CxjkjwKhQHorjJ2pqYC0p4Rz6Hj9ZWhiXkE4TnIk3+P+HiW32iL4tol0tKlL+aKCI0HLtQauiKBxMq3+7YJ64=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772825690; c=relaxed/simple;
	bh=eMBjHfy/HsZMpCtAm69Z92HA3aKyhYmpWis+u0S0kkM=;
	h=MIME-Version:Content-Type:From:To:Message-ID:In-Reply-To:
	 References:Subject:Date; b=kDKtE/xRa0XSDjOdiKV6ae1phnlSgtCQ0IlxqeGCRjNo2UhQyowIoEnCnWcAF8hkb1vZx13XZmrruKQwYQpTm2zlN+xXq5cTT8YT2Tv3fAG6IUAf3i5lqIURD7OBj7DdUZebpTiPfLOHRFEKZTjHVeFP8eBZGcwJrIPercZtluY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gBwJBz6J; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gBwJBz6J"
Received: by smtp.kernel.org (Postfix)
	id B64DBC2BC86; Fri,  6 Mar 2026 19:34:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A00E5C4CEF7;
	Fri,  6 Mar 2026 19:34:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772825689;
	bh=eMBjHfy/HsZMpCtAm69Z92HA3aKyhYmpWis+u0S0kkM=;
	h=From:To:In-Reply-To:References:Subject:Date:From;
	b=gBwJBz6JFin9dpyIBKBb3OLHgPsB+ZL3RT0wnDKd1GJ2QTP5eMvySQdEbogrCIfQw
	 fDJFbfreqnK9wDNFI7N9V9vrxnUgo7bJAckpOOOOCNYCo7/2+cFH8gtqTW678sPCf4
	 IY0SvRT2GGRSAE0CVAU2BB+fN4Ae7aylrwnhHjnUPkCYhyDR+v2nS0DPN3vew0M6JR
	 MtUc1v6Z+omxnaad9SnC0jmOlyatMpqTI4UgZM7+7IiI8rq3fQrAdhjiqx3GWOlLjF
	 0PgfBScHRgqb2DbXBXU0R7YDrEjl3XyNaHJXYlQOLvlFF+1aYDJNXF2q5LBNv48i+C
	 KDlNVjjAeLLVA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 05B443808200;
	Fri,  6 Mar 2026 19:34:50 +0000 (UTC)
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
From: B4 Bugbot <bugbot+b4@kernel.org>
To: mricon@kernel.org, gregkh@linuxfoundation.org, tools@kernel.org
Message-ID: <20260306-bcd06df9c6-13b6c8afc5e2@git.kernel.org>
In-Reply-To: <2026020637-cleft-viscosity-c984@gregkh>
References: <2026020637-cleft-viscosity-c984@gregkh>
Subject: Re: odd b4 "Mail:" trailer added for USB patch
X-Git-Bug-Id: cd06df9e282665334001751884c687a23d500a3bd17be35d4d2fd8a6fd137880
X-Mailer: bugspray 0.1-dev
Date: Fri,  6 Mar 2026 19:34:50 +0000 (UTC)

Konstantin Ryabitsev writes in commit 002f70670507a3edca307edd11b5e0000d9d73a2:

Add 'mail' to the known non-trailer ignore list

A code-review follow-up containing "Mail: someone@example.com" was
being picked up as a valid trailer and injected into the commit.
Add 'mail' to the ignore set alongside the already-ignored 'phone',
'email', and 'e-mail' entries so it is silently skipped during
follow-up trailer collection.

Closes: https://msgid.link/2026020637-cleft-viscosity-c984@gregkh # cd06df9
Signed-off-by: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Assisted-by: claude-opus-4-6

--
Deet-doot-dot, I am a bot.
b4 bug tracker (bugspray 0.1-dev)

