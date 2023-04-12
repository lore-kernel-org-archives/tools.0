Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C17AF746F;
	Wed, 12 Apr 2023 18:11:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 73A10C433EF;
	Wed, 12 Apr 2023 18:11:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1681323103;
	bh=Dpw8YPH002x7q6HLpSJ0hj7NGy06GgjL2sR4Zef/HXM=;
	h=From:To:In-Reply-To:References:Subject:Date:From;
	b=A9zf/V86A/+7OPA4P3uyxXfcCBkCxZZ7vNtIhcJ8oHmZDukkf9DTtFVwdrLcv+9YB
	 +Wyfw0pIx0pMr2TTVfPI6xlYTR5ujibHtEYDrLanVPxQKjGPEGdtg/9nqsQc7/pvKX
	 NYYJDyYtE+x1M4bKeETfcTutgdy4Ik84fBKj4gjVYDmRpbsbEj2cgOUl3sgzdnxI62
	 Wa8AMY1iq/oR8BDcFu2Bkn0x6BLOdHxmyPwZtIh+XzcvzA5ByQByaNy8/bYq7h5DMJ
	 a1c66bWH8mSFk3I5i3PJ5s6stK/7OyG/8LHp9tSNmFUE7vHDyDr2C35gYiGfWkfoA6
	 vnN4Qh5RMUTGg==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 451F7E5244E;
	Wed, 12 Apr 2023 18:11:43 +0000 (UTC)
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
 broonie@kernel.org, bugs@lists.linux.dev
Message-ID: <20230412-b217331-6607aea3135b@bugzilla.kernel.org>
In-Reply-To: <ZDbo/qTKFgBQdWh4@sirena.org.uk>
References: <ZDbo/qTKFgBQdWh4@sirena.org.uk>
Subject: Re: b4 trailers --update splats on new branch
X-Bugzilla-Product: Linux
X-Bugzilla-Component: Kernel
X-Mailer: peebz 0.1
Date: Wed, 12 Apr 2023 18:11:43 +0000 (UTC)

Hello:

This conversation is now tracked by Kernel.org Bugzilla:
https://bugzilla.kernel.org/show_bug.cgi?id=217331

There is no need to do anything else, just keep talking.
-- 
Deet-doot-dot, I am a bot.
Kernel.org Bugzilla (peebz 0.1)

