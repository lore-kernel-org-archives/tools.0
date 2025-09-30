Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B31AF38F9C
	for <tools@linux.kernel.org>; Tue, 30 Sep 2025 20:06:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759262775; cv=none; b=ZeSGiVi6HbUXFKRU2/fzIQk2X4G3QrHGkbFP2qQDMERA83o7+Z6Zc1t9MJ6ZwMBOQ6hcfRAiP0ScIjO5odR/qqIR+g79sZhvvIqqaIYDTnTkoxH4DUYWYHSxucga5lzGN6uGYvnBIVMwXINY27IOeEf+dghb7r8ViP3TuqJZE5Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759262775; c=relaxed/simple;
	bh=Qsg0NtCFoxJp3qlJ0og69G7OJWru2dfTb+KEoVk/6ao=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=II3EyQu2dwuHeTRSUdWIX6qUC/C5gk/m3YmyGvunq7vkI+A8Ehd/slNxd+otSVmU9Z8PlyN7QdVVNpjSC/p/FaXzOkt+0wYQg1VUlokANuh9RYL+VxkOqwaTNvtKdge5BvcMR3fvGhU6Wq540NFecoQAdMYgXl00ydNitk0Z77c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=rA+0ittz; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="rA+0ittz"
Received: by smtp.kernel.org (Postfix)
	id 5F90BC113CF; Tue, 30 Sep 2025 20:06:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2C6BEC4CEF0;
	Tue, 30 Sep 2025 20:06:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1759262775;
	bh=Qsg0NtCFoxJp3qlJ0og69G7OJWru2dfTb+KEoVk/6ao=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=rA+0ittzijYHfFXnpbx2catLdO/bOMlZFd/2EdSMGjmAzBwJMO0Dt/3AXtf8+8/qw
	 VIANem4WiR1ZJDGNMIRGVEaDXcc2jRa2Lt8r+MvpBR+KysOYcUvnDAVfbDIrFKrp8f
	 51bdR+3uwMG1+BWUDKJePlohsP7UglteGs480b54=
Date: Tue, 30 Sep 2025 16:06:14 -0400
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: Jens Glathe <jens.glathe@oldschoolsolutions.biz>
Cc: "Kernel.org Tools" <tools@kernel.org>
Subject: Re: [PATCH b4 v2 0/2] git_range_to_patches: add git options to
 better represent renames and copies
Message-ID: <20250930-misty-tarsier-of-emphasis-3edcce@lemur>
References: <20250812-format-harder-v2-0-53f74982079a@oldschoolsolutions.biz>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250812-format-harder-v2-0-53f74982079a@oldschoolsolutions.biz>

On Tue, Aug 12, 2025 at 07:59:13PM +0200, Jens Glathe wrote:
> This is an attempt at mitigating the real-world issue of file renames
> in patches due to code restructuring. I have a few of these, and would 
> like to keep using b4 for patch management.

Apologies for taking so long to review your submission. I don't think this is
going in the right direction -- I would prefer diff flags to be set
per-project or even per-series and keep the defaults as close to vanilla git
output as possible. 

There are several reasons for that -- for example, what makes sense for one
series may not make sense for the other. I'll work to make this configurable
per-series and then we can revisit this to see if it fulfills your needs.

-K
