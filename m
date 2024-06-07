Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B43DA194A66
	for <tools@linux.kernel.org>; Fri,  7 Jun 2024 13:39:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717767595; cv=none; b=B+4eNTVWsnqcoXdE9zAZF3g77/sqXp95ZjT2oqpMrCX5nfxT/JEeLs8Yq6h2z0OkT08vHI+xJxT5Ku4D91q8vR16A0lY4JSFJ3VCGOuwwZDcfK6+9+bZNQPiwBvo8SKr+r0rE5xl3OpoajstRp8Hda18COUszZbe/3puhuVnOMI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717767595; c=relaxed/simple;
	bh=PElPb6468xL59msQFm/OXYbEVcleOQxfUp8nZfut2fs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=BeteCQV0s0KpjnGvzAag4D1dwVQjCOeAWDY/Xeerof2wVH8H5/x0rxJnftcO0oWSQyv4oRJo8r76w5DYxrP0cUHEs6dOS96MOCp7sMzkpYsA8sWuG/bqsbEq5p7438WZVCYr+O82wDQgYhzPtKTydlqpNI5BNgtaQMxxVviGTCo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CraNOhKH; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CraNOhKH"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A266FC32782;
	Fri,  7 Jun 2024 13:39:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1717767595;
	bh=PElPb6468xL59msQFm/OXYbEVcleOQxfUp8nZfut2fs=;
	h=Date:From:To:Cc:Subject:From;
	b=CraNOhKHRyGH8dLQzt4ZoK3P9XbBjzPMhI3bRyHxrp6o3UbhMNqrgKZ8QKrgZzORJ
	 zMia5143pi+WxQbdJv0csVA2/mXc1IIAzO6++q7YfUiJKV7YyCW3REL6s0I4Mo5IpV
	 N1IgjdNXCnnZHMt6mvnwRnz/DGi8YzhZ4dqvEmja9yGQxegFTZFMgmWVFRzfzs0YUN
	 cId3pyxjn8StY/2GJ3SYVd1H2e6633n5ANi4dvf0h6+4+uD/YMpBu7lY6lmTwK+j3F
	 mwgnhpyV38RopeNUEkr84nfDriuc1jydi4eZn7PV0R7jdHPruJelIBODDB8yfpbDOo
	 hMGR92goMqVaA==
Date: Fri, 7 Jun 2024 14:39:51 +0100
From: Mark Brown <broonie@kernel.org>
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc: tools <tools@linux.kernel.org>
Subject: b4 prep from lore picks up versioning confusingly
Message-ID: <ZmMNp1_rMSMXHgFD@finisterre.sirena.org.uk>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="DhR63h7kjlljKWEo"
Content-Disposition: inline
X-Cookie: Your love life will be... interesting.


--DhR63h7kjlljKWEo
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Konstantin,

If I run=20

   b4 prep -n branch -F CA+EHjTwBRaCnzPfwdccHGGqsq9hGB5J1tA2aMcJyuRL8yYRZ0Q=
@mail.gmail.com

I get a series with this submit tracking:

    --- b4-submit-tracking ---
    # This section is used internally by b4 prep for tracking purposes.
    {
      "series": {
        "revision": 2,
        "change-id": "20240604-kvm-arm64-fix-pkvm-sve-vl-13cd71fd7db0",
        "prefixes": [],
        "history": {
          "v1": [
            "20240605-kvm-arm64-fix-pkvm-sve-vl-v1-0-680d6b43b4c1@kernel.or=
g"
          ]
        }
      }
    }

and the changelog for v2 in the downloaded series.  I would have
expected to see revision set to 3 and v2 in the history, v2 was clearly
sent.

Thanks,
Mark

--DhR63h7kjlljKWEo
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmZjDaYACgkQJNaLcl1U
h9CwEwgAhvVwUyFW26ef/HVJObmLXAaBYbJVjRR0xhR9H7yKi0RjTsCkejVK62HG
jYVlDr3H3dIsiVm//eE8OBHVIE5E4Hp7BWW/TpUx+fWyETDt0gPnuMntJFC2Af5v
a4dik9GFef4yerpI3zt9BvsQZhcSamRIxF0PtdC/Ga8dIZ/BJNNBgngJV+g6GCv4
o3CDbj+YVMslILvw0+u8fVvokKx6GI8FPXK/O/FyaA+sPG9Hpci9QRlN1qeQDURX
Pso1zL2pZ+GL/c3L9ydLeX2HVBvj35p18ooUQtoJ/VlM9TUepV/X3i96tWCOtdsu
qiwMZRsui60GTDyZgv8YgQ/61yqrpg==
=vk9R
-----END PGP SIGNATURE-----

--DhR63h7kjlljKWEo--
