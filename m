Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E36F932A3FF
	for <tools@linux.kernel.org>; Fri, 17 Apr 2026 06:50:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776408616; cv=none; b=esW3/G04mFdgRrhXNSlux9X3x3ZBUf/MGBbXkmw/bJo0zwt5HrYVzDuXaTwO34ADM94ZEq+99vd3IEnRW0AvFf7rwPBCjYcqgUcQbwhiD8L2QyNFOYKVnyW1oTjY1ozTi0hhKfTFBboI8rjyL9ih4o877GynC5TXxIm2fEHzUBU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776408616; c=relaxed/simple;
	bh=k77PbLktMwJv59DyDBdZjmEMBvuoDDuxXPdVGDG+hOw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=T3Wqh6+B5/X+trdPwbjwzNLiEI9mfD6K/XmjQGfpV4An3azioPuawPMo6ym+By6HLQJEFbubV3cVLrRez99ULmYPUngg1ICgqWVgvGhmy6aN531tGIv2IH8uPbc8Yy/PflzCC+hNVpBrDrZNhXrl/py+gTTSBWP57uFqgXOlHGc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GIahH5vi; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GIahH5vi"
Received: by smtp.kernel.org (Postfix)
	id 9F41EC2BCB4; Fri, 17 Apr 2026 06:50:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D5BB7C19425;
	Fri, 17 Apr 2026 06:50:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776408613;
	bh=k77PbLktMwJv59DyDBdZjmEMBvuoDDuxXPdVGDG+hOw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=GIahH5vi8e3kc4Q4sC1Dt9GRWS70z4hD4jkdz+IxGd9exU92m2VDsFMF/WH1JEqNY
	 cW3WX/PcFhEUkjB3xkQIxeGwk1H5UT5Ey+5TOTOnspFnCMBgopTNSYTad9CkbFipxA
	 +O9sSlB6FGs2dkeDpPU3sviik54FcBEIMnbQTBQUnecgQlv6WjYmBFJUMaOBxt60Ed
	 WWelZXF4V6m+Vle4H0oy3q/hyKHm0HtfaF0jhxnpCfOCX349oM5Q1PhEdhPu2SalRD
	 4sr5DAuiUIbBbV1oqYF/ODBglO7m+b+RKPqWBDu2CqyTmCHh7eCecu6KJHJ/EazT3T
	 xMya0NzbLDY+Q==
Date: Fri, 17 Apr 2026 07:50:09 +0100
From: Sudeep Holla <sudeep.holla@kernel.org>
To: Mike Rapoport <rppt@kernel.org>
Cc: Dan Rue <danrue@gmail.com>,
	Konstantin Ryabitsev <konstantin@linuxfoundation.org>,
	Sudeep Holla <sudeep.holla@kernel.org>, tools@kernel.org
Subject: Re: [PATCH] add sashiko URLs
Message-ID: <20260417-original-smooth-heron-96be80@sudeepholla>
References: <20260416112156.1059032-1-rppt@kernel.org>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260416112156.1059032-1-rppt@kernel.org>

On Thu, Apr 16, 2026 at 02:21:56PM +0300, Mike Rapoport wrote:
> sashiko is gaining traction and it's easy to add its URLs along with
> lore ones.
> 
> Signed-off-by: Mike Rapoport <rppt@kernel.org>
> ---
>  lorifier.py | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/lorifier.py b/lorifier.py
> index be7294b..96529bd 100755
> --- a/lorifier.py
> +++ b/lorifier.py
> @@ -25,6 +25,7 @@ import sys
>  from email.utils import mktime_tz, parsedate_tz, formatdate
>  
>  LORE_MASK = "https://lore.kernel.org/all/%s"
> +SASHIKO_MASK = "https://sashiko.dev/#/message/%s"

Just curious on the choice of
"https://sashiko.dev/#/message/%s"
over
"https://sashiko.dev/#/patchset/%s"

As the latter points to former while the reverse is not true unless I am
missing something.

-- 
Regards,
Sudeep
