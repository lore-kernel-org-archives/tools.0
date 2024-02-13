Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA9312919
	for <tools@linux.kernel.org>; Tue, 13 Feb 2024 16:35:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707842129; cv=none; b=B4EmdJBTC91r8e6btiP4HK9cIuGNqPB7dSnq0k7L1ozbe1DaGapr8fszJHlEHVbN76MToIaSb1Upge3peqLYJXt0D+Smszkk5FyDCAayOAhbt8xVg8ZCF0BbwKYDC+KdiU8oqPfyTs+bJ7K2GsdGsj+qsHz4UXyFML4mrUH4ogw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707842129; c=relaxed/simple;
	bh=Tl2ulSzErAqykAssw31WtE32uXmjcWxsR0vF1YP97bA=;
	h=MIME-Version:Content-Type:From:To:Message-ID:In-Reply-To:
	 References:Subject:Date; b=JmK18xl3Ru0R4WmF4WSDcVgawjumquoMdZXiZ31I3E96TWnyy6xVoCJc0ULXHMrnwHBNZeVSY5R895nK/1wlOn4SWCwsS6tR/mXc8sB1LLYICMFGMEm9T1mSPOHPeprAh29LFj6Gj15Al9unC6B2OXnoxpCeaj4tSPMmeaS4xtE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Gnu2mPrt; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Gnu2mPrt"
Received: by smtp.kernel.org (Postfix)
	id 5D9CFC433F1; Tue, 13 Feb 2024 16:35:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 46A60C433C7;
	Tue, 13 Feb 2024 16:35:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1707842129;
	bh=Tl2ulSzErAqykAssw31WtE32uXmjcWxsR0vF1YP97bA=;
	h=From:To:In-Reply-To:References:Subject:Date:From;
	b=Gnu2mPrta4qc18LejMRopjvD+EWPn+0S8sBqiSKXxBVvDDnaaTjjcXw0eK96jEsGU
	 XmIs6EmsOBOVMN/ckup8WVDq9rvsb97CL6JuicvdDwShFAxvYBHKIcpPECOmplAbV0
	 5cXug5Box4UsfpKYNmIAE6QxDhfU9n5SolFgG0MYQiH8dLB0FnEW99nOLbrVBMpd2d
	 UBVuN3M82eXB2mfkCAviOTKAde5LWJn77xIgkbH1S1oEwF/YA0A4kGPd0zQ0CnEIe4
	 4RTckvbAgErpni8DCh8MQCR1Xsp95lKM4mLRZyLn4aVZcnCo/4wlIypH+mHCYuz5Vg
	 OOYMtWY7RfCyA==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 2563AD84BCF;
	Tue, 13 Feb 2024 16:35:29 +0000 (UTC)
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
From: "Kernel.org Bugbot" <bugbot@kernel.org>
To: nik.borisov@suse.com, konstantin@linuxfoundation.org, tools@kernel.org, 
 tools@linux.kernel.org
Message-ID: <20240213-b218425c2-4f45ba76151b@bugzilla.kernel.org>
In-Reply-To: <b93b0a56-0207-4538-9413-36d59c20ca2e@suse.com>
References: <b93b0a56-0207-4538-9413-36d59c20ca2e@suse.com>
Subject: Re: b4 diff failure scenario
X-Bugzilla-Product: Tools
X-Bugzilla-Component: Infra
X-Mailer: peebz 0.1
Date: Tue, 13 Feb 2024 16:35:29 +0000 (UTC)

Konstantin Ryabitsev writes in commit bc83b76296315abd62fdfcec2276d96e3b611f7a:

diff: make the algorithm more forgiving

Be more forgiving when preparing fake-am ranges, so that series that
apply cleanly without a perfect hash object matches are still possible
to diff.

Reported-by: Nikolay Borisov <nik.borisov@suse.com>
Closes: https://bugzilla.kernel.org/show_bug.cgi?id=218425
Signed-off-by: Konstantin Ryabitsev <konstantin@linuxfoundation.org>

(via https://git.kernel.org/pub/scm/utils/b4/b4.git/commit/?id=bc83b7629631)
-- 
Deet-doot-dot, I am a bot.
Kernel.org Bugzilla (peebz 0.1)

