Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D88A428F3
	for <tools@linux.kernel.org>; Mon,  1 May 2023 15:42:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 846B4C433EF;
	Mon,  1 May 2023 15:42:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1682955737;
	bh=wplEUDhDrOIcm15BplR4m8AUSBAnG42NLrfvREEki6o=;
	h=From:To:In-Reply-To:References:Subject:Date:From;
	b=B0HezHYz33O+L5fbejl2C0q08Q566RXXWrg2caCPqg6kA4ERdqzMYsA7WBek3AOG5
	 VuyBgicZZQPLRVFZpcYKUDfJtN/wkGsG/XNnIXyVwZ2ZUNRn3bF0tBww0GloXTmgmv
	 B+c5LLfcpdwWyoqZl9HSYpXCkwu5Mwbyg74DtD/npgZy6EkXj5MCwfpmn77Kx/SH6l
	 WhjKi9xR3LTN/WjSgIC8IRneVe10mHKCmr5trTcfQxb2U1Kt+Bd7kq3k6k0aPNkNof
	 G/445F+a/Ih8nNVdYE3CWMpQZ1nFPHDG1TvpJpPKzUAo7trWl+E4Xv/l9TQ3y91Qp8
	 ayni3PamdykfQ==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 5DD0FC395C8;
	Mon,  1 May 2023 15:42:17 +0000 (UTC)
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
 broonie@kernel.org
Message-ID: <20230501-b217388-ec417f2f2f86@bugzilla.kernel.org>
In-Reply-To: <ZEwRJqjvbZGqpZpg@sirena.org.uk>
References: <ZEwRJqjvbZGqpZpg@sirena.org.uk>
Subject: Re: Unhelpful cover letter default for single patch serieses
X-Bugzilla-Product: Tools
X-Bugzilla-Component: Infra
X-Mailer: peebz 0.1
Date: Mon,  1 May 2023 15:42:17 +0000 (UTC)

Hello:

This conversation is now tracked by Kernel.org Bugzilla:
https://bugzilla.kernel.org/show_bug.cgi?id=217388

There is no need to do anything else, just keep talking.
-- 
Deet-doot-dot, I am a bot.
Kernel.org Bugzilla (peebz 0.1)

