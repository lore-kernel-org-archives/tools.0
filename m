Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DB5116DC3C
	for <tools@linux.kernel.org>; Thu,  6 Feb 2025 17:50:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738864217; cv=none; b=huFGyWPAdB6U+V4SUaL5L6afRj+ea9NPJfjhgXu1huryUuXPYMCJlZDeLPBZAmKjfnjamz5tfBmrYLVJEA38DZzjn+tpWs0uveaP0d7tp2yWYxiRga8JWp+K8QYNo/sWH5SJhKPpMTUAwDYy0AwfjNQXXz8oE3fdoXTmUpqamp8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738864217; c=relaxed/simple;
	bh=gSHaFn9Y9WwFRv4YxPyJ4PlpMlYT3gLEXnNerwAKVwo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=H7zvMK4DeKkDU0AOVDdnfI013I88aw00YVFRmNVCxM7LuelZzoRqUGqlnEwN8qhovL3CR9aLRsL6nsoMcNnLobfOi0CahedgkfUVrS2d5ck77ay0H3lQs272nPz+1FOiHIjBT9uQelDlMG7NmgIugaMKjGvduvAj/3FkLtc29hY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=pfx0/8L6; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="pfx0/8L6"
Received: by smtp.kernel.org (Postfix)
	id C719AC4CEE2; Thu,  6 Feb 2025 17:50:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 955D3C4CEDD;
	Thu,  6 Feb 2025 17:50:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1738864214;
	bh=gSHaFn9Y9WwFRv4YxPyJ4PlpMlYT3gLEXnNerwAKVwo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=pfx0/8L6ZrXr/DNTvKEll2cZNIFI9wtXJG4JR+UppTl0w8wH5i00RHkzL7t+wMmNl
	 5iMaSDtcWKrphr84TBoU1YaYoVd5tYmG3pE1dgOLGNPsD7SeIl0MMPiWKEfAvUF8KU
	 yCMC5/ztukclC0IgJYCe6v0Aik+HBMEtModFex+k=
Date: Thu, 6 Feb 2025 12:50:11 -0500
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: Andreas Hindborg <a.hindborg@kernel.org>
Cc: "Kernel.org Tools" <tools@kernel.org>
Subject: Re: [PATCH b4 v2] ez: add subject prefix flag
Message-ID: <20250206-bipedal-aromatic-lynx-10ef38@meerkat>
References: <20250204-prefix-v2-1-468f166eb9d5@kernel.org>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250204-prefix-v2-1-468f166eb9d5@kernel.org>

On Tue, Feb 04, 2025 at 04:30:45PM +0100, Andreas Hindborg wrote:
> Add a flag `-p PREFIX`/`--add-subject-prefix=PREFIX` to `am` and `shazam`
> commands. This flag will add PREFIX to the subject line of each patch before
> applying the patch.
> 
> One use case for this is when composing trees that consist of patches from many
> different sources. Adding a prefix to the subject of each series makes it easy
> to see the origin when scanning the commit log.

I get the reason why you would want this, but I also kinda hate the idea,
because I'm almost 100% sure that this will make it into someone's -next tree
or something like that.

Can we take a step back and try to look at it from a broader perspective? Do
you use this approach during code review, or for some other purpose?

-K
