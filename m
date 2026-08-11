Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F1EA37E5DE
	for <tools@linux.kernel.org>; Tue, 11 Aug 2026 20:13:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786479195; cv=none; b=ev7T9CTPuRvqgVv2uYQNNN+Tm7UF7WiarDsFCL6xBQtJDDFgd93u55xNpTaJbkUAohKCi+vuIpRs1YueCvtEG728OblAg1+jcyTE2u9BOsQaGlgSTeiO1efaMVX1fnI7K5aJVTnRwirJosMXbdaIKaVi5kgXUg1xpZxS1DrwyIc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786479195; c=relaxed/simple;
	bh=2FaQwFvnnY6hzw+5iBL+g4iiXgbgRs+u6ZBlPqE/DG0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=V5A7HaIJuX1DitfSTSFml1YEjReVsQQn1E/QnBDn/7FDYmTleg8E0GViXN7UCF/c7mTkIr0gfLjm03j8LqfKTT3YNIxju8VZ3UUw0BnvyEU/z4VGMh2egqCfmdG1DT/5L2ZOaYr45LJDvMMAReOiFe+qs5V7jLAG2mCEsGMskLE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=AOS4feh4; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="AOS4feh4"
Received: by smtp.kernel.org (Postfix)
	id 2FE8B1F00A3D; Tue, 11 Aug 2026 20:13:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C100D1F00A3A;
	Tue, 11 Aug 2026 20:13:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1786479194;
	bh=R0a0lJb3nMd75PdYWf1+qx/rR+cFYftGjNIs11fdExU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=AOS4feh4xaYnmK8r60gQ8G2mIVPQM5HLk7DSCJ7+wFC0vpfnWpmWF48DYsB4F2ZTq
	 aH3bc/x8O8Xcbf9PfT5j/uNSkrIh7PvT5RVRrDRuOxz4JmWo24trSyYGGj9x764W01
	 offRec/95z/DJGYDBcWjp3bY+qkuppxkdotS+ljE=
Date: Tue, 11 Aug 2026 16:13:12 -0400
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: Mark Brown <broonie@kernel.org>
Cc: tools@kernel.org
Subject: Re: b4 review misses a patch
Message-ID: <20260811-beluga-of-theoretical-engineering-5ca1a8@meerkat>
References: <8d7fc80b-e303-4f2c-9890-8408bd5d27ac@sirena.org.uk>
 <20260811-spicy-woodlouse-of-joy-7fa3fc@meerkat>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260811-spicy-woodlouse-of-joy-7fa3fc@meerkat>

On Tue, Aug 11, 2026 at 02:12:59PM -0400, Konstantin Ryabitsev wrote:
> > b4 review has imported only the first patch, even though it did say:
> > 
> > Retrieving series: cover.1785855013.git.rriveram@opensource.cirrus.com
> > Looking up cover.1785855013.git.rriveram@opensource.cirrus.com
> > Breaking thread to remove parents of cover.1785855013.git.rriveram@opensource.cirrus.com
> > Checking for newer revisions
> > Grabbing search results from lore.kernel.org
> > No change-id found, generated: 20260811-introduces-mdsync-support-for-cs35l45-d87349df7cad
> > Tracked series: Introduces MDSYNC support for CS35L45 v1 (2 patches)
> >   From: Ricardo Rivera-Matos <rriveram@opensource.cirrus.com>
> >   Change-ID: 20260811-introduces-mdsync-support-for-cs35l45-d87349df7cad
> >   Message-ID: cover.1785855013.git.rriveram@opensource.cirrus.com
> 
> My guess is it's because the cover letter is in-reply-to itself:
> 
>     Message-ID:  <cover.1785855013.git.rriveram@opensource.cirrus.com>
>     In-Reply-To: <cover.1785855013.git.rriveram@opensource.cirrus.com>
> 
> I keep discovering creative ways of doing weird things with headers! :)
> 
> I'll see if we can handle this corner case.

This landed in liblore, so you will need to run both git pull and git
submodule update to see a fix for this.

-K
