Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDC6C27815D
	for <tools@linux.kernel.org>; Wed,  5 Nov 2025 19:28:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762370930; cv=none; b=svPYD+kDyzRgyNTO0p/rP94KSjJZ/wdxMdLDclmgas+6exKEWEAOkV/y/ajDfGrpFvFU/byphCGwLrIgUsTYeRD1k4aBpj8MHWplP60j7TkyYVSyIkNzePgkdI0QUBN7fnDGm8URiBqFfk2P7G5fTq0gtcwk4DnjsWYUEoQ9bqA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762370930; c=relaxed/simple;
	bh=XNToSGa6weFO1KS/nonWn00wlXkqCQRdfFRADDwXJZo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GY0CEQcNRu/A0EhDgx4wI2C/pKOAE2mXMjCdVSDZz44pum+OjJ5WuYUSHg1X6BTscIEfKR9mB6xA4Dx6Q8GcJS0UXqztudXdRLtff+8YrKymGSocX8sVm/b1nJL4K3WzJ5RQkwZjrArOIxeazmnd00pRh78Hn4eO0x2EqcRcgkQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b=MwyLZyQ4; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b="MwyLZyQ4"
Received: by smtp.kernel.org (Postfix)
	id 80190C116C6; Wed,  5 Nov 2025 19:28:50 +0000 (UTC)
Received: from mail-qv1-f44.google.com (mail-qv1-f44.google.com [209.85.219.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 9A5CAC4CEF5
	for <tools@kernel.org>; Wed,  5 Nov 2025 19:28:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 9A5CAC4CEF5
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Received: by mail-qv1-f44.google.com with SMTP id 6a1803df08f44-88043139c35so2036486d6.0
        for <tools@kernel.org>; Wed, 05 Nov 2025 11:28:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1762370928; x=1762975728; darn=kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ehdNkqVz9hsVTdXbfd1vQEKkYQ0pItwGqbgXL3yTFMQ=;
        b=MwyLZyQ4/csuAsG2UQey/FyI19+Oxcx03AH3PxH2Y6Un67EvCH3KV6n1aGRJ3copEP
         jqiPj1vdb420WyS6GI39q00HsuyRiGmK/NlWhXuMsjNDJ/y9GZUhCYWKApyVfKbgxJgI
         SXq72wvtL1cAYxdo2vgrjIXLisakVQ5zkk362qDeAKxuNQsASfWpJUFAXLLz7j7HszZ6
         rDjRzu0keynsoZasv82tP3ZnMsKPEMSzAJG4FV6BkVWbXgu/S22gtezaVip9WAW4Avj0
         RknbwPLekOyTqRKwe5f9Hehdhg1AF51W2p+hlrdUbMGa5udoc3G+Pva2hlgiEwBZBjYi
         2qOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762370928; x=1762975728;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ehdNkqVz9hsVTdXbfd1vQEKkYQ0pItwGqbgXL3yTFMQ=;
        b=tVR9YS2n6IeYz5uSNjqi5LAYPt+JdCpS+xAU18tVWuaBng10uvypP9QI7KIJsnrsWQ
         kHSjZ+W4XJKt+HqDHCFz9VklyCK4+SQjQrfAkPd5soPy67C/ANYAJHpDsDlcQMgKC0nJ
         5I/Fv/Pxfzuv7eoxyeJqbPzN13FozqqzJ8n8chs/rpS1xTPC9VVev8hp1sdxu7etKm2T
         WR7idvOjcrOV85ES/rDu6bKMrSlW5tfTNitqdq2wWMUrH/fJAsNns6ODAuU2T+QQqqg+
         xCWWB7MOvM9YwZGj9f2yri9JXmyQnw/hZFqq6EMf0/ENdA9UbH3SHDL8Y4NZXLeCqSyu
         1STQ==
X-Forwarded-Encrypted: i=1; AJvYcCVmavhIdFmJMx6LfFNMmH/9/BS+ajTUp/Yyx6yr5xCq77LKO5LnrFZbZ3uVMcGIjPv8J07lYg==@kernel.org
X-Gm-Message-State: AOJu0Yx/xP5AVrkNVyedXkvVVwbJQ5HD2lFkzudMMFfkCFqnIZePBkUY
	31WFzfR7hYxF4Qx+o7D0NdZZ6iZFABR5Y/gryoJR5BW+xymtCG3oUEXCO0pTl622aNw=
X-Gm-Gg: ASbGnctiOzhbw+i9Y78XJHLOEjLyNz4r33TxNAY8YRzLz+dYYsF32/bOkqSv2a6cMdv
	vfev2Wy+O6qPIsDiP6D/+0lg7Jb6u6FQt1nUja1PoVSI4bLSOhKtJ7lXK9C8YKsHewHYVnnd2iE
	TtHO3qcAKmiw7bHbZfyVgRlXJixuOCAlZOJmnNa4JUQXIPZMn2hZuwqw/Q/wk4fXUrW1w9JQd6w
	5yHy8u9diI61QFOFm8v2OgQP7W5hwPSGhII2EdlfJWLgHDm37+q5VPUfwrdQYwYByZop2PwoLFX
	LE0zw3HBfZF4Qtu1d27GsTU30tgQ2Adbdqhz4XsrVYnfz1TfxU5d62nA6XpWcErs6QCNnUW76UK
	tUXySXH0NT5bPtuNYKfZSoegJOB/wywR7XIvMEzOdURqXPx3sP6ucrX+DGvAgSLFWv629akLJqM
	88NlLb4byjWSKI0W1pqQBWOJskwa+3cA/nT/dj1neb0yoEiQ==
X-Google-Smtp-Source: AGHT+IEXjXeNsMu8nIQkVXUxYERXNx05UgcuZnGSWl+5YWwn8fSFXHAyJzbYGr2u9tOzxcU4RU65xA==
X-Received: by 2002:ad4:5d4a:0:b0:880:4272:9a5d with SMTP id 6a1803df08f44-88071135c42mr49931856d6.14.1762370928152;
        Wed, 05 Nov 2025 11:28:48 -0800 (PST)
Received: from ziepe.ca (hlfxns017vw-47-55-120-4.dhcp-dynamic.fibreop.ns.bellaliant.net. [47.55.120.4])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-88082906016sm2990046d6.22.2025.11.05.11.28.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Nov 2025 11:28:47 -0800 (PST)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1vGjBX-00000007DIR-05Jp;
	Wed, 05 Nov 2025 15:28:47 -0400
Date: Wed, 5 Nov 2025 15:28:47 -0400
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc: users@kernel.org, tools@kernel.org
Subject: Re: korgalore: a tool to put lore/lei messages directly into gmail
Message-ID: <20251105192847.GS1204670@ziepe.ca>
References: <20251105-mottled-bizarre-marmoset-b055ae@lemur>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251105-mottled-bizarre-marmoset-b055ae@lemur>

On Wed, Nov 05, 2025 at 01:36:12PM -0500, Konstantin Ryabitsev wrote:
> So, unfortunately, this tool is not a drop-in replacement for most people who
> want to subscribe to LKML or other high-volume lists. However, if clicking
> through 10 screens doesn't scare you, this tool can be a good alternative to
> SMTP-based subscriptions and will likely get you the list mail faster and more
> reliably.

This doesn't have to be so bad. My mail tool:

https://github.com/jgunthorpe/cloud_mdir_sync

Comes with a built in oauth cookie, and a built in webserver to manage
oauth.

The tool auto-launches the web browser to localhost. The first time
you run it you will have a one screen to accept the application to
your account. From then on it generally doesn't require any
interaction as the token that comes back is pretty long lived, and if
not the refresh through a browser with an already logged in tab is
totally invisible - again by invoking the web browser to a localhost
URL that automatically generates the required redirects to get the
authentication - without interaction.

You can use the above purely as a capable oauth broker, and a tool
like you are proposing here can just use a callout like:

  cms-oauth --cms_sock=cms.sock --proto=IMAP --user user@domain --output=token

Which will rely on the running daemon to acquire and retain all the
require tokens. The various documentation pages linked from above are
quite helpful :)

This can also be wired into the various smtp programs so it gives a
comprehensive and easy oauth based solution for mail. Works on
Microsoft O365 OAUTH too.

IMHO OAUTH is good, we have very bad software support in Linux, but
that doesn't mean there is anything wrong with OAUTH. It's just
kerberos reinvented to use public key crypto, JSON and "web
technologies".

Jason
