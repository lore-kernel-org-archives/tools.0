Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE50EFBF9
	for <tools@linux.kernel.org>; Mon, 15 May 2023 21:44:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 792E2C433EF;
	Mon, 15 May 2023 21:44:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1684187078;
	bh=d0U0zkK/vLBTpsVwoS1sgxsvFZU9rJpvKCPzfFXQiAo=;
	h=Date:From:To:In-Reply-To:References:Subject:From;
	b=S12YO5RcgRPg1FAWV+H9tbiHPrsocWui5jdT1fnkLsvO+qd3ANA8JjPfMjbKVrUbP
	 nm195uKoKRhOnPqC4MjvTcR2CtB/w6bkwjJCbAqm3HtqvxFG9O4IXKR+VNEZXLFtIM
	 b09ORMjDlxTLNA9zRdFF9S+OIzRNJCgPXldqAnsMw49W5p8F2tZvij7quW4HmiT3pf
	 OoXZhESdCQySy2gzSPEhqxLBNwZDGBgQiGJGf6bRbamFMPzdCRGmQCqNRJd68omgrY
	 v9GT83A1zB4Uk58mO+9SEoXvk0QFzr8EBzS3BQxEUPh1yYByi07TrgP3rJbCLr5QXA
	 K4115Nw54/aow==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 5DB2BE5421B;
	Mon, 15 May 2023 21:44:38 +0000 (UTC)
Date: Mon, 15 May 2023 21:44:44 +0000
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
From: "Kernel.org Bugbot" <bugbot@kernel.org>
To: konstantin@linuxfoundation.org, icon@mricon.com, 
 ndesaulniers@google.com, mjg59@srcf.ucam.org, tools@linux.kernel.org
Message-ID: <20230515-b217332c9-1b90c6e4656b@bugzilla.kernel.org>
In-Reply-To: <CAKwvOdn6_J+9BppRbXEtDc8CW-qqoat7VJ521oWnqXCXHb_d6A@mail.gmail.com>
References: <CAKwvOdn6_J+9BppRbXEtDc8CW-qqoat7VJ521oWnqXCXHb_d6A@mail.gmail.com>
Subject: Re: b4: executable sendemail.smtpserver and b4 --reflect
X-Bugzilla-Product: Tools
X-Bugzilla-Component: Infra
X-Mailer: peebz 0.1

ndesaulniers writes via Kernel.org Bugzilla:

I spoke with the maintainer of our internal `sendgmr` tool; they recommended that the `-t` flag be used.

https://man7.org/linux/man-pages/man8/sendmail.8.html

Can `b4 send` add `-t`?

View: https://bugzilla.kernel.org/show_bug.cgi?id=217332#c9
You can reply to this message to join the discussion.
-- 
Deet-doot-dot, I am a bot.
Kernel.org Bugzilla (peebz 0.1)

