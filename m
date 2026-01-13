Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87378303A30
	for <tools@linux.kernel.org>; Tue, 13 Jan 2026 15:52:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768319550; cv=none; b=RbUvZCG+5qiedXP+0qefZN6f/3lCQRgCtHhE3O1PoR6FXaFP12yvdZ6bDEkbxZacJZvb8eSDZyEIfBRZz0lFoAR6QOcMgTHhYvCT1w7+jOhXaaw3hpsIQGLUg7fUrJQfW21Tr4pbsa4rtC3SLuP+h6DaRujIHPsgqToCiiwlYOI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768319550; c=relaxed/simple;
	bh=KykQ1SkhXM0gRqBRiHW/Or35PjR09GJsuhx2ih4bsug=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=qovhJKtEsCTERfdmdmuQKZ+KGfHSB5XIJuXImHkZrjSvDsjC9MA7vuRNfA38f1BM+k7NqoN+Edfbi39+mIJ3aaqX52bsHLS8jJ3ZpeEHlXWwZ3+PmYUPLfdWLpgVz0ZLAD/Nk+BPJ7krLEq9hvjZ3H6nIZpHGexWZ12LjeGxDZw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WxzB93Cw; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WxzB93Cw"
Received: by smtp.kernel.org (Postfix)
	id 53B82C19424; Tue, 13 Jan 2026 15:52:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ECBEBC116C6;
	Tue, 13 Jan 2026 15:52:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768319550;
	bh=KykQ1SkhXM0gRqBRiHW/Or35PjR09GJsuhx2ih4bsug=;
	h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
	b=WxzB93Cw/lDUHx6IJn+wAOK1+cCuc7BXG0RVrHrnBJSUCwhUmR8B4Yx/Yxwit8CuL
	 8hnRIhyTmTH0Lk6MhFA2ZY86BF7KKHSywH+hkVZYSkXhOepjkp0fciTW3+sCMaABZp
	 hmDjrByHDpuXfRiVe11PH/3QgdQAo7S07qGebfA8nxDU45LfoVcUVw01dKcO80XbzF
	 Xmbsf2BkFZ2fd1x0GEOIzpisJodd711K6WucoTSwMwRVTdtVcgpBvtt7h4jYLgBuuQ
	 Axb/ZKcTxAsnP2uKP8v/Vf8o+abNj1R3r1K4XpnTVBNVLnNXdfSpagf/ioRd/2YrYJ
	 Fs38EWvxaWFtw==
Received: from phl-compute-01.internal (phl-compute-01.internal [10.202.2.41])
	by mailfauth.phl.internal (Postfix) with ESMTP id 21390F40068;
	Tue, 13 Jan 2026 10:52:29 -0500 (EST)
Received: from phl-imap-18 ([10.202.2.89])
  by phl-compute-01.internal (MEProxy); Tue, 13 Jan 2026 10:52:29 -0500
X-ME-Sender: <xms:PWpmafA_CRA0WvjCtDGBipicCHX-hsXfeeDAHLq6xx476W3n0jvm_A>
    <xme:PWpmaQWtMBDnbnfKUXqeTaLwiWA06HHN8hmMp6-9KubmbP8I4GydLBMfx4GI1Kf6K
    vJgbe9AgZKNCeZZCNpr6MPH9wkICXBwBaiM6x6KmTCmOW8lNvflaj0>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgdduvddtjedvucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhepofggfffhvfevkfgjfhfutgfgsehtjeertdertddtnecuhfhrohhmpedfmfhonhhs
    thgrnhhtihhnucfthigrsghithhsvghvfdcuoehmrhhitghonheskhgvrhhnvghlrdhorh
    hgqeenucggtffrrghtthgvrhhnpedufeekteeugeevveeklefgudeifefhhfekkeeliefg
    jeeugfdvveffheffudduffenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmh
    grihhlfhhrohhmpehmrhhitghonhdomhgvshhmthhprghuthhhphgvrhhsohhnrghlihht
    hidqudeigedttdduvdeifedqvddutdegjedtleeiqdhmrhhitghonheppehkvghrnhgvlh
    drohhrgheskhgvrhhnvghlmhgrihhlrdhnvghtpdhnsggprhgtphhtthhopeehpdhmohgu
    vgepshhmthhpohhuthdprhgtphhtthhopehsuhguvggvphdrhhholhhlrgesrghrmhdrtg
    homhdprhgtphhtthhopehlihhnuhhsfieskhgvrhhnvghlrdhorhhgpdhrtghpthhtohep
    shhuuggvvghprdhhohhllhgrsehkvghrnhgvlhdrohhrghdprhgtphhtthhopehtohholh
    hssehkvghrnhgvlhdrohhrghdprhgtphhtthhopehushgvrhhssehkvghrnhgvlhdrohhr
    gh
X-ME-Proxy: <xmx:PWpmaYsSIF73_5uFGFLmYoU0Ol-8cRp-ZBipbxO4Dl0c0B2qarBG4Q>
    <xmx:PWpmacWtoaF0T6wEbEPL-pfv4avt9v6ncOMlXV9vAr0mI9uhSFAmrA>
    <xmx:PWpmacGNpL5NYOwyoAl1k7p-_QRKFKWT6OcIiBKs2AKvY8rVwvXlyQ>
    <xmx:PWpmaW3r-JTMV2IE9SstVr95dEGhh6GrmazbcMddb9Nxx-W4Jfs9rQ>
    <xmx:PWpmaWPoEdUXwmFU7so8C1Gu4-DJcyVPanxxiVtf5JiugEm4QxGjSbQD>
Feedback-ID: i40364868:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 031A315C0091; Tue, 13 Jan 2026 10:52:29 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
X-ThreadId: AUkkDFtffo2J
Date: Tue, 13 Jan 2026 10:52:08 -0500
From: "Konstantin Ryabitsev" <mricon@kernel.org>
To: "Sudeep Holla" <sudeep.holla@arm.com>, "Linus Walleij" <linusw@kernel.org>
Cc: "Sudeep Holla" <sudeep.holla@kernel.org>, tools@kernel.org,
 users@kernel.org
Message-Id: <6f7ba903-147b-4779-bc0c-f1b2db67a98b@app.fastmail.com>
In-Reply-To: <aWZCqXlJcMEQU-J9@bogus>
References: 
 <CAPKp9uY-BYKXAoWg8zPLhQjEHs4qqsW+qjYne7Qv1LKwL6BQUA@mail.gmail.com>
 <20251218-dove-of-fantastic-upgrade-c491ea@lemur>
 <CAD++jLk6=56izoMzfs_PVFvX3j9N+J6O1FGxrEg3wE78rOww4g@mail.gmail.com>
 <20251218-merry-azure-chicken-4d3724@lemur>
 <CAD++jLmwVSGwBZgSrbhcJ+w4BHWrgK57sBmMGR=ELRsHM+MzHQ@mail.gmail.com>
 <20251222-speedy-tuscan-salmon-4bfbb8@lemur>
 <CAD++jLmnGmdQtXraa0wzOmEs-j9BrzgnChvk=W8kE1NTUBqhVw@mail.gmail.com>
 <CAD++jL=JGmHWKDobmcf1v99335CrsLaT9My8-3Th_RNqq1EfuQ@mail.gmail.com>
 <20260111-hilarious-spicy-cobra-ad26c6@lemur>
 <CAD++jLnUtBod3+FNdLduG=g+6p3SmM7E55ZwcGqQdE6b2W=qbw@mail.gmail.com>
 <aWZCqXlJcMEQU-J9@bogus>
Subject: Re: korgalore v0.2 released with JMAP, IMAP, Maildir support
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Tue, Jan 13, 2026, at 08:03, Sudeep Holla wrote:
> For me, it's most 1 week and I can see that it matches the expiry in the
> token.

Apparently, this is because your project is set as "testing" in the Google Cloud Console. Tokens are issued for a week and then not auto-renewed. If you set your project as "Production", it will be issued for an hour and then auto-renewed (which matches my experience of never having to reauth).

I'm told to try this:
Go to Google Cloud Console -> APIs & Services -> OAuth consent screen
Check "Publishing status"
If "Testing", click "Publish App" to move to production

You shouldn't need to do verification if the project is marked as internal/personal use. However, the project I'm using for this in my personal Gmail account is old and is grandfathered in a number of things, so I can't test this part out.

I may create a Linux Foundation project so we can make this suck less at least for official maintainers.

-K
