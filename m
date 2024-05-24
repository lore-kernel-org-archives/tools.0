Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63B0E3BBF5
	for <tools@linux.kernel.org>; Fri, 24 May 2024 14:49:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716562167; cv=none; b=BrO4IW4jrhwIAODxLq/ON862AimEOSgBpqZfpoHXsG6kZKlThU/2N4Yk7v3j0KWTcsUo55vCXJABtJJYAVYuNDIffMo1Onya4PIrmpf4y+3TjDgGdd9EZNhNdiiONH/kMJEVt5HFDlwDw07GeKwYdvI+b7q8Tn2B0xio6tg5knk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716562167; c=relaxed/simple;
	bh=BN5kI70NlqEwJC1pwokXzRxK0rXvmR5PefgjRYrsHOg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RX0KyJaDVMwTveKHm5qBJJNIx8bEyssRseSDrPDJg2HyHpRyW3oinYK2ZINQ/Ualr/P/dxYtOHZdmNXm8yCquYisr9OeW1Uvpueza3KkUx4UsUHqUAiEdcFoFmYiseswvSnFiCp8bcoisiJHFQsar2SbFZFXUv47F74wJws0RVk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=AkQf5xPz; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="AkQf5xPz"
Received: by smtp.kernel.org (Postfix)
	id 08D5AC2BD11; Fri, 24 May 2024 14:49:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B72BCC2BBFC;
	Fri, 24 May 2024 14:49:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1716562166;
	bh=BN5kI70NlqEwJC1pwokXzRxK0rXvmR5PefgjRYrsHOg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=AkQf5xPzDaoU/WxJXOVBU/6yN/M36fwL1UxJd1kb+UJ5GY3X3lQLPTiiCaG+e2jo+
	 jMN/hExUANL1XRgmyPqO4dV4U9Pm15qbD/LHBLfCpk2H5FC9p8YT3NeM08E6DwWTHt
	 XqpqVyXR6dYCCBhTPLFk9D0UtLGOJQhN4wL6qvrY=
Date: Fri, 24 May 2024 10:49:25 -0400
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: Quentin Schulz <foss+kernel@0leil.net>
Cc: "Kernel.org Tools" <tools@kernel.org>, 
	Quentin Schulz <quentin.schulz@cherry.de>
Subject: Re: [PATCH b4] docs: document b4.send-prefixes conf option
Message-ID: <20240524-nebulous-ibex-of-finesse-c2ec8b@meerkat>
References: <20240524-doc-send-prefixes-v1-1-c6465822ad8c@cherry.de>
 <20240524-great-fanatic-whippet-caec89@lemur>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240524-great-fanatic-whippet-caec89@lemur>

On Fri, May 24, 2024 at 10:28:59AM GMT, Konstantin Ryabitsev wrote:
> One way I can think of to address your problem is to allow a + to 
> indicate that a prefix should be added to any existing ones (if not 
> already present). This would allow one to run:
> 
>   b4 prep --set-prefixes +foo
> 
> and also specify in .b4-config:
> 
>   [b4]
>     send-prefixes = +foo
> 
> It's kinda hackish, but effective.

I take it back -- thinking about it with some more coffee in, this would
break things badly for people with old versions of b4. I think a better plan
is to:

1. introduce an --add-prefixes switch that specifically adds to prefixes
2. if there are prefixes defined in b4.send-prefixes, we *always* insert them
   if not already present
3. switch prefix management to always be in the subject line of the cover
   letter, as opposed to being stored in the tracking json

-K
