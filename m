Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14B6513AC6
	for <tools@linux.kernel.org>; Fri, 16 Jun 2023 16:55:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 6C911C433C0;
	Fri, 16 Jun 2023 16:55:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1686934511;
	bh=Awoubq63QXq4ghWaiFjpjJoXIpwrM9SXAI22RoK8N1s=;
	h=From:To:In-Reply-To:References:Subject:Date:From;
	b=UM/HVRAU6URMzEOYQH7o8i7mVEWBktq1OKxv0oYwaT1yXhQ/OA+VlcBz8Vt/1UC62
	 WLUM6G97srJPtCnJ0GUKl3EhhHTvp/kx1DqiSKxUpAz7OGEkcN5m5RSa05ILRKPgoG
	 xaTv/AVqjCd2y2hgEXeWE9COA2OMFVe55fx9SWQgqYvr0AY62qI7/BZvry3JasEHI9
	 ee3cO2M6AL8puPrhAxDYz8HKd1MzvjwhaawWeAQrXmd/DWnBu6M5tsdRfSWh26Fgq+
	 jFMsgjFdIMrNwfdHDiGkst4lVysDPEin0KpDT0eQW2dkPyOPHBO0dTX1aSuVnIZiDb
	 a/hJUdm2th83w==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 51A6EC395E0;
	Fri, 16 Jun 2023 16:55:11 +0000 (UTC)
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
From: "Kernel.org Bugbot" <bugbot@kernel.org>
To: tools@linux.kernel.org, erik.schilling@linaro.org
Message-ID: <20230616-b217563-bc99b4c0fe17@bugzilla.kernel.org>
In-Reply-To: <CTDYR84I395O.2UI69IKNO7B8A@fedora>
References: <CTDYR84I395O.2UI69IKNO7B8A@fedora>
Subject: Re: encoding issues with single-patch series
X-Bugzilla-Product: Tools
X-Bugzilla-Component: Infra
X-Mailer: peebz 0.1
Date: Fri, 16 Jun 2023 16:55:11 +0000 (UTC)

Hello:

This conversation is now tracked by Kernel.org Bugzilla:
https://bugzilla.kernel.org/show_bug.cgi?id=217563

There is no need to do anything else, just keep talking.
-- 
Deet-doot-dot, I am a bot.
Kernel.org Bugzilla (peebz 0.1)

