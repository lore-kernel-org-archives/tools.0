Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06F3040BCA1
	for <tools@linux.kernel.org>; Mon,  3 Aug 2026 13:11:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785762683; cv=none; b=M5iNm5f+GNE+z/Joyt8Rd3CJNV3U7uBelLQpyGjNfhFt4LWvAe0uZLJQO4gtBhroN8lgJEOEbOPeb9GeX4AE/5q9ggj1r8u61hz+eRHWQfAvAsCDXhTJDhaydTZZkqCnSLbbowzJxgE9QgtG5zviLsQfAZAxr06R5PAjElLeTyI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785762683; c=relaxed/simple;
	bh=Ay13GtCy4B1i1tRir4LUR3gkqL4rmyiYqNTuJU95u8M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Y6GQiCLvfNsA1BJuYunyl+cpymDFByL/I7eSAr2rto1fPavnDTiA8ezbfO7M7Js+9/22Avf3iQYrP/RKy7g/9ayP1TyIThQ3jFoen+MExB7QainOuMoZKRuq+KqIo/bwUCllCE+KiQtCkWEj6PAqxUP1TaA2fwlWpiYxfVyYwYk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cAxphpIQ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cAxphpIQ"
Received: by smtp.kernel.org (Postfix)
	id D51701F00A3A; Mon,  3 Aug 2026 13:11:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 73D5D1F000E9;
	Mon,  3 Aug 2026 13:11:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785762681;
	bh=vM4rEaxz4Brxd15eI0mr8JWOkyCiqe8uG9mCibQZTgs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=cAxphpIQ/BFbRbDvD+r91Xdh7MrUC6HcBll/A1WkPsFZE+IoDo2wO7Zp9f1yaG5Qj
	 rLF9pDcAl8qmUeSXOMSmsC63E/RzVEWyDd5HeSSKQx7vsJd/8hFGIWYD6qIGc+kQ0D
	 ACIC4E+85T8ZbWCVymU8GP82UA3qPRu5NSN/nJvFJ6v+fnEE1Lx8e0xlqNk32SnWLm
	 ibIZ4fXoXq5/eLZF6kQ9Sd/1rJWHxdTifUygMfibuHeFlMPt+kdQ2O9MO3fBp9NWmI
	 eJaauZbC/IR3GsyUm92g8qMzNCEF8Y3UqHt1y9Qqj3tJFWM4hCk9jnbq0PnHzfuCdi
	 0OO00tLgkyroQ==
Date: Mon, 3 Aug 2026 09:11:19 -0400
From: Konstantin Ryabitsev <mricon@kernel.org>
To: Rito Rhymes <rito@ritovision.com>
Cc: tools@kernel.org
Subject: Re: [PATCH v1 0/6] Allow site layouts to render properly on mobile
 devices
Message-ID: <20260803-inscrutable-graceful-bullfrog-df737b@meerkat>
References: <20260316180036.71949-1-rito@ritovision.com>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260316180036.71949-1-rito@ritovision.com>

On Mon, Mar 16, 2026 at 02:00:30PM -0400, Rito Rhymes wrote:
> Currently, pages on mobile devices render against a desktop-width
> viewport, which makes the content appear tiny and forces users into
> a pan-zoom dance of pinch-zooming and horizontal panning to read
> content rather than simple vertical scrolling.
> 
> The first patch establishes the correct baseline by setting the
> viewport width to the device width. Once the site is allowed to
> render at actual mobile widths, however, numerous latent layout
> issues emerge. The remaining patches address those issues with
> targeted responsive adjustments.
> 
> It is not a transformative redesign and is not intended to affect the
> desktop layout.

Thank you for your patience on this one. I finally had a chance to review and
apply the series.

Best wishes,
-K
