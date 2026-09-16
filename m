Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 322AB3EC827
	for <tools@linux.kernel.org>; Wed, 16 Sep 2026 06:54:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789541668; cv=none; b=UGykkF4NaztO1f3L3n8Gd1u5Tv+75b0iLJ0Tw03162RY3ux6ChzdylfU1aK43Cb21iNPn1EF1fmbI2L1IKrrwCLTvXeNETha33elVZp2Z7b3J1NT5SUjImNsSslFDmMjhU+vyYuzslvRxZyEYXO3fzP2Q7Rh8xrLPhXGqHKujLI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789541668; c=relaxed/simple;
	bh=sOKcBL2jbGlfQ1Rjjw6KlhotcHNimfRfDJUkHapFFzw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=G0Hdf2iDb0Q6HGAIsxV4DuLqDDvmFxvyQ8eQ8EO5M6THbxxNTC+5TAEJ2WuUVor0n3bUhL/hVmTARkzPY9KEzwycy5L+6AOUeTCjEcjOlRX4h6t+KarunvO2Fzma5+uBuAXRw61+TIO/Ho/2ff5OzvIEP6im+T7iHjegScPDN4E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=oi5yxvHk; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="oi5yxvHk"
Received: by smtp.kernel.org (Postfix)
	id E7A281F00898; Wed, 16 Sep 2026 06:54:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 467481F000FF;
	Wed, 16 Sep 2026 06:54:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789541666;
	bh=sOKcBL2jbGlfQ1Rjjw6KlhotcHNimfRfDJUkHapFFzw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=oi5yxvHkWIEqdlw2hLuGX1y2TVTwFH0grhB/CRWHnFqshS6U1YZNkptdcIqKBTD0x
	 nP6gkl0hsM6QkLINBHaHj76NRdvBbRzXNhZtFDmn2rbIDGWZfRkJbh0GcHpN+qGMG0
	 6aFTtgIcn4SH9G6hgTKTLoAoaNfE+nj0CtAZCMy/UtqcoQXX90n0xIjf463GCe3oQw
	 5L9riClHNDv4EY9uigsChsB5sg2Qqi2DvavKmmpciNKwwCNy8cmG9fDqtV/lc/K307
	 5UBpGdC3rIt/Tu8cQe6qPuB4AcadcPa4VNA756FwuwyOr388/h38sjKc790u+4hfhf
	 /3hRPYO3SBZLA==
Date: Wed, 16 Sep 2026 08:54:22 +0200
From: Maxime Ripard <mripard@kernel.org>
To: tools@kernel.org
Cc: Konstantin Ryabitsev <mricon@kernel.org>
Subject: Re: [PATCH] ezgb: Drop shebang lines from library modules
Message-ID: <aqo8-4kHtUM19kdB@houat>
References: <20260814123104.1616487-1-mripard@kernel.org>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
	protocol="application/pgp-signature"; boundary="ap7h7d6uk527e2ql"
Content-Disposition: inline
In-Reply-To: <20260814123104.1616487-1-mripard@kernel.org>


--ap7h7d6uk527e2ql
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH] ezgb: Drop shebang lines from library modules
MIME-Version: 1.0

On Fri, Aug 14, 2026 at 02:31:04PM +0200, Maxime Ripard wrote:
> rpmlint reports non-executable-script errors on all ezgb Python
> modules. These files are installed as regular library modules with
> 0644 permissions, so the shebang line is unnecessary and triggers the
> diagnostic.
>=20
> Remove the shebang from all five modules.
>=20
> Signed-off-by: Maxime Ripard <mripard@kernel.org>

Ping?

Maxime

--ap7h7d6uk527e2ql
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCaqo9FwAKCRAnX84Zoj2+
djXuAX9tTuTwff8PLdFlHmidlE92h3HimCJBVCU4xywgi0lp9ieV1LM8SBnSmX2B
b4lLvuYBfjqwEwW3bEy034uQgylwwLXb+65vZiHpi75ribAdQtT0yXMggSkFgfQk
mR/PfTStSQ==
=OgS0
-----END PGP SIGNATURE-----

--ap7h7d6uk527e2ql--
