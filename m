Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15FD93214
	for <tools@linux.kernel.org>; Fri,  9 Dec 2022 21:18:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8279BC433D2;
	Fri,  9 Dec 2022 21:18:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1670620729;
	bh=FuYH0x2GTWHkQNnQcnFFLaUX7ajvViLivwLUB1dRMlc=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=Df5oXEjM9XdkE/8F6ygEBXtB3RtgfOh1Cob9HBuulRrzAtIbK5KM8bJuNazJKBRKZ
	 brgw5YhRQHbIhWD1pR1tKD4gNDdO/eoPM1BRp2Raag+EpDbYyqev+rKQG2KBn5LSnP
	 9Vme8sAmKu45p/4QJVHWPF1d8MK1LZxc4P7zLzaHUwyllTzx/KZVvxml31qVj+2F0/
	 0VMewr+C7p9RSboPIReIp8igDzmA7Sb8KuADYhju1hAN7IKIRnd33Ad54IeM6Kg5HT
	 pNkjENgVJYGJiMZ6MNymrDrvWUJnV0wEPbk5uoz/ZIRHyrH7LclHDKgwa+8Lj8rGLX
	 9gq572xIawZqw==
Message-ID: <e2ad3a972e389176c3c0dfce128a115e2ceaf2ae.camel@kernel.org>
Subject: Re: b4 prep + prefix handling
From: Vishal Verma <vishal@kernel.org>
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc: tools@linux.kernel.org
Date: Fri, 09 Dec 2022 14:18:48 -0700
In-Reply-To: <20221209211102.qeyyon3mxztcn2lx@meerkat.local>
References: <a68d5dc1c7919b16062fa1c477cf12b5c924caa7.camel@kernel.org>
	 <ezhajRb4PugsMXbJSB_qg_IBP4LS6w7wvEUeDREkucGMQRiW1dSaVNw2jugSG19Z-xUVuiLUuACG68OA8sHkyA==@protonmail.internalid>
	 <20221209211102.qeyyon3mxztcn2lx@meerkat.local>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.2 (3.46.2-1.fc37) 
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0

On Fri, 2022-12-09 at 16:11 -0500, Konstantin Ryabitsev wrote:
> On Tue, Dec 06, 2022 at 03:44:59PM -0700, Vishal Verma wrote:
> > Hi Konstantin,
> >=20
> > I found a possible issue with prefixes - and also a suggestion below:
> >=20
> > - When a 'git config format.subjectprefix' exists, b4 send does
> > something unexpected:
> > (the .git/config subjectprefix here was "ndctl PATCH")
> >=20
> > =C2=A0 | Subject: [PATCH 2/2] [ndctl PATCH] meson.build: add a check ar=
gument to run_command
> >=20
> > - It might be helpful to configure whether the final form is "PATCH
> > prefix" vs "prefix PATCH". I'm used to the latter, but I don't know if
> > the former is considered conventional.
> >=20
> > - It might be nice if prefixes from git-config could be added
> > automagically (perhaps b4 prep pulls these in when starting a new
> > set?). I have prefixes based on repos sometimes, like the above
> > example, and it would be nice to get consistent behavior regardless of
> > whether 'b4 prep/send' is used or 'git format-patch/send-email'
>=20
> Vishal:
>=20
> I believe the latest master should be able to properly co-exist with pref=
ixes
> set via format.subjectPrefix and those set directly via b4.
>=20
> Please try it out and let me know if it's not what you need.

Yep works great now - it gets pulled automatically from the git config,
without needing to b4 prep --set-prefixes

Thanks for the quick fix!


