Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8AB41F182
	for <tools@linux.kernel.org>; Thu, 22 Jun 2023 18:15:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 3C715C433C0;
	Thu, 22 Jun 2023 18:15:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1687457717;
	bh=6o9bWkrLZEmIfppayW3cRaMa5H28a8A9l/pr6AC8nWQ=;
	h=From:To:In-Reply-To:References:Subject:Date:From;
	b=bDWrTd6hEATeL5Epn+nMbUsAt8fAh0gzBkMV3AyvJIL0O8NE+Jczc4xSr1QABJ30M
	 K9wmzdmMi7hfw16egOja9oIK3yW705v4wBe6HFCUodIRozT+dneM7WmTsNH2BwyjMM
	 NwgTk32g5leuWPdI2jUe4bldpdCmp3iO1cl7EKCk8zquaKRCrlslTNoD051bgiyxPP
	 87e9zUU5/oB7MwaHyV2N4Pek5oRjnW+VArDO2FvNN78c/gF0KzQ0QYzdpUjmtHw6rf
	 tMsArERLqEYaJaddtqZS7RIxWtyXU/vFxSvB/K7oBGVnV/pR1EXnSrGuuededOQ4il
	 dk3yHwMOBtAMw==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 2231DC395F1;
	Thu, 22 Jun 2023 18:15:17 +0000 (UTC)
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
From: "Kernel.org Bugbot" <bugbot@kernel.org>
To: andrew.cooper3@citrix.com, tools@linux.kernel.org, 
 konstantin@linuxfoundation.org, jgrall@amazon.com
Message-ID: <20230622-b217430c2-4a4e47cb3410@bugzilla.kernel.org>
In-Reply-To: <a512454c-2bd6-fd20-dff0-5ec19c8f85a9@citrix.com>
References: <a512454c-2bd6-fd20-dff0-5ec19c8f85a9@citrix.com>
Subject: Re: b4 am/shazam tag accumulation with HTML-ish emails
X-Bugzilla-Product: Tools
X-Bugzilla-Component: Infra
X-Mailer: peebz 0.1
Date: Thu, 22 Jun 2023 18:15:17 +0000 (UTC)

Konstantin Ryabitsev writes in commit 832010c4d50bc73695865ec0771091a14f4b24fb:

trailers: normalize address after parsing

For person-trailers, normalize the address after we have parsed it,
which removes some of the common email-added junk (mailto:, extra <>,
etc).

Reported-by: Andrew Cooper <andrew.cooper3@citrix.com>
Closes: https://bugzilla.kernel.org/show_bug.cgi?id=217430
Signed-off-by: Konstantin Ryabitsev <konstantin@linuxfoundation.org>

(via https://git.kernel.org/pub/scm/utils/b4/b4.git/commit/?id=832010c4d50b)
-- 
Deet-doot-dot, I am a bot.
Kernel.org Bugzilla (peebz 0.1)

