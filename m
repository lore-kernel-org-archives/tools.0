Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FBAF12B71
	for <tools@linux.kernel.org>; Wed, 22 Jan 2025 16:01:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737561667; cv=none; b=VZUy5okpHKqb7VlcBgGMtXFukUyunHGyO22j4jTg7EbtMEVkV5RhtzPsTBxeOOpo6Y5xwZe2GXHt0hR6zfCldSYCSxjdjqmCW36+tNfrQ9Y9g5YJhJbGdAfxliGP92a5UJq3YlmiXggDVGPuuplkacB6P5Pas2Z/l5aJ8PImJPM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737561667; c=relaxed/simple;
	bh=tzgXr+zMwyM/lzO5Si9n/jQwqytCJiNOGGHLsB5qchs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UURgM/PNjNpX92THdi2vn98XGmxOSV/b/b78QzwJPqEPTBDKbwgAdmqWu0oHwvdfG8StTeclI6o4NO6HU+WiM6veGmCd9Ve29bT/gurMP/G2vpMTx8d4vC7RGu9vRkEPvJHEnK9iw25x/KI/4fm8mBrJV7T0f5T8zWWOYNrxEqI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=vl+nDK9K; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="vl+nDK9K"
Received: by smtp.kernel.org (Postfix)
	id 15C6DC4CEE2; Wed, 22 Jan 2025 16:01:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C5B60C4CED2;
	Wed, 22 Jan 2025 16:01:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1737561667;
	bh=tzgXr+zMwyM/lzO5Si9n/jQwqytCJiNOGGHLsB5qchs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=vl+nDK9K/aXsEzd7effsyWxe8dFfOYSR89ELCiDpg4i0fq/wB8AuJs9uNLEo+0no2
	 pLn7bPHTeTw72MJ7bnnLI95eoGYIwdZuW5nTsjXvbLAERFWYoiDa5CoimWEi/b1TSj
	 WUqXRo0en/FQBTHkdyLxtyrPGSTDXOkt3TWSH5uM=
Date: Wed, 22 Jan 2025 11:01:03 -0500
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: Christian Heusel <christian@heusel.eu>
Cc: "Rob Herring (Arm)" <robh@kernel.org>, tools@kernel.org
Subject: Re: [PATCH] Ensure patches show moves rather than add/delete
Message-ID: <20250122-omniscient-spaniel-of-persistence-1c3aae@lemur>
References: <20241217161146.1943425-1-robh@kernel.org>
 <0e03ec86-b46f-4d6f-91a6-a9cce483c300@heusel.eu>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <0e03ec86-b46f-4d6f-91a6-a9cce483c300@heusel.eu>

On Wed, Dec 18, 2024 at 09:04:53PM +0100, Christian Heusel wrote:
> > diff --git a/src/b4/__init__.py b/src/b4/__init__.py
> > index bb93656d8ad7..a63520792df5 100644
> > --- a/src/b4/__init__.py
> > +++ b/src/b4/__init__.py
> > @@ -3464,6 +3464,7 @@ def git_range_to_patches(gitdir: Optional[str], start: str, end: str,
> >              gitdir,
> >              [
> >                  'show',
> > +                '-M',
> 
> I think for consistency with the other options it would be better to use
> the long form "--find-renames" here.

I didn't take this patch directly, since that code has already changed a bit,
but I gave you both credit.

https://git.kernel.org/pub/scm/utils/b4/b4.git/commit/?id=764bbf5525f4894c5482753ed73a19dbbd7a2564

-K
