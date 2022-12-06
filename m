Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9032120FE
	for <tools@linux.kernel.org>; Tue,  6 Dec 2022 22:58:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BE73AC433D6;
	Tue,  6 Dec 2022 22:58:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1670367488;
	bh=MXWYAIEHSgiAsc16PwBu8QbdMJI0I4Xt5Ekps8a4Kho=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ErLYBnI/VSsgU9ZJ+GTxgXrRw+BtaHzt8whSNMi2nKy8MdY5Fw7sXfTyn1V/Dvpx4
	 TMmujxtOiM/GwiWu8y0bTy4bqFl9QzxcjZnM0JdEhayQqbviZLnr99uEdyaFNBq9GG
	 ikyKbiyzwPJtfwaEOksDY2ItITp0QMI3l6biBXiI77X7tyJHzc7l026GSVAJksPUcu
	 /cfJJLrpCYbt/ujplfxgap+pbr0KiBRepZzi7msaW7jI2OstbaRbAyOcmVXfnspX4E
	 K0614IUKnv3IjEe/gPdrGFVvwUPjVVEOcrbuk38RayQQ3xW8dgpvODmqWvJDTrb66d
	 RGEJO7CdCKuxQ==
Date: Tue, 6 Dec 2022 22:58:05 +0000
From: Mark Brown <broonie@kernel.org>
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc: tools@linux.kernel.org
Subject: Re: b4 prep HEAD fails when specifying branch point
Message-ID: <Y4/I/dzuV+s00L8k@sirena.org.uk>
References: <Y4+9Fz7lkzSnFV72@sirena.org.uk>
 <20221206221546.ezjxmz2w3tuxbzx5@meerkat.local>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="9Q9ef87/G3H2Srwq"
Content-Disposition: inline
In-Reply-To: <20221206221546.ezjxmz2w3tuxbzx5@meerkat.local>
X-Cookie: Ego sum ens omnipotens.


--9Q9ef87/G3H2Srwq
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Dec 06, 2022 at 05:15:46PM -0500, Konstantin Ryabitsev wrote:
> On Tue, Dec 06, 2022 at 10:07:19PM +0000, Mark Brown wrote:

> > Using Debian bullseye with backports of git installed to get
> > filter-branch if I attempt to run b4 prep it refuses to create a
> > new branch saying:

> Thank you for the report -- looks like I broke it when I fixed it last. ;)
> It shouldn't break in the current master.

Thanks.  That fixed the immediate thing however I ran into
another issue while trying to test it:

| $ b4 prep -n b4-test2 -f next/master
| CRITICAL: This appears to already be a b4-prep managed branch.

Given that I'm asking to start from a specific point I'd have
expected that the current branch shouldn't matter.

--9Q9ef87/G3H2Srwq
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmOPyPwACgkQJNaLcl1U
h9ChEwf/aLNS7N6fhlxEGK2M7HdIo4efDgaPKu8hTXFH4BF7/Y/iDjP+ecQHeYsP
y5amr4MvCP7+tyPqiIgvRnfqXYzjPijmwAJkOpHnsN0Lk1I1BEnFMIVIzhVcmhmn
hsdqgdBfJingsJSouhyggspcIVEuYy2kULmylSL3Kjzx3P47zOgTH0JqHocEUaW3
WyK8YJw9dsW1QP5RF8wg5rpTrQvakIie243rH1StxYwAifBfZ7xG+kgacyYWl8UZ
Q1+e8WfYE8gkLYlZ2KVGbQiIjYysmiKY4R0U/Wp+a7dSfpZ4zZgVD+12KuZlzipj
+qIc1FwUTP8Y/2KfpQBufpjdQlAiMg==
=+Hx8
-----END PGP SIGNATURE-----

--9Q9ef87/G3H2Srwq--
