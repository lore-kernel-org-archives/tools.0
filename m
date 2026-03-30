Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB9273DDDB0
	for <tools@linux.kernel.org>; Mon, 30 Mar 2026 18:43:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774896217; cv=none; b=tLU4KYbV5vZiotzskkkoJXI5v0Ux5cRI/yXdjPikTTqP8pjjM3sWGjN5MyBg2QiczkUTTscKGOZcqtAiMXedWK3b4oZQUSHHEjazqDznRlTGuTpyt1O3aRjeyOmiv+qNiFbEi3DBUsW0QsNQnwyr/ArvgBvhbhQ0TUWcvOf3hr8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774896217; c=relaxed/simple;
	bh=DKAFVlJu3fgf7jWafymrfBMmz6uBvdtXxe28N2UOZVk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Pa4ZlbBvYM0Pxej6BMuUFkwTPJmP0cDa8JsbTRzaq37w+vLuOLLeQ0snRDXfbryzQEv9DEsA0tT2giyZJi4Dm2+JtGY8D3Qp1PE/Int6l6yoyuhneUHgjjyCEyDKxSZDrSsn25/vhySXKzJd8QEBDxMZJyiQajJoJVfDEO4n+b0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ka4dp5Ks; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ka4dp5Ks"
Received: by smtp.kernel.org (Postfix)
	id 68045C2BCB1; Mon, 30 Mar 2026 18:43:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2A5F2C4CEF7;
	Mon, 30 Mar 2026 18:43:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774896217;
	bh=DKAFVlJu3fgf7jWafymrfBMmz6uBvdtXxe28N2UOZVk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ka4dp5KsuVNSxmpqgGEPdTT0lLOe0dpZL4seIDDqcCKFDa2w55y+DnK8dOgNHZJIf
	 wKb+gr1eLcD/DOZx/Q+lLH3npjo7ny3zaAf+w6AMVwehSblu1ILuA05URvVf4D2wSK
	 GBQ8wyZvBhUvuYJiY5nZG24HjL2C/MFgm9mqhGMOCeRis+mf3AtP+LKdK52c0VYxAz
	 svRQmPsilhvRR1IZFWz45LXSNsodEzWe3qe6b9lVK/1gSGBPdALy5zYcOebs1IRLWK
	 EmVxbZQ/FDJ5eL1jFWt8letC9Miw0zpD/mSbvGfIHBxDrrihHbIshN3WsmKx59O9ux
	 ej0onOkXoRwEg==
Date: Mon, 30 Mar 2026 14:43:28 -0400
From: Konstantin Ryabitsev <mricon@kernel.org>
To: Ard Biesheuvel <ardb@kernel.org>
Cc: tools@kernel.org
Subject: Re: another korgalore issue with linux-crypto
Message-ID: <20260330-uptight-leopard-of-awe-ee7afe@lemur>
References: <c4de9f25-0c60-49e4-925f-7749eba57264@app.fastmail.com>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <c4de9f25-0c60-49e4-925f-7749eba57264@app.fastmail.com>

On Sat, Mar 28, 2026 at 06:53:44PM +0100, Ard Biesheuvel wrote:
> Hi Konstantin,
> 
> Not sure whether this happened because my local fork was in a funny state, but I got the following issue related to a 'rm' commit.

Yeah, I think it's a real bug, but testing is tricky. I pushed a commit to
master/stable-0.6.y that should hopefully fix this (or, at least, make it fail
differently). Can you try that out? Using stable-0.6.y may be easier, as
master currently pulls in a new library.

-K
