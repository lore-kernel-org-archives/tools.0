Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08984200C6
	for <tools@linux.kernel.org>; Thu, 22 Jun 2023 20:21:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 652B9C433C8;
	Thu, 22 Jun 2023 20:21:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1687465262;
	bh=oHg6K5hRkIRaojrRvjel3IXWjv+Q1vLNKH6QQHgb8PI=;
	h=From:To:In-Reply-To:References:Subject:Date:From;
	b=EOFXS4B33PRlJSh6tgJYIOYExO3KXKisln6xokr+erkYxyM03XfmH9RSzRmJMP4A5
	 yWxt0P/EwzN869WM2q2h6LepwfvldHPjQOqBH030rg6kSRdZzs7vnubqflQ93rnQRw
	 unBOjRE7WDxIemFvepzFw1n/ULJot7iQ9GX4P7819PFMIhDrAv2Rxfd/DJkHJee7q1
	 LPuogZ7V/6pk9+87aqdd49C/IaFv1BvSagN/rkZ2018CxDgrzYb5//2EyOeZIKrZB8
	 7kHODY45qoPPMPqGF1gOtUsECuIPifRf3RZuYVcd6qvQvk5QVlW6MedelAz/kLs2R2
	 cFSeyClYeKMTQ==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 4B6BBC395F1;
	Thu, 22 Jun 2023 20:21:02 +0000 (UTC)
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
 andrew.cooper3@citrix.com
Message-ID: <20230622-b217393c2-04f4c2d35abe@bugzilla.kernel.org>
In-Reply-To: <4e4757cf-7351-9aff-fada-2b03ff82b2dc@citrix.com>
References: <4e4757cf-7351-9aff-fada-2b03ff82b2dc@citrix.com>
Subject: Re: b4 shazam in a subdir
X-Bugzilla-Product: Tools
X-Bugzilla-Component: Infra
X-Mailer: peebz 0.1
Date: Thu, 22 Jun 2023 20:21:02 +0000 (UTC)

Konstantin Ryabitsev writes in commit 73291165599839de9a2dcf4986c35a2041b22d09:

shazam: switch to top of git tree before running git-am

According to reports, running "git am" when not at the top of the tree
can result in the dirty tree state (see linked conversation). This
ensures that we switch back to the top of the git tree before running
"git am" and then switch back.

Reported-by: Andrew Cooper <andrew.cooper3@citrix.com>
Link: https://msgid.link/4e4757cf-7351-9aff-fada-2b03ff82b2dc@citrix.com
Closes: https://bugzilla.kernel.org/show_bug.cgi?id=217393
Signed-off-by: Konstantin Ryabitsev <konstantin@linuxfoundation.org>

(via https://git.kernel.org/pub/scm/utils/b4/b4.git/commit/?id=732911655998)
-- 
Deet-doot-dot, I am a bot.
Kernel.org Bugzilla (peebz 0.1)

