Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F990381A7
	for <tools@linux.kernel.org>; Mon, 16 Oct 2023 20:35:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jwO+RjKl"
Received: by smtp.kernel.org (Postfix) with ESMTPS id C34BBC433C8;
	Mon, 16 Oct 2023 20:35:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1697488522;
	bh=OGB7AVsMv///VaQn24YpxPwZI7RdD7huvGUwqfqAkpk=;
	h=From:To:In-Reply-To:References:Subject:Date:From;
	b=jwO+RjKl0/EXLvu1D4x7SxCgI82nJ/mpi61SWioRT5sYR/HqdOWb/Rb0Rx5ZVdm5G
	 zaF/X6cLVGd9IKpk6rN30WE57LBb10te6rj7IJVqvwFqajtcN9Ol/BLYjPzZDioM2F
	 GKJpYmTlNiFyLV+w3lQtRN4wrnGc0xNa+VSG8nxoUDao5mjhBGJDTDVJ8dETdi4n11
	 o9mMiDA/gegy8OyRuPk5mSlMGOHHRImpVzBu5C2RM/gMObcYdfiO+o4aD4y5+s7hum
	 pmIfyYIa8Ect+B+GlpufvKEsp4nPv8vAkd5wo7llrSvQCHHsRhO89OMQ/kQOZ2YhhD
	 IKJoRkV9Dp2TA==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id A1A8CC41671;
	Mon, 16 Oct 2023 20:35:22 +0000 (UTC)
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
From: "Kernel.org Bugbot" <bugbot@kernel.org>
To: willy@infradead.org, konstantin@linuxfoundation.org, 
 tools@linux.kernel.org
Message-ID: <20231016-b218017c2-ccc058da10b3@bugzilla.kernel.org>
In-Reply-To: <ZS2RA6G07+/eYu8C@casper.infradead.org>
References: <ZS2RA6G07+/eYu8C@casper.infradead.org>
Subject: Re: "b4 am" quotes parens in S-o-b lines
X-Bugzilla-Product: Tools
X-Bugzilla-Component: Infra
X-Mailer: peebz 0.1
Date: Mon, 16 Oct 2023 20:35:22 +0000 (UTC)

Konstantin Ryabitsev writes in commit 26615095533f901d9cbf9eb599f4dc5e305f5036:

trailers: do not quote names when special chars are present

When fixing potential email address rendering problems, we do not need
to be as stringent about the contents of the git trailer as when we are
dealing with actual email headers. For example, we do not need to quote
names containing things like commas or parentheses.

Reported-by: Matthew Wilcox <willy@infradead.org>
Fixes: 832010c4d50 ("trailers: normalize address after parsing")
Closes: https://bugzilla.kernel.org/show_bug.cgi?id=218017
Signed-off-by: Konstantin Ryabitsev <konstantin@linuxfoundation.org>

(via https://git.kernel.org/pub/scm/utils/b4/b4.git/commit/?id=26615095533f)
-- 
Deet-doot-dot, I am a bot.
Kernel.org Bugzilla (peebz 0.1)

