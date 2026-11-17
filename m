Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794954276;
	b=m0y+tjdzLTCNhAuOOEJK/HMUMu+wRdthSDjpBIHVC7Wrpom4aokZHhM3x1rtmoyo3waw
	 9iwyZ7uB+GXwJITS4e7onTDW7czpRfXO6PRM9BaoukjhlWX0vLDXSN2rH25PLP/HNg2hW
	 ebi6Q/uS7KjmTSqOUW+WW1f48zVQoAhcGoz2a06ajwj1gXdIXW7ziPc37m2r2BP6HRbkB
	 8zyrci9Am7MEFcGgvDXtgSQC447editcDrJfMPXHnd6Fj6Y8+j76yVqOIUyh1ZIPplHE+
	 jZjTTY4WyZjD5CS6AXZTnGucOgN+emH0INr2yM6DG/2VkQls6SLsiyuZxRJ2OE1CcqQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794954276;
	h=Received:Delivered-To:Received:DKIM-Signature:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:User-Agent;
	bh=ORwMLyBW3pP3lH5QvBjkf7owK8cGw2H3u0qwI12YdMY=;
	b=4x7rdIVrN2aM7FGQZADN7LgV0rJFYbup1y0jhQYsq4EdHOuTC7bTeIsJezR3PoicZ4SF
	 qT75Cy3R6LjXZWWo+wN7J6zOPmmKZOwQHR00NERcYc6MheJLh45BVCPaNDA98Er5qMEfl
	 9lj8EXpYBUO6EcRTUsNyfa2SdJ9LfXDwuTZCe+UQRkmCg2Q1iF4xPhyRnGOv3pqvVH9Sw
	 G9KA0QhtWG/YCWK4CCfNlGj2u1GSinnjeGgC1bEtyz35DmOEnTq2bLkI2sOeoIVkPOk/H
	 Q6xLG6xMDi3se/T/mrx7PkhxwJ1CO2yZOOO7NszgDTXO/rT1rqlchxP+tavlmOp/xPw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=XQjBFo3h;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70FA2606A31C
	for <tools@linux.kernel.org>; Tue, 17 Nov 2026 22:24:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=XQjBFo3h
Received: by smtp.kernel.org (Postfix)
	id 10CC71F000C5; Tue, 17 Nov 2026 22:24:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8D9CD1F000C4;
	Tue, 17 Nov 2026 22:24:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794954276;
	bh=ORwMLyBW3pP3lH5QvBjkf7owK8cGw2H3u0qwI12YdMY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=XQjBFo3hL/rRH8u+8Dhy8zNyobQ29PM714cJ/hZvZ/okcpWHNj4yswNn8jLGZEClR
	 lsGv8sxWVL+C9O7GuH2CwCaFs9nFMl9xRmDJNf5EztJei9Flkoz1w/l9q7lf2ixdSu
	 RN3tBur+eQFXQXSiEdp5w3Hlw6TKPvsGJSHd+W9nmtXefz/y6Nbizj2URcswicb7UK
	 235p5OGpd4wFdLtn9fiunYpRir4mtn/Baq2nLou4Y5ATPQaclj4MMDej0G6+jzxuvr
	 nJiFvKOcfoqfJ0DMBuczcsIMgdP94HVVuuAU84T2PF9CWDYNJ2ukTnD+l+R2DcL6R7
	 X3AUV9Z+nj6KQ==
Date: Tue, 17 Nov 2026 17:24:34 -0500
From: Brian Masney <masneyb@kernel.org>
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc: "Kernel.org Tools" <tools@kernel.org>,
	Jerome Brunet <jbrunet@baylibre.com>
Subject: Re: [PATCH b4 v2 0/2] review: add support for b4.send-me-too
Message-ID: <avzUIgdH1te0Gpt2@x1g10>
References: <20261116-review-send-me-too-v2-0-3e1e305e3272@kernel.org>
 <179495355454.997809.5612394401362326937.b4-review@b4>
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Post: <mailto:tools@linux.kernel.org>
List-Help: <mailto:tools+help@linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
List-Owner: <mailto:tools+owner@linux.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <179495355454.997809.5612394401362326937.b4-review@b4>
User-Agent: Mutt/2.4.3 (2026-10-09)

On Tue, Nov 17, 2026 at 10:12:34PM +0000, Konstantin Ryabitsev wrote:
> > The contributor side of b4 already has support for the configuration
> > option b4.send-me-too to make sure to include your email address on any
> > outbound emails. Let's go ahead and extend this to also work with the
> > review and ty sides of b4.

Thanks, Konstantin. What you have looks nicer than what I posted.

Brian
