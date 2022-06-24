Received: from bedivere.hansenpartnership.com (bedivere.hansenpartnership.com [96.44.175.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1ECA733C1;
	Fri, 24 Jun 2022 16:05:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
	d=hansenpartnership.com; s=20151216; t=1656086737;
	bh=CLc/U9JEmfWiM3rD5w6MnbzD1KKCfp0iCEnAGWK7I+Q=;
	h=Message-ID:Subject:From:To:Date:In-Reply-To:References:From;
	b=exLkZdWr1CMDxZEp0MPJUcSBENQatFdtlwz2pnCVUAAO6wYgf+3D8Kqu7uRSw3+nw
	 4Ce18M/GSw51TVPU3tVHF49xA6TYe6PDH1cxwLOJA9dW804J2GUzjWjzHPJkBOKm8e
	 m5OniqSR7gsGu+818sLYKj25JqdIdiXFz8xb7+3s=
Received: from localhost (localhost [127.0.0.1])
	by bedivere.hansenpartnership.com (Postfix) with ESMTP id C119F128790B;
	Fri, 24 Jun 2022 12:05:37 -0400 (EDT)
Received: from bedivere.hansenpartnership.com ([127.0.0.1])
	by localhost (bedivere.hansenpartnership.com [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id swJpitL_kSFI; Fri, 24 Jun 2022 12:05:37 -0400 (EDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
	d=hansenpartnership.com; s=20151216; t=1656086737;
	bh=CLc/U9JEmfWiM3rD5w6MnbzD1KKCfp0iCEnAGWK7I+Q=;
	h=Message-ID:Subject:From:To:Date:In-Reply-To:References:From;
	b=exLkZdWr1CMDxZEp0MPJUcSBENQatFdtlwz2pnCVUAAO6wYgf+3D8Kqu7uRSw3+nw
	 4Ce18M/GSw51TVPU3tVHF49xA6TYe6PDH1cxwLOJA9dW804J2GUzjWjzHPJkBOKm8e
	 m5OniqSR7gsGu+818sLYKj25JqdIdiXFz8xb7+3s=
Received: from lingrow.int.hansenpartnership.com (unknown [IPv6:2601:5c4:4300:c551:a71:90ff:fec2:f05b])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by bedivere.hansenpartnership.com (Postfix) with ESMTPSA id ADE7D1287908;
	Fri, 24 Jun 2022 12:05:36 -0400 (EDT)
Message-ID: <97e001a22c33fd65b08445aaddba590ae438897b.camel@HansenPartnership.com>
Subject: Re: b4-0.9.0 available
From: James Bottomley <James.Bottomley@HansenPartnership.com>
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>, Theodore Ts'o
	 <tytso@mit.edu>
Cc: Jason Gunthorpe <jgg@ziepe.ca>, Bjorn Andersson
 <bjorn.andersson@linaro.org>,  "Jason A. Donenfeld" <Jason@zx2c4.com>,
 Linus Torvalds <torvalds@linuxfoundation.org>, Geert Uytterhoeven
 <geert@linux-m68k.org>, tools@linux.kernel.org, users@linux.kernel.org
Date: Fri, 24 Jun 2022 12:05:35 -0400
In-Reply-To: <20220624155213.4wfbnttowgom2sjz@meerkat.local>
References: 
	<CAHk-=wiQzp+aurcmj15=LAa2ntvRZH0Ee2dn-PLjcFpmRE6Jcw@mail.gmail.com>
	 <CAHmME9p+zRErOsvA1zC=kTHtpYD_sGjFxVsj0pMwteAp4dCdjQ@mail.gmail.com>
	 <20220621165953.z25hwos7gom6bp6s@meerkat.local>
	 <YrIEnmt5vDMcbOiG@zx2c4.com>
	 <20220621182953.p5asczznnz3pn6dl@meerkat.local>
	 <YrIR2v7GdC3qIt2E@zx2c4.com> <YrI3W46GUS/Dap5J@ripper>
	 <YrT4LIq6ssD1mhMQ@mit.edu> <20220624135147.GA23621@ziepe.ca>
	 <YrXYaE12VFUDucsN@mit.edu> <20220624155213.4wfbnttowgom2sjz@meerkat.local>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.34.4 
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

On Fri, 2022-06-24 at 11:52 -0400, Konstantin Ryabitsev wrote:
>    - submitters will be required to register their ed25519 patch
> attestation key with the submission endpoint and cryptographically
> sign their patches (email roundtrip confirmation required to
> register).

Can we please be less pejorative about crypto choices?  ed25519 is a
fine curve, but lots of crypto HSMs which do elliptic curve don't do
Edwards signatures because they're very different from standard ECDSA
signatures.  Those of us who take security seriously tend to use HSMs
for all our private keys and thus won't do ed25519 if the HSM we use
can't do it.

I was under the impression b4 used gpg on the backend, which can do a
variety of elliptic curves and now, bonus, can use a laptop TPM as the
HSM to protect the keys (which means pretty much everyone has no excuse
not to do hardware key protection)? (TPMs are one of the crypto devices
that can't do Edwards signatures).

Regards,

James


