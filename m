Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB1FE9445
	for <tools@linux.kernel.org>; Thu, 23 May 2024 15:07:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716476832; cv=none; b=lQEB8rmbBMmMbYnUtuX/7oDx/x5NAnR40SniQ/nLVsQ5tZGAqq3JWmToKfenfMk+fe3v3WvjzAXbHG4zIjZcFVCCoNTorJyrOAj4PmSLU4dK/OVibOYRpcXmDraO16ciJ90orFKOPTkdIa1BJkOqdg4jUv04vIIPU+jUhYwHPQg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716476832; c=relaxed/simple;
	bh=aggC1NZgd42yk++WWGNJbzrnU580izmvevFI9V2I2+s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ICtmI0M3i5cNn5higqJImjEeOnNa8cNh1yvKj04na4174fUNGzR2qKg4lvrSOdk+QqWz48sHimpWVmVnQ2fPmAXlGbLwFy8Bln8ZbNJwpOAkmCpzhpbjg3TcwoBGBlBy/wXRU5/1IU55XuKtdI/NXOXvK5Pz85RRH6F/rtfa1Nk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=LzI7vK8x; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="LzI7vK8x"
Received: by smtp.kernel.org (Postfix)
	id 52873C32782; Thu, 23 May 2024 15:07:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1D174C2BD10;
	Thu, 23 May 2024 15:07:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1716476832;
	bh=aggC1NZgd42yk++WWGNJbzrnU580izmvevFI9V2I2+s=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=LzI7vK8xj3FkztNAxT10b+VC+XH3NAYn9iMz6UvzCFrQWDMBO4MZk1OLQ7pLLwXeH
	 uo4xH1ODeV2M994zbXKTQI7pnEmkJojGo0H63NOMJ3CDzPa0RG2VU9cqZF/AUDtGfx
	 fDYKB1tn2gdaKIHuez0MLahb2vEF0AyWDtOeqHa4=
Date: Thu, 23 May 2024 11:07:09 -0400
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: Jonathan Wakely <jwakely@redhat.com>
Cc: tools@kernel.org
Subject: Re: [PATCH] main: Use inbox.sourceware.org for repos hosted there
Message-ID: <20240523-strict-fortunate-buffalo-067b15@lemur>
References: <20240523143752.385810-1-jwakely@redhat.com>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240523143752.385810-1-jwakely@redhat.com>

On Thu, May 23, 2024 at 03:30:16PM GMT, Jonathan Wakely wrote:
> Like the kernel, the GNU toolchain projects hosted on sourceware.org all
> use email-based patch submission/review processes, and a number of
> people are using b4 with inbox.sourceware.org now. This streamlines
> things for those people.
> 
> I don't know if this patch would be acceptable for b4. It's obviously
> very specific to sourceware projects, but then the existing default is
> very specific to the kernel! :)

I understand the reason for this, but I'd much rather this was set in 
.b4-config, as it would obviously scale much better than hardcoding more 
and more projects into the source. Especially if origin URLs happen to 
change in the future.

Have you considered submitting a change that includes a .b4-config into 
the repos?

-K
