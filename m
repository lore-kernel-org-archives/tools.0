Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9711847CA70
	for <tools@linux.kernel.org>; Wed, 29 Jul 2026 12:01:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785326505; cv=none; b=aA+VWPSFmNp5vHMLRwain9wU7TFo3nPo42Hj/YJPebcVKM3vR04de8YdjjaUKFv38blKYmP9Gx0AC05aT8KZeEFd4hUnloY0FFshty6hyvCEKGsI+V+IG+aRiYKqewIIAVUI+AZ8S1P1k+uQxs3RAu1dyEh61qlRk0HdFrhpIdg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785326505; c=relaxed/simple;
	bh=JZJYzNOHoDbABbvVqUrug/73/5OzEO7sAymMpmTb6IM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=E3uinn1K24lISTnEkHZeUe/oFzoYUIU4g9wbiOMgsGgZmpGikm90YHIO94z025D+wd2IuPlQZ/gFo42u7Bv0Rjxe2uAjNgH12ilHoQhP4wX5YIxnwVJki50uBYxMUnWGKlwcWidF7NJyq9wraRu8lGtJkdCWgIX9nRzrm54/cFw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hjlVc8i2; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hjlVc8i2"
Received: by smtp.kernel.org (Postfix)
	id 3FC661F00A3A; Wed, 29 Jul 2026 12:01:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5DBA31F000E9;
	Wed, 29 Jul 2026 12:01:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785326504;
	bh=JZJYzNOHoDbABbvVqUrug/73/5OzEO7sAymMpmTb6IM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=hjlVc8i2SE+gqjmunV4nOpvNtwHHxppGk55OtMh09aenvFWajmZI++IT/KQh5sRk9
	 +WrajhLUHDIiRODVqt6WWC8EpNbHiIgEld233InVFydCRoA79/kQf/aVdCW56H/1AX
	 8+KcSQtdAPkeSiHAMNBvUdUpVu+cR1dzrp2k6K2C/RbT3WnDgWh5iX5aT6FIQcKHG6
	 YjK+9sKQuPGcx0MT8cZ/w8VYgMl+0nu1puWdj+qwb9Xu9IyOuKRDOcfneBgIWp/ppE
	 MlGr4AH9hjk7azyzDV0SS11F+gDgbxuD4+D7toUPl31sIqgFzYrGTXf380sQgqWlPs
	 /+7Mrp5JUhtcg==
Date: Wed, 29 Jul 2026 13:01:40 +0100
From: Mark Brown <broonie@kernel.org>
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc: Matthieu Baerts <matttbe@kernel.org>,
	"Kernel.org Tools" <tools@kernel.org>
Subject: Re: b4 review tui: too smart reply features?
Message-ID: <af04f1fe-1495-4e1a-9235-b651cdbfee2b@sirena.org.uk>
References: <c281cf50-7935-488c-8429-03eac9b8902e@kernel.org>
 <20260610-psychedelic-encouraging-quoll-c7b949@lemur>
 <b2c44799-85a9-4576-9aae-b43eb1092315@kernel.org>
 <20260729-pig-of-lucky-economy-3a5ace@meerkat>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="7LEG3DsZ9vf00GIS"
Content-Disposition: inline
In-Reply-To: <20260729-pig-of-lucky-economy-3a5ace@meerkat>
X-Cookie: Captain's Log, star date 21:34.5...


--7LEG3DsZ9vf00GIS
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Jul 29, 2026 at 12:38:16AM -0400, Konstantin Ryabitsev wrote:
> On Tue, Jun 30, 2026 at 12:55:25PM +0200, Matthieu Baerts wrote:

> > BTW, after having sent a reply, it appears a few seconds later as unread in
> > my inbox. I guess only a filter on the inbox side can help to mark them as
> > read, right?

> This annoys me, too, so I'll think of a way to handle this.

It could just mark all mail sent by the user as read automatically,
that'd also handle the case where they reply separately.

--7LEG3DsZ9vf00GIS
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmpp66MACgkQJNaLcl1U
h9DInggAhuvK/kysvnfYBDmq3+nuZYwpI3SzjY1rUW6FKJ6M0CR241C8ALNbn+QD
DSAKV85rSNWmLoJehfItRSzuOM4Wbpm3Fqssz49tdqGjvLr9utk2jB6M5NFaIZcZ
lTzaiGLGSFa5aREUtCff6Wqvx7hTpsbuM9x4PyOnK0U+YKealg6fcE6k4lrGBl50
h0ZKujJ0yVNesBbaEjDWBHGppl1CgmqNGWlFomKcH43CaxK7jD9WN2jU0TjriGPM
Y5vmeb4sxwZ9fw48WCjjvzkNKBKciv+y2XwNyZC/opKQfJG+R4GwmRgRhoUo+kqk
fgm/xfpMZMeXFZ9WRSWdVPSuHw5NLw==
=ssNP
-----END PGP SIGNATURE-----

--7LEG3DsZ9vf00GIS--
