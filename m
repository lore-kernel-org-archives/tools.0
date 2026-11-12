Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794478669;
	b=iZvAZg+qWJTUSXS/Vcz5fHD/PFHkM2HDKbrRK2N0t+u4KFGxGSWi3jYT6hvlBvJV11dB
	 +seGzLph0zvO79HwQQ5yFiZx/sLvtYmd7zohH1jQ2WkGrVTbF93HC8aE8J8Dbf+B9ZieK
	 0RLKYmu5GlTj5j02wb/rjMYsjX9br5d1Z6NdPfueheBfPunzYuLM+4CbsFSxPbXMHxklT
	 fRy1J+yPAfdSpfFIlaK3FNmHlp1If4Xw2GwKFK5xN6qmDTy0Tafz/rbmJqVp9nhXPxgyr
	 vtjqorlwwSq5ZsqLy42hsC+pXraRE19AbkXVShJ5bSfmP9UQ3K8u4WpMAFCilauDydA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794478669;
	h=Received:Delivered-To:Received:DKIM-Signature:Message-ID:Date:
	 MIME-Version:User-Agent:Subject:From:To:References:Content-Language:
	 Autocrypt:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=D17BVBDEl/CW53HlxffIRILdKvGvROVJHIeDMkemT70=;
	b=UFHFwvrhJqhUgy0rWTgNO9ZCI+s4e3HHeo6skktd25naMJLjuOgDjJrP/6mZ+aKmF3n6
	 lL/37+t3Mr9Y/AtUhvd6aoNP+9NJUU0etR2KeHbkiiPeJPKr4lwFj8WESN6AAqsrNMXZh
	 ef+ODNOxSf7oDL4P0d499H0+WMfQpADXRLrc2h+LYVwW8Szb/KkgAQVRcfvhjNd6WyAak
	 TRo2+bOmFYTHD7Qhw0u5Vi26wWFqGKjP9yxQax0iBfTFwQU7zGlsoKK6AnDvhErYOCHHz
	 lOqPc7HlRFfCPUt76Letx7TQgD6Kp1zE3YZLkJQI+7MnHAC6Zc2PAiTQeA325HlNfJw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=kQtOO9Ta;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9B71606A323
	for <tools@linux.kernel.org>; Thu, 12 Nov 2026 10:17:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=kQtOO9Ta
Received: by smtp.kernel.org (Postfix)
	id 633D31F00A06; Thu, 12 Nov 2026 10:17:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 18A5B1F00A05;
	Thu, 12 Nov 2026 10:17:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794478669;
	bh=D17BVBDEl/CW53HlxffIRILdKvGvROVJHIeDMkemT70=;
	h=Date:Subject:From:To:References:In-Reply-To;
	b=kQtOO9TaBaJEMgg41SsL/fdODYSkkx2ENpvEzJCjGEi7Sn5YmYs9BJo0RXMWkXjjR
	 oCSPtIiDbDQkQvq0X24Td3tkEUak83R7kIgHCTNCwjDosn9NB8hIxRhmUHO/4bcKqu
	 9vn8VibLNSb15EJAkg1Y/Kr/xdcr9ME0qFTfUWvR1TDNwDqK7lCxLDsMILf1bLxmtY
	 0LtZfwbWkczhvuL7xZUjMUY7uRMGxEK71IE1mpm/XWKeuoCNFuuHr6FlhFLzXADpK9
	 3YThFxSPgAbrEtb2BKayhSSCKX1elUDA6REX4CjRt7z5uB6XMd7ahqXeL7ALWtI+3m
	 L4i37NUt+378A==
Message-ID: <3aafe4ad-ce14-4ea7-8bd3-4a9484db6787@kernel.org>
Date: Thu, 12 Nov 2026 11:17:45 +0100
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
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Jeff Johnson <jeff.johnson@oss.qualcomm.com>, tools@kernel.org
References: <342fd0c1-671b-4487-8a42-44adecda502c@oss.qualcomm.com>
 <b02133f8-4819-4615-b99d-3df8eb1aecb2@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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
In-Reply-To: <b02133f8-4819-4615-b99d-3df8eb1aecb2@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 12/11/2026 11:10, Krzysztof Kozlowski wrote:
> On 10/11/2026 19:50, Jeff Johnson wrote:
>> Qualcomm employees have contributed to the Linux kernel from a variety of
>> domains. Current guidance is to use some form of *.qualcomm.com, with
>> oss.qualcomm.com being preferred. But prior guidance was to use codeaurora.org
>> (up until December 2021) and quicinc.com (up until March 2025).
>>
>> The current issue I see is that get_maintainer.pl can return codeaurora.org or
>> quicinc.com addresses in some cases (i.e. via --git-blame-signatures), and
>> codeaurora.org no longer accepts e-mails and quicinc.com cannot be accessed by
>> the engineers. And there are also cases where employees have left, and have
>> not established a new .mailmap entry.
>>
>> So I'm wondering if there should be a mechanism in get_maintainer.pl to avoid
>> reporting dead domains. Or should we just enter all of the obsolete addresses
>> to .get_maintainer.ignore.
> 
> --git-fallback takes addresses from the last year I think, so I believe
> no codeaurora or quicinc woould appear thus .get_maintainer.ignore is
> not a solution here. Addresses are printed (at least quicinc) because
> they are listed as maintainers, e.g. for bindings or drivers (two cases
> for maintainers). Obviously such bindings and drivers are abandoned,
> which is a good thing to learn from the bounce.
> 

I think I missed partially your point - you do not refer to
--git-fallback, but blame for fixes. Well, yes, for that I would just
drop entire @codeaurora domain. quicinc.com is still working so for me
it is litmus test if maintainer is active.

Best regards,
Krzysztof
