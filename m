Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 712B53EA88
	for <tools@linux.kernel.org>; Mon,  4 Mar 2024 13:42:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709559767; cv=none; b=RV8yx0F4fpYUBXomwPEm5mLjZXFUju1gvY5GtifcmWJnen1E+yxYioEYy2rAjxKU5UKOrltt+gb+cu90c6YiahrtRtynrQywO7R0pZjOzTaMTym9kl5AmEHI6rDLQveMw8063RIQlmXGCWxB4S6wS1MN+SGYj9fAypy9BXW+FYM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709559767; c=relaxed/simple;
	bh=b9RJ2jCDU87BSWB4ZGUg6uZ4bnFHpvcTF6AmdeWcdVg=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=izsdPYAQl60oKzp+63yqsB7v0YXlMDys9R5acT0yrmpHUkvIO1pnxMX0B2SSN0FOyL3fGTT7qsqlDG0VQsQQ1BNGJfN3sFXaSaQ4W2M+fb8hOYNYrVBWwNYvakGNiJVvKflb8GlUxEJGsVv6nO6dbdNTorHRwC32JscKmaahdy8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CVQ8ACVv; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CVQ8ACVv"
Received: by smtp.kernel.org (Postfix)
	id 1033FC43399; Mon,  4 Mar 2024 13:42:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C7E1AC433F1;
	Mon,  4 Mar 2024 13:42:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1709559767;
	bh=b9RJ2jCDU87BSWB4ZGUg6uZ4bnFHpvcTF6AmdeWcdVg=;
	h=From:To:Cc:Subject:Date:From;
	b=CVQ8ACVvcC6M0rsJ1b1Fncvz1pSpggkjY2OJEjAV9Ehmp77PUkMdNzPSHOsPJlwFD
	 pmaUKIRT5+BWeCKcG2LdNIeIavVZFUgT86tx4oLxwJhnJE0L/IOcji7EZg6B/UONnD
	 AoMd6UlghDybDhejor08UdiWF5pvzL0NVTTajDiLsYrTii+tGjR5NqDXQ3PNN8YgRc
	 xF682aEBYlsu99mAy41tMooZpJLOP3jSGKf7aKK2lCAaRmhfYVdW8pmGlVXuYQwShu
	 j6R0wcvmthLmEJ8zV8aNpJoWmB3Mbmdvw8Au5XQ8SmqS831GlOKmLi8+HY4VOMIEHS
	 gDLZo0u8/V0TA==
From: Will Deacon <will@kernel.org>
To: tools@kernel.org
Cc: Will Deacon <will@kernel.org>,
	Konstantin Ryabitsev <konstantin@linuxfoundation.org>,
	Jason Gunthorpe <jgg@nvidia.com>,
	Nicolin Chen <nicolinc@nvidia.com>
Subject: [PATCH v2 0/2] b4: ty: Fix incorrect patch/commit association
Date: Mon,  4 Mar 2024 13:42:39 +0000
Message-Id: <20240304134241.20447-1-will@kernel.org>
X-Mailer: git-send-email 2.20.1
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi folks,

It's me again. This time I fixed my git configuration so that the
authorship is correct and matches the S-o-B line. That's the only change
since the v1 I sent on Friday.

Enjoy!

Will

Cc: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc: Jason Gunthorpe <jgg@nvidia.com>
Cc: Nicolin Chen <nicolinc@nvidia.com>

--->8

Will Deacon (2):
  ty: Try subject matching for every commit before using trackers
  ty: Remove unused 'matches' variable

 src/b4/ty.py | 12 +++++++-----
 1 file changed, 7 insertions(+), 5 deletions(-)

-- 
2.44.0.rc1.240.g4c46232300-goog

