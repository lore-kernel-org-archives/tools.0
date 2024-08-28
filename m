Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8DFC2D600
	for <tools@linux.kernel.org>; Wed, 28 Aug 2024 14:23:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724854983; cv=none; b=JXEwWj/Wq8/izrrwdID3g9wsm7pjKsT/nVDfal49Sc54eIMZ7yymwhVaWkMITr3jKJXMt4KLw8L2qk/ju62nLDyauJsBjd5qAbxrGQLR9MPtXBmQfBupwbwLKNBS0LIUNV85hklTrz4G/pGRY1+OQCj6go6hiTzL/bllay1u9wg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724854983; c=relaxed/simple;
	bh=FIIBfUvACDlU18ZuHMSL9Qa9KObLSOG/B9ae+2iPLwU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ohXlqLpOuV1e671cO06u5rW55+hP3ueFbq1NPhArnry17ZU/0ssTDBp4As+SAYpqIzLJmqSwpaJaX2fh5X9DRJqoATXfivbMHOObHAHXsFRvbnznAC64ciDBVHUhJTwD9JKNPxCGSL6XUBzYSDgY5ZjAb8XA0SWtYedITIguK98=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=JdoN3Yzh; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="JdoN3Yzh"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1F68CC9039A;
	Wed, 28 Aug 2024 14:23:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1724854983;
	bh=FIIBfUvACDlU18ZuHMSL9Qa9KObLSOG/B9ae+2iPLwU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=JdoN3YzhGak5bRAEvvFFEi/WVEvPTqfe/n8tgFPEH2Jvt6bDvd+NzsMZIvKVYo4cG
	 JIi61OlHX2pHqR/F8iMOSAJJzp34gKiZZ3a+umARpvhuiajEhvcZSfL0RPZuYoDdNf
	 8BFb5Uwp7rhPK+xPbCcKersOxgmu9DNuPkG8RRr0=
Date: Wed, 28 Aug 2024 10:23:01 -0400
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: Mark Brown <broonie@kernel.org>
Cc: tools <tools@linux.kernel.org>
Subject: Re: Option to filter trailers in b4 trailers --update
Message-ID: <20240828-slick-attentive-lemming-6afffc@lemur>
References: <9e5ae790-9c8d-4ee6-a85e-9ac1e32ac24b@sirena.org.uk>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <9e5ae790-9c8d-4ee6-a85e-9ac1e32ac24b@sirena.org.uk>

On Wed, Aug 28, 2024 at 02:26:03PM GMT, Mark Brown wrote:
> Hi,
> 
> It would be useful to be able to specify a set of trailers to exclude
> from b4 trailers --update for the case where you are collecting review
> comments.  If you've had some Tested-bys which have been invalidated by
> addressing review comments you might want to pick up further review
> trailers without getting the Tested-bys.  You can fetch them and then
> remove them later but for large serieses this can get tiresome.

I can think of two ways to do this:

1. interactive mode where you're asked whether to add a new trailer or not
   (and optionally remember the decision)
2. a non-interactive command `b4 trailer --ignore-from <msgid>`

Which one do you think would be a better experience?

-K
