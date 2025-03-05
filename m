Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78EA42459FC
	for <tools@linux.kernel.org>; Wed,  5 Mar 2025 20:20:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741206048; cv=none; b=EqDFCOYvQ4m9UUWUZ4APDrdoQID0WUzHhCzGPmlzJftZAyBRDCaa+kb2ydcdskbbQSCn5Q1+PNtMxZFOYFfZji+AkQQ5+b5xrSLtz28HDogUrsDAWRI+HMoSFZTD89D3t9dveMwz3TlLWSahYHyMo8GFNZjJQt+AlSdDOUShW5s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741206048; c=relaxed/simple;
	bh=Gtin/H8pNTwDlipmG6AQ3zheu6pTOgAiG/1WXN0KW2o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Wodah0SePtcHV/ofT30e/gb+pGUenYQhT8XGtWYBXq6TlNyCNNL4NTtZONhvJqm8SLgOLPjJrvjDU43SOmvt6ukWsQR1jiyxB6k7iF+6v33wZeo8MEuOa9AY7wp6DWQ+YkItmeqe36HLPJ4tmsg52f04zS6gt7IUs9gazkltdog=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=lYBu1ksY; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="lYBu1ksY"
Received: by smtp.kernel.org (Postfix)
	id EDAA8C4CEE0; Wed,  5 Mar 2025 20:20:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B5DDAC4CED1;
	Wed,  5 Mar 2025 20:20:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1741206047;
	bh=Gtin/H8pNTwDlipmG6AQ3zheu6pTOgAiG/1WXN0KW2o=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=lYBu1ksYaxk97Rv/ZlYrz2fbfhwo0ATGN3dGUx7bxiIz2nKG4fasCn0jF3wcyyT3T
	 bWyIZwuwoytBuRzTjIzH/3LzfWQZGGqLFtJHuXsGDnlshJAxtGH/5CRL92hXgX0Oj4
	 oV/AwmvmUN+KdbvDMNpFLshI9WVrjuTcpx76shCc=
Date: Wed, 5 Mar 2025 15:20:46 -0500
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: Andy Shevchenko <andriy.shevchenko@intel.com>
Cc: tools@kernel.org
Subject: Re: b4 to accept https://patch.msgid.link/
Message-ID: <20250305-benevolent-aspiring-civet-142c60@lemur>
References: <Z8cMdUMZQhGtVTWx@smile.fi.intel.com>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <Z8cMdUMZQhGtVTWx@smile.fi.intel.com>

On Tue, Mar 04, 2025 at 04:21:41PM +0200, Andy Shevchenko wrote:
> 
> Hi!
> 
> Some of the maintainers are using https://patch.msgid.link/ format of URLs
> in the Link tags of the applied patches in their tree (and then it becomes in
> upstream in most cases). It would be nice if `b4` can recognize this URLs
> in the command line for `b4 mbox https://patch.msgid.link/...`

Makes sense. It almost does that already, but we need to make a more generic
case.

bugspray tag me
