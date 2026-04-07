Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B0E1345741
	for <tools@linux.kernel.org>; Tue,  7 Apr 2026 10:50:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775559041; cv=none; b=ZyymOVS0M/R7ypG1RqPdlBUVFD9dw36kNAHmuTY5tLdQRHaD1OmDpkOo/DAHm35voARBL6J2Hdgb1dk0ll0HdXK3DtO1P9hRQvpD512BXxnGAX/qr8Ap/ku1jqc54bD4Gr7ovHcfKIyU02SfK1wboj2d6u00Kp9BE0SebThtrdY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775559041; c=relaxed/simple;
	bh=ARvUPJsOELVB2a7Cvj/KYi3VyAtoFeJTGQVHMfBbIVk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ptlfHAR/fMMu+I4zvYIfWOJKU7IDBCh73AFvgGJfBrwW8vQ3/xmYCgthg3h/tIdkpXrny1uDGR51ggdVowLEQgYwbraEZu8XxG00JzLomIXZa81N+CiG9OmQUjPb6IFMiE/UFDRKVN7uXUZh8mCywfYrBo/bxP+J9TDLCZRkZwc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WLDbzUqv; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WLDbzUqv"
Received: by smtp.kernel.org (Postfix)
	id F3CFDC116C6; Tue,  7 Apr 2026 10:50:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1D303C19421;
	Tue,  7 Apr 2026 10:50:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775559040;
	bh=ARvUPJsOELVB2a7Cvj/KYi3VyAtoFeJTGQVHMfBbIVk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=WLDbzUqv/2LVkYSsqKpgI5IOpygwBI2latgLwE1zFvXmkrH40TXor0WXgE7JH/Cc1
	 Q+zQx6PlLKSyR1QRgv5NJQ9cB4mTQcHyrCc466P7jCmNwnNnayTdtkjf6DLAWBF5qS
	 It7xLCUgLwQeo1+EoSkdJ9VmZldSkwsHNDs4ExHRtWKGH91gCGCD7NXEbAS7O9WKKW
	 RWNb5byj9q4JuP87CQ6FSaTTn2hf2uBdXM3jf3hhNeEDLkkk8VG3jOkYY6V9BpcWxK
	 /fUHiATkmsHiGnDecbdsxi8P/jsb0funUYDfscLFItXrvq8UjraMCqFp8qCCkTUhE/
	 5HtPd9FByJNow==
Date: Tue, 7 Apr 2026 11:50:37 +0100
From: Mark Brown <broonie@kernel.org>
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc: Tamir Duberstein <tamird@gmail.com>,
	"Kernel.org Tools" <tools@kernel.org>
Subject: Re: b4 review state is broken after series reorders patches?
Message-ID: <5dfbf9fa-532c-47b3-95c1-4b14f6fed577@sirena.org.uk>
References: <CAJ-ks9=De02zhrrrbqEO3wUCzBazsiDV8vgpKNKD7=mVUBomCQ@mail.gmail.com>
 <177549837114.3355865.7109422546107942051.b4-reply@b4>
 <177550045089.3385816.4021244769990222254.b4-reply@b4>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="KoxXm71UYhruP8BD"
Content-Disposition: inline
In-Reply-To: <177550045089.3385816.4021244769990222254.b4-reply@b4>
X-Cookie: Now, let's SEND OUT for QUICHE!!


--KoxXm71UYhruP8BD
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 06, 2026 at 02:34:10PM -0400, Konstantin Ryabitsev wrote:

> - will automatically mark identical patches as "skip" on upgrade, so you=
=20
>   should only see patches that have changed

Is that a good idea - patches marked as skipped won't be applied will
they?

--KoxXm71UYhruP8BD
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmnU4XwACgkQJNaLcl1U
h9AOggf/SdoC0R7TMooUFOsudT+8EC6XWcKSZA10nxZECBqgiY6QRsmFitLbp/i3
Ln7khsUxodRAGeg9kNTltOKFrPuhByQ5AM4ORo7jRJOLA+qq5ucftcv3ZMNG9Qyd
ih49ldWJ08GHq86SnXgKt782n1TBKXWbSEEprbSWuRmbjHGpCt1fG5l5/6Z21wYl
557nFt8F3HooFkSlqIhMTao+7HKAj3LQX0ZIbZrSujuk8yiBpSeY2M0GU0szfVMT
LDPZi4aXF5+zrYa3hiuPDAptJ9a2RpS/Jj4uHX460dlrDprB3doiiWPXo8sr6Of0
VAY1C2O+OuZDQVH/8G3/TjrCg47NzQ==
=d5LQ
-----END PGP SIGNATURE-----

--KoxXm71UYhruP8BD--
