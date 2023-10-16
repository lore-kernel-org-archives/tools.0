Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A54E347DD
	for <tools@linux.kernel.org>; Mon, 16 Oct 2023 19:45:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="n/B1Frpb"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 7927AC433C8;
	Mon, 16 Oct 2023 19:45:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1697485518;
	bh=V8BgR6h1oRP+K8xL1OM3zgJsZfuz0xtLYbf5lv/Pp2c=;
	h=From:To:In-Reply-To:References:Subject:Date:From;
	b=n/B1FrpbSGmos/R1tkuJ64Y+xYSSkoXkiNPkn+e71Kaq9R+D5HKicCz5k+9aLwJRE
	 2PSnib9aIlCPncqAZ8IUFXleW5i4SqqiiM8raBBhTuyRIaMWkilAKwlJvPXUO5Hr6P
	 ovW/Bc+SM+9A6vKqoinsD93brHXGeW8GQdlNBm4diOqrw6CDbLeN+f01kgA+IM9/gM
	 1Eg3tvQVQzjsX9QlgdaGG6gVLC0ltHugzWeOgEXRsTyjMoBdiScVoeSo3bSrl3ZJ3u
	 S2l0941vKcXYA/33mE2VmUaeJjAGqGrwmcasfvP319ShWVF8Mfnkg2ku8RhhUf3Sby
	 gxs1EoBMoRUUw==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 57ECDE4E9B6;
	Mon, 16 Oct 2023 19:45:18 +0000 (UTC)
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
From: "Kernel.org Bugbot" <bugbot@kernel.org>
To: willy@infradead.org, tools@linux.kernel.org
Message-ID: <20231016-b218017-f98ed55ef9d9@bugzilla.kernel.org>
In-Reply-To: <ZS2RA6G07+/eYu8C@casper.infradead.org>
References: <ZS2RA6G07+/eYu8C@casper.infradead.org>
Subject: Re: "b4 am" quotes parens in S-o-b lines
X-Bugzilla-Product: Tools
X-Bugzilla-Component: Infra
X-Mailer: peebz 0.1
Date: Mon, 16 Oct 2023 19:45:18 +0000 (UTC)

Hello:

This conversation is now tracked by Kernel.org Bugzilla:
https://bugzilla.kernel.org/show_bug.cgi?id=218017

There is no need to do anything else, just keep talking.
-- 
Deet-doot-dot, I am a bot.
Kernel.org Bugzilla (peebz 0.1)

