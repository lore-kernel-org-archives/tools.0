Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78D87420479
	for <tools@linux.kernel.org>; Wed, 15 Jul 2026 13:02:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784120565; cv=none; b=Caa9T8E9uUik7RDORLnpoOHTXMg5LIYdNdxos9JdCHQiELpBtwZz7WMQlTmAKKmVVkGrZZGoWHXIWiHdnJ7zQV/vI70U3hzmWkrFX+KPVzVuflhLvLTjs6EYuLWpIyBzlgSltwxxLnDwa8tID9pYjRl/7LCLORX2fbqm7knJ+ww=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784120565; c=relaxed/simple;
	bh=XN7gdWO1eokpTO/Mk6qxfz+gT6ub0dEPe8NYDliWaX0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=VPrV0wNEpG5fuW50j6JrZopzuX+313BiE+R7v65jGubmLYyhqnVbw0ESLB5DjSERnQvFnxK+WUOy8rYbJJM3bxkrpEhKxBBwnTER2x0w4XfVCGYJdURy0Hv9eHXxPYUVvd1ZEPtJ0udcRFZCvcw0JSmFIFRS9BEPwYqu+SPxS7I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=amQ+U/me; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="amQ+U/me"
Received: by smtp.kernel.org (Postfix)
	id 317231F00A3D; Wed, 15 Jul 2026 13:02:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7613A1F000E9;
	Wed, 15 Jul 2026 13:02:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784120564;
	bh=JDNjWnFd2Vz4mfEqVUW2eMh/3odq/QI9hicbrk25onw=;
	h=Date:From:To:Cc:Subject;
	b=amQ+U/meZzgKPmhIzbtEKem5N5thpRNvqcXNQYz+bBzgjiYBq8fUP/aXGFoiC49MI
	 RiUTN9TgC/V5t87JhAg7ZZ8KMLTOfS+qI0b0ug6Y/zXKtYk2YbdTFvVpgSXeRo2JD7
	 ubETcKifKrfN0V2Hzal6xhKy1NEGdGH+S9rSxDo0QVHcAmA0tC2Qzv4OL+U4vI2mLw
	 HzLUEqGg1xzoL8JWDp5TDX95o80TedfVmRtjLnn3zoyrDZnUP/o11D/63xvSUxdMr0
	 L9xu70AxTUqrD7f9mUdbehSntX6GvNTp4VYrbQs04NgZAMCyoAeKkumwfWdw9qnTsN
	 YbOAHfkLYkBBw==
Date: Wed, 15 Jul 2026 14:02:40 +0100
From: Mark Brown <broonie@kernel.org>
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc: tools@kernel.org
Subject: b4 review failing to distinguish between serieses
Message-ID: <fe7ce92b-308b-4d84-a9c0-d6dc626a3718@sirena.org.uk>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="OWcYZpFxGVO1OacS"
Content-Disposition: inline
X-Cookie: "Speed is subsittute fo accurancy."


--OWcYZpFxGVO1OacS
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Konstantin,

I'm seeing

  $ b4 review track 20260715000525.739874-1-rdunlap@infradead.org
  Retrieving series: 20260715000525.739874-1-rdunlap@infradead.org
  Looking up 20260715000525.739874-1-rdunlap@infradead.org
  Checking for newer revisions
  Grabbing search results from lore.kernel.org
  Checking for older revisions
  Grabbing search results from lore.kernel.org
    Added from v1: 15 patches
  No change-id found, generated: 20260714-asoc-clean-up-kernel-doc-warnings-7c94a1912927
  Series already tracked as 20260713-asoc-sof-don-t-use-for-non-kernel-doc-comments-1a01f1f901cc (status: reviewing, v1)
    Recorded new revision(s): v2
    Upgrade the series in the review TUI to the new version.

There was a v1 of this, not tracked:

   https://lore.kernel.org/r/20260714014445.569992-2-rdunlap@infradead.org

but the series it's found is:

   https://patch.msgid.link/20260713175510.524728-1-rdunlap@infradead.org

which is separate.

Thanks,
Mark

--OWcYZpFxGVO1OacS
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmpXhPAACgkQJNaLcl1U
h9Ar6gf/QC7+mZVV/TRA4WryuQ4ycsL2AuQhqcbFhvT6sSjXyIgGuPyRaBEY3Wqf
2m0shorRKnD0/ruqtUxcX+ucltA3j8NPK4Ffm3rsDtnq9sV2zjfbqBaMZ1E7hunV
1NIIFi5uAHxUNGj7dL/Xq+zzB0NJ0svNy6jDJB2/Yn+3bbKGk5inzCAN0WXx1H8A
ws7hCkU5KslsUIy9RjsnYYK+ljwWH0MAdIFRAdwlqBryqCnz6muIzkdp7618q1SS
9gBXKKOzeyuVgbiPXWi1xrtP+X0xpVxlRu7+Og/HTIqk61VH91qxpUpSqd24ps8+
gttdPYni8erUDR5MbELBuvAbqzyvPg==
=zY1r
-----END PGP SIGNATURE-----

--OWcYZpFxGVO1OacS--
