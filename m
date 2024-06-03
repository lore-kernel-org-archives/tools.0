Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 926BB12E1CE
	for <tools@linux.kernel.org>; Mon,  3 Jun 2024 17:30:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717435819; cv=none; b=aKPoXeXd1jIAeT1QhtM+Wl9Ijp6gtc9LagdrKmYBZTDqpSK9P9IFvMYtYsV80OyNhoMIDPtsP7e0ZMyLEtZcxOndKOtWkHP7JRkib6ZEYzGm5+exSlwbUojsDnKoSh5VKR1fg7VCmgGrd/SqHlNtfQrARR1jGolAfWVgOO6VQW8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717435819; c=relaxed/simple;
	bh=JQIZM6vuLtFw/KiF4T2Vq8l2sH5sbR3sZk2UDqCm2iA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WSZhNlUBPChv/6KkxzgD7UqKkMPX9Y3nErXb0LDDPezE5IWkTWNe8udwLPyYIRVtGvV9M4qnvh5L6cijNnQMvQFlkgNTq3voEYzNjw9mY9nZK4HjhynDaGykDwtUOukDIy8Ujht6WYMwuY6oy4bV5FZoAXo9D9BcYq5GcnSqKOk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=G+Rma2LL; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="G+Rma2LL"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 64A88C2BD10;
	Mon,  3 Jun 2024 17:30:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1717435819;
	bh=JQIZM6vuLtFw/KiF4T2Vq8l2sH5sbR3sZk2UDqCm2iA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=G+Rma2LL/9nofQa3lCGIIGZ59N8xpQ8QXIIjhtBGyoUr2Shvuo+LLA6elrI8Zi2dy
	 u9Lvl2nJ8WhapfaYgq73L/cyp+bFIUfZmxB6nDlvA0NkChyVEqMDT/feZLs/pkpBh4
	 jr9MCRJ0VqYdjAmkalCqa1qn+WoKU4CEZTqr3AbFsqnMFnzETsGWS1lsfKBK7MLmzt
	 JcHTrLG28AiQVe4MJ4SjUPRwkhpQc/jJ5SRjKevcyVrlvR7pPDzwhrVNeCZHK/l3KV
	 hJD8t1Pgafg3G/TL5ZJcBDY1ZSUfQgaqWsUAeBWGSjFBDzzijgCsx03ogBRoJLmTko
	 pvo6hfNpslGcQ==
Date: Mon, 3 Jun 2024 18:30:14 +0100
From: Mark Brown <broonie@kernel.org>
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc: tools <tools@linux.kernel.org>
Subject: Re: Trailer updates to git commits not working
Message-ID: <da75a55b-a698-4723-958c-6ee5e3b55104@sirena.org.uk>
References: <15b55c55-8060-4c46-b545-3a3e774a9875@sirena.org.uk>
 <20240603-opal-wolverine-of-tempest-7a8939@lemur>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="H1Q0k46McAYItQ32"
Content-Disposition: inline
In-Reply-To: <20240603-opal-wolverine-of-tempest-7a8939@lemur>
X-Cookie: Don't let your status become too quo!


--H1Q0k46McAYItQ32
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 03, 2024 at 12:30:42PM -0400, Konstantin Ryabitsev wrote:
> On Mon, Jun 03, 2024 at 05:03:37PM GMT, Mark Brown wrote:
> > Hi Konstantin,
> >=20
> > At some point b4 trailers appears to have started having issues matching
> > my commits, every time I run it it complains it can't find commits:

> >    b4 trailers --update --trailers-from 20240603-md-base-regmap-v1-1-ff=
7a2e5f990f@quicinc.com --since regmap-6.10

> I'm curious about "--since regmap-6.10" -- is that known to work with git=
-log?
> I thought it only understood date formats?

Ah, that's me being confused about what --since is supposed to do!  I
had been under the impression that it was letting me specify a commit
=66rom which to apply updates (now I look at the full help I do see that
it says that the default is a time range style thing).  I didn't realise
it was a passthrough to the git log option.  In that case this is a
feature request for a way to specify which commits to update trailers
for, the use case is collecting tags as I apply patches on top of
already published commits.

--H1Q0k46McAYItQ32
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmZd/aYACgkQJNaLcl1U
h9DsCQf+MnKa1RJAUgHMbTqzgCL6594hhZ7yC0KDDJOodJfoxXkD6fQcm7k6wb2K
e1NVH9rgiMwySB2nYbCpLPIiwch7HfjBXreWc7XbFI/8Af7aHI/LmyOL9sPuvBgQ
M9mkdeR4UmovmRcImpJQE2AQAX1IEDnf9eVLDCM+0RHnZBZLGKHoOiUIA1ygxRra
rBd30qOq9U5bXWnGzOOKut4u5uvOCu+XSDyFXZa+QtoeuiMAURMNqehJ41C+dPwC
ll1nTytViotIeVAKbMpfyZNgVIosfBTsq4iixgH1CvZnWfNng4y1PKiqwDa0cc+D
BsppQ2y1rzpkIouvjvUZLrCPHRdymg==
=W1ZG
-----END PGP SIGNATURE-----

--H1Q0k46McAYItQ32--
