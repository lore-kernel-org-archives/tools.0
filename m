Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9372C16F84F
	for <tools@linux.kernel.org>; Wed,  2 Oct 2024 11:51:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727869914; cv=none; b=GXHd041+RWG5bxkd9KjuTJnxcBTTRZ3hCSzeqH0bX93pkUDPC/RRlJJdPWSCcvOMM6NYb/f66uSIyE8p4O3E5PC+TUFkf6hCY5kGrPtaQ96d8eIpc2j3a3e0Lqa0LXHJhWtWLq6rmxejbcW31k6NTS7a1os/9dK45xLbX01PhkI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727869914; c=relaxed/simple;
	bh=0hxLs7YdA2G2orQgzEKWKy1zPJ1FKtKmpagJWTR+Pj0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=UsT1AAnRBcFYMGdPUfkarIns5K+dn4JT3LTaPIscNVaTv6V+L+DSjvWjAFuVoTfZYFLkVCDn7934YuLS+XLL8NXtW5i6yCzsXaoT3BAZye8hS+GcOP7zJRXoE7Hq1ozWaUf1PmaCfQkcqD1FWCeIaY7Te0btBAikfNZ4QlGi1fQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XYljqmN2; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XYljqmN2"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6EF22C4CEC5;
	Wed,  2 Oct 2024 11:51:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1727869914;
	bh=0hxLs7YdA2G2orQgzEKWKy1zPJ1FKtKmpagJWTR+Pj0=;
	h=Date:From:To:Cc:Subject:From;
	b=XYljqmN2FiA9xFUopvBK0vLxfzE81sbO+JRdiNW+vDuhmBnBLHZhi+I4bHBLYFgC3
	 kQ81shGto51gAxZUdlmIsJQTccP65yevDpTyyrU49lZYEZcrzYhPtVScJ8X6NRzLlX
	 O1EaR6OqitwqWjJHrIL7wn4G+/uTIfVy1UjqvSapP7tdtbBKD5E9Z1O4K20ZS6kagN
	 qnAMhRnNuLMUc3oaoahsMM2zzXt3rVTLhjqt2or1EQo4nqJ+0ov4mcKIOyn59xusgL
	 tLOpyAa0BwBWAOOc3HMe/6ZnXVuYBDGQMOJAIPBMs4cIM4hdH4akHyROTGlam0y/Ss
	 3UEWbmkj3P1JA==
Date: Wed, 2 Oct 2024 12:51:50 +0100
From: Mark Brown <broonie@kernel.org>
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc: tools <tools@linux.kernel.org>
Subject: b4 trailers --update picks up bogus trailers
Message-ID: <98450a13-1339-41e1-87b4-3db7387906c7@sirena.org.uk>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="6k6JYUOTDK3is5dB"
Content-Disposition: inline
X-Cookie: Know Thy User.


--6k6JYUOTDK3is5dB
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi,

With current git b4 if I run b4 trailers --update on

   https://lore.kernel.org/linux-arm-kernel/20241001-arm64-gcs-v13-0-222b78d87eee@kernel.org/T/#t

patch 2 picks up reviewed-by trailers which were sent in reply to the
prior versions of the series even though that patch is new in this
version so the update is clearly bogus.

Thanks,
Mark

--6k6JYUOTDK3is5dB
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmb9M9UACgkQJNaLcl1U
h9CWigf/YoGziMIl3uHbD590AZ7bKIlmH/pq+C1sBvt+cx4UMWGyXg/klvmoFon1
RWr7/hQcfIrTsPKS3ATQjO5a4nuiDJjtC1rnybeYxUwru+to0UOCpYAouMZr2b5f
qU1ezSzyF6+vboMMFjrVaRzS7R3fjHvgOYxPY/TDSu5pJVVAnETkEFKXv42R/px1
oSK4nwOcncguNzjSZjBnYEech69VI23WuZoL8H00eRcL69sG3IAJDrxtNC2CN3lV
LhGcMNWBm3gY1Tl4xWEv4JvNY/EauIjQbG8NDroA1MkYzDpggXTmdpIz3aEbBKr8
SX27/qCYy4nnEYY7V9VoaHlqecr8Jg==
=jzrZ
-----END PGP SIGNATURE-----

--6k6JYUOTDK3is5dB--
