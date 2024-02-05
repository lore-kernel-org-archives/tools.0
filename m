Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F2F23F8CA
	for <tools@linux.kernel.org>; Mon,  5 Feb 2024 17:09:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707152967; cv=none; b=K/OPWsMCSCDBt9xB10oYBW6aaoUUlzpfmTun1OT5KGgWQWSDupPZHhDTn48fw9aTzVxqRSJMyJchbpTVGnq10PUP9LsOU8tw6K4MXer6eVUYoAMFGEOREZkuUg0dITpFCEBBsj7hP+q9QiUR2W/eitSM/Ht3vYyZJRGENArUva0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707152967; c=relaxed/simple;
	bh=ImiZCMNuJXKzJmXL7CIyrnYUkcI0b3XVht48qypXXCU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=h/kh6LgggB7FeWCxOtrOMae9ocTWGKcuyYBa6RqiRnFWo68NoY8kRrKHZwOkM4siVkG+jXrTS8gyTtFsfxfONGulnEzCi9m/LPBa1ytICmvH+urQQh/83ozRLPELe1oFy0VhXqrN6e9uXDO/crowRTrG2WN2zWM9UiV1aMo4HBU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=yiOzYamK; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="yiOzYamK"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DEF40C43390;
	Mon,  5 Feb 2024 17:09:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1707152967;
	bh=ImiZCMNuJXKzJmXL7CIyrnYUkcI0b3XVht48qypXXCU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=yiOzYamKXFZlHEovC2YiLY6Fqs/KO1sLQLKL/y6WXewLCEG2V6CJ0sbqYN2Eirjbj
	 WPL11z6mH5UBs4r/WpUjnZR90QmCD6tmkAhmbp1mGZON/AjiGfbqy8b+yAJlHXe6Dt
	 Z63sYUzHfTF6Ic6Yf0fjWA943QejDn+PGA46iTWI=
Date: Mon, 5 Feb 2024 12:09:23 -0500
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: Lucas De Marchi <lucas.demarchi@intel.com>
Cc: tools@linux.kernel.org, lkp@intel.com
Subject: Re: trailers update and bots
Message-ID: <20240205-upbeat-whippet-of-innovation-d26ae9@meerkat>
References: <20220916161835.mpi5oyeka3b4ellx@ldmartin-desk2.lan>
 <20220916162418.plk3jhc6hezv2ace@meerkat.local>
 <20220916163101.2ij6uznmymqvgklt@ldmartin-desk2.lan>
 <20220916165951.onu7f3p7xl7olw5u@meerkat.local>
 <uq3gvjhhmapxhjwjsdjghc63kr4wdcic6oum6gss5rvlj572up@5eiplp2qzf72>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <uq3gvjhhmapxhjwjsdjghc63kr4wdcic6oum6gss5rvlj572up@5eiplp2qzf72>

On Fri, Feb 02, 2024 at 07:33:42AM -0600, Lucas De Marchi wrote:
> Reviving this thread as a similar issue occurred and I remembered of
> this. Besides ignoring trailers from certain addresses, would it be
> possible to ignore any email at all from certain addresses? Maybe a
> b4.ignore-from to complement the above?

I think we'll just expand trailers-ignore-from to also match the From: field,
not just the address in the trailer itself.

-K

bugbot assign to me

