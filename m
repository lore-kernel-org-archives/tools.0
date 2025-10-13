Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BFA72566D2
	for <tools@linux.kernel.org>; Mon, 13 Oct 2025 12:15:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760357717; cv=none; b=KkPmxtMV/I6101+XE9FJ8C24mwqc/bywEnQSgBlTm8Gxx55Z+ORB25+OZOnU5wOZKdJ6GIPD99HpJv1cXA1EwxhXy7I0x1UnzfeAsSWnQWBK9I/1Rl+6bPwlkaWJVg5FStSFemQtTglotXwk+c1x7N71Xbz18sJQWkm77WPYyhQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760357717; c=relaxed/simple;
	bh=aRiLAsnPe21BuCaAFmWfoucJOHSvrTEfEKStYYdy710=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mK/8LJeS02PXvIPDfc//CrIMKjyHvcXhI1tPVimBYmZ7Z5rFEO3JIbYitY5HcwwdUOESilEH5cDkUwfudxrN8URW3f41a05IZGpaJGNe5rpnfD1eoSdBzX+jqu5TDZKbR2JjHB3udWzfdy+ZUxZHfpLpPc+V0IaDI+qqfIuIr5M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RLLdGhBM; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RLLdGhBM"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DA883C4CEE7;
	Mon, 13 Oct 2025 12:15:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760357717;
	bh=aRiLAsnPe21BuCaAFmWfoucJOHSvrTEfEKStYYdy710=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=RLLdGhBMAgEFkRYpwmD5TustUvnAdcYbElMOz4HHeOzjEaxfQNrx4vibahvJqUe9o
	 gxHSlhccXtgctZZcTnRZszj0n1DLMV7qNDKWtXApZtAAlB+xuIzLLLTrttCM/a+GxF
	 S9QhBKQaPvxNM174HPbRTLyV+oP4XJ+VHFcGUt6U3UYXF8djlXAsPShGxIDxxHdGCA
	 iQHpLyEPpWdmB810lDkTP3NNZ+vunWwIR5DSywXGEImPVliyZW1Z1XIzFsgO9WR3d2
	 +c3sJrjR6raN+JI8V94AUyHZYxKETPMSHreZGOfUF639w1htve2Ex8UP/kXALGsZC0
	 /oMiyzpmixpNg==
Date: Mon, 13 Oct 2025 13:15:11 +0100
From: Mark Brown <broonie@kernel.org>
To: James Bottomley <James.Bottomley@hansenpartnership.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>,
	"Vlastimil Babka (SUSE)" <vbabka@kernel.org>,
	Jason Gunthorpe <jgg@ziepe.ca>, Willy Tarreau <w@1wt.eu>,
	Konstantin Ryabitsev <konstantin@linuxfoundation.org>,
	users@kernel.org, tools@linux.kernel.org
Subject: Re: In defense of Link (was Re: [b4] initial "b4 dig" to supplant
 Link: trailers)
Message-ID: <76c43b1f-9f4c-4dc2-84a0-993a752ce48a@sirena.org.uk>
References: <CABgObfY5agTRsB-bCqCYbA0erFn5cVbujtTNBiCti8g_68nCWg@mail.gmail.com>
 <20251011061351.GB23024@1wt.eu>
 <aOoyhUzNDgwiyl5s@finisterre.sirena.org.uk>
 <20251012232725.GC3938986@ziepe.ca>
 <d884ec6d-856c-4dce-b8bf-cb6116c87bcb@kernel.org>
 <CABgObfaL1Pki1QCgO_vb1Ex_1=RgVwzOmD8Z+q_KnPw3jHwBpQ@mail.gmail.com>
 <19d8800c-c48d-4b98-ae4c-f52053b97ac5@sirena.org.uk>
 <4f9d75f4d024bf9340f5d6936a2a2dd73c6eb1f3.camel@HansenPartnership.com>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="9wn9cr3HL8uow5e7"
Content-Disposition: inline
In-Reply-To: <4f9d75f4d024bf9340f5d6936a2a2dd73c6eb1f3.camel@HansenPartnership.com>
X-Cookie: Ahead warp factor one, Mr. Sulu.


--9wn9cr3HL8uow5e7
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Oct 13, 2025 at 07:49:23AM -0400, James Bottomley wrote:

> Can I also take it that if a face saving compromise is needed then
> everone's tooling can work with a message-id trailer?

That's certainly the case for me, what I'm actually doing is pulling the
message ID out of the link and using that to grab the mailbox with b4
mbox.

--9wn9cr3HL8uow5e7
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmjs7U8ACgkQJNaLcl1U
h9CUfQf7BrR6zHhOlwJ2eQ6BP2th5MwzNipxQdtaxPKylvR6/a5IUMhtu6AX2jMq
V7iW/ifYtuOvJy2xIvblIpjtmI89gcB0XOv2jAwc9Uqkn1uSSDe9z9R6D9e0dJV9
hPXV8FZZhozoZzi0XkKbvfB5FJDeR2UF7GJPyMsgLUudyb9JIZqZ99DmtMRxhtwi
fM/JQ/9HjO15xRj8oR1WBoQRUf42+SLJflJcIg7wT37I3HFiAvu+PEPlEmagot2i
r5fj5CCrI60EKki2KewRDWXS2W8RFJkqeGxiKRhOlKNKD9gYfjdfWUlbu1FQiDK9
BE9Hcv5BptrdkBQV3cKW6SlZsvpy8Q==
=dWcc
-----END PGP SIGNATURE-----

--9wn9cr3HL8uow5e7--
