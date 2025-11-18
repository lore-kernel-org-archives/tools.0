Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B270F370304
	for <tools@linux.kernel.org>; Tue, 18 Nov 2025 23:02:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763506934; cv=none; b=Pcl6sdRWWqQ7E0iftycv4D2cl6P1Cot6boA5MZbq4WGVoEQsu8yQN4T9LeM8v0yz/xt+3ohIZV84/sFaMrcl/F/+0fCxlOzdl5uG8xcLijRinOUA6SYQNMiaYbzbvPnL+Rz5TMEgMeTOrXW60ZJjKPjpHPW27i8Q5Krg91QDdRc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763506934; c=relaxed/simple;
	bh=iAK2CWXEG9NqKx6nUb9E19PoxK0gjN+nchFestqBcmQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YJFnu83LEfStCHjs5yIwpWW3pcytWGZzb6QKbDLJ4fv9qN3mHU8PvFz4hEzqYPGGJd8vO7bGXcCi5pAgGoXlsI8Dq/tKutksrmKE+eD8ZsQz3ZfatLv+6ooTktjPNCz12x9DGsPeNNuS+w1PKPXGgsd+38Bc1rq4GdjSnl5yYgw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=RpUHuOtp; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="RpUHuOtp"
Received: by smtp.kernel.org (Postfix)
	id EEFACC2BCAF; Tue, 18 Nov 2025 23:02:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8A26AC2BC87;
	Tue, 18 Nov 2025 23:02:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1763506933;
	bh=iAK2CWXEG9NqKx6nUb9E19PoxK0gjN+nchFestqBcmQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=RpUHuOtpMT3bdZ+FekdKbrWsHJ80OlrzQg3i1Kj4Ul6psRC2fNJsBVBRRuupfesBo
	 ugeJYu69o3GBtzflHt6vKpUsB8iXoDG2QVk6x4yvXKdXH5wjPuwk26W4cLFQJJKl4i
	 2Rw/3OOZyyY4duFv9m4pay1V1mJ+5tHQ+D1e7SRw=
Date: Tue, 18 Nov 2025 18:02:11 -0500
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: Marc Herbert <marc.herbert@linux.intel.com>
Cc: tools@kernel.org
Subject: Re: Switch b4/README.txt to "pipx install" instead of "pip install"?
Message-ID: <20251118-quirky-resolute-aardwolf-f0befa@lemur>
References: <m2wm44ui4k.fsf@C02X38VBJHD2mac.jf.intel.com>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <m2wm44ui4k.fsf@C02X38VBJHD2mac.jf.intel.com>

On Wed, Nov 05, 2025 at 04:20:11PM -0800, Marc Herbert wrote:
> 
> Following the current b4/README.txt instructions on any recent Linux
> distribution (approx. less than 2 years old) fails instantly with the
> well-known "externally managed" error https://peps.python.org/pep-0668/

Yes, this is probably the right course of action.

> So, should the README simply switch to "pipx install"?

If you'd like to submit a patch, I'll be happy to apply it.

> Also, I'm not an expert but I think installing from source is probably
> better done like this:
> 
> git clone --recursive b4
> cd b4
> pipx install -e .
> 
> This allows running any version _and_ from the checkout directory
> without depending on any "b4.sh" indirection.  The main difference is:
> dependencies are isolated/protected in the virtualenv. Some users may
> want this, others not.

This would require having to rerun `pipx install -e .` each time the repo is
pulled though, no?

-K
