Received: from bedivere.hansenpartnership.com (bedivere.hansenpartnership.com [96.44.175.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5861A3D65;
	Fri, 24 Jun 2022 16:29:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
	d=hansenpartnership.com; s=20151216; t=1656088174;
	bh=9YaUqjFqcD2qoDF4zpc9oFRS871ssExt5YOpfRiv3SQ=;
	h=Message-ID:Subject:From:To:Date:In-Reply-To:References:From;
	b=lD+65Jl6tkeoqYZCJjhrUeAQccs2hO48VBNTPfZSnj5tjOf8seG7m+Ggyy1eKS/Ki
	 /W5omKReN/iKIE4WYIxTMzhSjZcka3DDDZfVEtphLwuJOvALDVUXKHey+hWN9Uy0oU
	 KWQcZASIgShJGvRQyMxmi8zmWrbkob18w6GtaNNQ=
Received: from localhost (localhost [127.0.0.1])
	by bedivere.hansenpartnership.com (Postfix) with ESMTP id 386E9128795E;
	Fri, 24 Jun 2022 12:29:34 -0400 (EDT)
Received: from bedivere.hansenpartnership.com ([127.0.0.1])
	by localhost (bedivere.hansenpartnership.com [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ZgVF2qTCtpmj; Fri, 24 Jun 2022 12:29:34 -0400 (EDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
	d=hansenpartnership.com; s=20151216; t=1656088173;
	bh=9YaUqjFqcD2qoDF4zpc9oFRS871ssExt5YOpfRiv3SQ=;
	h=Message-ID:Subject:From:To:Date:In-Reply-To:References:From;
	b=Gc9iLd6EyHzP/awX5SXJdvt3bpYYE1qqS9hoaoCW3YgbgvNZrjuTEkiBG8lqkyygL
	 p/obUMjhqAqvtF0HK1MqqJLs7/3PqWwB3LhN/cKFuDSbDaWgJuNx2Ia88MH77e/2kx
	 OiQdnwcVfPwVr0eBOrJ3lsMHJGw/3xHgvSmEJbNU=
Received: from lingrow.int.hansenpartnership.com (unknown [IPv6:2601:5c4:4300:c551:a71:90ff:fec2:f05b])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by bedivere.hansenpartnership.com (Postfix) with ESMTPSA id 26C351287946;
	Fri, 24 Jun 2022 12:29:33 -0400 (EDT)
Message-ID: <6af132556cf362d5af96c3ae742bb9b5d67bfccf.camel@HansenPartnership.com>
Subject: Re: b4-0.9.0 available
From: James Bottomley <James.Bottomley@HansenPartnership.com>
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc: Theodore Ts'o <tytso@mit.edu>, Jason Gunthorpe <jgg@ziepe.ca>, Bjorn
 Andersson <bjorn.andersson@linaro.org>, "Jason A. Donenfeld"
 <Jason@zx2c4.com>, Linus Torvalds <torvalds@linuxfoundation.org>, Geert
 Uytterhoeven <geert@linux-m68k.org>,  tools@linux.kernel.org,
 users@linux.kernel.org
Date: Fri, 24 Jun 2022 12:29:31 -0400
In-Reply-To: <20220624161639.y2edtlzmlmc4avkz@meerkat.local>
References: <20220621165953.z25hwos7gom6bp6s@meerkat.local>
	 <YrIEnmt5vDMcbOiG@zx2c4.com>
	 <20220621182953.p5asczznnz3pn6dl@meerkat.local>
	 <YrIR2v7GdC3qIt2E@zx2c4.com> <YrI3W46GUS/Dap5J@ripper>
	 <YrT4LIq6ssD1mhMQ@mit.edu> <20220624135147.GA23621@ziepe.ca>
	 <YrXYaE12VFUDucsN@mit.edu> <20220624155213.4wfbnttowgom2sjz@meerkat.local>
	 <97e001a22c33fd65b08445aaddba590ae438897b.camel@HansenPartnership.com>
	 <20220624161639.y2edtlzmlmc4avkz@meerkat.local>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.34.4 
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

On Fri, 2022-06-24 at 12:16 -0400, Konstantin Ryabitsev wrote:
> On Fri, Jun 24, 2022 at 12:05:35PM -0400, James Bottomley wrote:
> > On Fri, 2022-06-24 at 11:52 -0400, Konstantin Ryabitsev wrote:
> > >    - submitters will be required to register their ed25519 patch
> > > attestation key with the submission endpoint and
> > > cryptographically sign their patches (email roundtrip
> > > confirmation required to register).
> > 
> > Can we please be less pejorative about crypto choices?  ed25519 is
> > a fine curve, but lots of crypto HSMs which do elliptic curve don't
> > do Edwards signatures because they're very different from standard
> > ECDSA signatures.  Those of us who take security seriously tend to
> > use HSMs for all our private keys and thus won't do ed25519 if the
> > HSM we use can't do it.
> 
> This will be only required on the web submission endpoint, and only
> to begin with. Shelling out to call gpg or openssh from a web process
> is a lot more hairy than checking ed25519 signatures using PyNaCl,
> which is the only reason behind this restriction.

Sure, I won't use it, but it would be really nice to encourage
newcomers who do use it to also be more mindful of cryptographic
security ... particularly when this is a long lived identity token.

Using overly opinionated crypto libraries is inimical to general
security for two reasons: firstly because the crypto they mandate might
not be available to tokens and secondly (and NaCl is guilty of this)
because doing token support is hard so they mostly don't bother.  It
always amazes me how otherwise perfectly reasonable crypto people have
a plank in their own eye about this.

James


