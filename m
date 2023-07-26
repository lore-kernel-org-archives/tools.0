Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E8901BEE1
	for <tools@linux.kernel.org>; Wed, 26 Jul 2023 20:37:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id E6770C433C8;
	Wed, 26 Jul 2023 20:37:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1690403838;
	bh=1Zvsg5WiIhzwSvoTp7OZhCN+YGjHyWkT+8i2yqzl9yU=;
	h=From:To:In-Reply-To:References:Subject:Date:From;
	b=HmxeQvicjX+hkZGJ7bRQivN4lp7O26d8MEzmQzcD1nFxGHvCEfsilrFmtvhSWIaug
	 lEo+qUtQ+ZabTovSYoRHVVWTYQeFTLdGm3iDO0WguvLmbCcQj7nQ0IIj5uW3OwYIKE
	 Cbl77ULgUMpSTpwg4L6BHNUdASOLae/zPfvT2fvBNB56MSoP/jL3UXD1EX/3EOrp0p
	 lMZGb60U2DY3jERZ6r9dIZY6DZqzs913MAuPvDKVHvvxTyO3H27Vtf7jt2EtiT3WpO
	 2APTaMbDzkdTtuv63Xdsg5x1I9PXN7WLWWf8ueYfnzVsXcWbiZTCRUL2wp+3DWWySl
	 aWtSqB96jab9A==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id CDFCAC3959F;
	Wed, 26 Jul 2023 20:37:18 +0000 (UTC)
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
From: "Kernel.org Bugbot" <bugbot@kernel.org>
To: konstantin@linuxfoundation.org, duje.mihanovic@skole.hr, 
 tools@linux.kernel.org
Message-ID: <20230726-b217713c3-e930f8fe4a49@bugzilla.kernel.org>
In-Reply-To: <1940519.PYKUYFuaPT@radijator>
References: <1940519.PYKUYFuaPT@radijator>
Subject: Re: Encoding issues with --auto-to-cc
X-Bugzilla-Product: Tools
X-Bugzilla-Component: Infra
X-Mailer: peebz 0.1
Date: Wed, 26 Jul 2023 20:37:18 +0000 (UTC)

Konstantin Ryabitsev writes in commit 034f2fb2ac27c89c1c7ab2af04d26ba63be9ea6c:

ez: ignore invalid unicode returned by get_maintainer

There's a bug in get_maintainer.pl that returns invalid unicode in
certain situations (see bug linked below). We can't fix this in b4, but
at least we can avoid crashing when we encounter this problem.

Reported-by: Duje Mihanović <duje.mihanovic@skole.hr>
Link: https://msgid.link/1940519.PYKUYFuaPT@radijator
Closes: https://bugzilla.kernel.org/show_bug.cgi?id=217713
Signed-off-by: Konstantin Ryabitsev <konstantin@linuxfoundation.org>

(via https://git.kernel.org/pub/scm/utils/b4/b4.git/commit/?id=034f2fb2ac27)
-- 
Deet-doot-dot, I am a bot.
Kernel.org Bugzilla (peebz 0.1)

