Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A01543E5A38
	for <tools@linux.kernel.org>; Mon,  3 Aug 2026 15:17:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785770246; cv=none; b=eXkO6v6Q5521IIMxTYTI/9WlK3thBkShXjQ5N0K7lBOFX9Dl+ffHW5BVbiE5avJdZz6f9DtjCKLg3bjp8nBOJhGJhejpxiP9VknuWM0N6C6LcEkYedXGzuI2Zron89jH+pnK8wkeImP6kgJlyuWu7id5b/qNdJMQnH3813ePpUc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785770246; c=relaxed/simple;
	bh=w8HtnwdQfl1ldVeui2yIgWtBZn74Ng5z4tL3WciX1Fc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IiCyJyeubs4vBoL85hoiNHNUMjtrftw1NvZHqo/4xyf6va3cpl+vjC6ktzcoESS15gVdf9CBEo3/2EDLk/DfdRdffgJz5XfXgRTTsiC+9RykLNrfiZe8kAomO6muuRCNVqCgLSC06t68PZG6FbwLvyO3O276v/SkuvwsZ59iDy4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=vaZ0ChR4; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="vaZ0ChR4"
Received: by smtp.kernel.org (Postfix)
	id 9CA741F00A3A; Mon,  3 Aug 2026 15:17:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3D34D1F000E9;
	Mon,  3 Aug 2026 15:17:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1785770245;
	bh=hUMkYptQQi7Q+4Vcq7Jfpr6ciypmSQgondKRXPYqLrM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=vaZ0ChR4Crww8Us1uDrVvaIvqiPhdOgKAvb1oRDWdwCIZBxzWG5E277gEIVSfsX8I
	 AYM6dOvIXJmbQAbLq8YRHFm2J9KBgd3HJMiAqPgYCVxOo7KSvJ5BTWTdNbEwufp5xC
	 h4VYbzd177HGMx3Bk7rog55koX6WKsG56vJaYPsM=
Date: Mon, 3 Aug 2026 11:17:22 -0400
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: Mark Brown <broonie@kernel.org>
Cc: tools@kernel.org
Subject: Re: b4 review sashkio integration
Message-ID: <20260803-phenomenal-steadfast-cuscus-ccbc4f@meerkat>
References: <24e7e23d-2413-4185-bd5c-b563209630e5@sirena.org.uk>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <24e7e23d-2413-4185-bd5c-b563209630e5@sirena.org.uk>

On Tue, Jul 07, 2026 at 01:47:53PM +0100, Mark Brown wrote:
> b4 review tui can display sashiko comments it fetches from the API,
> currently it displays all comments.  It looks like Sashiko has the
> ability to flag comments that are preexisting issues in the API, it
> would be very useful if b4 could optionally hide or distringush these
> from issues identified in the patch itself.

Most of this is already done, we just need the "optionally hide" part fleshed
out and implemented. I'm going to mark this as an rfe for 0.17.

Thanks,
-K
