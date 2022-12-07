Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBCB18F51
	for <tools@linux.kernel.org>; Wed,  7 Dec 2022 23:02:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 04B83C433C1;
	Wed,  7 Dec 2022 23:02:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1670454161;
	bh=O3Uyq5ST6g5mqmKoW25b1NmQkmPqK42oxMjWI4o+q5w=;
	h=Date:From:To:Cc:Subject:From;
	b=AUD9nXQu6s3szZoViJcrHu+IfbK/r/njUEE9EOSHH0CR58anrC/ylCRQGwhmKVe32
	 Wf+XwtHusr8he0JGD1ktLasdruj+SWHmTKrZNWhoiKzaYI6Piwht8YFQRAZ3UHP/LF
	 KUqC/+Y/EXR/NPMCQYEq4gsFPbDI9ikX5FeOFMSyo4uiTKjmz0/BSwnvTvKAeEtBzr
	 9NzxeotJbGRmDWki+tBrnie5Spg9UsvlQueMhz21WQNYxZZA+e1ARGYz5GLSIZ80vc
	 Vddrn6SMvupLi3q1dcN6esJ7RAoNhCGharlxZtT9GJtdHKL5OCR8TAjYZEhTNGv3Aj
	 4nsx8p+4gHcNA==
Date: Wed, 7 Dec 2022 23:02:37 +0000
From: Mark Brown <broonie@kernel.org>
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc: tools@linux.kernel.org
Subject: b4 send needs a subject in the cover
Message-ID: <Y5EbjU+W7vcqtE/d@sirena.org.uk>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="pK5oz2I1DseGAuJH"
Content-Disposition: inline
X-Cookie: What!?  Me worry?


--pK5oz2I1DseGAuJH
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

If I've got a patch series with a single patch in it then there's no
need for a cover letter and if it's the first version no need for a
changelog so I'd expect to just delete all the text in the b4 cover
other than the recipients.  However if I do that then what seems to end
up happening is that the first recipient gets deleted, I'm guessing
parsed as a subject which then doesn't get used due to this being a
single message.

I can see why this happens but it's a bit of a gotcha - printing the
subject might help make it clearer what's going on in this case?

--pK5oz2I1DseGAuJH
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmORG40ACgkQJNaLcl1U
h9CO1gf/dW4jnVdeSejXSnBBaPB87iRMHBGRyEZzZQdhJ5sUOrnZDCNCMJmKycMu
SpoblCHqLaoB4/7M01p/TZH8D+2T153m8Qmsj0LsqSZsgJF++5VAl7D77gLinhHb
H0tVMcO2A1t/AXbLcPnENTQ756FIU6Cl8q9uyYit5YXqLyiH/yTiLaTWGKkWcY0b
z1ggQTADR9WUNYHBiN4PbnGOVszYPv/JHt2MT2r9MXhe6XAsNTST3MHivHYjRV3E
jde+U+zanOJvDHu2enT8ugG28awai4xgun8E0R+pKKHlyGoeohzLWJfDS0l6DLRT
eusI7q1gKCvWrzXsTR4yq0vEW3RSDA==
=OJAK
-----END PGP SIGNATURE-----

--pK5oz2I1DseGAuJH--
