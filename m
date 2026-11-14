Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794678037;
	b=P1Lm/bWg3Uh7vKXGOZM1f3f1Bm0RF+xRyp89QRG0UTgLL36VVHJTwNVnlpjLfLzipJPX
	 6X88XWEm8eqLtE29iWe76BSwlHvybz6JhWlDmliVy2pS6kQpCLQKTQ69uxHN4ONGJL35N
	 gz247lwb7vfVzQ1RVyRo2y72WdLloEdqSiLajCboSDvmxMO8EC6sClgo70a3q7P1duhKl
	 JctJyjCIH9vGdzCqaXg/oq+aB3XTaMsxx3x/eXxUpmoUVvKppMhnZYvUN4a6i7izKcOg0
	 JobLKiadfryD+Y9FCcALc7+0/1+x7suCZ458h+NpxP78BUp+w8zEdGpzkmL4/siGBTQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794678037;
	h=Received:Delivered-To:Received:DKIM-Signature:Message-ID:Date:
	 MIME-Version:User-Agent:Subject:To:References:From:Content-Language:
	 Autocrypt:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=de1BVdq+uFF1MFZfZwtp/0eQoxFpO+fwHIhoHnkagkg=;
	b=o9qYEds/SdovLQJIQtnPNEwWYDTNKNFJzMCrbtxRBf6IG7ww8MTbpVWIL18h2qO/OasU
	 bNHLr5i4uMoEadzKS8ZpPaOQ8hqGJjaVK6rSetccRnPrIkhC5U1bab3txZasFGyVidzik
	 AUw2nKQNzRqgoRlHZmcsKXW7I3u32RnlmXG7fINldDFk087hMQQtVTuEeOiUl6PgVUWDG
	 so28hFDQIwPpacTyKQay/GmSUlV4h8239K6vpFiaKGWP3Y2CiIOBZ9llc6LhcxOrGAQzz
	 V+UHfgKh5pO6JZKdpMzZK678ag2m1NFuniX0R5VMDBMp6LVDSQmUbfHH4p4LJ2IK6MA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=iVe9HSCP;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65BAA606A323
	for <tools@linux.kernel.org>; Sat, 14 Nov 2026 17:40:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=iVe9HSCP
Received: by smtp.kernel.org (Postfix)
	id 26FC71F000C5; Sat, 14 Nov 2026 17:40:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D66A51F000C4;
	Sat, 14 Nov 2026 17:40:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794678037;
	bh=de1BVdq+uFF1MFZfZwtp/0eQoxFpO+fwHIhoHnkagkg=;
	h=Date:Subject:To:References:From:In-Reply-To;
	b=iVe9HSCPx0gmFIexheWD3GE8NXeXxW9pJ9bFw9aqcQ8oHKL+cZox+bXqDcqhr6Bym
	 +tFZckhXafV5GtaFG6Pt4/OMefD0j8rrTgd80rvI6mLJqBpNxLgzsTxmgU8Q6KHrrb
	 sF8JcD4z+KIemqEGZkxW6E3gO/cDDKGuJt6aEshT7IHoqpHohopspR0A3gT+36ygsI
	 z2IpBql0lDdElx2p7zOhU+ukcqMbUDJDl0+I9CHD9FChgw2GdYagmduDHEGFsAqEzH
	 beBwjx1B6+ovtkwmI6twzECqnXP0eK5RZlrHr0nTcypcAvlravHo4AJZY6WX2HKeef
	 1bi6Ce5u0IDcA==
Message-ID: <2b1da3e1-939f-4efd-afbb-628f7d6e7a63@kernel.org>
Date: Sat, 14 Nov 2026 18:40:34 +0100
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Post: <mailto:tools@linux.kernel.org>
List-Help: <mailto:tools+help@linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
List-Owner: <mailto:tools+owner@linux.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Should get_maintainer.pl ignore obsolete Qualcomm domains?
To: Jeff Johnson <jeff.johnson@oss.qualcomm.com>, tools@kernel.org
References: <342fd0c1-671b-4487-8a42-44adecda502c@oss.qualcomm.com>
 <b02133f8-4819-4615-b99d-3df8eb1aecb2@kernel.org>
 <3aafe4ad-ce14-4ea7-8bd3-4a9484db6787@kernel.org>
 <fd6aa860-0d88-4e7e-b2b9-7cfbb738cf44@oss.qualcomm.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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
In-Reply-To: <fd6aa860-0d88-4e7e-b2b9-7cfbb738cf44@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 14/11/2026 17:41, Jeff Johnson wrote:
> On 11/12/2026 2:17 AM, Krzysztof Kozlowski wrote:
>> I think I missed partially your point - you do not refer to
>> --git-fallback, but blame for fixes. Well, yes, for that I would just
>> drop entire @codeaurora domain. quicinc.com is still working so for me
>> it is litmus test if maintainer is active.
> 
> Interesting. My access to quic_jjohnson@quicinc.com was terminated, and I was
> told by IT that was true of all quicinc.com mailboxes.


Well, my standard user@quicinc.com works, so I guess you mean the ones
prefixed with "quic_" (quic_user)? That's a bit trickier, because domain
is valid just usernames are not.


Best regards,
Krzysztof
