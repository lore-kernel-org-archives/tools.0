Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 154FD23E25B
	for <tools@linux.kernel.org>; Thu, 23 Oct 2025 20:17:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761250673; cv=none; b=KnCS4SS6OiZdURl9R9/vVGuH6dJD3cPuHo8tHm08hWEKIld+jmH8eS06WwQAf82ElsRAczxdWUnLczzci1pFaqKZqIAd/fW8HLoQ4kqc59eWHi19et7hFmrPMQMmS90It1X5naxDP69aXiz8uIDc0ODpT/1BaVYaaQqWi8CdCiE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761250673; c=relaxed/simple;
	bh=njbNCxSxtSKqW1rvLNfxm38+SC+jR2XMoX0gtjibeTU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KuTCeHlvee9zvSpblFllkfC+MMxsp3On7SI/M5KCZcRUKipjbw19NdXmCSpa47Xrvv1IJd3mwni2aZNrfJqGK8iGRMbViZmkcprLAfP5cZhM2vX0JTFbVOozycsqnzbcI4+YgCbcZU6yNF7VOVeoKg9oNaRaPobithqyBm8XF04=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=H0vngsoj; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="H0vngsoj"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 746EEC4CEE7;
	Thu, 23 Oct 2025 20:17:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1761250672;
	bh=njbNCxSxtSKqW1rvLNfxm38+SC+jR2XMoX0gtjibeTU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=H0vngsojmZjC3GiM1DdWQC+yaliTr0FKq3dl9PqOB4LlUalL10XHKPe7mcOZeKInt
	 3CE9h7i0deIe98EU2IBGkltL1DVGLMmHzTD35gkZ4J0wJqGCU5aQ5Wh3KG9R+SO3J6
	 gQWnoeJGNqQIljJpAQvVE522o96ohQoF7M9vmX5s=
Date: Thu, 23 Oct 2025 16:17:51 -0400
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: tools@linux.kernel.org
Subject: Re: b4 prep (via pipx) does not recognize branch on >=0.14.1
Message-ID: <20251023-petite-obedient-caterpillar-d9ccbd@lemur>
References: <ee6bab51-84cf-42c4-8ace-dd895f7d9318@kernel.org>
 <5bbab620-b942-4fd6-b15d-42b39736b01c@kernel.org>
 <20251023-crouching-tangible-jacamar-e4f01f@lemur>
 <e9f8b15a-ad1e-47c0-ae2e-837c85c7b307@kernel.org>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <e9f8b15a-ad1e-47c0-ae2e-837c85c7b307@kernel.org>

On Thu, Oct 23, 2025 at 10:12:05PM +0200, Krzysztof Kozlowski wrote:
> $ git log --format=%ce
> krzysztof.kozlowski@linaro.org
> 
> But apparently mailmap affects b4, just like it affects git show:
> $ git log --format=%cE
> krzk@kernel.org

Oh, you're right -- I messed up when I was testing it (added a .mailmap entry
in one repo, and did "git log" in another one, whoops).

I'll add --no-mailmap to the call where we're looking for the cover letter and
I'll check if anything else is going to be similarly messed up by this.

Thanks for the report.

bugspray tag me

-K
