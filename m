Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 149EE40DFDF
	for <tools@linux.kernel.org>; Tue, 28 Apr 2026 21:16:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777410997; cv=none; b=VqOuIqEFTKn53uVR0yweXCH4fmP/Rh4ll89RqQJeOR6p++hO4WlbX6dHlrXoYgl7Wg/3d5DnK1qu7UFud9cQPjnMehuf91h5qxs9a3UxpJhBCShSHoFQnWHBCcL0//gkoQ6kjQPWPBIUC5wId4mwfwXgfAZxHSYArjqmzQ/dPjo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777410997; c=relaxed/simple;
	bh=3FU76h0UnCnZKj+SZXkBCkMSiqt7rUYR9WmVS4hK6hU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bOR7o072HR3u/p7yUuOP918nXA9xC/nDRqrhH5bLcekm063xHtDyAcORDRTO7BI1SZzvBt2Q27CRkWhpcS4FBMrQhgeD/AShwvihIYnzBcVP9MjIlFNlcSWH1CLz1dDtdk5VcUXAbRcAEtjjK1rb4D1aBHh8rekwcvP/wD7p6BQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=Wca6suVx; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="Wca6suVx"
Received: by smtp.kernel.org (Postfix)
	id BA1D9C2BCB7; Tue, 28 Apr 2026 21:16:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 81054C2BCAF;
	Tue, 28 Apr 2026 21:16:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1777410996;
	bh=3FU76h0UnCnZKj+SZXkBCkMSiqt7rUYR9WmVS4hK6hU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Wca6suVxWMGymL0ZeR6YvkLahZYgDosdMxRseWXdgwfK1faRZDaF6SdvpVdGtAG9R
	 +bWKmAetPJ4p9FQtyY+7voZNUIHMzZAnw+kl9KX3ifn0UkXwxT/G0tyFJub4UUNQnL
	 8PTtnn/0ea2kM+nea1/at3fACKZYtOkKv+rQlQeU=
Date: Tue, 28 Apr 2026 17:16:35 -0400
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: Matthieu Baerts <matttbe@kernel.org>
Cc: "Kernel.org Tools" <tools@kernel.org>
Subject: Re: b4 review tui: patchwork integration
Message-ID: <20260428-unyielding-fat-chameleon-a264cc@lemur>
References: <f329a913-b0b3-4f5d-8bb5-a57b5b814081@kernel.org>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <f329a913-b0b3-4f5d-8bb5-a57b5b814081@kernel.org>

On Tue, Apr 28, 2026 at 01:02:11PM +0200, Matthieu Baerts wrote:
> Hi Konstantin,
> 
> It's great to have a built-in patchwork support!
> 
> Something that is blocking me to use 'b4 review tui' more is that not
> all Patchwork status are supported, e.g. I cannot mark a patch as
> "Queued", and delegate it to someone.

The issue here is that patchwork doesn't expose what statuses are available
via any API call, so we can either hardcode it to whatever we have on
patchwork.kernel.org (and have it not work for any other patchwork instance),
or we can hack patchwork to expose it. :) Either option is... not that great.

> I see that patches are automatically marked as "under-review", but it
> would be nice to assign myself as well, so others know who is reviewing
> what. Eventually, it might be good to ask for a confirmation: I might
> use the "review" mode simply to validate a patch reviewed by someone else.

OK, I'll take a poke.

> Something that was already reported by someone else I think is that the
> "patchwork" view only shows the "Action Required" ones, and it is not
> possible to show more patches.

Kinda same limitation as the one I described above, but I can take a closer
look.

> One last thing: it might be good to have other automations, e.g. when
> the "Reviewed-by" tag is sent from the "review" mode, then the patch
> could be marked as "Queued" on Patchwork.

Noted!

> (And eventually, have a way to run script as an action during the review
> and from the "patchwork" view, e.g. to apply a patch using a script that
> will do extra quick checks and select the right tree.)

Hm... from the patchwork view I'm not so sure, but I can take a look.

Thanks,
-- 
KR
