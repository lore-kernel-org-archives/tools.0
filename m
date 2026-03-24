Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C95683A6B8F
	for <tools@linux.kernel.org>; Tue, 24 Mar 2026 18:39:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774377562; cv=none; b=EaFoqSc/stPma6TpiwI82pC7ueloU+VPPyK2prsjJJAZhQmtgqKwfger6WY94J9v2naifh2t2vCdYUOA3N5Ts5/NWMp5QEn0svPL9XdEnxeEGtabfLclcb32dRt/jKVmpOQ3wZYyNBqX7Wv0UtR6AXPTeZqLRsE9ZJYhudkuBAQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774377562; c=relaxed/simple;
	bh=uPGGQjrIqgX4q0i8CMj8ytfJk4EN2I2Xop9JUMsXkMQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FbWo+2ir1LREQTJX2iGMD7GeWUJB6d5bSiFGVb8jk/z+secuUhPWXXdifRdyyX4BRsdb2bUXCE2Mcv/L/oXhIgn1AH5mNkH6t9jP0/ANRfE8iLk9UcwYtI56GzSKYgBeDWIkZLPvnEWfa9C17w2V27jSUhFFLwVxHKBzqGG/mSo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=qZVIHXSw; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="qZVIHXSw"
Received: by smtp.kernel.org (Postfix)
	id 6DCF7C2BCB1; Tue, 24 Mar 2026 18:39:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 40272C19424;
	Tue, 24 Mar 2026 18:39:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774377562;
	bh=uPGGQjrIqgX4q0i8CMj8ytfJk4EN2I2Xop9JUMsXkMQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=qZVIHXSwPawJ23W1wugZxcUJrCRbPYtX1yW3yLQc4WpiAo63XqEY/EJAUpbN8IBUE
	 4B5hnK+EDo7MFNYtyJIrXLhVdGXKJxhRuWKDchvGxPHQDBUscnsV8cv6k4U2ocA1GV
	 newI9yFQJuVOuXf7YvM93CNS84MmftMvmz2WYO7QZQAgxyZiQLU8hvf5KNJKKKJrU8
	 49v81DuAUkRJyZZKVyGTT91st+MsdAZKzdDzsq5UWhRcFVmskYPKyfmNP64w3+u1WS
	 Bxx8ieSieu39ArAMfQbgn1oHxwBZfk6Re1k1rXE0R/P+uj/XOndt3ehJCufSSraAM0
	 Khd+zNF3nLD5A==
Date: Tue, 24 Mar 2026 14:39:21 -0400
From: Konstantin Ryabitsev <mricon@kernel.org>
To: Mark Brown <broonie@kernel.org>
Cc: tools@kernel.org
Subject: Re: More non-interactive operations
Message-ID: <20260324-masked-imported-taipan-f665ed@meerkat>
References: <c5b1ef7c-047f-469e-bf5b-bd385b21bc32@sirena.org.uk>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <c5b1ef7c-047f-469e-bf5b-bd385b21bc32@sirena.org.uk>

On Mon, Mar 23, 2026 at 06:35:21PM +0000, Mark Brown wrote:
> There's a few things that feel like I should be able to script doing
> them, rather than having to do them in the UI:
> 
>  - Update all
>  - Sending queued thanks messages
> 
> Especially with the thanks it seems like I ought to be able to have
> something that kicks the queue whenever I do a push rather than having
> to manually remember to do it.

Do you want this to happen even when the UI isn't running, or just an
occasional auto-task from within the UI?

-K

bugspray tag b4/review
