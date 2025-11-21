Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E61719E839
	for <tools@linux.kernel.org>; Fri, 21 Nov 2025 21:23:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763760190; cv=none; b=EzLrBR6LRBXoUEIEMht49em6S1O/U8v1vhXzfj+neGQakzZYWnbneZNyV8mgD6HwbQ0BC6WVv/hJ5Cwznwd7VHTcqup0LLA7PAjRmks/bdygA3+YZnSTHzSUFVPtWtHOqHM1QKIxo0z9Da8eMG1vdhmxvTgRc/J6wMdsJxgYJF0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763760190; c=relaxed/simple;
	bh=Q1EX2ZNYOAnwt4urQWnngmaxRgyhCaNEWqP0G1CBK5E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qeZve+Z43iUbmrllPmDnaNK94cqk+rvFaWiD1j6ZYnnKSSv2HZGTEUnxvXFRm9zb+qrw/28ZEhFh4fPjuSdHpyzvryJImVtNWYn7TNiJmqLTqdqPpNDQyKk2nZKSY6Si1LjqQlwtb29bYd7Qr89VKcpe3d2rSOOFsQn5HFe5fjM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=V1RNfecC; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="V1RNfecC"
Received: by smtp.kernel.org (Postfix)
	id 91F84C116C6; Fri, 21 Nov 2025 21:23:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4DDF6C4CEF1;
	Fri, 21 Nov 2025 21:23:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1763760186;
	bh=Q1EX2ZNYOAnwt4urQWnngmaxRgyhCaNEWqP0G1CBK5E=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=V1RNfecCADNoiEOLhSXI8xBbU95z0gBS1OYWnpk5KdU2/UX0bKxXfJHyVY7tnNv/N
	 EFQfxQVTgh85wOm4BG/1/DHL7Fl4WHOtbQ5pLA0l60g3hVgT/N+WFgApOLHlbT4LPP
	 uPevEhm4BNzkEMJOGKSAjDViAiiRicNBmYCay5b4=
Date: Fri, 21 Nov 2025 16:23:03 -0500
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: Marc Herbert <marc.herbert@linux.intel.com>
Cc: tools@kernel.org
Subject: Re: Switch b4/README.txt to "pipx install" instead of "pip install"?
Message-ID: <20251121-idealistic-satisfied-snail-7d0199@lemur>
References: <m2wm44ui4k.fsf@C02X38VBJHD2mac.jf.intel.com>
 <20251118-quirky-resolute-aardwolf-f0befa@lemur>
 <m2ms4ft7wt.fsf@C02X38VBJHD2mac.jf.intel.com>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <m2ms4ft7wt.fsf@C02X38VBJHD2mac.jf.intel.com>

On Fri, Nov 21, 2025 at 01:03:46PM -0800, Marc Herbert wrote:
> > If you'd like to submit a patch, I'll be happy to apply it.
> 
> Sent. If you'd like to fix my English or make some other minor changes,
> please just go ahead and do not ask for my permission.

I followed up already, but if you'd like me to wordsmith the rest myself, I'm
happy to do that -- writing docs is nobody's favourite job. :)

> > This would require having to rerun `pipx install -e .` each time the repo is
> > pulled though, no?
> 
> Usually not. Possibly yes for upgrading dependencies or some other "big"
> change like some packaging re-organization, but not for pure code
> changes - that's the whole point. Give it a try?

I will, thanks for the pointer.

> The only drawback is the same as the advantage: too much virtual env
> isolation! It hits you when you try to install and use "on the fly" some
> fancy debugger, test plugin, tracing library, Python IDE,... They are
> generally "not found". Then you either need to explicity add them to the
> manifest, or use some obscure pipx option, or revert to "pip instal
> --break-system-packages -e .", or to "b4.sh",...

The biggest drawback of anything pip (or pipx) installed is that everything
breaks when I upgrade my distro to the next version and suddenly my Python is
3.14 and not 3.13. :)

-K
