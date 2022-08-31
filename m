Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EF444A2B;
	Wed, 31 Aug 2022 17:30:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6652DC433D6;
	Wed, 31 Aug 2022 17:30:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1661967007;
	bh=vqMy10x6iRefx2QEBC7Z7d2kRT4LwBro/3M9SD8TNow=;
	h=Date:From:To:Cc:Subject:From;
	b=XyPWegD54g9vHVSLhH9c7en+3jXE7tKUHnqzdXFFqo9PKJ3FmNq4fpmt+8MtSc5ue
	 AyqVdRgmBH7FZnIglNFRkg9BDR+j7wjATFS+XPIHvrhXGHmLaBF7Fark8UN+yA5pim
	 go5lJhwJZ4NMSbdQNFdbEAWgrRMUEd6cNfCj/jxoxxmnVj7E1d9U8saeQ2laA9o3d+
	 PmoSLII8QKzfpSBofZTfZBot8xBmaHZOoGDL4FBnDjUvJuYghgnkNU+zYQoMzj/Fun
	 pDhHLRFxTfbTIYVBkJT0+cArPTSEFYOdUCVLSO+wBz3Bd3C9zEkZ5XrcQA/ICylM8O
	 9B9cglm1yyfQA==
Date: Wed, 31 Aug 2022 18:30:02 +0100
From: Mark Brown <broonie@kernel.org>
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc: tools@linux.kernel.org, users@linux.kernel.org
Subject: b4 ty header encoding issues
Message-ID: <Yw+amkaanvEh22Zd@sirena.org.uk>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="mhDPM5yfxLgsHDqv"
Content-Disposition: inline
X-Cookie: Keep on keepin' on.


--mhDPM5yfxLgsHDqv
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

I keep on seeing bounces from b4 ty generated mails in the form:

<devicetree@vger.kernel.org>: host 23.128.96.18[23.128.96.18] said: 550 5.7=
=2E1
    Content-Policy reject msg: Message headers can not have 8-bit non-ASCII
    characters in it; Use MIME encodings if such are needed!  BF:<H
    1.73333e-08>; S231310AbiHaMlF (in reply to end of DATA command)

for example for 166194965823.85274.11181035918338902693.b4-ty@kernel.org
where the offending address is Martin Povi=C5=A1er <povik+lin@cutebit.org>.
I'm sending using msmtp to kernel.org.

Thanks,
Mark

--mhDPM5yfxLgsHDqv
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmMPmpkACgkQJNaLcl1U
h9A+zwf8DU0KrME8vzjlyFz8mVdqvrrhbmYFFG6HdWLHGJ3Ze58Da2GNL7S5I+w5
T6rGnvnm5jtmOC3YkCN+fwoSp2F45L+mo+gj/9MLocXAlDxoBN09T8515EFDUTsb
TRBJFbqyUHna2zbySAo5HvurYzBRhvq3EKjDFoho0Xn/K7kr2sWeZ2+x5/CUPDPi
TmQMedTvYJH373XbAkHJEwu3Vt2UmLQB3XQ9bwebkChwoEyhPIYN3+qMRPv1v042
8biHy0Cdkq52g6GDNxzNMQq37ZXEHG6Uxdl0dcehDaPfzPoCsm6haYtc0rM4ZOIF
NDg4ZIbP34+H6YWVlGkXETkFFMVFoA==
=IVqY
-----END PGP SIGNATURE-----

--mhDPM5yfxLgsHDqv--
