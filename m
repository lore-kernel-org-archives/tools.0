Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA29D28E3
	for <tools@linux.kernel.org>; Fri, 21 Apr 2023 18:58:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 6F584C433EF;
	Fri, 21 Apr 2023 18:58:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1682103485;
	bh=E3NZ0ZevcEKIkcxSj4f+uVmtF+W/lmkw/dnyAsCFcxU=;
	h=From:To:In-Reply-To:References:Subject:Date:From;
	b=VN2GiaHHIK/6CQMhwK3GLc8JZdSHd96w8y3ZO5/z7FrSiAcZfjCsXPtCqbOlGqfLB
	 dtkPupiGEE2dYiM7Df/qnjT7tk4ou9iPTFU9u7T1hYUdB0+04v3nUEMdQ+fSPA/7nS
	 z5LihmCECAmFzwo/xkVIgWoK8wu3NIGW+QU+nId60c2XmuumxIR/kXd/WzVtl6V9RB
	 UhphHFdNm4PmPTXZ7mKf/uCHDgMwO63NAHqHjCbR5Jb7PsK8ZGYI6vafHO0qPNmbaa
	 upg7entIHo0g+pw4WvqmsJS+DF29OfmZAZqoNqRUN7SpNpRLJrCLwFHVc0ob+EipqY
	 cA2QDbMbTpOYA==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 437D1E270DA;
	Fri, 21 Apr 2023 18:58:05 +0000 (UTC)
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
From: "Kernel.org Bugbot" <bugbot@kernel.org>
To: brauner@kernel.org, tools@linux.kernel.org, 
 konstantin@linuxfoundation.org
Message-ID: <20230421-b217359-d734ce74b4d1@bugzilla.kernel.org>
In-Reply-To: <20230331-ranged-decrease-6027cce938ff@brauner>
References: <20230331-ranged-decrease-6027cce938ff@brauner>
Subject: Re: asdf
X-Bugzilla-Product: Tools
X-Bugzilla-Component: Infra
X-Mailer: peebz 0.1
Date: Fri, 21 Apr 2023 18:58:05 +0000 (UTC)

Hello:

This conversation is now tracked by Kernel.org Bugzilla:
https://bugzilla.kernel.org/show_bug.cgi?id=217359

There is no need to do anything else, just keep talking.
-- 
Deet-doot-dot, I am a bot.
Kernel.org Bugzilla (peebz 0.1)

