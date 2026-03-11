Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9583B2C0F95
	for <tools@linux.kernel.org>; Wed, 11 Mar 2026 17:09:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773248959; cv=none; b=tzdXnHEDTkdcGJXBBqj2/ydJoc9pmC18YJ5RDAE+ksFhxAm3357mOm6nYfUZaD7sRX72SR3bZ7se1lSpodTKaGzCim/EPH3wKZSO5gLlquEiTlFf5SZtv8lzF87MOYTe/olbXaxlEm71OfEanlB9hPNMv3xTyDEJGwKQ7FOnvg8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773248959; c=relaxed/simple;
	bh=5HZkm+I+AzGS5YJcs7RHVeJj+nw4ZTTWFsyj95+Buys=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Vf15GlVq/KQubfNsLVje1S7ApmVqQTmInalViQI54mWJBV1gVHXHLMj79RSuwAPbQYvWFSkQaiC12VSHt+/bkUHyeMUCWgCxTshVHuO7VkEH/ddq9RCJyF0E4qMDepzZSviYJupQPdon9pi/iXQDL6qHfw+7hlDFIq2fkGmROCo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=a5d1V2lv; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="a5d1V2lv"
Received: by smtp.kernel.org (Postfix)
	id 573CEC19424; Wed, 11 Mar 2026 17:09:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 96C00C4CEF7;
	Wed, 11 Mar 2026 17:09:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773248959;
	bh=5HZkm+I+AzGS5YJcs7RHVeJj+nw4ZTTWFsyj95+Buys=;
	h=Date:From:To:Cc:Subject:From;
	b=a5d1V2lvLNCuayxEy+dXfvVhqwJP0x2xK2hUbRBGZkZ3wX6D+fJ+yiT2dx6jv76GM
	 /2KF1L38EgN7wKgccJvP6+9uQ7XhVCzAJRpakD6SLLUDXIpNm65B0ig5mPR/s+HURv
	 4RsRMmK9Oc6holzkjjXarrdn4wpr6i+nrsCP74Qg2avS6jZ5yCzC/4B/l9dtXpKUc4
	 ctSfr44JxKBmBzNe/1t+FueyAaJPh/dS4oPO1TMMPMEMTSMxMYHYF2HL8iMY2+cUas
	 tdWWDFgbFOpIY6Pksf+TGvp+jLecXWuFAgS/No+GItOxwJl4h5cPPp7mTA7BqWNqhi
	 ZZ6oOrsc8BdaA==
Date: Wed, 11 Mar 2026 17:09:15 +0000
From: Mark Brown <broonie@kernel.org>
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc: tools@kernel.org
Subject: b4 review feedback
Message-ID: <c2cf828e-fb43-431d-91f8-ef7ca384edc6@sirena.org.uk>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="f69okKx57j5Aaxj+"
Content-Disposition: inline
X-Cookie: When all else fails, EAT!!!


--f69okKx57j5Aaxj+
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

I've run through a bunch of review using the b4 review functionality,
it's mostly working well and helps with some things I'd been wanting to
improve.  I've still been using mutt to reply to things so didn't really
test that side of things.

Issues I've noticed with the flow, some of which are repeats:

 - There's the hooks for integration with custom CI ("test this list of
   commits") that I've mentioned previously.  Perhaps b4 could natively
   support KUnit, but it might be as well to just do that through a more
   general mechanism.

 - For the CI integration stuff a CLI for listing branches and commits
   in them would be useful, for use in kicking off the CI en masse.
   Could also be handy for indexing.  You can easily list the branches
   with git but extracting the bases could use some help.

 - It would be really nice to have a mechanism to track which branch
   reviews are targeted at and based off, right now it doesn't seem that=20
   this is the case?  If a series was applied to a branch for review
   it's probably where it should be merged, though it'd be good to be
   able to track base and target this separately (eg, branch based on a
   tag from Linus targeted at release/next).

 - Currently a series can only be marked as waiting for a new version if
   it's been imported for review, this means that if other people made
   comments or the issue is that it's difficult to apply you still need
   to open a review to postpone the series.

 - It's weird that the "CI" (checkpatch) option isn't available in the
   review view.

 - Being able to send thanks based on what's in a published branch, as
   well as the thing where it's easier if people don't see a mail before
   the changes are visible we need an equivalent of b4-treename for
   local branches - it looked like the thanks mails were "applied to
   local branch foo" which isn't ideal.

Thanks,
Mark

--f69okKx57j5Aaxj+
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmmxobsACgkQJNaLcl1U
h9DTxgf/Z20JruCYVXOrxcXEub+pfcenyIVIrZ0+gJuYpKFPkB81nEBXhQQciYID
XcC+YB5BzqqcuZ01d1+xJpuHTNAi4RfzmaQ59OXEbsG5oAnAsdlqbmm9WZdPnqHW
tVKcMSKWv8Ks7TaybHgVeO7c1G0ahbcqhcAnySQH+awGBJeBW4HRWiQl8HGJgkoC
2dYrrJyWQpCboybDE0q6EDwT1+JbIrYWDWa5h2YAZuB7MFuuXHkrCTniJK/3m+db
Ivo20epSMHvmWm3U63PPTdzpLjlLsP7+pnk4000N8yrpkJaNWE2DKy/vDpIy43P1
ZODL9td7z0oHd5fn1uSBOKhhxc62sw==
=Bz+4
-----END PGP SIGNATURE-----

--f69okKx57j5Aaxj+--
