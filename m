Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D866F3914FB
	for <tools@linux.kernel.org>; Thu, 12 Mar 2026 16:44:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773333864; cv=none; b=imH3UdkoenMtMju2LstN/xoRqZ04FkYycQTVJL10lbnHwpzf5wrLp67Z6Ma/o19qeqYIRnxMg5A5OHhwILoLzpY+Mx1d9HuF5AFWf1iubV+JoS/JQBDgcgSJm3H8RPQc8IAdD1hrCO7Etl4qgyCpqfbEdd4H8Pbxud8f2nDME4g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773333864; c=relaxed/simple;
	bh=T+f91gxuO9fGKuIBIRQsl4h75H5jFHLJDEcTWkjYZuw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=JaiyP57ncXru7G1xt4tXSVfhB3joyncEZpbks4oBIJuGxnNX6bwiPYFrtSxYcoYrUeCvxGN8iv0zUJT0X+tHIO6+g//PPyhiXSueg4O2gNht7nulFlzh8En/jjZNRzqHo6IwoAw8pzYxfvf4Qvuo5SBBsq5X4nrRusL2xncXsIM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EFiQ3Uug; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EFiQ3Uug"
Received: by smtp.kernel.org (Postfix)
	id 8B539C19424; Thu, 12 Mar 2026 16:44:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CC520C2BC86;
	Thu, 12 Mar 2026 16:44:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773333864;
	bh=T+f91gxuO9fGKuIBIRQsl4h75H5jFHLJDEcTWkjYZuw=;
	h=Date:From:To:Cc:Subject:From;
	b=EFiQ3UugxtXE/dndMLFAuoqWgp4OKldfBFDWtei1nYBlZlsV3Gt9PX/u7jLZMT4qZ
	 F1yPfYVXUUQW7wn0SZFKWfD/ux5k8C5qM1OMnTHenTCxMYlhIU/uTt5PzJzZJgC38U
	 sPV5gFjOkgXPa+pK7/EJYOsDodPRdrSV+r/T+DMZ0hwDQ36f07v3v7skmZ0CtdyHRk
	 LzD8yqaG7PW/ABDtf/oUuNxdquAfZkericefRQCF+pUFaHi0QVPZzRji3ZUcHzQtOB
	 WVkTtKlfciIQ/J16DJoqLIfPaVkyvICa1yWwm+ZajW04R7p5tlhac1aR0/rUt2HoZj
	 my+i8LuQt4zvA==
Date: Thu, 12 Mar 2026 16:44:21 +0000
From: Mark Brown <broonie@kernel.org>
To: Konstantin Ryabitsev <mricon@kernel.org>
Cc: tools@kernel.org
Subject: Editing commits during review
Message-ID: <182ee3cb-af98-4602-bddf-a2419e7add18@sirena.org.uk>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="68qvvVRhcvcb05N8"
Content-Disposition: inline
X-Cookie: I feel better about world problems now!


--68qvvVRhcvcb05N8
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Konstantin,

I can't see a facility in b4 review for editing commits during review,
for example to fix subjects or remove spurious tags (Fixes: being a
common one, lots of people seem to just randomly add them).  There's
shell mode but it explicitly warns against edits to the commits.  For
patches that just get applied you can fix up after, but that's not so
good with the merge strategy.

Thanks,
Mark

--68qvvVRhcvcb05N8
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmmy7WQACgkQJNaLcl1U
h9C4Lgf/bfuoGkkabK8drkuuzJp2Kh/evIQuC+fs9yTEAiAzPwG4OQtx+3E8u9cy
2Z6Qm0yVxuXcGcyA5VQ01eHejutWSUc+NthUaCTMJgXp7VkwDS/T4p4RKBDSeZcc
F76HuUXywCue0IQ+l2Q1555k/LoeuANyQ5jEMh7GiR2qPjqEM+zLsAybr5zCeImq
Uv/I78Q1u1NuzV3R5Az8PlvTqxOZmmngdpQfD6CgouN+K7lFEJdDskPOlQVaym9j
bVRA9z9YIi9cflD8CWyzNhzzos7ysTecPoSzlhZDYyLPhKDu+bplQ2M8KSm5Ldtk
zYzq+J9oX8YhY2DiZ1Jt+ew5q3t0Ug==
=ArBI
-----END PGP SIGNATURE-----

--68qvvVRhcvcb05N8--
