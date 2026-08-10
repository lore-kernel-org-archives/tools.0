Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90B354343E4
	for <tools@linux.kernel.org>; Mon, 10 Aug 2026 19:08:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786388914; cv=none; b=aYHFNzjyLbwgiirjW9wdyQsxDDW9SM7uNqoJIq8QPYrJNuFoDPFhNF0YuUNqITsiSloTMdQqVGKd2moVz5DV6evgHWSb/FFAtJHGx9wYQ/pdol/hpRqW8INnDSayLyiMTVJlNP2TWszhTvO4yX2FW0O41Vmjw/8MaVVsgYqMnzM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786388914; c=relaxed/simple;
	bh=sZuPYV4ETtt/UlFVzIfNZ/OSOwNZZRO0dk7jcO16PTU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uKUEr72mYFyahU19I3sYsiLlaFy3jGYMAoQ4YwEyLTg3gIBUwPNmhwSK0YOg9rsX8U8qU2BilE50UlH53v6qcaBJ5yvMlMWfO19FEOku9oNJ1vHwIXwe29FLQYISxtcX6amM+ZZ2nBgVJzYMwkuko2f6ToLn4FjPz7bflqzYQj8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dPKGX9Ee; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dPKGX9Ee"
Received: by smtp.kernel.org (Postfix)
	id 9373E1F00A3D; Mon, 10 Aug 2026 19:08:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 20DC31F000E9;
	Mon, 10 Aug 2026 19:08:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786388910;
	bh=51RfRqHPc6k1xYPvPO9HIx62/ulHo9GVr8JV0cju6q8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=dPKGX9EezbQHV1C6VkuEUZok/SCeUBs8GfVflqL7xSPHEewXMvZ9t3gjqpwfPHLEC
	 /qyPQCrftITVLVqzzAbmExeQuxW042hMTM/lrT/kwRknMYFkw6xcfsHIzEip5i2MaA
	 xDrQRKgCQtTPF5qtbnAyQXjM/wp4uzZ+3d4nCnlhb27ZcQ/poxGXBUTnL7rjWA58IZ
	 RNEi0Dk23+7hFk+lJTnM/NENRKYq1PC0g13BbpUS5kuvdwfFDOyVm5UGwgM4YiIFyH
	 4xX8CrjbCjh8LcvRFFHiIhMJQOd+bUZFQJHQiponqeKPCDJBpOyBfzBbhTxQpU818e
	 488mrTZ0DWGxg==
Date: Mon, 10 Aug 2026 15:08:28 -0400
From: Konstantin Ryabitsev <mricon@kernel.org>
To: Maxime Ripard <mripard@redhat.com>
Cc: tools@kernel.org, users@kernel.org
Subject: Re: b4 0.16.0 released
Message-ID: <20260810-magnificent-precious-frog-f3d1ca@meerkat>
References: <20260805-alluring-arrogant-grouse-ece17a@meerkat>
 <20260810-urban-hamster-of-brotherhood-0b9bb2@houat>
 <20260810-amazing-woodoo-mink-af1cdf@meerkat>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260810-amazing-woodoo-mink-af1cdf@meerkat>

On Mon, Aug 10, 2026 at 11:47:21AM -0400, Konstantin Ryabitsev wrote:
> > > Full release notes available here:
> > > https://b4.docs.kernel.org/en/latest/releases.html
> > 
> > It looks like the tarball hasn't been published? Is it on purpose?
> 
> Oh, sorry, I forgot about that step! I needed to first make sure that the two
> new libraries have tarballs, too, and then got busy with bot wars.
> 
> I'll set it up today, thanks for the reminder.

All tarballs should be in place now.

-K
