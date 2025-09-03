Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4667B2010EE
	for <tools@linux.kernel.org>; Wed,  3 Sep 2025 15:06:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756911998; cv=none; b=cZpkLp8noLp/JkrXDgbg3dEfstoH/JWQpIqd569OLkFI3iXY/eWGFKrqmcWD9VMGbex3O2Y2DZLuTi8bq0l2qVVREbO/wER+XBZ2BoqdVQzz+XTD0s01SykMUOY0gtbGUengt/Z6oAFxQJ4HNXDS/nHTBlTLReVoKkZ8XVOUzd0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756911998; c=relaxed/simple;
	bh=kt+FoA9ZfMS+LWUzx/wVSSJihofg8/nchleJLmOwaWE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=S8gvmwHbQ+ckxbpve3henVrlzGGLr5iX/oAVtE0uAoK0slqsz02G3TPV+HqHdq//X+5xvqp1HtRSF4pWJ9S5y1yXqfvkem2L7ZrawL0XM32SdPCX0D4hM9Bi7Dnr8yC5OuQybEJkzJv6OpD0Uo8Rcdbq7P4IJKmQJ+ZXm++Sc3U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=Nbe+zp/6; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="Nbe+zp/6"
Received: by smtp.kernel.org (Postfix)
	id D2972C4CEF4; Wed,  3 Sep 2025 15:06:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 82C6BC4CEE7;
	Wed,  3 Sep 2025 15:06:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1756911997;
	bh=kt+FoA9ZfMS+LWUzx/wVSSJihofg8/nchleJLmOwaWE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Nbe+zp/6TAe1RQVz+WVGLN72ym+XAabJ+Z6bN6G5v048P8xzb8jItXpHbMSuPRZ7A
	 qoMhW2/xS9g57RGPdJbfTJI8R0Jxyl4DP21Hqs8brEoJxh+qhJLQluKuPL0Z8y9zTN
	 y/qrVkKJvtUeNS+DZkSsn7pXe5M/7Z1vJaAevnUw=
Date: Wed, 3 Sep 2025 11:06:36 -0400
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: Trygve =?utf-8?B?TGF1Z3N0w7hs?= <trygvis@inamo.no>
Cc: "Kernel.org Tools" <tools@kernel.org>
Subject: Re: [PATCH RFC b4 0/3] Support for other public inbox forges
Message-ID: <20250903-amaranth-mayfly-of-glee-fcc42f@lemur>
References: <20250829-sourcehut-v1-0-8e259603352e@inamo.no>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250829-sourcehut-v1-0-8e259603352e@inamo.no>

On Fri, Aug 29, 2025 at 10:19:41PM +0200, Trygve Laugstøl wrote:
> I really like b4, but would like to use it against Sourcehut. Sourcehut has the
> same "public inbox", email driven cooperation that public-inbox.org fronts.
> 
> This series adds support for other forges that support public-inbox like
> email interfaces, Sourcehut in particular. I'm submitting this with the hope to
> get acceptance on the concept and feedback on the particular implementation.

I've considered this several times, but there are many places where things
will subtly break, for example when we try to issue xapian queries against the
defined location. We really do assume that the remote is a public-inbox
endpoint, so when it's not, we may fail (and not very gracefully).

The alternative I would recommend is creating a simple wrapper that can grab
the mbox file from remote and pipe it to `b4 --offline-mode am -m -`.

Would that be an acceptable option?

-K
