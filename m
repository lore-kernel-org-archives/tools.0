Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E97383F880A
	for <tools@linux.kernel.org>; Tue, 17 Mar 2026 19:13:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773774838; cv=none; b=I/QBtqpkiKQ6pIsyXk3KEuXHIJdDwcXlEKuWnbQmPsmcRwixl8S3OSZxUJlfrKV/OMZPqe5R70aOHAGoBQ+bkHf93yoBhKdhSjRJsoLglCY3nN2+WSbFitaTr0vJPjnX5sopwFoTZyh0AuSYWs7M5KPcm7tUj9ahxCdbsu3GNCo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773774838; c=relaxed/simple;
	bh=OljnhiQaO/i6U6uQmpsrvcZ2kTnlpG+kJSSi1h8Xit8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=tq++g+PYadZejzp7+MdTMSB+kx+NPRG84IkhDFZHIBtnenG2CrLoeK6uQG18X5CZJgG2BW0CbYjSujXULWL+KzSfXJp7mhPNYUOjtxfFV+g4t4sno7IHTKqf5/bPT1lZwh+3aH+nwys56dJKZOxy1eIjspQ9MPG7izPvM9AkLdk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=rqmQNp7L; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="rqmQNp7L"
Received: by smtp.kernel.org (Postfix)
	id 906F9C2BCAF; Tue, 17 Mar 2026 19:13:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D1378C4CEF7;
	Tue, 17 Mar 2026 19:13:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773774837;
	bh=OljnhiQaO/i6U6uQmpsrvcZ2kTnlpG+kJSSi1h8Xit8=;
	h=Date:From:To:Cc:Subject:From;
	b=rqmQNp7Lr2xW7N+gyfOFqfuYLqO2gxz725V+F4Bl2JNM8sCJgZySk5VTrzN/qlbPp
	 2MqUgVFqY6+AWEqgWMttogdi+u7dV/rgPoZGQ5ahTn5MniCIdw2+i0ks6oGzd+WftJ
	 1AoQZiYOovzNxvIzIZbnx5lomPflJfxwN0ii2q/uOwSzIm/SCRJ9uOe/ZR8+oUUtaM
	 UagHiAzung4C497rWPugLOg6p49qIrpr3N0nIuPtg64wv4dHvyD1I+zri8J7vIaIlV
	 sAZ+HcV2SFgDv3Uobplnx8DYZwVxdPKdLvjUFxX12mCwEd350m8FZIWCrGfeLxdQlt
	 /BLDLhOGgcBvw==
Date: Tue, 17 Mar 2026 19:13:54 +0000
From: Mark Brown <broonie@kernel.org>
To: Konstantin Ryabitsev <mricon@kernel.org>
Cc: tools@kernel.org
Subject: b4 review handing of rebasing issues for new versions
Message-ID: <069aac52-a9a2-44e1-bdbb-eabc82e23641@sirena.org.uk>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="6Km4rx8ff2wwljCI"
Content-Disposition: inline
X-Cookie: Must be over 18.


--6Km4rx8ff2wwljCI
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Konstantin,

The new series version handling has a bit of an inconvenient interaction
with the new version being required for rebasing reasons.  The status of
the series is keyed off whatver version of the series that is currently
applied and if a new version is sent it'll be offered as an upgrade.  If
that new version fails to apply to something useful a common way of
handling it would be to say so and wait for the submitter to resend but
if you mark the series as waiting for a new version without applying the
current version then any time you check for updates the version that
fails will be seen and the series moved out of waiting which is
unhelpful.  It'd be good if the new version tracking noted what the
expected new version was rather than assuming that it's anything newer
than the currently applied one.

Thanks,
Mark

--6Km4rx8ff2wwljCI
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmm5p/EACgkQJNaLcl1U
h9BX8wf+Lv9LyTnAW8jRxSPIHy4Dx5T/gzdS5Qm56jZ7WoeElCrhK86K9puideJV
AK0xIstgIqBtV7kfg34n7zpX8Febz34ruDl3Rqi96Xd1KJz2Sg5hC/nZLfLUgjB9
2HC6XkWKqFJNZF9odFxCZaTGauIcRkMXGhTszaGij+fw96qBQsO/6wXkUZmgiTI6
H/gDnuYFXy2Z+rE1p4BVlu7y4rGDJ2OGapXHF3sd0bcCV5OD3fsIyjibO1KtkGp7
O6AZYsyPn5rcgSi67r+cNhcvOluIrMXG6HIGbl87DORPIM2jzsOFE3/QFkJz2tgs
NZR3mmftrqHtu90KgylYrbbp8g5gyw==
=LQF0
-----END PGP SIGNATURE-----

--6Km4rx8ff2wwljCI--
