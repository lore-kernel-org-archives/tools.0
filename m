Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C1C531AAB8
	for <tools@linux.kernel.org>; Mon,  5 Jan 2026 16:40:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767631217; cv=none; b=oGnOrU0q7RQDifoDCNQK3dwihN+P38D2KXw89gUDqrALhZDMTR+dS7A7/QCf82uGWpCR16kHyiH7u/0Z65F9W51Yueld5NL8lwN7pbLmoYImSjI0iM1/ySLCrZl0yZM6WQhYJoAxfSQYTwQ3ixAWGUSd/yGF7Ua0/xhtxIFuEkY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767631217; c=relaxed/simple;
	bh=QY125lqZWTpEZTLmRwgUICrdhmdMdNzW1RQLYas0Kd8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Lw/1ZEgPhO+rlDc32yaYwnOH+4JyvskDgDvS4ofo+y+LVLKAxO5eakYaIyuGRrXM4GMOMJ+FxdQsMq1T+Ei0aoIq9Ibm/fCkO7u/IyC3rk56Ta54wIhkJtY5Ozw/7nU65mGKcT1Cj5hfLbQKcQk/43UH6g6VCcoByW0Gs8kzsTE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix)
	id 76E2EC19421; Mon,  5 Jan 2026 16:40:16 +0000 (UTC)
Received: from smtp.gentoo.org (woodpecker.gentoo.org [140.211.166.183])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id AED39C116D0
	for <tools@kernel.org>; Mon,  5 Jan 2026 16:40:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org AED39C116D0
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gentoo.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gentoo.org
Received: from [192.168.1.154] (pool-96-240-17-61.nwrknj.fios.verizon.net [96.240.17.61])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: mpagano)
	by smtp.gentoo.org (Postfix) with ESMTPSA id 924D5340FD3;
	Mon, 05 Jan 2026 16:40:14 +0000 (UTC)
Message-ID: <fc0cacbf-d8d1-48d2-8817-d69e6eb3e049@gentoo.org>
Date: Mon, 5 Jan 2026 11:40:12 -0500
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: patatt - tests source request
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc: tools@kernel.org
References: <f0fb89e1-a37b-4871-bf0d-23f84ef450ff@gentoo.org>
 <20260105-curious-russet-goshawk-d97fd8@lemur>
Content-Language: en-US
From: Mike Pagano <mpagano@gentoo.org>
In-Reply-To: <20260105-curious-russet-goshawk-d97fd8@lemur>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 1/5/26 11:25 AM, Konstantin Ryabitsev wrote:
> On Mon, Jan 05, 2026 at 09:53:59AM -0500, Mike Pagano wrote:
>> Hello,
>>
>> Would it be possible to include the entire "tests" directory in the release
>> tarballs [1]?
> 
> Could you please clarify your request? The official release tarballs are built
> directly from the git tag, so they should already include everything.
> 
> -K


Absolutely,

When I untar the 0.7.0 tarball (for instance), it does not have 
everything in the git repo in the tests directory.


0.7.0 has only test_validation.py in the tests directory.
If you look in the repo, there is much more in the tests directory.

Does that help?

