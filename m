Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E53C35E937
	for <tools@linux.kernel.org>; Tue, 16 Jun 2026 14:45:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781621153; cv=none; b=im4Q3Z8qQh6ou52LgYzK1npKOR3MWHKfLU5VzsaSszLrtxQnyhVNVChSovacadSYcY1QZCZ5HujdIwlBglTVwtaveEoucJNb/PaUcYOxCdPGaUL3QG5jCtRiKimpB48PK+XS/zBx3L+gwi+nsS5X+ONYVmqA0kuXHTHKZWA/KHo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781621153; c=relaxed/simple;
	bh=NRPcwuIea+AOg5CFI5BOVg9Eg4Q+3QfCZUYJshoItc8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Y2PKuBqV2tbrFuWsR14Nhb6NFTi8dO8nxgkNjEJ5PfUsuim2G2txTuPp7sultTKFQiS6lkY7jYN6LtixDMIqysye6uaMkXyaS9tchSd0+9YtisGaFVCfNI/oXixOc4KqplzHkYzJuJSRIxbXe7+AjrrbMsEitlFDnqg+Fg7wDkg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=Ky1oxTSn; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="Ky1oxTSn"
Received: by smtp.kernel.org (Postfix)
	id 4AD6F1F00A3A; Tue, 16 Jun 2026 14:45:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E117B1F000E9;
	Tue, 16 Jun 2026 14:45:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1781621152;
	bh=DyOwgwjosA3Mmct+Kosl6CmCnxJB1MF/U6NxITK3JC4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Ky1oxTSn2k5aRZzkZayLCfm7TUaQuJZ9xILncB4osxlRCKg9Mb/o8xyjKxpdRmoq/
	 MuIuK0NwlrD9h8XOo34KvJcC7G/1NMUtvC+8F7Dbv8+RKtMf0/peBE6IcHdvDWj+L3
	 apwsUNs9jl1BPQxumnQsBepZ//Hn5zreGEkR9EOI=
Date: Tue, 16 Jun 2026 10:45:50 -0400
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: Mark Brown <broonie@kernel.org>
Cc: tools@kernel.org
Subject: Re: b4 review tui crashes while openining serieses
Message-ID: <20260616-discerning-maize-hippo-f42c9f@meerkat>
References: <21fe13c1-5c9a-4a47-b97b-251da4748aea@sirena.org.uk>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <21fe13c1-5c9a-4a47-b97b-251da4748aea@sirena.org.uk>

On Tue, Jun 16, 2026 at 01:06:25PM +0100, Mark Brown wrote:
> Hi,
> 
> Recently (since the support for cancelling network requests came in?)
> I've started getting crashes sometimes when opening serieses, I think
> only when opening them for the first time, I've not been explicitly
> cancelling anything.  Retrying generally works fine, it's some race or
> old state:

Attempted fix is on master. Not 100% convinced that's the cause, but it's
worth a try. Let me know if crashes still happen.

Thanks,
-K
