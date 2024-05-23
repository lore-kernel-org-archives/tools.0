Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFAAD6AAD
	for <tools@linux.kernel.org>; Thu, 23 May 2024 15:20:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716477631; cv=none; b=FLL4ZfgItiHzS+yhJjqYtcMm58+svPszkwF5/jD0G9WhvFPtfrR/sf7gH/MBE3H7ZJ1XJqST/Q2OJZ7ZdSHoWo3sf4VQ/sr1H4NQ5SaBc2HP/2awJaH5FrdqUpaHdKaLoAo4YIQV7WGomX+weBxb+hh7wB79OMS1cvzVSkpmgq8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716477631; c=relaxed/simple;
	bh=4BgS1UOZoz3bL71/rbJkh2peVP6R5Viv/QYTddr744g=;
	h=MIME-Version:Content-Type:From:To:Message-ID:In-Reply-To:
	 References:Subject:Date; b=ZjjCwL9KIx1O7Smc8qhk2kGsI5RGEGwz0nTwQuYXBA1sTn41W5bcSKh/cEOIuAkv5gPT5rV9Cp5c2PX8kAhqzFGdUBxPxC7RPyyPG9bbu2vPo+50+zJA3OzQiDnwFWpChD/RALK4BRmN3LsdeRJEAbaLc8QInNec4QflPZjOj64=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=L6vqANN1; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="L6vqANN1"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 7494CC2BD10;
	Thu, 23 May 2024 15:20:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1716477630;
	bh=4BgS1UOZoz3bL71/rbJkh2peVP6R5Viv/QYTddr744g=;
	h=From:To:In-Reply-To:References:Subject:Date:From;
	b=L6vqANN1j0eLBr/e07vP3Lnla9gSGKChrhsdl1iUYLVuXGV3iKB598t9kr4tM/yEz
	 Fr5uFCFrRj5RYKY80baQfufiyoyFp/SCrwruzkWfbPJ076NGszE6aozBvAlxXypxKg
	 a3HoxZTgCWxdAj4Ovxmn1M3SgxvLol/HGDfK5tBIRAA2A4QIivPrIR96k31Cwbg2FU
	 gJzv9uynne7/sxKUmOaLI08gFLmVOQYpMEOuJI19ektwxeu2tAhqIgceDRfei54P0C
	 C1z+2H66Dbo7NSqx9eEmNL3NlND2kG/iIT4j6b1ef0FwXZKrS8nUeAGjv9WgVnV+HS
	 x8Zu5Ly+UkznA==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 400B0C54BB3;
	Thu, 23 May 2024 15:20:30 +0000 (UTC)
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
Message-ID: <20240523-b218878-e423837ea2d1@bugzilla.kernel.org>
In-Reply-To: <ZhQ8DoS1GaT0603l@sirena.org.uk>
References: <ZhQ8DoS1GaT0603l@sirena.org.uk>
Subject: Re: Checks for recipients
X-Bugzilla-Product: Tools
X-Bugzilla-Component: Infra
X-Mailer: peebz 0.1
Date: Thu, 23 May 2024 15:20:30 +0000 (UTC)

Hello:

This conversation is now tracked by Kernel.org Bugzilla:
https://bugzilla.kernel.org/show_bug.cgi?id=218878

There is no need to do anything else, just keep talking.
-- 
Deet-doot-dot, I am a bot.
Kernel.org Bugzilla (peebz 0.1)

