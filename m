Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E0EE372
	for <tools@linux.kernel.org>; Thu,  8 Dec 2022 00:39:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ADC62C433C1;
	Thu,  8 Dec 2022 00:39:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1670459945;
	bh=IoQFYTcN3Ol9j7uRyZi4ZXXBWPUdPOL34FPczp+zRgA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=NDmRJhu4xH+wB60Dac/OB6gS44fYYYuNO+anOW9puhD9KjQ0ViDwxg3Geg7RXn6Xa
	 hNPaMdV0T7xgBCoCobwU0sJfOow5K7rgGlqohvz8TIdSWt7cqKo8Zlp79xRldFttOY
	 1JpQxJC65C6uJumjm5DQUVDJvg3lzjMUxfGpLyo+44IzSkCAyfCkUJFW2hrjFFJIL4
	 oxQodbwHfjBlT2oC1JuLVR6noCpFvGmXWAYL+DTc/Wu5Vu783xHDg6KdrbYYQNf3SP
	 tYlcJ/BBe2Ohh2LRieRScQrH2i6FyuLw0npJl0E+aLdJyKEwGOrMrr3PC0u5Z/piqH
	 f77hhorKB2Y0w==
Date: Thu, 8 Dec 2022 00:39:01 +0000
From: Mark Brown <broonie@kernel.org>
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc: tools@linux.kernel.org
Subject: Re: b4 send needs a subject in the cover
Message-ID: <Y5EyJaSdOXL3Nzwg@sirena.org.uk>
References: <Y5EbjU+W7vcqtE/d@sirena.org.uk>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="nJupnhOsE0eF+41+"
Content-Disposition: inline
In-Reply-To: <Y5EbjU+W7vcqtE/d@sirena.org.uk>
X-Cookie: What!?  Me worry?


--nJupnhOsE0eF+41+
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Dec 07, 2022 at 11:02:41PM +0000, Mark Brown wrote:
> If I've got a patch series with a single patch in it then there's no
> need for a cover letter and if it's the first version no need for a
> changelog so I'd expect to just delete all the text in the b4 cover
> other than the recipients.  However if I do that then what seems to end
> up happening is that the first recipient gets deleted, I'm guessing
> parsed as a subject which then doesn't get used due to this being a
> single message.
>=20
> I can see why this happens but it's a bit of a gotcha - printing the
> subject might help make it clearer what's going on in this case?

=2E..and further if you look at

   https://lore.kernel.org/r/20221207-arm64-mvfr-fix-v1-0-0c739eb77bea@kern=
el.org

you'll see that the to and Cc lines end up in the sent patch which isn't
entirely what would be expected.

--nJupnhOsE0eF+41+
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmORMiQACgkQJNaLcl1U
h9BVLggAgYY7p495ajiwjoUCtudG9P0282kSX0digUs5fmKF5PDY2fnui9Mj8fek
SDDNVQYeunaSZevTh6Gwwxe+RfOodxJH0f2Lu+eFYFr/tz7OuBjec/GuBpb0te3S
FwNI+dPu7XipTIwy+uWUn7IRA6Lgqo5Empy5jsi9cH0AnLM3TEdLXb3cMSY7rGa3
i1SvvtP7fjE+e/lJJiBxzcMwxcBcs7JrdmEwlEglLvHFuaWzA2F0M8b+WplO/2RC
49lsP8II/Zxe870/B30HBlVwybtJcaqIjEGaLIAtCE7mmKDnp3sVz+5xAtlng9cX
LhlMdNwE1l4w3GiqR5MbeldGxNidQA==
=6xby
-----END PGP SIGNATURE-----

--nJupnhOsE0eF+41+--
