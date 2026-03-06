Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CCAB231842
	for <tools@linux.kernel.org>; Fri,  6 Mar 2026 21:15:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772831721; cv=none; b=frAQEuNrUVpD5x+lLMo5ckR/rdBJR/RNgti6igX6b/e1vru4uyhFXJ3gjFAd0yDibTsERQG5lHtP0GQow3HVX9nVmU1HNGneT10aUnaRxA4tUi73uY+qf39by8cwpL8i7/eDyLzdW2PoKiE7hs113GlK1itGz0e/pEpCjMIuZrE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772831721; c=relaxed/simple;
	bh=U8tiEFGD8hzWRhiZza8CPTa4tbVmgjRwBsFUEKBk/ys=;
	h=MIME-Version:Content-Type:From:To:Message-ID:In-Reply-To:
	 References:Subject:Date; b=LnkifXxEnVTKhTx9ow/bcp6Xb868QI6rgCZt52APXRhl39XfhxLNIxfK/JokQdbuJUmLVsLDxZ5k9sF1q3dFACVT+xbwJOJ9Aq5haUM4i1c07tiFwbNdRlgfZDT5NdUg2SpotkSbvETo2gs9yFQdmT4PJr7KonDucliutdmc4/Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=p16mRk4L; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="p16mRk4L"
Received: by smtp.kernel.org (Postfix)
	id 4EE7AC19425; Fri,  6 Mar 2026 21:15:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 384A6C4CEF7;
	Fri,  6 Mar 2026 21:15:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772831721;
	bh=U8tiEFGD8hzWRhiZza8CPTa4tbVmgjRwBsFUEKBk/ys=;
	h=From:To:In-Reply-To:References:Subject:Date:From;
	b=p16mRk4LP9UPYVLCGA2B7rXlMYh+EvwrJVtBHMBSVKHGoVEcKLoSYl+tHCdLlqjVc
	 gtIGx930cMpGUaNQrbrWyfYZDBx3P8vLg5Ljwbe1bNuIinvVMatK4NBCKhz0okjwcu
	 yh/rdIKJQSw4A1K2N2RIcLi00ZXaZKhBjqgbAjp9FsCCuQ9baLivb8VI+mJ1b02ygS
	 eRJ8g1976KIH/SkiUKMSCsmjTtBthBaw4CG1jFpXcuJCVVFp2X+weL61srLMJFZHu4
	 NNomp99rJS6DSHN7PuyNcW/gZrZpXYdNn1K8+YzNVZgcr/Ee/JW7jd8Ms/8/vdsEia
	 GziyIevZN1fYA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 7FD783808200;
	Fri,  6 Mar 2026 21:15:21 +0000 (UTC)
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
From: B4 Bugbot <bugbot+b4@kernel.org>
To: broonie@kernel.org, kernelci@lists.linux.dev, tools@kernel.org, 
 konstantin@linuxfoundation.org
Message-ID: <20260306-b46d2ce4-33c55758ba7d@git.kernel.org>
In-Reply-To: <aTj6C69JzDUJUVP4@sirena.co.uk>
References: <aTj6C69JzDUJUVP4@sirena.co.uk>
Subject: Re: b4 pr checks for KernelCI results
X-Git-Bug-Id: 46d2ce461ddc5826f87e69e3ef0b1e666c49645a563e0d1506ad598b3f6177e2
X-Mailer: bugspray 0.1-dev
Date: Fri,  6 Mar 2026 21:15:21 +0000 (UTC)

Hello:

This conversation is now tracked by b4 bug tracker.
There is no need to do anything else, just keep talking.

--
Deet-doot-dot, I am a bot.
b4 bug tracker (bugspray 0.1-dev)

