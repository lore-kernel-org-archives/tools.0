Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B9CCC941
	for <tools@linux.kernel.org>; Wed, 19 Apr 2023 18:15:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 6EACDC433EF;
	Wed, 19 Apr 2023 18:15:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1681928113;
	bh=+Q4hjlHZ1hO1QXXCPPrUs46oiU8rmqbsmIt/YDgs14U=;
	h=From:To:In-Reply-To:References:Subject:Date:From;
	b=e/qZYubc+xoJRwigtwJJ0F0BkmZCX4jgFUIDtfCS+MjWiPGvDSCZVJkjf2Vu8vPJ1
	 reUZiJBWBoUIoR3SFXdIeTeFhlWKr3b5ol6GZvvMuH4yXzVWMQ3pY2lDVV+35s/pah
	 IFgTDE4albU8km31QeLX8cQXhUjik2/pweSnTHBqgTneditzJd6ERZ3liWIqnKS1iW
	 YAOoN5sUPdF3Ze1Yupu1QLb31QkleuOUmr/w9rY7V0h3gIEUdTw2QPY/jKMgtIv5J/
	 gFN5IySFzKM9NYpB1o1tPZOB7kyBwMgK9GuVLxiKSAWKH+7lgzyoIywQpSU0mrwz6A
	 utf8f1FogQtsw==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 59893E3309C;
	Wed, 19 Apr 2023 18:15:13 +0000 (UTC)
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
From: "Kernel.org Bugbot" <bugbot@kernel.org>
To: konstantin@linuxfoundation.org, icon@mricon.com, mjg59@srcf.ucam.org, 
 ndesaulniers@google.com, tools@linux.kernel.org
Message-ID: <20230419-b217332c4-e0f4d3925df0@bugzilla.kernel.org>
In-Reply-To: <CAKwvOdn6_J+9BppRbXEtDc8CW-qqoat7VJ521oWnqXCXHb_d6A@mail.gmail.com>
References: <CAKwvOdn6_J+9BppRbXEtDc8CW-qqoat7VJ521oWnqXCXHb_d6A@mail.gmail.com>
Subject: Re: b4: executable sendemail.smtpserver and b4 --reflect
X-Bugzilla-Product: Tools
X-Bugzilla-Component: Infra
X-Mailer: peebz 0.1
Date: Wed, 19 Apr 2023 18:15:13 +0000 (UTC)

Konstantin Ryabitsev writes in commit eff3eca47b798a501d079f7d25165d0415551edc:

ez: do not trust local commands to properly reflect

As we just discovered, Google's sendgmr is not properly compatible with
sendmail flags, and will ignore addresses passed via the CLI, instead
always using the ones from the headers.

This is opposite to what --reflect is designed to do, so bail out with a
loud error, but give a way to override it via a custom variable.

Reported-by: Nick Desaulniers <ndesaulniers@google.com>
Link: https://bugzilla.kernel.org/show_bug.cgi?id=217332
Signed-off-by: Konstantin Ryabitsev <konstantin@linuxfoundation.org>

(via https://git.kernel.org/pub/scm/utils/b4/b4.git/commit/?id=eff3eca47b79)
-- 
Deet-doot-dot, I am a bot.
Kernel.org Bugzilla (peebz 0.1)

