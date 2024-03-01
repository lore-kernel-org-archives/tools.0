Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59DC420E6
	for <tools@linux.kernel.org>; Fri,  1 Mar 2024 10:34:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709289255; cv=none; b=LCe0yobYxHziYe1IhKuBvJh5qdGiqktNGqPcqvB3sqsJ6DID7i4pNU2mJMFz5aFM7Aq6h4EdJqn1JrAsD+mto2hV71RumaF61iUt7yxQizZaWYXOhrdJzGR05CzRc36G6sn1W7nfq72EYa/nSTNaKF1QzlSQStvOfSWCrKh8MZo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709289255; c=relaxed/simple;
	bh=89OROOro9dwWUnE7o8RttgnGZqDWC+12mEooqyjYJV4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=K72IzeuaoI6omyVU4o3l4eXmcE9WOIrpZIDjf6sAGx1mk6zk487cT0hQnnbqLt9x996Pp/wTfxhaArbUgyjzC8PFdhJayoKIJWG7pnvatpyu26Xy1EmMxQqUCiqz85AFjwDC3wU7JYxTtGfMIHY8Fot6ObK1y2RZiIQNMloiAAs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hfezHzIH; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hfezHzIH"
Received: by smtp.kernel.org (Postfix)
	id EC3ADC433F1; Fri,  1 Mar 2024 10:34:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BB12CC433C7;
	Fri,  1 Mar 2024 10:34:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1709289254;
	bh=89OROOro9dwWUnE7o8RttgnGZqDWC+12mEooqyjYJV4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=hfezHzIHRhUGsynnSgo5y8Xgm34yoMtnN2oA4Ib6opQSXB3r3SFkc/7vdMQy4A2IL
	 2sPcq2Q/EasVj8/DbaPjB+F+JG6RkJnfHGnHuopO/gtsiXCvYRHN3eqoWG61RFRvYm
	 rwRoZ6+7MEDhYncciqvrUyB+E+FPN9cUDEzQ8vxa69AycwRPBR85Ta5tziQ7RgYIPz
	 p7ptUuic4tBoBiV4EDB2WnDjnJzFTQhcNM3xdlDRhzpmkRLlq8SWV1nNQ5wRMDc4ju
	 E7Ws+4sc1Q3OJp0RMS6AJ5WMKGBIIvLw1Zzp8kep0EKoY6dj3F1wxmZqJz5+vA1ifi
	 hUV3z0fNhs/+Q==
Date: Fri, 1 Mar 2024 10:34:09 +0000
From: Will Deacon <will@kernel.org>
To: tools@kernel.org
Cc: Will Deacon <willdeacon@google.com>,
	Konstantin Ryabitsev <konstantin@linuxfoundation.org>,
	Jason Gunthorpe <jgg@nvidia.com>,
	Nicolin Chen <nicolinc@nvidia.com>
Subject: Re: [PATCH 0/2] b4: ty: Fix incorrect patch/commit association
Message-ID: <20240301103408.GA17789@willie-the-truck>
References: <20240301102418.17705-1-will@kernel.org>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240301102418.17705-1-will@kernel.org>
User-Agent: Mutt/1.10.1 (2018-07-13)

On Fri, Mar 01, 2024 at 10:24:16AM +0000, Will Deacon wrote:
> From: Will Deacon <willdeacon@google.com>

Sorry, I forgot to configure my .git/config properly so it's got the
wrong author email address for these patches.

I won't resend immediately just for that, but I can send an updated v2
next week assuming these patches look like the right sort of idea.

Cheers,

Will
