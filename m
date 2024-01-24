Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3EDD0160
	for <tools@linux.kernel.org>; Wed, 24 Jan 2024 00:08:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706054909; cv=none; b=VAYHZPv91SHdMX3mm66JQdKXHI8d9aj0YgU2/j6gTpeyBflQQn5sbvw6mXxlebCTk/ZXZyJ4VLgkVRHcefMz24hDUfDKrDBY2axH8BtYJhIy+pxt9UnQTJiaVoueSjZrd79TlVrXIyFEZmYQoV1KhKRowBKrAewlUXL8V14iNGQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706054909; c=relaxed/simple;
	bh=c9+tHENeHCrMXizZROpUcMaQey+13rFdtL6iqrEr47g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=exOxD2+a4p0l0d47rv0rcOCG7KD6KWyCECfFExZCDJWcUK/F2XjzfgzVYAq71O0kw1jwzyDY5biUT7wbUBN+RLPL/WJlf1/OZIMG8LiTfLUhvLS7yfA25LiGSAh3OX9EoeHEenwMtiG9pI51fTfnwBPrCNtJndivtIHVj3GxCsI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZcOOJTnB; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZcOOJTnB"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 20A79C433C7;
	Wed, 24 Jan 2024 00:08:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1706054908;
	bh=c9+tHENeHCrMXizZROpUcMaQey+13rFdtL6iqrEr47g=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ZcOOJTnBae8vDdz2DiHxDBOGFEuDK9fvEhBovUHSJmnB30Jk+9ywpxtZvZFQG5fyX
	 CbhmxTEnO02ddpC9lJX1mgTI9CnuYdgM52srbQNCbJNwJjyAHJd53Rgg88ZvLjEUC3
	 GnxslX/jYvedB2lfwdMQJaMu8HhOi1L0wQPGC4jeQf5s0oQgAHz9dRES2sYvLb3dn3
	 6IX+pYdLBN28J1jQLXOuCLrI4D9SfhQjgs0M+2EA99Sm7On6kn57nxrhBcuvcdwta3
	 DPuNGfNoVNfglKOtvkjTGriNkcxP86uOvi0sRNbImmnzIxphIUekwlYBgVkbub5igW
	 twruEddhuJATg==
Date: Wed, 24 Jan 2024 00:08:25 +0000
From: Mark Brown <broonie@kernel.org>
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc: tools@linux.kernel.org
Subject: Re: Scripting support for telling if a b4 series is sendable
Message-ID: <7e7a3cde-1076-40db-b810-b2e7a1e0f1c6@sirena.org.uk>
References: <47699f5d-4ba3-4438-8a78-ab6c3345840a@sirena.org.uk>
 <20240123-amethyst-goat-of-passion-ba852c@lemur>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="HVnD0BkUMtmif8hz"
Content-Disposition: inline
In-Reply-To: <20240123-amethyst-goat-of-passion-ba852c@lemur>
X-Cookie: Stay together, drag each other down.


--HVnD0BkUMtmif8hz
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Jan 23, 2024 at 07:01:10PM -0500, Konstantin Ryabitsev wrote:

> I've added 'needs-editing' to the output of "b4 prep --show-info". It will
> also probably include 'needs-checking' and a few other 'needs-*' entries as
> the feature set grows, at which point I may add a separate summarizing
> 'send-ready' entry.

> Give it a whirl and please follow up if it's not what you were looking for.

That looks great, thanks!

--HVnD0BkUMtmif8hz
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmWwVNIACgkQJNaLcl1U
h9ATggf/eUxBJSzwCuqDi2MYVvHN8hmUktzTX4aGPsey3uSRqqI5dw27SouRklSF
sWGKLiVqt7z4/Qh4wzLZskHs18xtl2Hl64PbRXy0fhPz305HzOhSUlMb7w3vHMOM
Hw4M2HtDaUPke/soeW8EC2875gn+LCuW1/h9dKEnBWmNZHG5Zw/8QFkfXUUkUM/t
zpzzeO3jakP3sQBQOBp+VgVljvhzevYaUPqwFxi6fJ4bEtqOLkDKI73QqLeFJr0W
JncFGBwyftF9CezbHhJhOE4KtVwkbXqLpRuapEAsKXcP+hP+4TRiPkM+E9fQ+LEL
GmwJagTJmbg+nYmLLV5+N+faojsnCQ==
=4p0x
-----END PGP SIGNATURE-----

--HVnD0BkUMtmif8hz--
