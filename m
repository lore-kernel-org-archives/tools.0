Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67D6E15BD
	for <tools@linux.kernel.org>; Fri, 26 May 2023 17:46:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A3D21C433EF;
	Fri, 26 May 2023 17:46:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1685123190;
	bh=nnBew0fVkutALHDli+ngAgwWa3AbI0HR4jzCBiQbQKw=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=q0oTM7/GYgUfa/uEy5GNR9G5w5Iuy0WZ+T7p2LtVBNU5dn1jrZ1XlpvzFZdiT11y3
	 6kdIuIdZEGYUvq4sQVwlu9cYuZGwY8MuKDqZr9pOMWDgzzHyPuX4vzpgsJl2MVMRc4
	 gipj37m9Ga1n+6ZYijBb68FhMXX2BkC7mFJX2eIk=
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: "Kernel.org Tools" <tools@linux.kernel.org>, 
 Matthieu Baerts <matthieu.baerts@tessares.net>
Cc: Nick Desaulniers <ndesaulniers@google.com>, 
 Follow Upper <follow.upper@example.org>, 
 Cover Upper <cover.upper@example.org>, 
 Test Override <test-override@example.com>
In-Reply-To: <20230525-closes-tags-v1-0-ed41b1773cb6@tessares.net>
References: <20230525-closes-tags-v1-0-ed41b1773cb6@tessares.net>
Subject: Re: [PATCH b4 0/2] trailers: accept recognized link trailers +
 "Closes"
Message-Id: <168512318956.1381718.10679205841484797842.b4-ty@linuxfoundation.org>
Date: Fri, 26 May 2023 13:46:29 -0400
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13-dev-7b5b2


On Thu, 25 May 2023 22:10:35 +0200, Matthieu Baerts wrote:
> Nick reported in [1] that Closes tags were not picked up by b4 when
> updating trailers.
> 
> In fact, it looks like that even Link ones were not picked up. (Or at
> least it was not working when I was testing it :) ).
> 
> With this series, Link, BugLink and Closes tags are now automatically
> added when available in follow-up comments.
> 
> [...]

Applied, thanks!

[1/2] trailers: accept recognized link trailers
      commit: 0a6be433883dee544b991e218e0f505dba356a88
[2/2] trailers: add 'Closes' as recognized link trailer
      commit: d21bd9e7ff99736818af68b99d36a8e77889132d

Best regards,
-- 
Konstantin Ryabitsev <konstantin@linuxfoundation.org>

