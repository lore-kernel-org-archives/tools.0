Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1519730CD95
	for <tools@linux.kernel.org>; Tue, 11 Aug 2026 18:13:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786471983; cv=none; b=c3soChZ6YqWKH9/TU+82JlQQRgQX4WEgGEa1Rd9Ys27AcT4Y7V0EHNWouY52Cy7CbT/majk1Kcm/f6Zh8s8Ps8Oji0XI9by5QqZr6IM3h9pjnQ649H/hYh5+Zq9zSRnUaoQET9kfn0Z2PpqPYR5Gq0dblk8SKeL5DmgDiTjHQc0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786471983; c=relaxed/simple;
	bh=Vi0KBfCB5OEtwYEU9ZnmBlpqGdk1rJ9T5cMjbhmvB3g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rIj9vgfP1l+3woGk5kW/bGFQIYgfWnfj0pECbrIPoQgljW67khkvQGJkcfwSfMuo5Xa4QoBMfn0LCxycNmRuEjuqPGsF0DKnsOrdqBR1x7kEcc67TvDs6qtqS3PmLRV29Vv1B4yI8i5O5SqGLlb/JOs5kYZbVAao/p0OjRQBo/U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=llhIud3V; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="llhIud3V"
Received: by smtp.kernel.org (Postfix)
	id ABE181F00A3A; Tue, 11 Aug 2026 18:13:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4AA8B1F000E9;
	Tue, 11 Aug 2026 18:13:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1786471981;
	bh=rtPEtTqfcOgCIkD7MMIPdoH4L/jP6V1fuPT759+aleY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=llhIud3VKTXfN0Bd1LZ6q2AoQ5d2o9hApzqL9b4AYpKLH7wF0lW//3dOB8xTsm19q
	 AQEpOkTP0FaGf7mI2CjuoeESp/3epHULZ8DCU4WuyzHks6wkU9cHP1rwERs1ZL2h2A
	 MQoXkOh+V9Soz+w1qJXIn1BO/t/9xoc6InM+tJqQ=
Date: Tue, 11 Aug 2026 14:12:59 -0400
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: Mark Brown <broonie@kernel.org>
Cc: tools@kernel.org
Subject: Re: b4 review misses a patch
Message-ID: <20260811-spicy-woodlouse-of-joy-7fa3fc@meerkat>
References: <8d7fc80b-e303-4f2c-9890-8408bd5d27ac@sirena.org.uk>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <8d7fc80b-e303-4f2c-9890-8408bd5d27ac@sirena.org.uk>

On Tue, Aug 11, 2026 at 06:54:15PM +0100, Mark Brown wrote:
> Hi Konstantin,
> 
> Fun one with current git.  For:
> 
>    https://lore.kernel.org/r/cover.1785855013.git.rriveram@opensource.cirrus.com
> 
> b4 review has imported only the first patch, even though it did say:
> 
> Retrieving series: cover.1785855013.git.rriveram@opensource.cirrus.com
> Looking up cover.1785855013.git.rriveram@opensource.cirrus.com
> Breaking thread to remove parents of cover.1785855013.git.rriveram@opensource.cirrus.com
> Checking for newer revisions
> Grabbing search results from lore.kernel.org
> No change-id found, generated: 20260811-introduces-mdsync-support-for-cs35l45-d87349df7cad
> Tracked series: Introduces MDSYNC support for CS35L45 v1 (2 patches)
>   From: Ricardo Rivera-Matos <rriveram@opensource.cirrus.com>
>   Change-ID: 20260811-introduces-mdsync-support-for-cs35l45-d87349df7cad
>   Message-ID: cover.1785855013.git.rriveram@opensource.cirrus.com

My guess is it's because the cover letter is in-reply-to itself:

    Message-ID:  <cover.1785855013.git.rriveram@opensource.cirrus.com>
    In-Reply-To: <cover.1785855013.git.rriveram@opensource.cirrus.com>

I keep discovering creative ways of doing weird things with headers! :)

I'll see if we can handle this corner case.

-K
