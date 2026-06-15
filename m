Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB03E2E7631
	for <tools@linux.kernel.org>; Mon, 15 Jun 2026 21:51:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781560302; cv=none; b=k0tiUdZ9dhP9TL/yamPq/lci2RyAvagyUgzqkeifVUWkbEShd+KYS3pfsPr1UWHq9AsQKIkLqU0x7cfy66j9U9b0go6TGG9iO3kUtzVx/s6g3ERptreapACGhq5DEl8K0UfqvdiiXofJSbqRd2Xgpr/J8yxMVM1SMY+uNkR6Jpw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781560302; c=relaxed/simple;
	bh=UuBNuInCmGgR3jqxdfzIqtv5Ix240YbAmNnV2hY8KHM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tEOvh/oSpToE1MXKJMFDIzZqyHEQ+o6BDTWuvBbPyzDoexAYJNUYehNB+216sYR+vzl+r9aJMnuk4FgEnka5S3mCgGoQZOcrBoJi9RoGkCaPmGQNkqEMjMnFh0B7fb8OwE2weMENtHVvuaRAkrlerVFCF1RXaCq0bHO2oxZ24hQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bhKPhqkc; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bhKPhqkc"
Received: by smtp.kernel.org (Postfix)
	id CEF411F00A3A; Mon, 15 Jun 2026 21:51:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5CA551F000E9;
	Mon, 15 Jun 2026 21:51:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781560301;
	bh=3oiFIpKEFeSQR7NOEwBMiFtU6CkgAb1ibOA3TbgPbhQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=bhKPhqkcIzR2RWYBA1UNjgXVoNTGXkjLyW4MsZNYhbnWY6GUq1buHOZuAkh6Er/Sg
	 7qHIAb8ncpBpc+a+VsfcAB+nj5Jw9+hJ52TV5jx8IgW20yADhcnB6xMTKgO0LNKpY5
	 nXjBzecPj19AdYD5a6BhV9jI1XWqfyZe2+InsmmVYE0CjIh7FkKM23wAgkRM8phg0G
	 OmqF9SvNmRIBKZHlZzod5vJ/3xMPN9JYrMXzJbJh18MsTMs/dvv79XICRkaA+8DZ8e
	 eAaBwo5UiOnUQDOYZbZepBa/c2wbsdo+wAnjIZR91E20n85BcT/13Mbp/YQJ9aPQn6
	 AD0TFUYR2IMdA==
Date: Mon, 15 Jun 2026 17:51:39 -0400
From: Konstantin Ryabitsev <mricon@kernel.org>
To: Dave Marquardt <davemarq@linux.ibm.com>
Cc: tools@kernel.org, Tyrel Datwyler <tyreld@linux.ibm.com>
Subject: Re: [Tyrel Datwyler] Re: [PATCH v2 6/7] ibmvfc: register and use
 asynchronous sub-queue
Message-ID: <20260615-smiling-kelpie-of-temperance-4dd61b@meerkat>
References: <87h5n3o69j.fsf@linux.ibm.com>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <87h5n3o69j.fsf@linux.ibm.com>

On Mon, Jun 15, 2026 at 04:14:48PM -0500, Dave Marquardt wrote:
> 
> Hi Konstantin. I'm using b4 to send patch series. I get these comments
> about not having a Signed-off-by: tag. Should the tag be added by b4? Or
> should the patch attestation be enough?

That's not really the right way to put it. Different projects will have
different DCO requirements and it's not up to b4 to enforce the presence of
trailers. It's not the same as patch attestation -- the attestation's job is
to mechanically attest that the patches haven't been tampered since they left
your system. The Signed-off-by: trailer is more about the actual code you're
committing.

> I do notice that "b4 prep --check" flags some patches as missing the
> Signed-off-by: tag, particularly when I've chosen to not fix some
> warnings.

It's speaking to you, then! :)

You can either manually run all commits with -s (which is what I do), or you
can set up a hook to do that for you automatically -- but since it's supposed
to be a deliberate action by the committer, I recommend just always
remembering to add that little "-s" after "git commit".

-K
