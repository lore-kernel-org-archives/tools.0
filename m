Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 360E34A7C86
	for <tools@linux.kernel.org>; Mon, 28 Sep 2026 11:31:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790595093; cv=none; b=Oymjcy5HvLkrvBuLmxT9e00+zMk04JCycBoHjsJhfeYx0PCxJxaT88EsjDmESv0xmcQ1t0Y7Mc1EkAUwTE1TjI+TsHWDquap2ZJGGC/ZLLWnoSCgEtE/iEzbRrKBHuwlw/URd5ioVfoiMcirEknvi4jYhhVyS68/A9bOg/uPYR0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790595093; c=relaxed/simple;
	bh=vHRCKQ1sZaDTfItkggzq/CcYPNeunavz/TZ72i4sgys=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=PHTAI7R9H9rmbWHVQ8Wm3HNci3tjCEW7SIquNZUbnFelGpkZgdqQibr8CLztUHogY/YVJ+RHiEl66BkCIuzJ7QAmNAiNF+t+chaztwU/UnnV0CkXM9yI1jaLq20Mr5HdATvpNUrf5QWA1jv/xWNXj9iWdMDq3yPXgDK8YbhEYEM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Z+aQCI2/; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Z+aQCI2/"
Received: by smtp.kernel.org (Postfix)
	id 318A71F00893; Mon, 28 Sep 2026 11:31:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7C9DE1F000FF;
	Mon, 28 Sep 2026 11:31:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790595092;
	bh=Xi6QjiGdr5qXnE/PFkLqCW7csfBErl+86EXaeMd2F5Y=;
	h=Date:From:To:Cc:Subject;
	b=Z+aQCI2/ed+bDzzaY5j06VR9fZk0y5iVbd/ckxslwqNBVk7AHP3RDUYEx5lMLgFss
	 gKX463B++IzKH2DkvWmh7jCYnDLFbC1HO+WXUx4QvPcM9FvR6f+9tmaIyhoieIMmKp
	 9OWH6YeYnEr5FUaby6kiIC7l9sl41sH0G2R/To0m/otDNdIC8oCn7ztws2MBhznQUf
	 8xnnzEPgHhOWTfZd5NoK2t2xrad6lYUS5DXNuwLNuXeSg0AATP3g6srwwDDDO80KRS
	 e2nYFjrwcz1BRv9bjsIsgo+PbxSW1l58TVOUl+dp7fsdO8kFU44IMI7KHWKxARus61
	 8XoER3TTv18zA==
Date: Mon, 28 Sep 2026 12:31:29 +0100
From: Mark Brown <broonie@kernel.org>
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc: tools@kernel.org
Subject: No way to link loose messages after a revision is imported
Message-ID: <a5774f23-3e8d-4ef1-97ad-6514bcc26251@sirena.org.uk>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="GqCTcmZkYy84tnSJ"
Content-Disposition: inline
X-Cookie: Here there be tygers.


--GqCTcmZkYy84tnSJ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi,

If I upgrade a series in the b4 review tui but later discover that not
all messages were imported there appears to be no way to later attach
additional messages, on the command line we have b4 review track
--rethread but this doesn't work when the revision is already tracked
unless you abandon the series.

This affects:

   20260928061149.1844121-1-shengjiu.wang@oss.nxp.com
   20260928061727.1844167-1-shengjiu.wang@oss.nxp.com
   20260928061756.1844185-1-shengjiu.wang@oss.nxp.com

Thanks,
Mark

--GqCTcmZkYy84tnSJ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmq6UBAACgkQJNaLcl1U
h9DkCgf/bZNZeF60eghuqEII7tgMA6VcEyh2BiUIRnhWedxO3vTTFksXCgtevFuF
LdvCEiNM3HFslVRFHHQi5IZIDZZBJrpNTxrJTecgwNQAu4RTacUidIghqvEKMT2M
9Z/gm7S9jvM952AdMz6B/mxnbUiZpMSIQqjHVYrAMmZQ0u6Sw4KTd/tjNZiKC5iw
usK9l72bzXSx6H7u1aQMuAfRpflP1UpHzU4Q9ofhefZIiHSYa4P1NulJ/GpBwFfx
rV+v4RNXobDd1QnneyrsUMiTKWDCmtIfBPkJVmmW4vImnIRiPrjg0SDZgnfOQ+mI
V1o9WPwsVUmo44LlqAQLXSoiuBh4lQ==
=7lVF
-----END PGP SIGNATURE-----

--GqCTcmZkYy84tnSJ--
