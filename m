Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EDB32EAB8B
	for <tools@linux.kernel.org>; Fri, 27 Jun 2025 17:04:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751043895; cv=none; b=r4cFzuFuUB4KhW4hs9r9XISndvbgLAj/d6W44/Ijysv7qdXRg25I5AUrEhAZ5P9kszF833VZp5Pg6Sx3Lg3kbhP41hNG6C8c2FEoNOfbvh84ZToRbHc5eqSoHcsLq4W/OYInmm7/Cl1QXBKhJ3/Rt80gKciot8tR8TL8ZtqQRlA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751043895; c=relaxed/simple;
	bh=Lw1j5F4rIsnJEqYWngjKPZcFGJitTkGxrhc9V7tH5Sg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iAqLGLQ3jH/gU7m+CfLUyJKD/UfPk7R2WDFbwWpp6qQJZ6hPwUV/uybchusvazqoUd1MqgjEofDEst47WOewzpyL4xr+Acfoynt4Wnj+4inloocZXVYg1fYx0Kq8CmFo9JArqoguHsA+El6+B4KCdxW/pdJJleGfAwEX5FnMe7M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=L68J+lc/; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="L68J+lc/"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C4607C4CEE3;
	Fri, 27 Jun 2025 17:04:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1751043892;
	bh=Lw1j5F4rIsnJEqYWngjKPZcFGJitTkGxrhc9V7tH5Sg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=L68J+lc/msU1BS1xZv48pypWtYwlViJWa6jjhRZNlRA+RuKamiGXjHczALMTQM5eQ
	 kDAACOqsQeKIR9S/nbqcxc+t6YneHO71CO48IafwfCsmh+/Ie7x+kX0u2l6hY8888y
	 dzlvMyJTWllM/HOLREQ3wi8nRit+wP4/Xk3iMTRY=
Date: Fri, 27 Jun 2025 13:04:51 -0400
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: Mark Brown <broonie@kernel.org>
Cc: tools@linux.kernel.org
Subject: Re: b4 trailers doesn't work with imported series
Message-ID: <20250627-xanthic-crane-of-honeydew-f599df@lemur>
References: <2491bc09-da6c-43dd-b8ce-e5c137294f68@sirena.org.uk>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <2491bc09-da6c-43dd-b8ce-e5c137294f68@sirena.org.uk>

On Fri, Jun 27, 2025 at 06:00:54PM +0100, Mark Brown wrote:
> Hi,
> 
> With current git I'm seeing an error trying to shazam one particular
> "series" (a single patch with a cover letter, which does normally work):
> 
> $ b4 shazam 20250627164348.3982628-2-mathias.nyman@linux.intel.com

Ack, can confirm.

bugspray tag me
