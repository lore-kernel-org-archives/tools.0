Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E02D9BA3E
	for <tools@linux.kernel.org>; Tue,  4 Apr 2023 15:03:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CEB71C433EF;
	Tue,  4 Apr 2023 15:03:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1680620638;
	bh=t3MmFmAy9246QAPQDs9bv0hOfIUhI2YNAxysmbgmm0w=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=H49iDaVRHs0SItEaKVyYoOugPaFtBj0y/bPZ1ap1KiJ6zlbNlA1uKXFVi6uhJcgoI
	 5GK/SR6BE/cjfva1bc+XWMsoBekGeDXcORECLypG+8ceOOHelbQcBMZyhnzxyHLVq6
	 puSJYI1AqnETF7insDjN6alHMbXRy7Gk65faumy6Nd7kIcXG4mD4Qr7jCmwTjNbVJP
	 Lq0T9Z5wc9KF3R4yrVKAVgIKKG4SynIunVMZE5kVIaw/GCzl93gBK3IIFmBTCEX/Og
	 tc6iQRuvaO+NHEXMzE/0pYyyAXOtP+kzfsx1uOcIttdcdH1dc0y5ggdArN5I6Sh+HA
	 gdpDgZNJ0pRzg==
Date: Tue, 4 Apr 2023 16:03:54 +0100
From: Mark Brown <broonie@kernel.org>
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc: tools@linux.kernel.org
Subject: Re: b4 having trouble parsing recipients from cover
Message-ID: <03f33806-d61f-47ce-9c0c-f3cb0a7a6302@sirena.org.uk>
References: <gmnswy45efztvcyc3xqymm52h7cdfwjz64go2wy3zyeqcqwb76@36fva4hyip4q>
 <b38de7ff-3de1-cd4a-a532-66642aea587c@leemhuis.info>
 <20230404-bacteria-refinery-a97393@meerkat>
 <ZCwlhTvZhpVXBj6/@sirena.org.uk>
 <20230404-tummy-lusty-057598@meerkat>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="95dHMRagNUrrqL3E"
Content-Disposition: inline
In-Reply-To: <20230404-tummy-lusty-057598@meerkat>
X-Cookie: Being ugly isn't illegal.  Yet.


--95dHMRagNUrrqL3E
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Apr 04, 2023 at 09:42:37AM -0400, Konstantin Ryabitsev wrote:
> On Tue, Apr 04, 2023 at 02:26:29PM +0100, Mark Brown wrote:

> > I've got a cover letter commit for a single patch with the contents:

> Does it work if you add a single line title at the top?

No, same behaviour (I just added a line with a couple of characters
rather than a full subject).

--95dHMRagNUrrqL3E
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmQsPFkACgkQJNaLcl1U
h9DhSwf9E3LyT3X1Vl0dMCMiTF6Crofym+ib03C1ZPfe5WeMSaT8r4N1pgJ99Cbv
V97Uv2qpQ7yD40vZcJw7jdTCsOYdPt7Yfv6TuzCTUZxjdjnuBnmjR2fUUcUEqd7A
gRg19bf2n75g1h0oZiKDktDwdHQW3j33dMXf37ITSRUUeEU1uiPh4OnN5uyXBOgh
OP3yssSbtBUo6AZoeLEKGJfDoTAMT6hsI4TjVJs7k3uB9eDnEwAVXhKFRgPCvufJ
v4PwjNDLP03EVjF5cbWBZihTTKtpHUsEXez4eCEpFTM5/6YSdoTlzJQ+zdKrWnaX
dvAk+xcXusJ7JN0rbYRBWMotSJd4Ng==
=5sVJ
-----END PGP SIGNATURE-----

--95dHMRagNUrrqL3E--
