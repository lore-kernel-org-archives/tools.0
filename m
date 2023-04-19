Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 052A9C941
	for <tools@linux.kernel.org>; Wed, 19 Apr 2023 17:38:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 97861C433EF;
	Wed, 19 Apr 2023 17:38:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1681925889;
	bh=WOkkRWw8jqphjDc6Cq2mTFnf8tyzqkvaEAAeZJgDJZ8=;
	h=From:To:In-Reply-To:References:Subject:Date:From;
	b=GhPKRgX2ik1EFT1uWYz3bziyVW+7T+/+J8m5JJcwEmRoLn989Cyx7yGuyY6uIrRm4
	 pEK6X1cwuvoNxs8DJZcbL+6yA2/qNBmpZCXaxCRRN/JcBElDAOoaVKwhVPtuSpn4Mn
	 zo99oivQtxO3FjRLQw4wnYtbkEd3GF6xDw+9kiDta/wFpEyMXwNFS6HuiYRVZf87v/
	 n61JU/PE5vPpuWG9saRawv/bmLWCvuG1gs6ksqqx4ponl5JP6xuPkzTS5VU1FWhZIc
	 AoLren7JLYFulOXK/2dbCrOlwX9uFRHdnK2q9gOcqEbyyCZjer6XECfi+FKErymC71
	 xdw7bBup8uhDA==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 72B99E3309C;
	Wed, 19 Apr 2023 17:38:09 +0000 (UTC)
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
From: "Kernel.org Bugbot" <bugbot@kernel.org>
To: broonie@kernel.org, konstantin@linuxfoundation.org, 
 tools@linux.kernel.org
Message-ID: <20230419-b217331c2-b18774441e89@bugzilla.kernel.org>
In-Reply-To: <ZDbo/qTKFgBQdWh4@sirena.org.uk>
References: <ZDbo/qTKFgBQdWh4@sirena.org.uk>
Subject: Re: b4 trailers --update splats on new branch
X-Bugzilla-Product: Tools
X-Bugzilla-Component: Infra
X-Mailer: peebz 0.1
Date: Wed, 19 Apr 2023 17:38:09 +0000 (UTC)

Konstantin Ryabitsev writes in commit 00e423af1a0968f2f90a4c3384c202ffee98bc08:

ez-trailers: don't crash when there are no follow-ups received

If there are no follow-up trailers to process, bail early as opposed to
crashing.

Reported-by: Mark Brown <broonie@kernel.org>
Closes: https://bugzilla.kernel.org/show_bug.cgi?id=217331
Signed-off-by: Konstantin Ryabitsev <konstantin@linuxfoundation.org>

(via https://git.kernel.org/pub/scm/utils/b4/b4.git/commit/?id=00e423af1a09)
-- 
Deet-doot-dot, I am a bot.
Kernel.org Bugzilla (peebz 0.1)

