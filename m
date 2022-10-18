Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CA824A37;
	Tue, 18 Oct 2022 20:29:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 31A20C433D6;
	Tue, 18 Oct 2022 20:29:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1666124989;
	bh=HVoRdeuniV0NvpQy56LEkes0CuGtQr4sfZcQVvfL1pU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=eCDdeU8P0w5Lbfyg2BCsuN/+/LzsI8rBuhb1HaZNSTNaBn9fx1UuNDnc9sf4kq4Xw
	 D/cWZLpr+EGhI9smqRl3gpN9nRryjHN4wuDCLUog4/YWr/+VtUiUJePRHuZif0lxfD
	 SnURx5acl/LepADurL3/kDoQMqPFNC+qM+EXRXczoaOj43h+OpvC6RhurVChWU9bvH
	 vfb+4gsT8mxIcD6IxiYQMfmh1an8ER7YN5rtWfJLINkMSl29hZPelgFKIS5yNXXQ0D
	 iQ4c+4KUJUuYCp8+KmNsTsMk03TTI3qfRTGJn79kTJMF5xKzmlJQ2RrfLCM76AROmu
	 IihpDSqA9PjTg==
Date: Tue, 18 Oct 2022 21:29:44 +0100
From: Mark Brown <broonie@kernel.org>
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc: Maxime Ripard <maxime@cerno.tech>, users@linux.kernel.org,
	tools@linux.kernel.org
Subject: Re: b4 bugs / future improvements
Message-ID: <Y08MuItOLxqpBr+/@sirena.org.uk>
References: <20221018153620.tyuedbldi2ofbe2x@houat>
 <20221018201804.na5x7lohm4yszg5h@nitro.local>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="qrJDWDdC513xdzih"
Content-Disposition: inline
In-Reply-To: <20221018201804.na5x7lohm4yszg5h@nitro.local>
X-Cookie: Lake Erie died for your sins.


--qrJDWDdC513xdzih
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 18, 2022 at 04:18:04PM -0400, Konstantin Ryabitsev wrote:
> On Tue, Oct 18, 2022 at 05:36:20PM +0200, Maxime Ripard wrote:

> >  - Generally speaking, rebasing a b4 series is a bit troublesome:
> >=20
> >    - It's a bit tedious to do. One needs to rebase and then edit the
> >      cover letter by hand without b4 being involved. I don't think doing
> >      the rebase interface all over again is reasonable, but maybe we
> >      could add a subcommand to set a new base?

> Interesting. I'm not sure I fully understand the problem, but then all my
> rebase tests were all very simple cases of running "git rebase <newtag>"

> Is there a reason why you have to manually edit the cover letter after a
> rebase?

If you're doing an inter-version changelog it's common to say something
like "rebased against foo" in there.  It's a bit clearer about things
than base-commit.

--qrJDWDdC513xdzih
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmNPDLgACgkQJNaLcl1U
h9A7xQf+MgiUmGjBblInwKOCStmzNNzwk6kCOCziqxms0I4mLGal3lGVd0WND/zc
GIeRZFTzkfpBjMI8/+pHfIiCfgANc3egWoVWkqFaJiKQ4TyEXuGSZev4u5OJNHj6
1wH91KdYIOPaVVommecfamC7XHhls3P+gK0CAQNEBoerjON7veq7uocfm91VIpNZ
REo90zNxc7qbQ1c0YhiperJHWInet/4rD8LFhm8hb18WBSzNZ4+0q4JoLC1u7p7I
Me8ruc3kbgUWSoKAhVrj6txjLxgAMFmPNIY7eJEqVpBq96VrMcXZ3EMAhfSKeSYy
hR3JsVHDtMMiBPONP7QI0O7V16ckZQ==
=G8on
-----END PGP SIGNATURE-----

--qrJDWDdC513xdzih--
