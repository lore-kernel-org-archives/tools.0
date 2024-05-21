Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C61D57318
	for <tools@linux.kernel.org>; Tue, 21 May 2024 10:39:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716287940; cv=none; b=ZFZxsqVnmJxPCooN9opfFqt+Vumsq+K3mCbCfSASckoP3nXuEt3/Ptc5ARbI1NiBxFeSbjg46RWRbRxRGYwreJTgtw9Js1SaSyJmYc1/7YEiXjTHqx53r5qPCnbSw6HOUzKzkT7rjnTkNgxMvrezxm3BIp82DGGUTfOnkNYIRLk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716287940; c=relaxed/simple;
	bh=jC18eWoJvPaDkPjYN9LSMM2XWKJ5Ahn4ZgPktxjvAtg=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=mVtQLCnd44Jd+LwOnGtOA1FM2XjkFjqt2U/WlqPTv1/VqjilbdgLIab+avqc52AdcqRb3MtsLn82NuxMoBsRG47tRO6h30tg5GFaowBcFTTiJ4XPeepHXMx8UvBKHAoR8HyTLfWJudRz8XsQVcuq8TyTBnk1E6NvRp0zPBhVGho=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=m1F8wRMu; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="m1F8wRMu"
Received: by smtp.kernel.org (Postfix)
	id 0C591C32786; Tue, 21 May 2024 10:39:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8FC56C2BD11
	for <tools@kernel.org>; Tue, 21 May 2024 10:38:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1716287939;
	bh=jC18eWoJvPaDkPjYN9LSMM2XWKJ5Ahn4ZgPktxjvAtg=;
	h=Date:From:To:Subject:From;
	b=m1F8wRMucIoqyt4zmZUumGyW2qsLYxjGKMD5DPua/FcsplPcJr/Mh+W19DO5Z0bt1
	 7Xe+iijUGsJdEIQqIdqtwf8PazDmjC5lOaPVB016QekxguGIj/RMXFqBB1o5XZC3m7
	 BQiX1rBhKgBSNDd5blOMMB8IQEZ4sYLdZsgcBk6f0Yq9dyb0bmY4fTiOIusdGNIwpp
	 gM+eIX1plcDVLZsHbTbc+1GNkibGfVvl4g0yWXgKYeTF2e5avJ88Eli96SpB17TEZy
	 x07MNQcBA+zv3pJH0NYRgjNvlTZDICOpBZJ/cis+vq1Dfl9vjK+JJJV3fTZwxhA1/h
	 2fwDUAOq17XRQ==
Date: Tue, 21 May 2024 12:38:57 +0200
From: Maxime Ripard <mripard@kernel.org>
To: tools@kernel.org
Subject: b4 adds changelog before the cover letter
Message-ID: <20240521-curious-obedient-dove-cc79a8@houat>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
	protocol="application/pgp-signature"; boundary="sh4rfdbxv4yxxdbe"
Content-Disposition: inline


--sh4rfdbxv4yxxdbe
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi,

I've just noticed that after sending a series, b4 add the changes before
the rest of the cover letter.

For example, I've just sent this series:
https://lore.kernel.org/r/20240521-kms-hdmi-connector-state-v14-0-51950db4fedb@kernel.org

Prior to sending the series, this was the commit containing the cover letter:
https://github.com/mripard/linux/commit/062e28a73fd2

Right after b4 send was done, this is now the commit:
https://github.com/mripard/linux/commit/0d20a4123b4435c41177e2cc9122f7d335f7399e

It's not clear to me what is going on, but other series on other
machines with the same system and b4 versions don't show the same
behaviour, so it's probably an unlikely bug, or related to the local
configuration.

Maxime

--sh4rfdbxv4yxxdbe
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCZkx5wQAKCRAnX84Zoj2+
duVaAYCIoN5rZBNe+CApWr1yB4FSa7cWs1Da5LS2ZVzVwfSWsBeM+SqCPiFWKQPV
TBDvYYwBgPcBe9QsyP3kDnmwrUvBNSpxwNEJHPsyul/+2SVSwM5eA60WmriYiOKH
chKPRS49QA==
=LAcA
-----END PGP SIGNATURE-----

--sh4rfdbxv4yxxdbe--
