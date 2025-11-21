Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA520270557
	for <tools@linux.kernel.org>; Fri, 21 Nov 2025 21:09:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763759373; cv=none; b=A6Nwll2E9DFHE0KECCGPYw7RRh542w3FyfXuHybRHetr/4kmqSppc1zeuCB74SZa7/2eO7qsv1hLRD4eOuSDsFRzeu07A4WfMKKes0snPWc23NTu6ij2hoEGHtgKBYiQldXh+9JBSkgOARdXrDKzs1pioST6rXIzKtXBIsEtsrI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763759373; c=relaxed/simple;
	bh=TR52FiOI511Ek8XLeKAl4mvuRcWsY0toD5CDXytyyoc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=B/xV6HZexXNUeuF4IoQ/wXZuET2OzxNM5sghjju2bx+S5kM+JIV8uYSdkzIHQzY4ozDH4gFceUZQFjlTbllxckP0eI0qyzHttxBqDUKcI/MmWXcX0cVzbcXnrpxpwl4wMKA0dFLTwJfx69uVTB6iPPtXRVeyw0GOHkyP0qRcytQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=IW/TP769; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="IW/TP769"
Received: by smtp.kernel.org (Postfix)
	id 68A4DC113D0; Fri, 21 Nov 2025 21:09:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 26F52C4CEF1;
	Fri, 21 Nov 2025 21:09:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1763759373;
	bh=TR52FiOI511Ek8XLeKAl4mvuRcWsY0toD5CDXytyyoc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=IW/TP769cvjdoqGGS21cnfWXpYg5rLtNllOF838MP7b/3/jqMGKfevW7UG7xvba8c
	 znABrprGmk9lFemrsRTuQhO1HChRJsHDB0+vnQxs2LoJkXQeUu+whEuMvwgC5YRCIU
	 zUJKcl52qHOhKak17ZI7k0ciBLekZmJq9CflGHZE=
Date: Fri, 21 Nov 2025 16:09:30 -0500
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: Marc Herbert <marc.herbert@linux.intel.com>
Cc: "Kernel.org Tools" <tools@kernel.org>
Subject: Re: [PATCH b4] README.rst: switch "Installing" section to "pipx"
Message-ID: <20251121-tall-messy-beaver-fad4ca@lemur>
References: <20251121-readme-pipx-v1-1-261e669ceccd@linux.intel.com>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20251121-readme-pipx-v1-1-261e669ceccd@linux.intel.com>

On Fri, Nov 21, 2025 at 08:39:05PM +0000, Marc Herbert wrote:

Thank you for your patch!

>  Installing
>  ----------
> -To install the latest released version with pip::
> +Since 2021-2022, ``pipx`` is recommended to download Python packages and
> +their dependencies and install them in isolated environments that
> +conflict with neither the operating system, nor with other packages.  If
> +you are interested why, see Python document PEP 668. Note: ``pipx``
> +existed and worked long before 2021 and PEP 668.

We don't really need the explanatory note here -- the purpose of the README is
to get people up to speed with minimal information overload. I think something
like this will do:

    To install the latest released version use ``pipx``, which should install
    all dependencies without conflicting with your system packages::

        pipx install b4

> -    python3 -m pip install b4
> +If you have not already, install ``pipx``. Usually from your Linux
> +distribution: https://pipx.pypa.io/latest/installation/

I would put this in docs/installing.rst, because that needs to be updated,
too.

> +
> +Then, install the latest ``b4`` release from pypi.org::
> +
> +    pipx install -v b4
> +    pipx list

We don't need the "list" step.

>  
>  Or to install the latest master (warning, maybe broken!)::
>  
> -    python3 -m pip install git+https://git.kernel.org/pub/scm/utils/b4/b4.git@master
> +    pipx install -v git+https://git.kernel.org/pub/scm/utils/b4/b4.git@master

This is ok.

So, we just need the bare minimal instructions in README.rst and then slightly
longer instructions, with details where to get pipx if it's not available on
the person's distro (I doubt) in docs/installing.rst.

-K
