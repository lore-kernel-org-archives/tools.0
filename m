Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8AE133E9
	for <tools@linux.kernel.org>; Tue,  2 May 2023 17:18:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 7C9FBC4339B;
	Tue,  2 May 2023 17:18:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1683047917;
	bh=AQYE0YPWxjvVWXUHkkYKxg3aH8dHJJr/V7wmvRc9/xk=;
	h=From:To:In-Reply-To:References:Subject:Date:From;
	b=ZdvQRW6qfgql9NmnEq/uve01YnUA1NU2up408HHS0r2R1oXukHmAc/0cQlxEMm/es
	 LXHM2Sb8QBBo5UV6rpAQwiJzkKSPavKYl654R9piOtswtMlu7XNN8ragFRJjlz5959
	 eSfY9SVyIJHa8+Dr0NrVn6F57eWUFz54vbOQSxVjB+DY11EDzogf4D/B2fec+4bt/Y
	 E7dmprZ2VeO+pdNhSasW3FjJ48xwp5R2RkQ3JDOzVTIZSiO7xTR6Dbe+A0VxZ3/EhW
	 EoiWr2R39KFOteXxSNz0ToIFlpzHrrP6Qifx8fHlxoRCiMwl2kfLiKB1BGTl3iA3Hj
	 cnuV2BsR0Awlg==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 5E7CAE5FFC9;
	Tue,  2 May 2023 17:18:37 +0000 (UTC)
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
From: "Kernel.org Bugbot" <bugbot@kernel.org>
To: andrew.cooper3@citrix.com, tools@linux.kernel.org
Message-ID: <20230502-b217393-514b2fd9abd0@bugzilla.kernel.org>
In-Reply-To: <4e4757cf-7351-9aff-fada-2b03ff82b2dc@citrix.com>
References: <4e4757cf-7351-9aff-fada-2b03ff82b2dc@citrix.com>
Subject: Re: b4 shazam in a subdir
X-Bugzilla-Product: Tools
X-Bugzilla-Component: Infra
X-Mailer: peebz 0.1
Date: Tue,  2 May 2023 17:18:37 +0000 (UTC)

Hello:

This conversation is now tracked by Kernel.org Bugzilla:
https://bugzilla.kernel.org/show_bug.cgi?id=217393

There is no need to do anything else, just keep talking.
-- 
Deet-doot-dot, I am a bot.
Kernel.org Bugzilla (peebz 0.1)

