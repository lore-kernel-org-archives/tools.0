Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 223B53A1E95
	for <tools@linux.kernel.org>; Mon,  5 Jan 2026 17:02:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767632531; cv=none; b=owKfEHnoRb13vdlltyFsS718IYrCQNfeoTZc3atw0Ri5Kb6v+mywq1tSnHivOJIpEIAIwqUMlSNpFosHihtpbmIULbx8wkFCEiQTGl+SuLNK7W7yGZOxFaZrLXGy3Jrmwg3N9B3liB3cdBRaiHYE3hSzyWnBf/x9wSpARVETTk8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767632531; c=relaxed/simple;
	bh=DCuPPUzVTEK99uXVZoBnH4v946z2RXcd59kgVtb+7Fw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=V+xAyJjxq17vvByVj9jMoPC2dbSLOV9PCfemR0CyBQu2+j7Q6h46ZASjFPZe9KuLI0G0OWa4DEuhw3o2rOfq5KlQpHX5Wb4cK0R4iigOzBng4pU2X88y3nq9PNzvysqt4jIpx15kBZfZGkbQQpRefgUVvbZM+KN/xn27t83aI04=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix)
	id A4522C19421; Mon,  5 Jan 2026 17:02:10 +0000 (UTC)
Received: from smtp.gentoo.org (woodpecker.gentoo.org [140.211.166.183])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 5F952C116D0
	for <tools@kernel.org>; Mon,  5 Jan 2026 17:02:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 5F952C116D0
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gentoo.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gentoo.org
Received: from [192.168.1.154] (pool-96-240-17-61.nwrknj.fios.verizon.net [96.240.17.61])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: mpagano)
	by smtp.gentoo.org (Postfix) with ESMTPSA id 6B3BF340F62;
	Mon, 05 Jan 2026 17:02:07 +0000 (UTC)
Message-ID: <b81c15a5-0030-4ba9-a7b2-cbbdb19d4222@gentoo.org>
Date: Mon, 5 Jan 2026 12:02:04 -0500
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
 <fc0cacbf-d8d1-48d2-8817-d69e6eb3e049@gentoo.org>
 <20260105-ruby-aardwolf-of-glamour-342acc@lemur>
Content-Language: en-US
From: Mike Pagano <mpagano@gentoo.org>
In-Reply-To: <20260105-ruby-aardwolf-of-glamour-342acc@lemur>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 1/5/26 11:51 AM, Konstantin Ryabitsev wrote:
> On Mon, Jan 05, 2026 at 11:40:12AM -0500, Mike Pagano wrote:
>> When I untar the 0.7.0 tarball (for instance), it does not have everything
>> in the git repo in the tests directory.
>>
>> 0.7.0 has only test_validation.py in the tests directory.
>> If you look in the repo, there is much more in the tests directory.
> 
> I'm not sure we're looking at the same tarballs:
> 
>      $ tar -tf patatt-0.7.0.tar.gz | grep '/tests/'
>      patatt-0.7.0/tests/
>      patatt-0.7.0/tests/__init__.py
>      patatt-0.7.0/tests/conftest.py
>      patatt-0.7.0/tests/test_validation.py
>      patatt-0.7.0/tests/unit/
>      patatt-0.7.0/tests/unit/__init__.py
>      patatt-0.7.0/tests/unit/test_byhash.py
>      patatt-0.7.0/tests/unit/test_devsig_header.py
>      patatt-0.7.0/tests/unit/test_patatt_message.py
> 
> Did you download yours from here?
> https://www.kernel.org/pub/software/devel/patatt/
> 
> -K

Thanks, for your help.

No, we are downloading from:
https://pypi.org/project/patatt/#files

I will update our URLs to download from this URL.

Thanks again !
