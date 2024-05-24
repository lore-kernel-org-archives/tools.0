Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B21386262
	for <tools@linux.kernel.org>; Fri, 24 May 2024 14:29:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716560944; cv=none; b=mvu+LFckExHn3kEurmoM2T5uXlkUEDprBRk0n7oQ9A3PRA3ANn3LO4f8KAJnWv3JRIMTJ0xP/Sy6vS6gaWbodBbBHk1kCEt9rv9Wxjt+SzJNNAaIS/gzmOqqjoQjeLo0tsR7XGQxMB5aVbaAgLPiHo+AzleLz9AYKu6q0Kwq250=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716560944; c=relaxed/simple;
	bh=Ka6RZK9CDXGCi8/1D/C1BqWs8iJF39utvrIG/keIHDI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dSpTxJDUwbDIjsLmXvt3gbT9Tl4Catcx7J5fYC0YbPiz4dW7l6Y7yKNo+1rU3JS9rBfni7dQ1D7RtZ+6zwyxWyx5MVDGFaQ9V9rqLdXnsynP9hlK/fv7P83oq36CPLIdxg//OS1mYJQLJ5FuedGOb2ieNl6gLNhjC0OYyGR4myQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=A6D8Z3sd; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="A6D8Z3sd"
Received: by smtp.kernel.org (Postfix)
	id 90B6EC4AF08; Fri, 24 May 2024 14:29:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 58604C32789;
	Fri, 24 May 2024 14:29:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1716560942;
	bh=Ka6RZK9CDXGCi8/1D/C1BqWs8iJF39utvrIG/keIHDI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=A6D8Z3sdOA4chGRnTeCJ5p//+RST5La33c4e63YN9IT3Y5kCbdIDyzx5RqGSQw2gu
	 jtFD/nU/kzBWmOtSLSbnNLmweXOO52ZO2pmVH+lijfdQhHfJ3iwAZsq3+RnT3jCShc
	 Cx3GCC2H1s18M/XRAQidQWnIULZ0+NtXV0nISr9g=
Date: Fri, 24 May 2024 10:28:59 -0400
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: Quentin Schulz <foss+kernel@0leil.net>
Cc: "Kernel.org Tools" <tools@kernel.org>, 
	Quentin Schulz <quentin.schulz@cherry.de>
Subject: Re: [PATCH b4] docs: document b4.send-prefixes conf option
Message-ID: <20240524-great-fanatic-whippet-caec89@lemur>
References: <20240524-doc-send-prefixes-v1-1-c6465822ad8c@cherry.de>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240524-doc-send-prefixes-v1-1-c6465822ad8c@cherry.de>

On Fri, May 24, 2024 at 03:30:35PM GMT, Quentin Schulz wrote:
> I'm also wondering if we're missing tests for this?

We're missing tests for most things. :) Writing tests is a lot of work 
and, unfortunately, I do not often have enough time to spend on it.  
There are some minimal tests in place for the features that, if broken, 
will result in maintainers being very upset.

> Additionally, should it really be entirely replaced with
> `b4 prep --set-prefixes` rather than appended?

I'm happy to discuss this. A lot of features start out as stubs that 
later develop nuance as people start using them.

> I'm trying to add config files for b4 to different Yocto git repos.
> Small Yocto git repos do share the same mailing list, but need to use a
> prefix. However, in Yocto we have a branch per release, so one would
> need to explicitly add the branch(es) to which this patch series apply
> to as additional prefixes. This would mean we would have to add the repo
> prefix again through `b4 prep --set-prefixes`.

This is, indeed, different from the kernel -- which is why you are 
having trouble adapting the feature as it exists to your use-case. I'm 
happy to brainstorm about this to figure out what would make it most 
convenient for your needs.

One way I can think of to address your problem is to allow a + to 
indicate that a prefix should be added to any existing ones (if not 
already present). This would allow one to run:

  b4 prep --set-prefixes +foo

and also specify in .b4-config:

  [b4]
    send-prefixes = +foo

It's kinda hackish, but effective.

> Also, modifying .b4-config with an already-created series will not
> update the prefixes (which made me first believe this was not supported
> at all). Not sure how to handle this though (if we even want to)?

We can specifically treat any +foo prefixes as "always add if not 
present at send time".

-K
