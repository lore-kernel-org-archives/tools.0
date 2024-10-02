Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 635551D043E
	for <tools@linux.kernel.org>; Wed,  2 Oct 2024 13:34:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727876063; cv=none; b=kYFLlIJdXMG3A3nlV2DZMonnzX7dR9Ru5nIRSUtZLtUcgZPrp+832BRg9iURUwCbp0BMqURv2Bgv2v+Y0kT9rMifnyp3YMIEaO/ymykCgA/GUL8FotXUpd7WiG4JjTVn7KofKqx5IoH53/+4Ap7DC3/KzGh70DS4ooIDMw24+Og=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727876063; c=relaxed/simple;
	bh=UStQplz6IovrPC4adGt3hXVyx6NpuYq6fM+TcfE6vvU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eUCe/5za+vWJtoghHXIZOPOuaJgX0TY8qX5NQB5xLHUlIlTzRduxJjOA7cID7Bt1Dms110hOjG370Em57OqGlFQheB8hJ3/ZEKWbWxZXGg37HfGUYg3BsOqf2kO9RGynbA9VHjPMVPBriSumpYDdEa0tT5Tu00jiQfYMq+wY6m4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=1I+JDEYq; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="1I+JDEYq"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E86DEC4CEC5;
	Wed,  2 Oct 2024 13:34:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1727876063;
	bh=UStQplz6IovrPC4adGt3hXVyx6NpuYq6fM+TcfE6vvU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=1I+JDEYqoSdWrYDSM0XYIZPs1k8k/Rzsydq86NTdyX9FyMJKKMmYYyHTyRO123AGN
	 nErmeVx1rGiDDCGDFhOFcr27no+VkuqZhsq0w80G6a/udl0MC5j/RG3Y2tLW0rQhPx
	 9nucWqX7IoKBReVF5rjrx0Ekd9j9fv4R96G02SUk=
Date: Wed, 2 Oct 2024 09:34:20 -0400
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: Mark Brown <broonie@kernel.org>
Cc: tools <tools@linux.kernel.org>
Subject: Re: b4 trailers --update picks up bogus trailers
Message-ID: <20241002-quantum-guan-of-action-427cc4@lemur>
References: <98450a13-1339-41e1-87b4-3db7387906c7@sirena.org.uk>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <98450a13-1339-41e1-87b4-3db7387906c7@sirena.org.uk>

On Wed, Oct 02, 2024 at 12:51:50PM GMT, Mark Brown wrote:
> Hi,
> 
> With current git b4 if I run b4 trailers --update on
> 
>    https://lore.kernel.org/linux-arm-kernel/20241001-arm64-gcs-v13-0-222b78d87eee@kernel.org/T/#t
> 
> patch 2 picks up reviewed-by trailers which were sent in reply to the
> prior versions of the series even though that patch is new in this
> version so the update is clearly bogus.

When I try it, I see the following updates that it wants to pull in:

	Finding code-review trailers for 41 commits...
	Checking change-id "20230303-arm64-gcs-e311ab0d8729"
	Grabbing search results from lore.kernel.org
	---
	  + Reviewed-by: Thiago Jung Bauermann <thiago.bauermann@linaro.org>
		https://lore.kernel.org/all/878r3f99o1.fsf@linaro.org
	  + Reviewed-by: Deepak Gupta <debug@rivosinc.com>
		https://lore.kernel.org/all/ZvyCC7tJT7QoKO%2BD@debug.ba.rivosinc.com
	  + Acked-by: Yury Khrustalev <yury.khrustalev@arm.com>
		https://lore.kernel.org/all/ZtbQPBSl6Ym7g4QE@arm.com
	  + Reviewed-by: Catalin Marinas <catalin.marinas@arm.com>
		https://lore.kernel.org/all/ZschddrfehjVUMXw@arm.com

Are these different from what you see?

-K
