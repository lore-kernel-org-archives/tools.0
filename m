Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D55713715;
	Fri, 14 Jul 2023 19:30:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id A7B70C433C8;
	Fri, 14 Jul 2023 19:30:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1689363015;
	bh=G+GgepLAC9G2L4+PqP4SnXj/MKlSlWRBOJk/54zFMnA=;
	h=From:To:In-Reply-To:References:Subject:Date:From;
	b=F14a6N6Vds5QQbWDcC8quCu+GfOW5H+xbDypj+qN0Z5BuB1VvIRhQa+vfLn+bw69J
	 EyZvaEvpzBPFBcVy+uz4wbLpazFhdwX1W/SPXKgNOwRmoVJigOZF5XlARiv5U8KUrf
	 T33W6+HxD7d815Y97HYAaD1QAOaVlVCxrp4WC1fmubzAte5fMtCTNl9ESbofNBWhIt
	 RquRY4YVVSPGWPcp/pWUjq97t3FmOZVO+SMQUyVH1baVimpQ6UIu5itycgE9SKiqtM
	 jMypVt34IonEBiJ+RTyvkfLRMx9HkI467mHo5AnIJfndBP7wXMueKaBRhkY61FLkze
	 vmhFRSLimJkzQ==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 7E426E1B4D6;
	Fri, 14 Jul 2023 19:30:15 +0000 (UTC)
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
From: "Kernel.org Bugbot" <bugbot@kernel.org>
To: lee@kernel.org, users@linux.kernel.org, tools@linux.kernel.org, 
 konstantin@linuxfoundation.org
Message-ID: <20230714-b217672-d0c17b244b92@bugzilla.kernel.org>
In-Reply-To: <CABVG=qdHsB5pa8rOKCV9s2WtXKZ-Qh1+8q=1VNcorM37P4r1EQ@mail.gmail.com>
References: <CABVG=qdHsB5pa8rOKCV9s2WtXKZ-Qh1+8q=1VNcorM37P4r1EQ@mail.gmail.com>
Subject: Re: b4: ty: Feature request - configuration option to send to
 'myemail'
X-Bugzilla-Product: Tools
X-Bugzilla-Component: Infra
X-Mailer: peebz 0.1
Date: Fri, 14 Jul 2023 19:30:15 +0000 (UTC)

Hello:

This conversation is now tracked by Kernel.org Bugzilla:
https://bugzilla.kernel.org/show_bug.cgi?id=217672

There is no need to do anything else, just keep talking.
-- 
Deet-doot-dot, I am a bot.
Kernel.org Bugzilla (peebz 0.1)

