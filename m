Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A49A1B78F3
	for <tools@linux.kernel.org>; Wed, 18 Jun 2025 21:29:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750282177; cv=none; b=e3gMLoMvS7TbhPVFYdr/Z7hrIAjDqMkKoQBtpLzmTbKJYIN2VwDsCatuJYTOL1AskQYc/OprHF/FE57gzblR6Lr4wQeqxsy1eWvFA7RpqyzOFCH9JW2tz34WHHp3pRZ7ZdvOxN1V7pELOGSAsZJMqz7gbkG7xop9QHPAx1trt7U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750282177; c=relaxed/simple;
	bh=kWtZsjCnLnaUDpRLL9iX4OQ4gVYX0SYJ72y/3tn1/Zo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RMXs4M2YhMLlVRBAOI6Q0XQNeN3q4WRVlXjD9rtoyC0PfOzMI7UrG5DKdE8yN0pW23P9Ni/U8ST6tOm3HC4MY8GGZ7dc17j4+DKXs3PDsdmuRobv8w5xB8oiulWtDN83X4ruz7BP1/eO0Wm0VAYb3s8RfKx97emPsgNjme6fM/U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=K2WXLjQh; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="K2WXLjQh"
Received: by smtp.kernel.org (Postfix)
	id 80CAAC4CEF0; Wed, 18 Jun 2025 21:29:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6A595C4CEEF;
	Wed, 18 Jun 2025 21:29:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750282177;
	bh=kWtZsjCnLnaUDpRLL9iX4OQ4gVYX0SYJ72y/3tn1/Zo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=K2WXLjQhw222zqK4ROk0UaGGcQNpEmWmV+eTa73ysBYSwFeBx7Drxnnw6tKsd8DHu
	 isETSjNa/uKuDOlFnaqxCEEDYUUpjA+z64bLFevRdJ+WxGKiOlvdLon3SWqPxEnAGA
	 rhrZsx+Qb5Z20SXCNEu8UPe+WNIYq5RrD8tCPTTQy7VYlkRxI+5lN6ndnduu0XqcYP
	 pgdsVQS2cw2YA5yuDm+NsgBf1NV1/DIlt/kcFWQYHNqnRSDbSrSYpYDOO7bs+X2Mdc
	 iK1ulfXQR12zPLsAMGMqpV6GbWr1p5SGi0RxLxYcWDV+trRhLj9us+AzWhPBNNRH1I
	 F5g5O58vMGW9w==
Date: Wed, 18 Jun 2025 14:29:37 -0700
From: Kees Cook <kees@kernel.org>
To: Sasha Levin <sashal@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-api@vger.kernel.org,
	workflows@vger.kernel.org, tools@kernel.org
Subject: Re: [RFC 00/19] Kernel API Specification Framework
Message-ID: <202506181428.3D086D2@keescook>
References: <20250614134858.790460-1-sashal@kernel.org>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250614134858.790460-1-sashal@kernel.org>

On Sat, Jun 14, 2025 at 09:48:39AM -0400, Sasha Levin wrote:
> This patch series introduces a framework for formally specifying kernel
> APIs, addressing the long-standing challenge of maintaining stable
> interfaces between the kernel and user-space programs. As outlined in
> previous discussions about kernel ABI stability, the lack of
> machine-readable API specifications has led to inadvertent breakages and
> inconsistent validation across system calls and IOCTLs.

I'd much prefer this be more attached to the code in question, otherwise
we've go two things to update when changes happen. (Well, 3, since
kern-doc already needs updating too.)

Can't we collect error codes programmatically through control flow
analysis? Argument mapping is already present in the SYSCALL macros,
etc. Let's not repeat this info.

-Kees

-- 
Kees Cook
