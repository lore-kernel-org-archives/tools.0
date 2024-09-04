Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C1F61D86F0
	for <tools@linux.kernel.org>; Wed,  4 Sep 2024 12:27:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725452855; cv=none; b=lXSrG8PQnUkrLmeie5m5ay8dKfn24PJ8YGYJscChYvm9GaTZFWEr9HPETKPvceh0Ox3Mn6+44d4O8DTC2WHKnNLsr8Iobq7lji2UIR/po5Ao2/LeRIncj5dkurip3j7sFjWerUh7hBZb5fzsSPmuY1bgBOD957IBlfC2MMuHVxc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725452855; c=relaxed/simple;
	bh=HkNAa2dt0oJzlNKKsPVeY5pLWuOy0m43nfIh5NDPwBY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hWPBJhtkiv12xJUJcIuUmXVe69OOq+MQ84K4BkM9VT6xyRAlzm7L4CQgBShyJ6YrTrNxMjV/00Upq4riPH59Nh+CH1rU5d0Ef7tm3ZYZMonP9fbVuUa33RcZ2hDf+uOrvAobN2jVkxU39dJw/9o2gs7HBUsTGYIXFBerS6hFmXc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=iSrXFVjD; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="iSrXFVjD"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D95D7C4CEC2;
	Wed,  4 Sep 2024 12:27:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1725452854;
	bh=HkNAa2dt0oJzlNKKsPVeY5pLWuOy0m43nfIh5NDPwBY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=iSrXFVjD1whwgXnLij01oHiQap/32S5deyNzaQGuj7q6HrHWgoLXU8FVZ/uITiykg
	 YeM3rZupZn4hCw18afIVzVIT5LnE8Lb/IH7Hhi1d7nF2yhZEh5+CgHeavUKRtTR/Mo
	 hCDIdvs8yZEyTO0rHM/QAetlrs0DlBXqDTOUAAnN3FdrMIQHFuMJ4ajxzOqcJvNf79
	 LVaifCHUAwIvFYek0rXxZEpr7TwsHWA7ihBIMyA+l9bD03XH6xGnRFQ2asLrDg+6fJ
	 A6b780hRmadfLTLOQ9iu7zRrrnYBFni7gZsvBEY6rkLNT2VLBdEbIHqOaAz8G2wvYS
	 548DHGrxozwZA==
Date: Wed, 4 Sep 2024 13:27:31 +0100
From: Mark Brown <broonie@kernel.org>
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc: tools <tools@linux.kernel.org>
Subject: Re: b4 send falls over sending a series
Message-ID: <5922be8e-527b-4e7c-948b-0e45b57a57a3@sirena.org.uk>
References: <9ae3668b-666f-47d9-9d25-be0fc57b6335@sirena.org.uk>
 <20240904-fat-thundering-cuscus-fedd1b@meerkat>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="Kww/VJe64i8GqSvT"
Content-Disposition: inline
In-Reply-To: <20240904-fat-thundering-cuscus-fedd1b@meerkat>
X-Cookie: Linux is obsolete


--Kww/VJe64i8GqSvT
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 04, 2024 at 08:21:32AM -0400, Konstantin Ryabitsev wrote:
> On Tue, Sep 03, 2024 at 11:42:21PM GMT, Mark Brown wrote:

> > When attempting to b4 send from the branch:

> >    https://git.kernel.org/pub/scm/linux/kernel/git/broonie/misc.git doc=
umentation-b4-advert=20

> > with current git b4 the patch is sent but I get the output below and the
> > repository is left with the base commit checked out as a detached HEAD:

> > Sent 1 messages
> > Error tagging the revision: Could not cherry-pick the cover-less range

> Could you send a "b4 prep --show-info" for that branch?

branch: tmp
cover-subject: EDITME: cover title for documentation-b4-advert
base-commit: 7c626ce4bae1ac14f60076d00eafe71af30450ba
start-commit: 85a5e5b261c5b1fb14235b3172a257eae8d1b159
end-commit: f03b085c680cce51be033f56d9702050180ef835
series-range: 85a5e5b261c5b1fb14235b3172a257eae8d1b159..f03b085c680cce51be0=
33f56d9702050180ef835
change-id: 20240903-documentation-b4-advert-18016e83d7d9
revision: 1
cover-strategy: commit
needs-editing: False
needs-recipients: False
has-prerequisites: False
needs-auto-to-cc: False
needs-checking: False
needs-checking-deps: False
preflight-checks-failing: False
commit-f03b085c680c: docs: submitting-patches: Advertise b4

--Kww/VJe64i8GqSvT
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmbYUjIACgkQJNaLcl1U
h9CQFAf/fuXmZAZ73rVCLEq5zDOtGxF38tJUWtpv1ZjrbKMg7Vx4M2fnRiWnoUmh
euOhLngBGc1BITPn3FVSF1a2XeaKes+OPSx3oO+eiT8o1JjZMB5nsodt1e2V+SNW
9q6QntP/qAsvJ2aH93lnAo0clsaifC9G8zpHpX7IjYE5Ja8Jfcy0yTBUZVKUGJVR
Q49+/7nEP0/0kXirahnVIq42MCPBVYBm8cW8vkt1izSBGoPaXBwUXrDB3Ruoy1CZ
2A+F5ONfw2NeeecYQQsM7/3HxQQWb7M5mA+6O6YOR6NQ/2hTbPSTBjffnKBsP0cM
NAXwUSSn7SUOd5g29Nv9Dm15LH7lQQ==
=JkiQ
-----END PGP SIGNATURE-----

--Kww/VJe64i8GqSvT--
