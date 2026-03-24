Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 642B435AC3D
	for <tools@linux.kernel.org>; Tue, 24 Mar 2026 18:29:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774376961; cv=none; b=pWM57TEd9BK5hEy1LpJIw3R80FyVJTl6XQE8lFZhKQAMKN5vGaxtjeQj6fhRuv3FFUzVb0EuZ42sKmKOczJePK/mHanIXhG6MbKBcuRGo8S7ryQRwSWNoDyxIyZMLBFR9Si/MDuJwxLqpTi5lY8VZlLYe0jX07AChO9p+yDSzCM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774376961; c=relaxed/simple;
	bh=kcbeThGwkkX+boJ+xga8EopuJW9g13sZ1vPXBcERSco=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fwPCREcCghngq53vJZwPNdVfbSpdz2MVyrtXtH12+EvFwveTPReeQr1V20ZQWvMd5PTYovrTeSVG5tARCrKNXXdSOCZdZt6+9FEwHq9P+0uGYnMFUDiSJp+eTECtcc5F1k0jHtxnyIFxqKSOgslakJ2MnpcEIPVl24eIcTNJ78E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WBngdJlB; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WBngdJlB"
Received: by smtp.kernel.org (Postfix)
	id 27768C2BC87; Tue, 24 Mar 2026 18:29:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ECE0DC19424;
	Tue, 24 Mar 2026 18:29:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774376961;
	bh=kcbeThGwkkX+boJ+xga8EopuJW9g13sZ1vPXBcERSco=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=WBngdJlBNjiaVIeLQIWla7B0j7Z4ToAYOpErfblGmom0CUSExE+ItWtbrjrH7cSZF
	 w0BxFt5PQAGdLnLlpR8d284VLPXXDYj+wFR85Ro1IGp4oZn6kMbbtEc5Q9XGrhJ67q
	 PqAd1ZSOi5z+sTtWZUGe8pieNQlvhSovhIbc6GxV8MsP++x3nYO10kzzP98LzCpYCR
	 0fwNIl7kkem3OazBpgA+UAdnTiQetC2BHoudAdiqR7JlL9c6PSqHV3GnTOn27fpxrh
	 C2/t6Tl77m7mXCiOmRP/4buctGU4WoJ6mU8ac0XZ71EH36rbqemwmtOYnC5KEeVE/R
	 zcHuGa1dWxpkQ==
Date: Tue, 24 Mar 2026 14:29:19 -0400
From: Konstantin Ryabitsev <mricon@kernel.org>
To: Mark Brown <broonie@kernel.org>
Cc: tools@kernel.org
Subject: Re: Clarity of pending sashiko reviews
Message-ID: <20260324-bright-hasty-shark-7a3f50@meerkat>
References: <f4c4741d-0795-4e8f-abd3-420ab849dbdf@sirena.org.uk>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <f4c4741d-0795-4e8f-abd3-420ab849dbdf@sirena.org.uk>

On Mon, Mar 23, 2026 at 04:34:40PM +0000, Mark Brown wrote:
> When a Sashiko URL is configured (should that possibly default to
> https://sashiko.dev?) but it's not yet processed a patch then it
> provides a warning "Review in review" and links to the specific
> https://sashiko.dev/patch/NNNN review.  When the review didn't happen
> yet that's a 404 which isn't good, it would be better to link to the
> https://sashiko.dev/patchset/MSGID URL.  
> 
> Ideally Sashiko would have a page at the per patch review, assuming the
> URL is usefully discoverable, but probably b4 can detect the 404?

Yes, the integration is fairly minimal right now and will already require
adjusting if/when sashiko.dev starts sending public follow-up emails, as they
will start to clash with the ones we're loading via the API.

bugspray tag b4/review

-K
