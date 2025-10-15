Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2AFC25B1FC
	for <tools@linux.kernel.org>; Wed, 15 Oct 2025 16:43:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760546593; cv=none; b=NdAdeqDpN/RA7j8Xm2rVC9nf3OdCvIpCOim3ddy2tX96EEJjhFCsawxPSy1ZwwUt23sh9C8q6u9+bwNxfvR19ldRaHwgC+JlkXiR1AZ6w41fn/rXhb2f69BPQxRd3thczmTbPfxUYdtHW0m9rUqt3OL7R1pWZsRDZeFM2Ug+v6g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760546593; c=relaxed/simple;
	bh=sX7wrNE379AzMv+151glriaOmW/7dXOvJgW3MZdfnDE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Do0NkPiXgb4+cLWdyYQRt+wAEVzyzPABePPmM1+C052f1BJ8bSpytkRfUEYgtNrVAD7817pkzkw+vJl4tGvZZ/DyCH6H1l2dPylRWjOLuqVydd8gie+z5K53yuTcaDsOrARV4e33wzHrDvy+wiyP8fOBgK3SPgBFHM+Um3QBHI0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QETGEL3O; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QETGEL3O"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 57E2DC4CEF8;
	Wed, 15 Oct 2025 16:43:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760546593;
	bh=sX7wrNE379AzMv+151glriaOmW/7dXOvJgW3MZdfnDE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=QETGEL3ONdFYDaNtZnXR9eUnVMfAyzAAX8j+FKiPRirH1NckB3RvY34HMFuJULTHN
	 LtLzo9Fgc+GYhA8qD0Fz/2DsPn3auLy9IVGM2ueS2T5f7MUVKRIWc0yCXwjFXtFhtk
	 mAonYv8qJ0H5ZAA61Lbv99hkFKD314ZGUPXgem/pHzjhGoWfZQM2KsLRRHJyep48Y6
	 EmNV7WFhEIhHx6tm9GXUe0aqEy8nmO6ajVd4yqaxZX6aLMs95y4gl+hjnrVeRczc/Q
	 50ILGC9xe0A8nT/PZZUnUrPlcgDhpYgBcfrFcOJ/VlZ0ObNfpazgRWB3RttQk0jYlB
	 mYMUujPzgXJkg==
Date: Wed, 15 Oct 2025 17:43:08 +0100
From: Mark Brown <broonie@kernel.org>
To: Steven Rostedt <rostedt@goodmis.org>
Cc: Peter Zijlstra <peterz@infradead.org>,
	James Bottomley <James.Bottomley@hansenpartnership.com>,
	Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	Linus Torvalds <torvalds@linuxfoundation.org>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Konstantin Ryabitsev <konstantin@linuxfoundation.org>,
	users@kernel.org, tools@linux.kernel.org
Subject: Re: [workflows]Re: In defense of Link (was Re: [b4] initial "b4 dig"
 to supplant Link: trailers)
Message-ID: <7bbf0c95-d254-4bf0-96c5-893f6349ed4c@sirena.org.uk>
References: <CAMuHMdWxMhM1J3zHC8OkN_fd8XsJPFA6jM_3JFU=ySKhnX6ESw@mail.gmail.com>
 <CANiq72ka1y0YXysRQtuqnzc0i5FSbrGjKwprrXQpozwDOV3khA@mail.gmail.com>
 <aadb0515-4024-40c0-8024-fcdd029a3029@sirena.org.uk>
 <2991ae006906913c10715a9673ac53a4ea557728.camel@HansenPartnership.com>
 <20251015151447.GD3168635@noisy.programming.kicks-ass.net>
 <20251015111816.728bfda7@gandalf.local.home>
 <20251015155346.GA3287345@noisy.programming.kicks-ass.net>
 <20251015115917.5e031880@gandalf.local.home>
 <20251015160622.GB3287345@noisy.programming.kicks-ass.net>
 <20251015121502.7430d067@gandalf.local.home>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="s/Zc12CvT+NUgcnt"
Content-Disposition: inline
In-Reply-To: <20251015121502.7430d067@gandalf.local.home>
X-Cookie: Long life is in store for you.


--s/Zc12CvT+NUgcnt
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Oct 15, 2025 at 12:15:02PM -0400, Steven Rostedt wrote:
> Peter Zijlstra <peterz@infradead.org> wrote:

> > Finding where or which patch is directly affecting 'your' code is mostly
> > trivially done by scanning the diffstats.

> I don't have the time to scan 20 different diffstats that are at the end of
> every change log. Especially when it's not in the immediate view, and
> requires scrolling. It takes much more time than a simple lore lookup.

> And sometimes, the files don't actually tell me if I should look at a patch
> or not. If there's a patch I need to look at, just Cc me on that patch. I
> usually don't care about the rest.

The trick is often that without at least the cover letter it can be hard
to tell if the series needs to go in together, if each subsystem should
pick the patches relevant to them or whatever.  Some context does help
with triage, though at least for me often just the cover letter and any
shared patches are fine.

--s/Zc12CvT+NUgcnt
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmjvzxsACgkQJNaLcl1U
h9DBeQf+MR1jDU1ryV1lPRUGVSqPM/1MASH2Q2BWdOTSls6upT/dlgbkyEasiCwg
j0+uHXNtgtFCmXPH0SfN09ApudEac0M2up1bga1vKD15TGqe98x8GrQpK2vbnHTR
gWYOuKCw3ENa2+nt6MYHVLwgKWMtiz4bQxsQTPAbQ2Zrp9nKI3+Xr0ro4klYTmwu
5h7haJCUZE2+9IIeH07XdFz4mjxnLl+or3gX3wcxkn/h91L9//FS2kHVck3nZ2BY
2P1EdqmA0D4TqRAOjpvrmJ9jDjl14iukwxUwDu0H0YaZ+ErjNuk9qpcKRgGBSg7Z
pUD9n9NERnVV5s9KD4NTQEj92Dddvg==
=Qeaz
-----END PGP SIGNATURE-----

--s/Zc12CvT+NUgcnt--
