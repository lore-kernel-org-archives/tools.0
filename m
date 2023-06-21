Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F504F9D6
	for <tools@linux.kernel.org>; Wed, 21 Jun 2023 20:42:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id AB40BC433C0;
	Wed, 21 Jun 2023 20:42:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1687380126;
	bh=T1RJv4Vq1z2uPv/eoEFhHwX5eg9AyLUW39+C+J6jkMU=;
	h=From:To:In-Reply-To:References:Subject:Date:From;
	b=juTNFtv68RnUN07t0FcEpvbwswdtO/8RVnW7EkRzwNhT4gN2dFR1XDWnjN1UKBdDa
	 E811SO+trKfySbomQkVD+WrowP1BlWD37Mw+Mj5GCIyhj5IZgx3uXMXGF3I9K9U4Sf
	 z5XS/VKJ4btV1IifDCnT9rCb6e2bZ2blvyXRpm1Z5jljukmrceV522dC1ZRjQnmKzG
	 rfBLSSkb8+jpZib1yAmCn3fkH+VIErkotTv7KwTKiLOyIp0Yhby5rFM0YrPGoGngkm
	 Eq4W+VtpoaDTCKFeuwnUUJVscVz82qzqNiOs2cJsn7imy/eUiTUZ3NNuzYI8hihFF7
	 uoVnD4eV8PjAw==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 8C176C395C7;
	Wed, 21 Jun 2023 20:42:06 +0000 (UTC)
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
From: "Kernel.org Bugbot" <bugbot@kernel.org>
To: broonie@kernel.org, tools@linux.kernel.org, 
 konstantin@linuxfoundation.org
Message-ID: <20230621-b217388c2-f62ec33c18b9@bugzilla.kernel.org>
In-Reply-To: <ZEwRJqjvbZGqpZpg@sirena.org.uk>
References: <ZEwRJqjvbZGqpZpg@sirena.org.uk>
Subject: Re: Unhelpful cover letter default for single patch serieses
X-Bugzilla-Product: Tools
X-Bugzilla-Component: Infra
X-Mailer: peebz 0.1
Date: Wed, 21 Jun 2023 20:42:06 +0000 (UTC)

Konstantin Ryabitsev writes in commit cb93cd00e391622db4a49753f8944ce2b29c5d9d:

ez: make it easier to send single-patch series

Do not force developers to edit the cover letter when information from
it is not going to be included into the single-patch message anyway.

Suggested-by: Mark Brown <broonie@kernel.org>
Closes: https://bugzilla.kernel.org/show_bug.cgi?id=217388
Signed-off-by: Konstantin Ryabitsev <konstantin@linuxfoundation.org>

(via https://git.kernel.org/pub/scm/utils/b4/b4.git/commit/?id=cb93cd00e391)
-- 
Deet-doot-dot, I am a bot.
Kernel.org Bugzilla (peebz 0.1)

