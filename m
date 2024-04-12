Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B34C315250B
	for <tools@linux.kernel.org>; Fri, 12 Apr 2024 21:09:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712956184; cv=none; b=GprDUKaCtKmuE7LLFfnOgj9Mlf1RqdsWcjmvWQI2qItynsPixBN4JnwkjoQqbmqihGYicYMJ64fejM/beQyifKBa+WMgNnOxpKq+KLUldRQJguPseImPQVIgRq9sV+5EUJJIYV0AGJHcJSW0AkMOKHnrjtpL4Hzt+qpmzkgTCGU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712956184; c=relaxed/simple;
	bh=qfNSwzDYuhbzZCrA3dy06ibw0uuWY9IBvtLpj2827GM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FC/vV+ELp0wpsr6pxJSOEMcZYJv/dfophJR2oKtf2QlCXeQF0lciqUJ0DAF7ppEdom7szqC6whH3bq6ncMecGdYngHfaHUNFvdMzTZiwVvlh+jSb6/BIVTH/qTYwDJULXYUup9fZzpPhhFdeJUmGLyKdEW3pcgj3w9poqydkVHk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=cc9T1z7X; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="cc9T1z7X"
Received: by smtp.kernel.org (Postfix)
	id 8A40AC2BD11; Fri, 12 Apr 2024 21:09:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 51683C113CC;
	Fri, 12 Apr 2024 21:09:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1712956184;
	bh=qfNSwzDYuhbzZCrA3dy06ibw0uuWY9IBvtLpj2827GM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=cc9T1z7XXlhJood44Qgtucxp6PunryIWUdEeFPi7p3oAkSKXXVz1XrVJfQ70DdT1A
	 RRiWZOXTwb0vRj7ZVwL7VfWfU1E9so/JmfMtjow6Jr8c4mHPL4LjXKvJSM/XA46JR1
	 K60KBWcA3CoBKwjlxbRmQmxdnea6TmeIq9BFm49I=
Date: Fri, 12 Apr 2024 17:09:43 -0400
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: Frank Li <Frank.Li@nxp.com>
Cc: tools@kernel.org, robh@kernel.org, krzysztof.kozlowski+dt@linaro.org, 
	conor+dt@kernel.org
Subject: Re: [PATCH 1/2] prep: add --check option to run necessary patch check
Message-ID: <20240412-shaggy-pristine-walrus-319fe3@lemur>
References: <20240319045332.2304950-1-Frank.Li@nxp.com>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240319045332.2304950-1-Frank.Li@nxp.com>

On Tue, Mar 19, 2024 at 12:53:31AM -0400, Frank Li wrote:
> This just run script/tools/checkpatch.pl

Hello:

Thank you for your contribution. I didn't end up taking it, because I 
wanted to make it more generic and less tied to the kernel. However, 
there is now very similar functionality in the current master that can 
be invoked with "b4 prep --check".

It's not yet a complete feature, but any feedback is welcome.

-K
