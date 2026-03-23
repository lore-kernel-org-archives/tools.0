Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5314C3E51EF
	for <tools@linux.kernel.org>; Mon, 23 Mar 2026 20:58:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774299494; cv=none; b=LlMjlzUAcAoBM0Y53lYMWCz8H8tvGNLx6JFs0dsXiTBLQ6LhSp2dX74r24vKnsgznSOiEaVSnNCHcXONSBd+JMj20LPlhNuD0uFG2dilA9enp/+0aCsn8rNVDl+CWO9LRpiQp7TbJg+7Lk4chWl/9AcdV+Vgg/ckmu8scB0Q5a0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774299494; c=relaxed/simple;
	bh=dxHVTgQW4dImhwptvkTE68dPaSDJDZoECnbdKYGD7s8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jjbXf43RdHmy9UY/i7uXfAUZE9bTgtI+h5u+HkDF2r+wH+qfUORgh4nZnUtuO7B77WFG0Uw0Fi32hXDYaSFABs1gatZrOybj1ChU/5lMr8wCjd6/vl29N95e5po5j2tFRnj1iYp4zoRiCwW2MnyESUjnO1XH4v1t6OXiof0DrYU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=GCMlBzEl; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="GCMlBzEl"
Received: by smtp.kernel.org (Postfix)
	id ED3ECC2BCB5; Mon, 23 Mar 2026 20:58:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BA883C4CEF7;
	Mon, 23 Mar 2026 20:58:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1774299493;
	bh=dxHVTgQW4dImhwptvkTE68dPaSDJDZoECnbdKYGD7s8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=GCMlBzElD/+hC6feP2+5CC95AIED1aE46HdP5nw9YCfNSEniif1h+UAnLCqniqNT3
	 EuQC+3nE//Xsv7YcMOjAchhCEPuarU1sddmtejZT+dgDrDAVOZtvfiCo38W1kJivK5
	 kcNWWAv3a4Wsoe4GvJNQyHrzilzcrCtu2Q44qaLc=
Date: Mon, 23 Mar 2026 16:58:12 -0400
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: Mark Brown <broonie@kernel.org>
Cc: tools@kernel.org
Subject: Re: Stitching together serieses
Message-ID: <20260323-spry-condor-of-discourse-abce3d@lemur>
References: <8637ff61-4eca-42ac-96fb-d530498b3f82@sirena.org.uk>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <8637ff61-4eca-42ac-96fb-d530498b3f82@sirena.org.uk>

On Mon, Mar 23, 2026 at 02:07:13PM +0000, Mark Brown wrote:
> When users send a patch series in a way that doesn't thread such as:
> 
>   https://lore.kernel.org/r/20260323041505.2088-1-niranjan.hy@ti.com
>   https://lore.kernel.org/r/20260323041545.2101-1-niranjan.hy@ti.com
>   https://lore.kernel.org/r/20260323041624.2120-1-niranjan.hy@ti.com
>   https://lore.kernel.org/r/20260323041641.2133-1-niranjan.hy@ti.com
> 
> it would be useful if b4 review had a way for users to tell it that
> actually this is a series and please treat it as such.

After several bad takes, I landed --rethread in master that should do the
right thing in Most Situations (and probably screw things up badly in all
other situations, tbh).

E.g. this works:

    b4 review track --rethread https://lore.kernel.org/r/20260323041505.2088-1-niranjan.hy@ti.com

It also works for b4 am/shazam.

Please try it out and let me know any bugs you find.

Regards,
-- 
KR
