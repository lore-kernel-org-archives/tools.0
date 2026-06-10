Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 760E040680F
	for <tools@linux.kernel.org>; Wed, 10 Jun 2026 11:11:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781089920; cv=none; b=XSt6E0JeZZ9il36FFUmTYjRKXgKtI8yMNyvp4KdQeCz44lKPu21KIvRzwqoyRBmQt0kpo9tkiXahbNMkpqRbzPXBp2n6ekaB3wjbG6JE76l4ibUNaIOTgJHEkJTIEubVZDLovVWlaMMxw5jbfmuGZ/m2WbGfpc25e47OWp+urfU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781089920; c=relaxed/simple;
	bh=QmckbFiTQekzspzdWMIe1JZyDgKD1mlFKFBBuugLQKM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NT8Rc+ifjoGqp2w3yvQhpbTTrLgHaRKDJ5DxqZm6gW1xj5/dYiFY1Of4UYB0IKYGRHxDtbxykIXjSnWlCKm+gE8Y1XI5nPUbT9qw4b5ho0xKtGAVbkshGwv63NSuyd0z2gLFa4bDjNYKWTaDrY/iJ4AKoOImFcqGp9LK5UELYBE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LIOArbLi; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LIOArbLi"
Received: by smtp.kernel.org (Postfix)
	id E6E641F0089B; Wed, 10 Jun 2026 11:11:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AC5101F00893;
	Wed, 10 Jun 2026 11:11:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781089914;
	bh=QmckbFiTQekzspzdWMIe1JZyDgKD1mlFKFBBuugLQKM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=LIOArbLixB12EvWtQbtYlkVmw9mkBSGrtsdVzO7iN9mW0ufWZF3VMNm3PLwNdx+aX
	 LifcwE9JY+KUJ9yr8GXf3MBJFULnQTqDNRCOPMxOFuJ/W9E2Au3EVp0NX9oBpv5TbL
	 WY6qdRKOhmamtx02AuELuhtEpCoF5GeVliikYO4XkTDH6hL1/8nGqCQq52uxNGARua
	 v4l3YN4n25tr0XMmxtl4dvRfRLh/vBsvLvoKMFV8noGnNL3UmH92NGb5jUnDrPR83a
	 PRUWIJREp5itGizW8TQjPH9lb6ptp+pL47L9nTRAN4lUTo1k5YKwV7Xqp+C8nQqjS1
	 4ZlP2/X+yd4BA==
Received: by finisterre.sirena.org.uk (Postfix, from userid 1000)
	id A92D61AC56C5; Wed, 10 Jun 2026 12:11:51 +0100 (BST)
Date: Wed, 10 Jun 2026 12:11:51 +0100
From: Mark Brown <broonie@kernel.org>
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc: tools@kernel.org
Subject: Re: b4 review workflow issue with partially accepted serieses
Message-ID: <ailGd8akixhx_GHg@sirena.co.uk>
References: <afk5QvNAQDxFCbvT@sirena.co.uk>
 <178104250404.112711.2880594121343252200.b4-reply@b4>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="gdBAFpmAVmXpeFMD"
Content-Disposition: inline
In-Reply-To: <178104250404.112711.2880594121343252200.b4-reply@b4>
X-Cookie: Leave no stone unturned.


--gdBAFpmAVmXpeFMD
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Jun 09, 2026 at 10:01:44PM +0000, Konstantin Ryabitsev wrote:

> You can then review it again to take more patches or do anything else
> with a series that is being reviewed. If you take a subset of patches
> again, the series will go back to the "partial" state. If you take them
> all, it will go to "accepted".

> From the action menu a "partial" series offers everything a "reviewing"
> series does: take remaining patches, rebase, range-diff, upgrade to a
> newer revision, snooze, mark as waiting, abandon, archive, thank, etc.

Yeah, so the not being able to send thanks is actually blocking the
usual flow - as well as not sending the thanks mail the tool doesn't
understand that you might have no intention of taking the remaining
patches at all so there's no way to say "I'm done with this now, send
the thanks", you can just archive the series or return it to reviewing.

--gdBAFpmAVmXpeFMD
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmopRnYACgkQJNaLcl1U
h9CIdwf/SvO7lc/DOC4Qoz9D5j8zV3IdO8vcAkcxeUwSSd90HALZzHwOUfwLhPYx
M7a8Qoyk7J0AzSB8vBL3Gly8XvggZA1wJma2uPF8oXQUgc87c1Xd/GWF55qLw2bQ
qc/oWEr614U3X4hMY3jQX7kH1uNy36nP6O3FuaXZ9hsdV4xWO7/n94wmzHZt1ln0
s209RNJ6KCAR3dUuLbWeY6HQ66NeJhvrts+gclvWvUK65gYFNhDixqCwv+AM0V/R
GVioKHFNmy5XLbwPuqp3BPqOjggdCoj7n9xTEH2mLi5BYK3HdMJolbeke4spcQCN
OWtt1nCFI0audub7ZR5biJUgnpX6ag==
=s80j
-----END PGP SIGNATURE-----

--gdBAFpmAVmXpeFMD--
