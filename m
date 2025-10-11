Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8712025B302
	for <tools@linux.kernel.org>; Sat, 11 Oct 2025 10:33:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760178825; cv=none; b=UxTZ5SYG4wv8OUZ2Cc2U4jojVFFNVmtTRsrr6AD/Nq6xhv19KNQtnxh74jovRm5GceB3AwNHTV8waABNGSYAD85yX48GLRokTIdPa0RQ8KiBrsLFyz7IXNl/yxEJBReDahEJOmxLn5/v9/cMM6pNYapO4mfFeNW5h5StKvgVmFw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760178825; c=relaxed/simple;
	bh=gYnL5wg71pKPZeN0kzXOz6KaOoET4ebgurmRXhOPSRg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=igKDEV1raU46bbtMIL+c7v2ZN+bolIM1te0fwcEQQ27Q2lW6LXH28MGuCtfIVwPBlWNMKKkwHttiOGE5Swx47bZC5voCC3LLXxcF8qyn0Ua9NXEVPs+WaW6BYl2X4+cucHEaJXHmmqoVxlvY8TnQoN3GzMmra/M5QrkHwpPHr/A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hYBSe+0l; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hYBSe+0l"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4A70EC4CEF4;
	Sat, 11 Oct 2025 10:33:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760178825;
	bh=gYnL5wg71pKPZeN0kzXOz6KaOoET4ebgurmRXhOPSRg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=hYBSe+0lgbMUzWwbdL9NPi8xySqnAwVSHFckOhyu2TvHijUZ7gVA6KlWoDuRfS+Xt
	 NPiyLSZXIpYqX2zCdBBWXCwNImFl9yLYIpJ0JMXogemyWEQ4b3XDhVOKABZWKlbTGe
	 u7uuZuLR9mf41fWmAPzIjTWFYA/9DnYqYLfXUzR1LgMvyk1yA5fb6bxdEz5RLgb2P+
	 TdNKww3yXgf1jro4y1H7vqDYx5cFwfxgp7GxY/R3Sg/Zq59V25Z8cuTfx93K3BR4/t
	 gk6sEZ65Hhc9FWALcFQ1XoVybQEgSQffYjQj3u/cQAPIZgQRcCjibO+RuLmjyroKcS
	 2pUnY4wRdfQnw==
Date: Sat, 11 Oct 2025 11:33:41 +0100
From: Mark Brown <broonie@kernel.org>
To: Willy Tarreau <w@1wt.eu>
Cc: Paolo Bonzini <pbonzini@redhat.com>,
	Konstantin Ryabitsev <konstantin@linuxfoundation.org>,
	users@kernel.org, tools@linux.kernel.org
Subject: Re: In defense of Link (was Re: [b4] initial "b4 dig" to supplant
 Link: trailers)
Message-ID: <aOoyhUzNDgwiyl5s@finisterre.sirena.org.uk>
References: <CABgObfY5agTRsB-bCqCYbA0erFn5cVbujtTNBiCti8g_68nCWg@mail.gmail.com>
 <20251011061351.GB23024@1wt.eu>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="dNImBTMqFnXpCv4K"
Content-Disposition: inline
In-Reply-To: <20251011061351.GB23024@1wt.eu>
X-Cookie: If in doubt, mumble.


--dNImBTMqFnXpCv4K
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Sat, Oct 11, 2025 at 08:13:51AM +0200, Willy Tarreau wrote:

> Maybe what would be needed would be a "Lore" (or "Series" or "Discussion")
> trailer that automatically makes a lore link from the message-id, and
> which would explicitly indicate that there's nothing else there but the
> actual patch submission, contrary to Link that's for any extra info ?
> It would be added by "git am" when passed a specific option.

There was an attempt to do that with the https://patch.msgid.link
domain, that's basically the same idea just done with a domain instead
of the name of the tag.  Linus wasn't any happier with that idea
unfortunately.

--dNImBTMqFnXpCv4K
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmjqMoUACgkQJNaLcl1U
h9COFwf8DMTEZiZYNHWDoI1wcWGBP66V6LOGa8SyvbWt+Gdm12/2athL7dT9v/Xo
KGix/bQ8qnLimBOSKrbEwjWbr1CJ0XAUzLp6XZkD2YstMWatpoEDV+/cmyVCDfrV
ZywsDGocUDnErhF9H/b1E6sCR9cbeMIBTIo2S8IilZjrFIlvftkx5C6jZmtqMFId
p0BR7FLjGCQLi9Kx3CIb+X4PTbxSM4B8/FWSgUXFGND0Nbq/65jSptthJnq7Lw7R
cPY+vm7TJdZjapzc9YqtjiGHUhEby4Iz2mF8BdCptdKFgSqmvaIannvJ/HGG7kdK
EGHMcVqUnZS+raf4DhMNjVc8EfxlEg==
=gD3Z
-----END PGP SIGNATURE-----

--dNImBTMqFnXpCv4K--
