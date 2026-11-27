Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795822343;
	b=DTIHM+C9PJkLwTBCsJh1v9BbgCDc5dEh+0UE28WdqbqmPwZ1y2/TH2sr4sytVJo1wyFr
	 Ow/lfnANTMxNSxH7xcxGdg4xhi9kTjGRXqxlOm4N8u/M1CjphrVYBkLzh46U0FVL5MV4e
	 RpEY88I+rwSmyAIrI8AOcUbprr5Z1ubJfAsdF0MFSV2jdOQk0KKW6cjeHY+c9a2HeSTIr
	 ZRsT4bDVYCFpXK2zTbkvXGypFVmlc4Y5Z7FoROCx3YffOiJJb2IpPZwl2m4mdyoWJtmo4
	 zOiSqk2pPMng4vZ0hqxBEwSML6ygyoWBJ9mVV2vgMQryDn7qk58MlN6sP/QhzVWH9Eg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795822343;
	h=Received:Delivered-To:Received:DKIM-Signature:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Subject:From:To:Cc:In-Reply-To:
	 References:Date:Message-Id:X-Mailer:X-Developer-Signature:
	 X-Developer-Key;
	bh=yxxd0YGbMqrFy0ccZ2UyzOgmnNEKTvx3bmrI7XBS9lg=;
	b=YJpNR3sM0GCQ9LAyIvCNcm3GydUM7BcLR0WPmGnB3h3vW1VwUGDo+BPjYnXcIgfR9lwn
	 vU+DQ+P9iNz56i784cv6zlwskxzExqp3WdbPxwJAhflC9VpwxYfjdvqCzorFrA9pb67c7
	 EJFMLf/qPaD4Lzo2gnQOcmcYBVJowPuVf/aicvjLE3Ip3d9MTQ3QgUGVWOSfzYjOPd4YP
	 iLFyDApFZg7eKHEKtHVksIi0Q1j+pksaPiL89wmc7i6V+ITggFGpaP2cQDwjfohe1dWQX
	 xUkpQxc8YLqeL1MrP0ghaQQqZIWEgPCwG8q7IIADgE0CkqRcmBzsi8JT1KpoaumRdrw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=cleiHlsM;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85034606A31C
	for <tools@linux.kernel.org>; Fri, 27 Nov 2026 23:32:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=cleiHlsM
Received: by smtp.kernel.org (Postfix)
	id 1315E1F00897; Fri, 27 Nov 2026 23:32:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AEEB41F00893;
	Fri, 27 Nov 2026 23:32:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1795822343;
	bh=yxxd0YGbMqrFy0ccZ2UyzOgmnNEKTvx3bmrI7XBS9lg=;
	h=Subject:From:To:Cc:In-Reply-To:References:Date;
	b=cleiHlsMOSrLA1wVjcCRFnN+lff+IS8N73DjLSBweQv79jf+sE6okKrvVolYegjJw
	 KOoCI2yBlddWauGgZilUWv/LaR6ml5hPIvF6NdEVmCPDv1WEgYDbJbiTZy6RHlmbmI
	 2JLaE/dDvPUPpgcxTJ4n81rjYxx2kgWGOEGm5kw8=
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Post: <mailto:tools@linux.kernel.org>
List-Help: <mailto:tools+help@linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
List-Owner: <mailto:tools+owner@linux.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH b4 0/2] trailers: keep comments between Signed-off-by
 trailers
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: "Matthieu Baerts (NGI0)" <matttbe@kernel.org>
Cc: "Kernel.org Tools" <tools@kernel.org>, 
 Konstantin Ryabitsev <konstantin@linuxfoundation.org>
In-Reply-To: <20261127-multiline-trailer-comments-v1-0-ae8360525615@kernel.org>
References: <20261127-multiline-trailer-comments-v1-0-ae8360525615@kernel.org>
Date: Fri, 27 Nov 2026 23:32:17 +0000
Message-Id: <179582233748.831361.6846250850498336586.b4-review@b4>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=792;
 i=konstantin@linuxfoundation.org; h=from:subject:message-id;
 bh=CaH3bhcf2p0wM2mqI7fRsSbs7wdcC4TEM472zcVgN50=;
 b=owGbwMvMwCW27YjM47CUmTmMp9WSGLK5hJkkJrgo7tlZ96T/QJ2Z5hwmvR2WLxZbbZcp47iwd
 FKr66LqjlIWBjEuBlkxRZayfbGbggofesil95jCzGFlAhnCwMUpABOZ5cLwz6jnc59pTdqe2kK1
 pL8eW+sPXxWt4PidENGXfdD1ed+fxwz/K952nXc5Yrt8RnhZTEy8ySl1s6XewklHBJq96pcHO99
 iBgA=
X-Developer-Key: i=konstantin@linuxfoundation.org; a=openpgp;
 fpr=DE0E66E32F1FDD0902666B96E63EDCA9329DD07E

> 'b4 trailers -u' and 'b4 shazam' move [ ... ] comments spanning multiple
> lines, placed between Signed-off-by trailers, above all the trailers.
> Such comments are commonly used to describe modifications made to a
> patch after its original submission.
> 
> Patch 1 keeps these comments attached to the trailer above them, as was
> already done for single-line ones. Patch 2 makes sure such a comment is
> not dropped when b4 moves the user's own Signed-off-by to the bottom.
> 
> Feel free to drop the second patch, it was only useful once for me when
> re-testing something sent for the backports on another branch instead of
> doing a simple cherry-pick :)

I kept it -- both merged with small tweaks. Thanks!

-- 
Konstantin Ryabitsev <konstantin@linuxfoundation.org>
