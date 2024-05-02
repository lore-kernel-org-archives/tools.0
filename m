Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54D5654747
	for <tools@linux.kernel.org>; Thu,  2 May 2024 09:23:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714641839; cv=none; b=jZgs9z2jkKYbys5SkWNpNyLamx+qrQsUuO0GbaLufS7nlVmsdVcWLHkq7090hktFKMb/DbsC8TdV+hyknDI+mak6+xGOG8YOEy4ZRyGqTmFS/i/fJvmnsu4CZwRyNIog0WYR+usu5BaLHSIo9JnjYxNrfVgAf4+xl6GUZ0Ak0dc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714641839; c=relaxed/simple;
	bh=yCEZNp+Ch5FgbJFCBwEXd0o5NyuRJ4uNuPs6rRbUYkY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TDX2DPVDOZAe9XAItrFYqJd6WprEnylcKQXNxKrPIo6ED1Cy/JZOAiyShL1MY5cRVNwU7gugcOtjIo3WLdBtmPmpzXwZh2SYWM77u1YYQC6jkqfkGPeK94SOEoOwSKGp1RGcb6Yqx4nzQS+/Xsd7Zc7DYFHLBMQptl3TyBW+AZ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Le+17mJP; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Le+17mJP"
Received: by smtp.kernel.org (Postfix)
	id EE64BC116B1; Thu,  2 May 2024 09:23:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CE43CC113CC;
	Thu,  2 May 2024 09:23:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1714641838;
	bh=yCEZNp+Ch5FgbJFCBwEXd0o5NyuRJ4uNuPs6rRbUYkY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Le+17mJPqvEocm66cWpYcYP1xFNjpq5GVxuSsSHUMp/yvFevwPd0KvQpc3cmFKhuT
	 5Y1cXlIVMXUBVB9Fh14cAHPvNCWxziqoI8uAo6YrasmP1UkqdU+/3bQ4vdAD7gOnqK
	 rDmWDQeOoSd5M4wQpPbQs9N/DiQJ1S3V4KQK36oxp/s/gR6QFivnPlhUeB3WtmiM5o
	 94xE3RL0UmZLsuJ0xRXdRobEXuJGTQzUbBdwOolm4r+29+HMEG5PHD7ksWhhdPwHC6
	 G3Fycbkv02+n4WZgBaGsR74EV2YHePVM72x7FctVKpSOzFXL9+NBZBjGkfbErM6sfx
	 lMThZA/0wLxGA==
Date: Thu, 2 May 2024 10:23:54 +0100
From: Will Deacon <will@kernel.org>
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc: tools@kernel.org, Jason Gunthorpe <jgg@nvidia.com>,
	Nicolin Chen <nicolinc@nvidia.com>
Subject: Re: [PATCH v2 0/2] b4: ty: Fix incorrect patch/commit association
Message-ID: <20240502092354.GA16551@willie-the-truck>
References: <20240304134241.20447-1-will@kernel.org>
 <171459859217.935458.14461888310866914252.b4-ty@linuxfoundation.org>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <171459859217.935458.14461888310866914252.b4-ty@linuxfoundation.org>
User-Agent: Mutt/1.10.1 (2018-07-13)

On Wed, May 01, 2024 at 05:23:12PM -0400, Konstantin Ryabitsev wrote:
> 
> On Mon, 04 Mar 2024 13:42:39 +0000, Will Deacon wrote:
> > It's me again. This time I fixed my git configuration so that the
> > authorship is correct and matches the S-o-B line. That's the only change
> > since the v1 I sent on Friday.
> > 
> > Enjoy!
> > 
> > Will
> > 
> > [...]
> 
> Applied, thanks!
> 
> [1/2] ty: Try subject matching for every commit before using trackers
>       commit: 47bd55d3182d875802700670270f5ee0877a8d5d
> [2/2] ty: Remove unused 'matches' variable
>       commit: dced92071d2135ccbec521cb4face63cafcdc407

You applied these already (with different SHAs), I think:

https://lore.kernel.org/r/170958794467.8875.12454526353405240108.b4-ty@linuxfoundation.org

So I'm not sure what's happened here :/

Will
