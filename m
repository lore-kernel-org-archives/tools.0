Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45A9434DB46
	for <tools@linux.kernel.org>; Fri, 27 Mar 2026 21:00:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774645229; cv=none; b=uDLVGmGWEwj6rTMELOhOx+qo2XHG4T+hMl/cWqxH+D6WXAS/QcPHDCAkq7YMuyfvQBtP6r9svBRnpB6BIMOViuv5+TbH9tjSTaj/jHQQQsEBHiVo/M/4RkbUEVehLamQBdmnBOJxcwenxRuAALNkBcgK/umsGPObJxvAC5WPK1c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774645229; c=relaxed/simple;
	bh=zpyqXh3NdpycKAe2IB65sLA0lwa8Cus1zF2+3QdPkW8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lpyDCQW4duAsZ2Fw3UX02ZTsWRJStG0mrf3EmFt3xnihHH+y/d5M1fwSP3GgiOlzuOGpPIlvcCy1SWnL5Y1HCJdje5uZ9ZvMifyRRAU8n5wPwfNOH7GLDH+ZCI1sTTbXaR1WMyz/EPemh82cfz1rIgtL0SXQ37g6QbCUo9vFzOM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=1TKjzV5M; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="1TKjzV5M"
Received: by smtp.kernel.org (Postfix)
	id DCDEFC2BC86; Fri, 27 Mar 2026 21:00:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A573FC19423;
	Fri, 27 Mar 2026 21:00:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1774645228;
	bh=zpyqXh3NdpycKAe2IB65sLA0lwa8Cus1zF2+3QdPkW8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=1TKjzV5MGxdxyDbTgoz5V5Mfb4YCnXQip+zhNV1oqSMY10aJLKW2WBu/DvZfc6pvU
	 dhogJxZPhbFbnDuGTVSLZBW5ADJz30GFvrpuqnTk6M3KZUq0UXUIjJuqmjMxQmQCL0
	 ZFo2vJAoAPHdlQ2FnckvBU4EhQyFfK2g0fO5WBj4=
Date: Fri, 27 Mar 2026 17:00:24 -0400
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: Chris Samuel <chris@csamuel.org>
Cc: tools@kernel.org
Subject: Re: b4 review experience
Message-ID: <20260327-benevolent-tungsten-chipmunk-5a5558@lemur>
References: <2c1ab8a2-8a86-48a7-9a53-ef3a00ab4bd2@csamuel.org>
 <20260324-skinny-daft-nautilus-167b65@meerkat>
 <2762cb7e-b277-4722-b6a9-da11c771783f@csamuel.org>
 <e1c2b0c9-1a9f-4a18-91e2-eec6f6f17170@csamuel.org>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <e1c2b0c9-1a9f-4a18-91e2-eec6f6f17170@csamuel.org>

On Tue, Mar 24, 2026 at 08:51:07PM -0400, Chris Samuel wrote:
> I found this when using the CI support - if Sashiko reports an issue it's
> not possible to select the URL to go view the report. However, if I run "b4
> review tui --no-mouse" instead then that works.

Yes, this is turning out to be a very common observation from people using
textual. The solution is indeed either to run with --no-mouse, or in many
terminal emulations text selection can be forced with "Shift".

Best regards,
-- 
KR
