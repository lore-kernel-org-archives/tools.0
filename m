Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B83444A32
	for <tools@linux.kernel.org>; Wed, 11 Feb 2026 15:20:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770823224; cv=none; b=qlbTzoptWPH70LHQuAsucjvqw0pV2LvYifJizDM/gUpCk0poO/I8khAg2FHBnOZYQVcQHGvZrP6PqEwxgrkCxvpBC0M/laTKVbmHXi+UxXRgBUqi5LMCWxmpcKDdVUHHc5gelS78hTckvwPXGYePhhA9jTFq8xKvk6SGeNS8sDw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770823224; c=relaxed/simple;
	bh=R8kWmp9g9g5gxEcp0LjPk1x3Of8WN7meV2iC233N6z8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=TonoYF5xkVtp9pQv0zxjSoNqj3s5iZq88gi0Mye5WahFB9bbtBgzIraIofEkqqLUf/DPY55vlBzlYWenvGzLG13gveDBd+YDZqkTKNE8md1HJ357i6eTyer5AU4g9CeQssbh/4VNHaowK11GSlvMfTa6e9tGPG0+HRNptIF+ZZ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mqtPWu4f; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mqtPWu4f"
Received: by smtp.kernel.org (Postfix)
	id 65FF6C16AAE; Wed, 11 Feb 2026 15:20:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6B865C4CEF7;
	Wed, 11 Feb 2026 15:20:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770823224;
	bh=R8kWmp9g9g5gxEcp0LjPk1x3Of8WN7meV2iC233N6z8=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=mqtPWu4f2MbGYZPpMzt7pjv2xFtWxoYic2FZFHnCqqMOUoQbDQ0bxHVCpgMqBSqHM
	 XWZCqEtab1p7AoRHi+mCo8b/TkfhP6yAcBEF0Gml7bMHwy0rEMdBnghZ5A1AZBt/Ll
	 OZFiN6QXp32FCHX89hCH8K/w3JM8f3jnNU0IW52SaZ47FzvwHcy/SCVm76uM6pJ0qR
	 9HCxbkNK+911e1xWvxAdtceXgbBI5x86i8nVsy4zQj9U7WlRkaZQSrPf4Jw9WT1KZL
	 5bHYuO9wileXFYt3RihLMRoxN9uKHzEJWlYgQ8O/pcbMbWR38tntUp/97Y6NrAyYHW
	 b/9bDCusADxrg==
Message-ID: <bc8445cc-f57f-48c0-b45a-747ac916d5b2@kernel.org>
Date: Wed, 11 Feb 2026 16:20:21 +0100
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: korgalore bug: Feed state not found for lch@ list
To: Konstantin Ryabitsev <mricon@kernel.org>
Cc: "Kernel.org Tools" <tools@kernel.org>, Andi Shyti <andi.shyti@kernel.org>
References: <695ccea6-bb19-4f6d-99cf-1d898b53b1cc@kernel.org>
 <20260209-hungry-phenomenal-unicorn-1ad4be@lemur>
 <c3dcff19-7f6c-4f09-ad63-c3af15e8c5f6@kernel.org>
 <20260211-gigantic-aspiring-jaguarundi-aeddcd@lemur>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 a/A=
In-Reply-To: <20260211-gigantic-aspiring-jaguarundi-aeddcd@lemur>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 11/02/2026 16:14, Konstantin Ryabitsev wrote:
> On Tue, Feb 10, 2026 at 05:30:31PM +0100, Krzysztof Kozlowski wrote:
>> "/home/krzk/.local/share/pipx/venvs/korgalore/lib/python3.13/site-packages/korgalore/lore_feed.py",
>> line 77, in clone_epoch
>>     raise RemoteError(f"Git clone failed: {output.decode()}")
>> korgalore.RemoteError: Git clone failed:
> 
> Ah, so in this particular case I wasn't testing with the actual --shallow
> parameter, which is why I couldn't reproduce the failure. The problem here
> is that the lch list doesn't have any messages since November 2025, so when we
> try to clone it with --shallow-since=1.week.ago, we get a clone failure.
> 
> There is a workaround for this situation in both master and stable-0.5.y, and
> I can confirm that setting up the lch list works without a crash now.
> 
> If you can confirm, I will tag 0.5.2 for the release.

I tried master branch and works, thanks!

Best regards,
Krzysztof
