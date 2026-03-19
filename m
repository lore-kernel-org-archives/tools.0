Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D8EF3D5223
	for <tools@linux.kernel.org>; Thu, 19 Mar 2026 13:20:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773926435; cv=none; b=cos8YfOQN0OSvODLT9Zy3BV3hjOCgE4SedsKWfXGkYhtJeq1aS+xOItWSaZ4ReeVSq9qTJB+RdfdhTK9Ys+hV84dcbj2QdNs1QQ8jMDj5Rc90l02dPAOLcSKrsiGHzea/m5wXMPF80um6srHF5aFRHVKQLxmOrbN8199gzMduT0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773926435; c=relaxed/simple;
	bh=h5elfQAjknb07ES8KCJVImq/H7+M4pIeJAX9JbFPHds=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=Q3mTkAhw8b+y1qfJdPF9gEkXZ1xC6TtlIV76VGTuR0EYfSjqYGIGEwELGKQgBO2GvtH4nC8CnfP3B/nrF8uTtOXwNUiw0e1g27oHPE7EdGcGWpATRwXnkcuWnTHGh2XTF6d+CI4SRDTMO7bbcOND2wA7XRlmoRkFwh6ZKnBmuQE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NTXw9bqJ; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NTXw9bqJ"
Received: by smtp.kernel.org (Postfix)
	id 1560DC2BCB2; Thu, 19 Mar 2026 13:20:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ACFE9C19424;
	Thu, 19 Mar 2026 13:20:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773926435;
	bh=h5elfQAjknb07ES8KCJVImq/H7+M4pIeJAX9JbFPHds=;
	h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
	b=NTXw9bqJJagqezL+TyvTSl2ZiLIkn7bN6raDn0TOB99rSKkWA9mE0NUqwrw/LP8qi
	 qI8d9IHC5NdCAc4jxOB5D4pse6MDeedUIanIl19jMmEOxhenwIkdVgFhuNBq3FJsX/
	 0sh2idLO+n72aK7PK/cWrhF2B2kC7KdKFr+5aDpFNzFEf/Nz8CPGpM/u+iDrrm30R9
	 OBJQyKEszOl7Bg6aDZYO0q8qajI7W5VhvYyZZQIeu0wt2heYhuYxHSBxd035NXWJaZ
	 4EOw9TY9eI56SjkDhH5Erc/rBv9upes3MSW+Yoi1yNsgqwtlWAWzmFN1h/LOJEcpk/
	 k+8X18QXIbNJA==
Received: from phl-compute-01.internal (phl-compute-01.internal [10.202.2.41])
	by mailfauth.phl.internal (Postfix) with ESMTP id 6968FF4006E;
	Thu, 19 Mar 2026 09:20:33 -0400 (EDT)
Received: from phl-imap-18 ([10.202.2.89])
  by phl-compute-01.internal (MEProxy); Thu, 19 Mar 2026 09:20:33 -0400
X-ME-Sender: <xms:Ifi7aY8NuvPSR-mNJLpjpGUwp1cVfomMZAg30eAvUKpJRS5LQz4hNA>
    <xme:Ifi7abgTyUt1LGWRg0bTSHnZ_LUaEeM4IJ6YkDVVyjtsWzheRcakmX9C0_RNpCC_T
    W07yq7EkgkwkvpcZ-68nJiwsDQDyYrZbkGkEuYlGUZl3OvDTWxMGC4>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgdeftdejudduucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucenucfjughrpefoggffhffvvefkjghfufgtgfesthejre
    dtredttdenucfhrhhomhepfdfmohhnshhtrghnthhinhcutfihrggsihhtshgvvhdfuceo
    mhhrihgtohhnsehkvghrnhgvlhdrohhrgheqnecuggftrfgrthhtvghrnhepudefkeetue
    egveevkeelgfduieefhffhkeekleeigfejuefgvdevffehffduudffnecuvehluhhsthgv
    rhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepmhhrihgtohhnodhmvghsmh
    htphgruhhthhhpvghrshhonhgrlhhithihqdduieegtddtuddvieefqddvuddtgeejtdel
    iedqmhhrihgtohhnpeepkhgvrhhnvghlrdhorhhgsehkvghrnhgvlhhmrghilhdrnhgvth
    dpnhgspghrtghpthhtohepvddpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtohepsghr
    ohhonhhivgeskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepthhoohhlsheskhgvrhhnvg
    hlrdhorhhg
X-ME-Proxy: <xmx:Ifi7aU-ljuIAHgplHIK8HRsBdJkRr92pPsd_vfIPt50KvWSR530LaA>
    <xmx:Ifi7aSv8qF6VJ8CZ9fD40SnBstVGwR06srppj-EXyDOm_WdhUTv-Ew>
    <xmx:Ifi7aXr2bhbKseAFEZ81U64n9cQTzdwFieI9WJiHSKrvQoszzjMwLw>
    <xmx:Ifi7afnWAmsqfdEgyRMN-P7Io4OVpzTLIUL9rik9trFfWFWvKMZvNg>
    <xmx:Ifi7aby7qyJuX7PKTmCqS5LA2z6ZyvRfIMcQEwZ4dRSWI2BUzDCuxdy4>
Feedback-ID: i40364868:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 46CDA15C008C; Thu, 19 Mar 2026 09:20:33 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
X-ThreadId: AF_O06tvK0fR
Date: Thu, 19 Mar 2026 09:20:12 -0400
From: "Konstantin Ryabitsev" <mricon@kernel.org>
To: "Mark Brown" <broonie@kernel.org>
Cc: tools@kernel.org
Message-Id: <1b93b8c9-329f-4b9f-941f-7eb9774ceba0@app.fastmail.com>
In-Reply-To: <64a3ea45-bb7f-4a29-bce9-2dcf44ed7e25@sirena.org.uk>
References: <64a3ea45-bb7f-4a29-bce9-2dcf44ed7e25@sirena.org.uk>
Subject: Re: Problems with b4 review update workflow
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Thu, Mar 19, 2026, at 08:05, Mark Brown wrote:
> Hi Konstantin,
>
> When you take a new version of a series it's possible that a rebase will
> be required to get the new series to apply.  Unfortunately there is no
> opportunity in the UI to select the base that a new version of a series
> will be applied to, b4 just takes a stab at a base without seeking
> confirmation (even if it detected that that base isn't a match) and then
> if that doesn't work you're dropped into a shell in the middle of a git
> am which makes it hard to repoint the base.
>
> Worse, since b4 archives the old version of the series prior to trying
> to take the new one you've compeletely lost track of the review - there
> should be an unarchive on error.

Yes, that's not great. 

bugspray tag b4/review

Thanks!
-K
