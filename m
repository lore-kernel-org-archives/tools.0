Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7C391802C8
	for <tools@linux.kernel.org>; Wed, 10 Apr 2024 19:20:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712776825; cv=none; b=aaDZmGJG74QCoWHkA+o8NUy7Iox5cmEXU0qqIKR7oOjCLl35Pr+VHnLYVyBDvZatbxRmVyYTTHO/k3sATcbet10yYutK3hpA/CPYDpaiP0iZu9SDb45HPc3M6iaob3BcZcH8Qx1HmjfXI/COhB8nPG8PjmJqtxhu9R6t2OPAA0g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712776825; c=relaxed/simple;
	bh=MZ3ABlT+PcsoCT1k5lr+NnSNRSoMhsKDu6yWjLEPis4=;
	h=MIME-Version:Content-Type:From:To:Message-ID:In-Reply-To:
	 References:Subject:Date; b=g86/L/prUcUsYr9/dNAmlEe89jFNT+oM012I56TtUZDNmMUhf2yGsjX1wifcDUCBHRYsu3AApC2QAsTLuQqPQAdpHVZxZNdA9hw4rxSQzyAzxAGrtO8+0PodIHgAIu1RFAWCHd/whLXOms1++vsBLWf35SJf5tFYtidCobgJB/A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BiVM1AWS; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BiVM1AWS"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 7F7B4C433F1;
	Wed, 10 Apr 2024 19:20:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1712776824;
	bh=MZ3ABlT+PcsoCT1k5lr+NnSNRSoMhsKDu6yWjLEPis4=;
	h=From:To:In-Reply-To:References:Subject:Date:From;
	b=BiVM1AWSSAHxUY3WPG9d3X0ZALK5C9qSuZDia74s1haKgxpfl1wj3LKGPIYRBiTqP
	 VQgUlPtwk3hBC/JQ/2b7NfpbjgbY2oid8Ggp6hWcSlf3MMlBGWn3tAtw39HpSdvHCm
	 3lfTbfcERjBBWas5wXABoevyukT+tfgtYeAIqSB8k9zFINTA/euJBIdCm7zXX9hfaU
	 iUmpt7DRSv2XSmoCJJxktINfrAA6FXIShdzuTALE/BT5GPXq1Id0HUCwIQ/ttfASeI
	 aOKGPeD3IkujSuf6UpN3jnTaqEyseaKiriU1v2OvTXlnNuFYIEH2nvFmLRPg39t9cf
	 ymh20wLOFxSlg==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 671FCD6030E;
	Wed, 10 Apr 2024 19:20:24 +0000 (UTC)
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
From: "Kernel.org Bugbot" <bugbot@kernel.org>
To: konstantin@linuxfoundation.org, tools@linux.kernel.org, 
 broonie@kernel.org
Message-ID: <20240410-b218706-4b7ce5322f27@bugzilla.kernel.org>
In-Reply-To: <c9a9347a-b795-4824-8edb-9fba31cdfc5d@sirena.org.uk>
References: <c9a9347a-b795-4824-8edb-9fba31cdfc5d@sirena.org.uk>
Subject: Re: b4 needs-editing check vs single patch serieses
X-Bugzilla-Product: Tools
X-Bugzilla-Component: Infra
X-Mailer: peebz 0.1
Date: Wed, 10 Apr 2024 19:20:24 +0000 (UTC)

Hello:

This conversation is now tracked by Kernel.org Bugzilla:
https://bugzilla.kernel.org/show_bug.cgi?id=218706

There is no need to do anything else, just keep talking.
-- 
Deet-doot-dot, I am a bot.
Kernel.org Bugzilla (peebz 0.1)

