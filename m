Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C03278F3A
	for <tools@linux.kernel.org>; Wed,  5 Mar 2025 19:41:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741203686; cv=none; b=KOz5un+cfKL1AORA7LIWUddJD2RXunaiiEHSfBtOjiLMi8bFqUmnY4b9G5XPFuywQ95stD7zmRJl4dbwCVlZkSMBnfgvq+F85R5tIUJL7Gaf31IP5OVTXPYyifXbIJ9l8dZb+1b3QHX+KMjTKui5qu8gWTsGGhV5OZrAHHGlTNw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741203686; c=relaxed/simple;
	bh=NVFHIBT8awLT6Z9TeW0ZeaBcUdXJoWORxKTgXOsGtMU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RmIs2u7XM0L/I84vdZiGjW9MTOiSbmQy1YfvhYedgMCFpd7DZmqT1vxGHCOmQbzKXYkR5hsQMKYWRsBidD/Sr98LmXYBQxm1TQK5khpuOeGj51JCmIpAcA5dr7TxB2rIfJTHFugvuQTWH5NXQ56Cjp6H+Ld3EfYB2Mg1tXBIhLA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=laLpHlbd; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="laLpHlbd"
Received: by smtp.kernel.org (Postfix)
	id A936DC4CEE8; Wed,  5 Mar 2025 19:41:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5F491C4CED1;
	Wed,  5 Mar 2025 19:41:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1741203685;
	bh=NVFHIBT8awLT6Z9TeW0ZeaBcUdXJoWORxKTgXOsGtMU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=laLpHlbdpQOxQDd5PhGXXHzn2QNI6Ls4z70LX6IuPGKgLMu9gU2zKYXVTrCr+tDRr
	 Lb6HQ1ozRlfEF5Ykb1Oj7p0ExyZYlJthdbRFpPp5OBz/Udqp3RqleV1wFw7BVK5Qov
	 4pxu0NZLzG6CY1VYOaeB9cqteaitAs4pfDA4nK5M=
Date: Wed, 5 Mar 2025 14:41:24 -0500
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: Rudraksha Gupta <guptarud@gmail.com>
Cc: "Kernel.org Tools" <tools@kernel.org>
Subject: Re: [PATCH b4] Add `flow` subcommand
Message-ID: <20250305-charcoal-marten-of-typhoon-87b3d7@lemur>
References: <20250302-flow-v1-1-3247c022bbac@gmail.com>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250302-flow-v1-1-3247c022bbac@gmail.com>

On Sun, Mar 02, 2025 at 04:34:34PM -0800, Rudraksha Gupta wrote:
> `b4 flow` is an interactive session designed to handhold the user into
> submitting patches upsteam. As b4 grows in complexity, there will be
> multiple commands to remember. `b4 flow` covers the majority of cases and
> shows the proper way to use the program.

I see your point, but I'm not sure this should be the core part of b4 as
opposed to a convenience wrapper around it. There can be many situations where
a contributor would want to stop and go back in-between various stages of
patch development, so I think that wrapping it completely into a "b4 flow" or
similar command will cause more frustration or confusion in the long run.

Thank you for your contribution!

-K
