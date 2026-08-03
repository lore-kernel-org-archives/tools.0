Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 553CF40DB5B
	for <tools@linux.kernel.org>; Mon,  3 Aug 2026 17:08:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785776931; cv=none; b=YjoLrtG9UkPXc2ouz5CLFMGAJQVhC7yNeOmZ9n7cvIB9GwOkG1lpC3/Q+3XC7UA9pe170tOCSA2DsFuBim/DxZcJuuHg0/gDE5y/JuRbzzNPvsw2rAv3Q0Gd65s4ph33iXQ6sByBAw02diS7KLa8uBC0DWnwFRbtFXvZkbMVtaU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785776931; c=relaxed/simple;
	bh=vzIX8ENV1wUDVZeaGtkYf9BQW4rHCa9dHsvIV9T4a30=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=e/6qA8NETYFQ28kNVOgMopGrg93mvKkpYstDC2fZvIzJbyLHMIfgarL8ml9HyaUWijeif/o2jRhivZ/wzubBuUrjYpJQrjxya3pWV+89Q0PJbYsXrv/8icKkltkZ71V/SMtPNMbUSwKRK6gCFOtxIOndop6hnH4y0B69BVdsmqo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UsPgWVtq; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UsPgWVtq"
Received: by smtp.kernel.org (Postfix)
	id 77D2A1F00A3E; Mon,  3 Aug 2026 17:08:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 171A91F000E9;
	Mon,  3 Aug 2026 17:08:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785776929;
	bh=vzIX8ENV1wUDVZeaGtkYf9BQW4rHCa9dHsvIV9T4a30=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=UsPgWVtqBQDCqusucfERr2qvJetQB55yb84V90REcMpZqqaLLBlskj7x2+lxXvKZl
	 DQZKssQ5v5M8tKWomZOkDEipls5e150mu5SZRXQRZsMqTiTdEg+f/TRz23F/V8mQJp
	 /TdBGeJoXxQxbk4XLvVO7VuayOY/cIyA+kTz+WdEP6JqKoCcjJq4eyHGv3+O61Uppt
	 UnkZca9g+9xNjqiiEfqLSWmGh84U7mWfv/O0xenT8j4k2mYyoytYmVR82nrp+359rm
	 rqwQ+wj3IdXW+BGF16BMsAxPtrZGXgNVw8BDPOFJo7gavUbDMb5pcS+c4RKY6Tq7PM
	 jUU+CS8/Ekmyg==
Date: Mon, 3 Aug 2026 13:08:47 -0400
From: Konstantin Ryabitsev <mricon@kernel.org>
To: Rito Rhymes <rito@ritovision.com>
Cc: tools@kernel.org
Subject: Re: [PATCH v1 1/2] add mobile drawer navigation with a compact
 sticky top bar
Message-ID: <20260803-curly-sly-guan-18e09a@meerkat>
References: <20260803153502.32096-1-rito@ritovision.com>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260803153502.32096-1-rito@ritovision.com>

On Mon, Aug 03, 2026 at 11:35:01AM -0400, Rito Rhymes wrote:
> On small screens the navigation wraps into a dense block of links that
> is hard to scan and gives closely spaced tap targets, the banner
> consumes significant vertical space, and because content reflows into a
> single narrow column, returning to the navigation at the top of the page
> is a much longer scroll than on desktop.

Sorry, this series didn't render well neither on desktop or on mobile. I
applied it and then reverted it.

-K
