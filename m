Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B4FA149C44
	for <tools@linux.kernel.org>; Fri, 26 Apr 2024 15:11:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714144293; cv=none; b=Bm1witZj3Vt6KPWgEwzJNDG0RDRoCXR6tNkhnvFWgtUIki/Tcza6fcxXmlQNXPPGbd1eU/TavhtjBFaJTZ3u7Je1pBbeShpbIIs/KRQHdFLEki16INEeBI5R6g679zRihMiU1LYodXYoMysqKHAqcM5ANaAjwNpmm1X+nVMIQxk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714144293; c=relaxed/simple;
	bh=6vKlh0j3tOsxrzCVmGYAjViF0cBWqfUddigqj+0IYzM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GXhGIb/hcsuwJmTt9YJdvVsutocwKGeamR8uCCO5WMzuy/hujkaM9ShEkxlJFyLcz5YqDTSsEypDLwJqMhDnEWwu3X36dKyfu/6syw0YSAGf/cQWcKcZZa02mH9TvVy0gs/6RuT6en47WCfzi1x3Gz7AfYE+wegWjqh6hWyrx1E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=kzCpMIea; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="kzCpMIea"
Received: by smtp.kernel.org (Postfix)
	id DDD07C2BD10; Fri, 26 Apr 2024 15:11:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 97FAAC113CD;
	Fri, 26 Apr 2024 15:11:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1714144290;
	bh=6vKlh0j3tOsxrzCVmGYAjViF0cBWqfUddigqj+0IYzM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=kzCpMIeavppSCDfX3WW6yEp2RDchfv51rkCfi2lJjGhUNlf9MRghuYhEWid5Mldcn
	 gO3w7phF6l4TjSo5FksfV6/p4gJtscrt3kNi173+1Q4dVY5hqWQ0eaU+mSi/zCcrDB
	 PTTJnR1+qqj4IsA0wDET1lRefmwUGScSu+WQ3tY0=
Date: Fri, 26 Apr 2024 11:11:29 -0400
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: Luca Ceresoli <luca.ceresoli@bootlin.com>
Cc: tools@kernel.org
Subject: Re: b4: use new trailers in 'b4 send --resend'
Message-ID: <20240426-jasper-sloth-from-neptune-82a6f7@lemur>
References: <20240426140157.349783d6@booty>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240426140157.349783d6@booty>

On Fri, Apr 26, 2024 at 02:01:57PM GMT, Luca Ceresoli wrote:
> first of all: thanks for b4, I love it when sending my patches!
> 
> I found a little issue when resending a patch series with unmodified
> content, but with new trailers received after the initial sending.
> 
> This are the events involved:
> 
>  1. send a patch series (b4 send)
>  2. receive some Reviewed-by, but patch not applied and no changes
>     needed
>  3. update trailers (b4 trailers -u)
>  4. resend (b4 send --resend)
> 
> At step 4 I would expect b4 to prepare a [PATCH RESEND] series with
> the new trailers added. Instead b4 resends the exact same series,
> without any new trailers.

This is the expected behaviour, as far as I know. There should be no 
differences between the series, otherwise it's not really a resend.

It's not really necessary to resend a series just for trailer changes 
anyway. The maintainer will most likely use b4 to retrieve it anyway, 
and that will pull in any new trailers.

-K
