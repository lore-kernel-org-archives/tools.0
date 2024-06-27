Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70140195FC2
	for <tools@linux.kernel.org>; Thu, 27 Jun 2024 14:25:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719498321; cv=none; b=iUKsAv183qLsjXUDqITwLM573vwKnhk2YxBTlFt6mdI04d/d6W1ttSyejPqeYZ7wYGjTVv6M1Xnl6YxFmgCJcdLCbG4p7fdwx+UO9Cb+HgnNWJVRC4zpzhZsITZzWYJu7G2BPVp21QN0D5utjzVCHEgcCyXDd9m76ZOVssjII5I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719498321; c=relaxed/simple;
	bh=jRqkGpfA2574IEYjChLvVf7I/JbMm8Eh0K0En54+U64=;
	h=MIME-Version:Content-Type:From:To:Message-ID:In-Reply-To:
	 References:Subject:Date; b=WqGvVK4pgf1IPocGowSA0E0nGAzYJsjKjhq6CrnEWQyRgOdN+06O6aJk/voXw25FcRhx2DfopeRclZyYJFVFV2XNd5DzXY3ZhBSbGdWXNHBDGku+IUHcIRpRol/cT5FkMvD5oeQ0Vu4K42TLk7ZrEKp88pDhuGg9EqnLWlIQbvA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XJKZgujE; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XJKZgujE"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 2D7BAC2BBFC;
	Thu, 27 Jun 2024 14:25:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1719498321;
	bh=jRqkGpfA2574IEYjChLvVf7I/JbMm8Eh0K0En54+U64=;
	h=From:To:In-Reply-To:References:Subject:Date:From;
	b=XJKZgujE3rib9U3EDaAF3an7xClId0FVJT1bxXhi2vWbk2bcZtlxgFCwUB710mkyC
	 akDNtY8mRYd8bm+fL0qRlz99msdoCLoc3K4NBLLmqgATi2TL+AHvPnFarGkInsxUyc
	 Lsq188n4v13HT6gjjudAvfzV4qGr88Mf9q9UpBoH98OyCw/1pxIOTfTmhwh6Ye5wm6
	 lqO24elpswtZCg6iD2KH2zr9M0SsEnrHQpntoFjAfx43cdZT9TB0FLjDPywfuTdBtw
	 VK1UTuKfLLYK7uyNWoJraKoT7Oa9ob7aqOHzv3Iev1edFZQrHYRnWAt9vwgOIyQ52E
	 lR6QR1C9/bVUA==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 1589CC433E9;
	Thu, 27 Jun 2024 14:25:21 +0000 (UTC)
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
From: "Kernel.org Bugbot" <bugbot@kernel.org>
To: quic_jjohnson@quicinc.com, tools@linux.kernel.org, tools@kernel.org
Message-ID: <20240627-b218994-3cce4d29613f@bugzilla.kernel.org>
In-Reply-To: <ca8f8cab-e62c-4784-bdf8-9c92b2c0202c@quicinc.com>
References: <ca8f8cab-e62c-4784-bdf8-9c92b2c0202c@quicinc.com>
Subject: Re: b4 prep --cleanup failure with cover-strategy:
 branch-description
X-Bugzilla-Product: Tools
X-Bugzilla-Component: Infra
X-Mailer: peebz 0.1
Date: Thu, 27 Jun 2024 14:25:21 +0000 (UTC)

Hello:

This conversation is now tracked by Kernel.org Bugzilla:
https://bugzilla.kernel.org/show_bug.cgi?id=218994

There is no need to do anything else, just keep talking.
-- 
Deet-doot-dot, I am a bot.
Kernel.org Bugzilla (peebz 0.1)

