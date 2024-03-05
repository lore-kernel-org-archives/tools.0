Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7410026AD0
	for <tools@linux.kernel.org>; Tue,  5 Mar 2024 21:35:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709674520; cv=none; b=L8MeoWvW+lYkLr58snk+rnoaSyrqdvAOyfSniyjZhdx42J/q6LcAKq2BJlgUoAvFHQFLl+hC9dV871QknhtGB/eSZLs4PsCk2gDj9qEO/H6sGFOHNNqGcgAJFG8REAkYlXH5bkuZwK7HOS1wCa5t7NqfZ5hFPuZ/lPtI0IYTVJk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709674520; c=relaxed/simple;
	bh=c41k8r3CxFwStwTV7xfKn22wKFnQBQ1AGaBFDLbA+tk=;
	h=MIME-Version:Content-Type:From:To:Message-ID:In-Reply-To:
	 References:Subject:Date; b=cnzMO9BPrGBZbyAHMWAAJ6pRP0BxvsLhL00ltCdnBv/+d14mMXc7s49o3EFI60qIvCa/uM8iYivt2r9eABSUGkmlpaOGM2M+6EGsMBJKBtXHsyd9bAFIMhfUAsMNOUpHC8PDRJyH/8QKPRslMsjDBRth3dpHos6hRsZtNcAQSMA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Y/HzyaUk; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Y/HzyaUk"
Received: by smtp.kernel.org (Postfix)
	id 24706C433C7; Tue,  5 Mar 2024 21:35:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 016E2C433F1;
	Tue,  5 Mar 2024 21:35:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1709674520;
	bh=c41k8r3CxFwStwTV7xfKn22wKFnQBQ1AGaBFDLbA+tk=;
	h=From:To:In-Reply-To:References:Subject:Date:From;
	b=Y/HzyaUksCamZapLwgDLXRN8SetAjIrJbYW0ZpkzkTAe2WNH1IFaFgKaXGdQmyrp/
	 SdPV1qD5yCYZMXKL5Kiqt4D6ONhLIFW8QQ5ghq1UwsXvQWsI8VwxzarMpGwKzyHqvZ
	 RDdFJ2/gQ8r2Wd2ceP3fy5Hv0Igk792qgJdJwlmCVVLsPh7Ycib2drvvWvBzJlree8
	 MgcgmgZQpoGYC1z39u1hgHmH4BJlZm9CvSaPmZWLS58ZMpQ5dEr5pis33ThUMiMIJU
	 KNc07fM4m7s3javzrD7fNbuAJcQR2oNdBvegQbyK5Cl+xQFV6y1knEzehKbYkMA966
	 s/BAlchiVzvUw==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id D888CC04D3F;
	Tue,  5 Mar 2024 21:35:19 +0000 (UTC)
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
From: "Kernel.org Bugbot" <bugbot@kernel.org>
To: tools@kernel.org, andrew.cooper3@citrix.com, tools@linux.kernel.org
Message-ID: <20240305-b218563-507754436713@bugzilla.kernel.org>
In-Reply-To: <0137232a-5380-4869-9a9f-8a8db3506782@citrix.com>
References: <0137232a-5380-4869-9a9f-8a8db3506782@citrix.com>
Subject: Re: b4 failure to apply patch with ANSI escape sequences
X-Bugzilla-Product: Tools
X-Bugzilla-Component: Infra
X-Mailer: peebz 0.1
Date: Tue,  5 Mar 2024 21:35:19 +0000 (UTC)

Hello:

This conversation is now tracked by Kernel.org Bugzilla:
https://bugzilla.kernel.org/show_bug.cgi?id=218563

There is no need to do anything else, just keep talking.
-- 
Deet-doot-dot, I am a bot.
Kernel.org Bugzilla (peebz 0.1)

