Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 216A3283FEF
	for <tools@linux.kernel.org>; Wed, 24 Sep 2025 08:32:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758702758; cv=none; b=LpGs9Oue84uhunN8bV54WJGNTfJoEME/Nr3fHzmJqw2R83QPaUsn+6ADIjlgIr/QnhnmoM75K4jpmaxvxd8PD/TVx9HD1sAkbt+MzBSEv+cuC96x/+HtNopQ/ARgjihuqcf3T2JmvTU6OsI16jG/GT47pZYSmRd2jMI7020nXQo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758702758; c=relaxed/simple;
	bh=J1Qi29gBiQ1KMEt7/4mW6m4UCGn9pd0e+eT2+hlf424=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=XIPFvwhRQcOCCTfYY8RcGiDGEy/2cHhsiqLbxPkevoB6S0HqGN85W2s0nqngcpdRGdPOUkPICGFGKJDVA4d1cfPMQsaKAep5yyelp3zfWSidPSswCSKMQovuAXrnDJfpgeLQFoQD3Jq1zsfOOstSfEURPmGfHPSl6grJ3xap7yM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=r4buuJXg; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="r4buuJXg"
Received: by smtp.kernel.org (Postfix)
	id C64F7C116C6; Wed, 24 Sep 2025 08:32:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 59297C4CEE7;
	Wed, 24 Sep 2025 08:32:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758702757;
	bh=J1Qi29gBiQ1KMEt7/4mW6m4UCGn9pd0e+eT2+hlf424=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=r4buuJXg/dy1J4IQv1P94NDSSLmqV+dLk/TakHFZPthogl4wA0iGG3unOq1dfGzvx
	 npW71NuS+30BkKh9hIZUm5CqS1yU6cLKaChE2HAqgbEZ7cqDDDE/z4nvueaZgmXOd6
	 Hb+MR6ww9ybEEy1YTPdJ980J9iLrnI4MmjIl7UHbjyU1CbU5D/B5OKt03kYcAAQFhg
	 gdfrsZgcNY5oUlSWWH8GX6bLOnDIpg1mQlNFW5+c63MljPDl+aBMxClFjbb9LTJMvA
	 cjjixKj6sv/nDariUyAMNQM+kuujF+rIp76NW7174ZEPlrknCSXsq4HD74Lx7dwi7q
	 vS/kLHjgFjssQ==
Message-ID: <765d72bd-395f-462c-9c04-d2dd98244845@kernel.org>
Date: Wed, 24 Sep 2025 17:32:35 +0900
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 00/20] can: netlink: preparation before introduction of
 CAN XL step 3/3
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc: tools@kernel.org
References: <20250923-canxl-netlink-prep-v3-0-87a7684333f3@kernel.org>
 <13f98eed-b535-4360-a545-0a11dbc8aa12@kernel.org>
 <20250923-rose-shellfish-of-wealth-c8dee7@lemur>
 <715c6b6d-5672-4ba4-99d1-04fcd1dbb81b@kernel.org>
 <20250923-impossible-splendid-rabbit-ba01ba@lemur>
Content-Language: en-US
From: Vincent Mailhol <mailhol@kernel.org>
Autocrypt: addr=mailhol@kernel.org; keydata=
 xjMEZluomRYJKwYBBAHaRw8BAQdAf+/PnQvy9LCWNSJLbhc+AOUsR2cNVonvxhDk/KcW7FvN
 JFZpbmNlbnQgTWFpbGhvbCA8bWFpbGhvbEBrZXJuZWwub3JnPsKZBBMWCgBBFiEE7Y9wBXTm
 fyDldOjiq1/riG27mcIFAmdfB/kCGwMFCQp/CJcFCwkIBwICIgIGFQoJCAsCBBYCAwECHgcC
 F4AACgkQq1/riG27mcKBHgEAygbvORJOfMHGlq5lQhZkDnaUXbpZhxirxkAHwTypHr4A/joI
 2wLjgTCm5I2Z3zB8hqJu+OeFPXZFWGTuk0e2wT4JzjgEZx4y8xIKKwYBBAGXVQEFAQEHQJrb
 YZzu0JG5w8gxE6EtQe6LmxKMqP6EyR33sA+BR9pLAwEIB8J+BBgWCgAmFiEE7Y9wBXTmfyDl
 dOjiq1/riG27mcIFAmceMvMCGwwFCQPCZwAACgkQq1/riG27mcJU7QEA+LmpFhfQ1aij/L8V
 zsZwr/S44HCzcz5+jkxnVVQ5LZ4BANOCpYEY+CYrld5XZvM8h2EntNnzxHHuhjfDOQ3MAkEK
In-Reply-To: <20250923-impossible-splendid-rabbit-ba01ba@lemur>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 24/09/2025 at 04:50, Konstantin Ryabitsev wrote:
> On Wed, Sep 24, 2025 at 02:54:36AM +0900, Vincent Mailhol wrote:
>>> No, I think something else went wrong here. You did list
>>> prerequisite-change-id, but it's only a 4-patch series. I'm not sure where the
>>> other ones came from. Can you push your b4 branch somewhere where I can take a
>>> look at it?
>>
>> Thanks for jumping in this thread and volunteering to investigate. This is kind!
>>
>> I pushed the v3 in my tree under the branch:
>>
>>   b4/misterious-prerequisite-patch-id
>>
>> https://git.kernel.org/pub/scm/linux/kernel/git/mailhol/linux.git/log/?h=b4/misterious-prerequisite-patch-id
>>
>> I did a 'b4 send --reflect' to double-checked that it still has the issue.
> 
> Dropping others for now, and just adding the tools list.
> 
> What is your net-next/main pointing at right now?
> 
>     git rev-parse net-next/main

  $ git rev-parse net-next/main
  df1526752e0cd8db11b1fd4c1be3bd47409fd3ac

Also, just in case:

  $ b4 --version
  0.14.2

(which is my distro's latest version).


Yours sincerely,
Vincent Mailhol

