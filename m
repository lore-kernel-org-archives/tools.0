Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77F9D2C21F7
	for <tools@linux.kernel.org>; Wed, 11 Feb 2026 15:15:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770822901; cv=none; b=MxdId36IQMATBN/XvCAmxl3VOAsEV5yHLFxWd5tGfm6sobZIgYktRVj2K3Z9WUWWwcfjyIIZL8Mu/b/2ZmKdWFMOFlDiys3U+6TQ97EeGC+wIBqWLxx1bT/DAIcUYeIN2vULarOeHp0UTT1OM+tVk213eC5eBa8fFYRLVSoq3UU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770822901; c=relaxed/simple;
	bh=Mi5FFnDFMOAqPWolsi/DMizWNFf5XzqvrQKvxEeCk5s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FBwLP01L8ki5uxa/tha0RUQwfZ43QwcMq33XL04lRuexFJfNpneweiRtgDgSriYDPFhdsUg1nqZEcMFgwAKHFtXIec6gYMeLFAd93vzyZxEC3qKQ2IOhHPp5KBYQ/A6R8HpoRZEarKNoHEy+D1acyEhDWNKfs4haYhBMlQdbXPo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IuG/dcFt; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IuG/dcFt"
Received: by smtp.kernel.org (Postfix)
	id 2E3E9C2BC86; Wed, 11 Feb 2026 15:15:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E6569C16AAE;
	Wed, 11 Feb 2026 15:15:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770822901;
	bh=Mi5FFnDFMOAqPWolsi/DMizWNFf5XzqvrQKvxEeCk5s=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=IuG/dcFt4HN1XLrDoEVW0E918IKo8cWc4MMXi0dBJ5PbDXEXmG6B2K6AQCm2sjhN/
	 h8PoVXh1hQnYwikTPwdWNkMeqZ5dOTniXdq/iORLYSHa3YU8EL0xzE7/DXjoHpGdMa
	 VGEDxeVfsDFUBCcI31BgXEBOvWzgSy+X44zj1Tehk6fTRyDdJbfx5b2B117ftWXg8g
	 ZjvPZoRwFia5GHXhSEedoue6Hozi9kCpkPb6IPcvcWNO+HLKU4BGBN5oMxGFUgKJU5
	 UuypBFIhISxNRvt5m4SapW/D+zw8o3ZjsvcFVXyN98yKXGyHRgOVguac7xyNrL8kUD
	 EnK2BoUxFi4xg==
Date: Wed, 11 Feb 2026 10:14:59 -0500
From: Konstantin Ryabitsev <mricon@kernel.org>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: "Kernel.org Tools" <tools@kernel.org>
Subject: Re: korgalore bug: kgl pull fails after kgl track
Message-ID: <20260211-zippy-corgi-of-love-0e6c3b@lemur>
References: <e7330b25-1e9d-445f-a1d4-e50a1ce0ddca@kernel.org>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <e7330b25-1e9d-445f-a1d4-e50a1ce0ddca@kernel.org>

On Wed, Feb 11, 2026 at 11:05:44AM +0100, Krzysztof Kozlowski wrote:
>   File
> "/home/krzk/.local/share/pipx/venvs/korgalore/lib/python3.13/site-packages/korgalore/cli.py",
> line 800, in retry_all_failed_deliveries
>     for delivery_name, (feed, target, labels, subfolder) in
> deliveries.items():
>                        ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
> ValueError: not enough values to unpack (expected 4, got 3)

Thanks! We're now testing for this condition and there's a fix in master and
stable-0.5.y.

-K
