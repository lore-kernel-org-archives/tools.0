Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A49822D780C
	for <tools@linux.kernel.org>; Tue, 17 Mar 2026 19:52:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773777169; cv=none; b=c0pwMrQffpCiTg2k3kJVGbYHb8vBL0ctDCo6gWR9By5prRJ3oXp6kNJlU4DsLRXHOvI3Cfki7XCKJJQl6o3K5c48JIV1/1Gsz2bKQFpf/SuzPm+lOcn4/igY2ONGMILaXe+7uGsDcZYWgChgNIuXBMRk4EoExk6/EKekMihlXBM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773777169; c=relaxed/simple;
	bh=4jxLg2fDluH638eTTWNI+ga1Wb0YQksYu8kzTP0vwFM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bdLK6W9+Pt7x05I7kwuSZvqqHpGIaddRblSYrVeugzY87RoQCf5+VdGMCq4BxaHBgkFDlQJ3ZXlOtPwTo1WLnH+3zgaam/D1dWj3w4GFQ83pmMREviDb7YAWIWfLaKy/O4V9VECOQUPsfdQJk2NdIislUZDTh/JlB+TZ4qf+3Co=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KzLzNQzo; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KzLzNQzo"
Received: by smtp.kernel.org (Postfix)
	id 7ACCFC2BCB4; Tue, 17 Mar 2026 19:52:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 43DC0C2BCB3;
	Tue, 17 Mar 2026 19:52:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773777169;
	bh=4jxLg2fDluH638eTTWNI+ga1Wb0YQksYu8kzTP0vwFM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=KzLzNQzom+sTaXnZNy/rUsznDp+EZq1PiT6rA0FD8iFYPsLXsIxSFSyPWfMLgYGBZ
	 kGbUEBCxhyRvfojSpqdjuFGYpFRmwVbqXMaBG+ptfBr1P2q/JSanlCosR4c06Yvg/o
	 3OD93oJhKLrR8KUaGnBf9d/vY9tDtnTZoc2WyucDEtqcCo9PAx+sHAn3U3a9fDYXuN
	 OVeJmAhzUYq0m76cwXyFAI4xxA1R0vxq+7fjoUu+YdE01arKWPqTUrkQbZ7jD0McZ+
	 fB/YynMHjATU4YaCrlhhxAUdI6OGh6AoXl2atFOJS8LelZyl3BYOa2Hq6ELOaboxyP
	 e/RigrwKqPuXQ==
Date: Tue, 17 Mar 2026 15:52:48 -0400
From: Konstantin Ryabitsev <mricon@kernel.org>
To: Mark Brown <broonie@kernel.org>
Cc: tools@kernel.org
Subject: Re: b4 review handing of rebasing issues for new versions
Message-ID: <20260317-steady-narwhal-of-courtesy-edccbb@lemur>
References: <069aac52-a9a2-44e1-bdbb-eabc82e23641@sirena.org.uk>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <069aac52-a9a2-44e1-bdbb-eabc82e23641@sirena.org.uk>

On Tue, Mar 17, 2026 at 07:13:54PM +0000, Mark Brown wrote:
> The new series version handling has a bit of an inconvenient interaction
> with the new version being required for rebasing reasons.  The status of
> the series is keyed off whatver version of the series that is currently
> applied and if a new version is sent it'll be offered as an upgrade.  If
> that new version fails to apply to something useful a common way of
> handling it would be to say so and wait for the submitter to resend but
> if you mark the series as waiting for a new version without applying the
> current version then any time you check for updates the version that
> fails will be seen and the series moved out of waiting which is
> unhelpful.  It'd be good if the new version tracking noted what the
> expected new version was rather than assuming that it's anything newer
> than the currently applied one.

That makes sense. I'll make it possible to specify which version you're
waiting for on the waiting screen.

bugspray tag b4/review

-- 
KR
