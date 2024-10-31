Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 085CB1A7AD0
	for <tools@linux.kernel.org>; Thu, 31 Oct 2024 19:15:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730402134; cv=none; b=YOI4+YDcT94OtVhafjobNo4N2rYyHqt6n3XcRx1iJtLlsEWiMf6DkuazqIJD8LJziEgRwyYk+c5fJ9F+RmBMQRIPUjDfGbkb0K/pLpgWPjrX+PcjdCN0jO8S88lP2fkStSSkHq1/NT1vGyY2ikxQInma7WzNlb+2J1sStI9jj1g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730402134; c=relaxed/simple;
	bh=08TKdc2w/UUEOpm3yfK62HpmbuasaoXTuXkzWIJbw/Q=;
	h=MIME-Version:Content-Type:From:To:Message-ID:In-Reply-To:
	 References:Subject:Date; b=N795QtLX78bqesPr2RO0SKFeJPBvEHhhsgkjSVJ8y2fVgkbarCNuraIaFHpvgTQu+u7C/EFdP2VVHWg5u+dQKBHS7QZAz4w5/oJAjStj2jO5xaLg25xwImrNz3K++P/ciYjmfnnFG58ORNcB4tE758xz+sexp4wChH+mTnDZL4E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RSBYBdxm; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RSBYBdxm"
Received: by smtp.kernel.org (Postfix)
	id C00A8C4CED1; Thu, 31 Oct 2024 19:15:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9EED8C4CEC3;
	Thu, 31 Oct 2024 19:15:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730402133;
	bh=08TKdc2w/UUEOpm3yfK62HpmbuasaoXTuXkzWIJbw/Q=;
	h=From:To:In-Reply-To:References:Subject:Date:From;
	b=RSBYBdxmq/jo/EeKT3LEvccPEPpc8rKzbtlo/VmZGStpU18eWnCeuY0PXHL3TAYsy
	 tebfzVyz8wTSJUseDvA40KrgjprIau0yg7lMyX6Y387FjRyUxCWECJ4y4ZXCqmme9w
	 brovbuFdmDMxpVtcb+CkSKHJvquVdYS1rjE3sWaAgFn19XBE3BVh1p5zDaYVkXgb/5
	 53x/ROMey4a+LSsEcw5q2D7UbvqOeFYkeNNGauBG+icD97Ulp08/Z5ATC3tjXYx0yN
	 hTEINVtr3H16uCUgpd+mtutv8ES3vpGsTLBZiaBB7D9xcMSPymTfMqQzGoYS3NaMgg
	 ryiY5CkC4EbEg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id B2772380AC0A;
	Thu, 31 Oct 2024 19:15:42 +0000 (UTC)
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
From: Bugspray Bot <bugbot@kernel.org>
To: ribalda@google.com, hverkuil@xs4all.nl, konstantin@linuxfoundation.org, 
 tools@kernel.org, tools@linux.kernel.org
Message-ID: <20241031-b219449c6-878ca3eb30fc@bugzilla.kernel.org>
In-Reply-To: <CANiDSCvSAVkSsdWzfGFHK2YZXy_dOHVeJOA7V0pmyzHzSm6iEw@mail.gmail.com>
References: <CANiDSCvSAVkSsdWzfGFHK2YZXy_dOHVeJOA7V0pmyzHzSm6iEw@mail.gmail.com>
Subject: Re: Bug in b4 shazam?
X-Bugzilla-Product: Tools
X-Bugzilla-Component: Infra
X-Mailer: bugspray 0.1-dev
Date: Thu, 31 Oct 2024 19:15:42 +0000 (UTC)

Konstantin Ryabitsev writes in commit 355e82083f0eba59abf31521977dda09fab8bff5:

Don't strip trailing blank lines in patches

When parsing patches, don't rstrip blank newlines in case it's a
(slightly) malformed but a valid patch that strips the leading space in
diffs.

Reported-by: Ricardo Ribalda <ribalda@google.com>
Link: https://msgid.link/CANiDSCvSAVkSsdWzfGFHK2YZXy_dOHVeJOA7V0pmyzHzSm6iEw@mail.gmail.com
Closes: https://bugzilla.kernel.org/show_bug.cgi?id=219449
Signed-off-by: Konstantin Ryabitsev <konstantin@linuxfoundation.org>

(via https://git.kernel.org/pub/scm/utils/b4/b4.git/commit/?id=355e82083f0e)
-- 
Deet-doot-dot, I am a bot.
Kernel.org Bugzilla (bugspray 0.1-dev)

