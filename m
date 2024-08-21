Received: from bmailout1.hostsharing.net (bmailout1.hostsharing.net [83.223.95.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0872E1E389B
	for <tools@linux.kernel.org>; Wed, 21 Aug 2024 09:11:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=83.223.95.100
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724231507; cv=none; b=m/BjfopVMeCj6EuGYdv/++jXB+Dn+8ofNMVo32zW+XC9QA1pBkgFYW5ItG0JMOdSahQNN6vfbh7w5hIByJFjErq/6ddYsrVVgI+GsCByWNgpgtQKZU5d1YviYS2BzGamK+wLsW5AqESr2G+r9u0tS/gphmE2euBOo+DXsKokwpg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724231507; c=relaxed/simple;
	bh=bCbJMKS3FG50er8IfqpFwttH06Vi8He/RfnRyZbb9wE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=O+V9vFiZeocSvnEb2ifhlmpukdf6rveRaUwwGFB+S3KQ+t8rs+YJagTIi8UN9jE4QtuqPjaX4FmHCD3xr6PZ/ca07oqOfTQ4ytJsQKyk4i80a9i0LZGUpS/fbdCc93Cp5I3FHDFSoTnEsOGS4lWA7D2fCQOis6EuiaYGBdI4H38=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=wunner.de; spf=none smtp.mailfrom=h08.hostsharing.net; arc=none smtp.client-ip=83.223.95.100
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=wunner.de
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=h08.hostsharing.net
Received: from h08.hostsharing.net (h08.hostsharing.net [83.223.95.28])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256
	 client-signature RSA-PSS (4096 bits) client-digest SHA256)
	(Client CN "*.hostsharing.net", Issuer "RapidSSL TLS RSA CA G1" (verified OK))
	by bmailout1.hostsharing.net (Postfix) with ESMTPS id 838A63000ACA4;
	Wed, 21 Aug 2024 11:11:40 +0200 (CEST)
Received: by h08.hostsharing.net (Postfix, from userid 100393)
	id 5DC991BD87; Wed, 21 Aug 2024 11:11:40 +0200 (CEST)
Date: Wed, 21 Aug 2024 11:11:40 +0200
From: Lukas Wunner <lukas@wunner.de>
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc: tools@linux.kernel.org, Ben Widawsky <bwidawsk@kernel.org>,
	"H. Peter Anvin" <hpa@zytor.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Matthieu Baerts <matttbe@kernel.org>,
	Luis Chamberlain <mcgrof@kernel.org>,
	Maxime Ripard <mripard@kernel.org>, Paolo Abeni <pabeni@redhat.com>
Subject: Re: [PATCH ksmap 0/2] Keysigning map cleanups & graph links
Message-ID: <ZsWvTHKiBtZek6_I@wunner.de>
References: <cover.1722439238.git.lukas@wunner.de>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1722439238.git.lukas@wunner.de>

On Wed, Jul 31, 2024 at 05:30:38PM +0200, Lukas Wunner wrote:
> The key ids on the kernel keysigning map link to pgp.cs.uu.nl,
> which has been defunct for a while:
> 
> https://www.kernel.org/doc/ksmap/
> 
> I propose linking to the graphs in the pgpkeys repo instead (patch [2/2]).
> As a byproduct, I'm cleaning up some stale or incorrect data (patch [1/2]).
> 
> I think I would technically be allowed to push directly to the ksmap repo,
> but naturally I want everyone (and Konstantin in particular) to review
> the changes beforehand and provide acks or raise objections.

Three weeks have passed without anyone raising objections,
so I went ahead and pushed these changes.

I've interpreted Linus' and Mathieu's responses as an Acked-by.

If anyone *does* have objections, this can easily be amended at any time.

Thank you!

Lukas

> Lukas Wunner (2):
>   users: Clean up key ids and e-mail addresses
>   yaml-to-kml.py: Link to graphs on kernel.org
[...]
>  188 files changed, 190 insertions(+), 190 deletions(-)
> 
> -- 
> 2.43.0
