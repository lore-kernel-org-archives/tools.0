Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794511701;
	b=fX7XT+Sbs+Y7JDHM1xkO2Kcx7C5zVZ+2l2mO637KybkjW6S8FAFjWKiYd1WpSZ74RirM
	 Q6DlZ6tyidg5pLkt9aeekGKfZt+3h9INse5ZKc/aTcUlvJ8/RLN6AyHGXWUjf50JhT8lY
	 psX7WGDkmYwhiEzNHb3dFVGBRxdjqEh60MFo+yelhG1CjDcc+yT5471PnSQMS9h4PovGO
	 I6GGihF+MTe+UbLrV2qoEIyNOLHIuZlG9v73d9PmXiqfPrTRXLIpDfLs6S9+cMzdDXoyr
	 GIGtdbMztmuHN4LmKVUq9mRleh22vy4X4MKdYuRX4ZKA2c3yWFRLgPyxwjJsWL6UQgQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794511701;
	h=Received:Delivered-To:Received:DKIM-Signature:From:To:In-Reply-To:
	 References:Subject:Message-Id:Date:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-Mailer;
	bh=YTrc6qGMsFF+Trufy9ZIyRGm8i9HifuCCtkUaLz63cM=;
	b=wdj9aMTpL/hqqq67rhFkpDBtzM09SAxBzR9yrAsxBG9GEul/YKKfvEu7YcXsOJOv1Ku6
	 gB98O1JD43oG+6dhmnlBKJDSNWP3NCdLwpK4J/hzU9ecgvy+FjApyJ676jtgtZwnR9BR3
	 fUQ8jpIXjqeJYQ+ugnAkz7dNwwbUFKxIzc6OUxKjyQ5kCJ2ENeS9KvV9ycYGBkF5TaiH+
	 bkwoiMHvRzf8RwKBy/OaPPwTGIvBtzSVHw5H8diDAchlhpR847kmcBt3paOhaGKVuGiQi
	 wIsiCU8ZMViGGIFjkUZcbq8+nH5f1Q0GNICpNuKUTwWXqAPp8lfEq7qZoorUNV4vqtg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=VeXiQvXT;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B5DE606A31C
	for <tools@linux.kernel.org>; Thu, 12 Nov 2026 19:28:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=VeXiQvXT
Received: by smtp.kernel.org (Postfix)
	id DB7D11F000C5; Thu, 12 Nov 2026 19:28:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9D9861F000C4;
	Thu, 12 Nov 2026 19:28:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1794511700;
	bh=YTrc6qGMsFF+Trufy9ZIyRGm8i9HifuCCtkUaLz63cM=;
	h=From:To:In-Reply-To:References:Subject:Date;
	b=VeXiQvXThvbvUGn+xf3Gku6Vp8Amz9nMgakQMKt1a8U6CdpJ9y8ZviVuzSLyCpSzm
	 sssEST5ZXfvfDPJjv4cbl6tNK8AV4DPxZ0Nr1z41/mBVpWYAWUOdWD01FmGbiRxH96
	 cm0gawjwPBsjyF5PmjIoW23fqL+r/pArOJC2CVwc=
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: tools@kernel.org, Joshua Winkler <josh@bemoty.dev>
In-Reply-To: <20261112191000.162374-1-josh@bemoty.dev>
References: <20261112191000.162374-1-josh@bemoty.dev>
Subject: Re: [PATCH] Replace dead distro bug report links
Message-Id: <179451169995.17878.5325371152787278730.b4-ty@b4>
Date: Thu, 12 Nov 2026 14:28:19 -0500
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
X-Mailer: b4 0.17-dev-ce4c1


On Thu, 12 Nov 2026 20:10:00 +0100, Joshua Winkler wrote:
> The Ubuntu help page returns 503, Arch moved to GitLab, and the old
> Linux Mint page doesn't resolve at all. The new links should give
> users a good place to start for bug reports.

Applied, thanks!

[1/1] Replace dead distro bug report links
      https://git.kernel.org/pub/scm/docs/kernel/website.git/commit/?id=ba144a5b84d79074ce5a8c38880d65edd55bf188

Best regards,
-- 
Konstantin Ryabitsev <konstantin@linuxfoundation.org>

