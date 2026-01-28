Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3AE28238C29
	for <tools@linux.kernel.org>; Wed, 28 Jan 2026 18:01:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769623290; cv=none; b=f4qsHFupYagIjnDQcWdqhXmXcsHsYuT6R/8BdJrUHkvHqlU/7zsL03ewZ7o7TfpibwDIwmre8jtusdN/wnm+CvF9qe5m79LiDLXMUaKRzOKH35c78lrUoX4ikBQ9TiDss9Wqlq2T/GI0JnqUWKXE9j13joCasFuPviHqUdGIicc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769623290; c=relaxed/simple;
	bh=/Mht4lm8VZ5zY68rJyER3+dBI5IDzwXwRmGtQyZ2KKM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=O9sHZIP9895KRTTbhv9KrChltPm+ohh3sbIm555e5JUjzk4yPQOCYBKKOSlmW8Xk/iCwCdTInerJUrq/xynsp1d6xEg/FwTMYe/T3WNXYpxwvoKuSSo9fk94PZNoDbGAem6EncLdxgrjASKRHn2bg5wsFw5loux5/IBqgf5t2Vc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=qHZwrxuJ; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="qHZwrxuJ"
Received: by smtp.kernel.org (Postfix)
	id E252BC16AAE; Wed, 28 Jan 2026 18:01:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2E7C6C4CEF7;
	Wed, 28 Jan 2026 18:01:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769623289;
	bh=/Mht4lm8VZ5zY68rJyER3+dBI5IDzwXwRmGtQyZ2KKM=;
	h=Date:From:To:Cc:Subject:From;
	b=qHZwrxuJPvkTloma1P3fTSp7BOU49jlLi3hJP0UnblyeXLl7Wbd1aqfzei8uABETj
	 xZB6SdBrKQ5mYqY+Ldosol9SlNWPAuUqnqfBAXmFQc5iPjsU7kpNMjTgcXJLq5sxUm
	 THpf0HhkyhN8LGhquUXCZYBxLEehl8DRUM1puJIGYf85sAYnt/TqnIz4Xh2nipHdez
	 3+Nk4GBUkuToi/RjPT/axr/h5lpzQV0gu/h6pvO/+kIX3DcVGxy1FDbQGxMPfcmi1B
	 k6Lp4V6J8ULu4vnpQK/EA0Hw7GOL/7g/eb7C2uQtPq9S+Qm27AW0puPpbhp40thndg
	 d3ox5UKVKhLkw==
Date: Wed, 28 Jan 2026 18:01:26 +0000
From: Mark Brown <broonie@kernel.org>
To: Konstantin Ryabitsev <mricon@kernel.org>
Cc: tools@kernel.org
Subject: kgl track-subsystem --forget confusion
Message-ID: <39d09de1-8756-4b51-a4b8-c5d9c8fb1676@sirena.org.uk>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="mM8TA8vweuSHNF+T"
Content-Disposition: inline
X-Cookie: APL hackers do it in the quad.


--mM8TA8vweuSHNF+T
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

If I do

   $ kgl track-subsystem 'REGISTER MAP'

the config file is created as:

   Configuration written to: /home/broonie/.config/korgalore/conf.d/registe=
r_map_abstraction.toml=20

but if I then try to forget that configuration with --forget the
configuraiton file is left behind since it tries to remove a name based
on the exact arguments I supplied:

   $ kgl track-subsystem --forget 'REGISTER MAP'
   warning: Config file not found: /home/broonie/.config/korgalore/conf.d/r=
egister_map.toml
   Removed tracking for subsystem: REGISTER MAP

I would have expected that the two commands would be consistent in how
they name the configuration file, or for the remove command to at least
offer to remove a configuration file with the canonicalised name for the
query.

Thanks,
Mark

--mM8TA8vweuSHNF+T
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAml6TvUACgkQJNaLcl1U
h9DE0Qf+L7alHJlMKexbr7mPIib6HkP9jsn+EK2kssKcBW0uePXJ9EocMHW85AIZ
V7pCXlHDSwL6t+2oGp5slM2U8j6OqSdSyOiGtgnEqE+cGyL2JKO7VPnEGSaR2ssF
kxBZp4BeLNEMFZ6lkxJxlqRuQdLWBLFeasIc4SFFhuea/iq2MdvQ0wOs3uWSYveg
Nq3AewLz2TJrQhYyumJNfpiLPG13256fI/jyjjABfxEGft8fpvEM6Fqsc2TQaaPY
5rueUZw0ZN8s6LS2kl8OTFYJCDAEJDN/VD2hBYneQkxueTDt+lOulkL9O0AOp0pZ
39zLr5cZH+n5/EhUoYMiNXZZCy5MZA==
=2oMF
-----END PGP SIGNATURE-----

--mM8TA8vweuSHNF+T--
