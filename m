Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F44428680
	for <tools@linux.kernel.org>; Thu, 16 May 2024 12:38:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715863094; cv=none; b=lV42dN3vKWyO/N1OjeEToOA34gESzuzgZxK2KlyeLpjEHAv+c4PLN5qMl+sZ9qM48iiLm2mm6wk1GwzFYpIgcqZ5h6jZY6eZ0toLRdj5IRUzK+kdmQv8QDpfudnEXzguX8jSex5Id40m0O/c+W9qi49hYcGArDR7wo4YjWY4FY0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715863094; c=relaxed/simple;
	bh=xuY3INJU6xe2SQVj71wP609dL+DLhY/v5PvWL6+/6Xw=;
	h=MIME-Version:Message-Id:In-Reply-To:References:Date:From:To:Cc:
	 Subject:Content-Type; b=TUZC6eFXmtACJdEF6F4iXrRHY6Pv/CUoL776/3IVxUAaVxRdRx3b7r9x1DksDCqvLocgp9gqKub59vliThnW+PYzEIGFe5Hn0BNzRUn13uv1ehM70wDBHzJejagTuql3E8hINgyPlHGDzelOAgfUgcw5AOB3y/BAsqJ1DGesKmk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=flygoat.com header.i=@flygoat.com header.b=pgb/JRDO; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=IovEZCm6; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=flygoat.com header.i=@flygoat.com header.b="pgb/JRDO";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="IovEZCm6"
Received: by smtp.kernel.org (Postfix)
	id 8BA5DC2BD11; Thu, 16 May 2024 12:38:13 +0000 (UTC)
Received: from wfout1-smtp.messagingengine.com (wfout1-smtp.messagingengine.com [64.147.123.144])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 9DB60C113CC;
	Thu, 16 May 2024 12:38:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 9DB60C113CC
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=flygoat.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=flygoat.com
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
	by mailfout.west.internal (Postfix) with ESMTP id 9C7741C000FA;
	Thu, 16 May 2024 08:38:11 -0400 (EDT)
Received: from imap44 ([10.202.2.94])
  by compute3.internal (MEProxy); Thu, 16 May 2024 08:38:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flygoat.com; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1715863091;
	 x=1715949491; bh=JscTQxLAk3V96qFDXBrf7A039tSWxD/jXzTElnVgAEI=; b=
	pgb/JRDOUqruUl+n14fP8g0HfDtGKFHoHb4GXm4sEAjmQtsPpAcPXZ3ljmqW93Cq
	2ZM9tbFmdJ5ZkLNlw9+16gFUAu0gn+t2ohDz//7X6TKeIA9tz5jujT7rr+9Jf2+2
	xAfUFlPJWMMm3bcjGDxS2Tnae6TXVoZujUdsrmrrEjo/dICe16M53GIHkOPlnZcA
	e8Ue1ZqWAwTEEucweEiyF653BGeYU9oZYE8gxZq3jDSZubmRGboehtkYUVVKaYbS
	t23WgVJdDNWbuSg1dDXI5nA0Cm7PjCNFPPGLZTqja/TS9Y/cn8UwNuXw8+oS/ziM
	knpK/lc/HGxf2gbgHcNBXg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1715863091; x=
	1715949491; bh=JscTQxLAk3V96qFDXBrf7A039tSWxD/jXzTElnVgAEI=; b=I
	ovEZCm6cemKX48TQdlbOqmjumbu9D2jlQkzMGwK86yOqIvgrCFBTbgcgegW7tyoV
	OhATLUG4O3KfiGdViLLP3Q+WEdkXOtN2MGWPdPPEHwoChWqp+K2nUUPpAd3+53Cj
	N/QUVs3tZtmSXDaggtoPJdk0VF0AVubtrVP4cPJRioMstbQo8Sv8K+xGa+/Wk04A
	NwgWqsqrU3rONCfg/S2PEKSV8KEhLz2HD9c7hZ3QnlXjXF/gBGAt5ENC2kWJ+62f
	aR4S+c8imNbH9z9HXb/FBdg+SzwFF4hcEpF5tlJzr77L79FMgJz0TrK5x9OsGLu2
	47hqU1FsGWvCJtkjEEb5g==
X-ME-Sender: <xms:Mv5FZvAWTZrcdZO0HwLNhtz4Wip9R4eiBm4EBGL3UtNQYY4NyO-FJQ>
    <xme:Mv5FZliApIIKzrrNbOGfSDUNyWCFdCeVsbYXQUb8Uv63U9qJ2yBnEXClH8FJXKPFD
    G1CA02Kdpk3j8sP_Bg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvledrvdehuddghedvucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepofgfggfkjghffffhvfevufgtgfesthhqredtreerjeenucfhrhhomhepfdfl
    ihgrgihunhcujggrnhhgfdcuoehjihgrgihunhdrhigrnhhgsehflhihghhorghtrdgtoh
    hmqeenucggtffrrghtthgvrhhnpedufeegfeetudeghefftdehfefgveffleefgfehhfej
    ueegveethfduuddvieehgfenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmh
    grihhlfhhrohhmpehjihgrgihunhdrhigrnhhgsehflhihghhorghtrdgtohhm
X-ME-Proxy: <xmx:M_5FZqkN2gOkfU-I0xVI4jnNlCjIRdEt3eXc_azBMM3Zgf_fg55a3g>
    <xmx:M_5FZhwTzfarl3axMGbvKMFyIaZJTnafE-SDw1cU8VqT3BsdPCpnyQ>
    <xmx:M_5FZkQPkHaVoeBMqfB7J7aS35Gr11KmtoJiMgOU7uAz5FMzydQp5g>
    <xmx:M_5FZkY0pHRE_lIKHbragEJQRXKPkUYHTngSDOwRlYQnNxUMYEvFsw>
    <xmx:M_5FZvdArO86zFvBhSCXzrP4FW1inXE8mjIHsqJtNa-VJRF54oFBZCMu>
Feedback-ID: ifd894703:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id E6B8236A0074; Thu, 16 May 2024 08:38:10 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.11.0-alpha0-456-gcd147058c-fm-hotfix-20240509.001-g0aad06e4
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Message-Id: <fac639a5-98a3-4a04-b4a6-5182be5454a9@app.fastmail.com>
In-Reply-To: <20240516-glorious-crocodile-of-adventure-4d5784@lemur>
References: <b483c569-66b1-4a4c-913f-3b60ebcd1743@app.fastmail.com>
 <b89ad184-f920-4f6f-af9c-59ff9ef52b8f@sirena.org.uk>
 <20240516-glorious-crocodile-of-adventure-4d5784@lemur>
Date: Thu, 16 May 2024 13:37:50 +0100
From: "Jiaxun Yang" <jiaxun.yang@flygoat.com>
To: "Konstantin Ryabitsev" <konstantin@linuxfoundation.org>,
 "Mark Brown" <broonie@kernel.org>
Cc: tools@kernel.org
Subject: Re: b4 one key git rebase -i
Content-Type: text/plain;charset=utf-8
Content-Transfer-Encoding: quoted-printable



=E5=9C=A82024=E5=B9=B45=E6=9C=8816=E6=97=A5=E4=BA=94=E6=9C=88 =E4=B8=8B=E5=
=8D=881:26=EF=BC=8CKonstantin Ryabitsev=E5=86=99=E9=81=93=EF=BC=9A
> On Thu, May 16, 2024 at 12:53:06PM GMT, Mark Brown wrote:
>> On Thu, May 16, 2024 at 12:47:45PM +0100, Jiaxun Yang wrote:
>>=20
>> > Is it possible for b4 to have a one key git rebase -i to whole seri=
es feature?
>> > Or at least have a command to output base commit hash, so I can mak=
e an alias for
>> > that on my own. I think that would streamline my daily routines a l=
ot :-)
>>=20
>> You can get the base with:
>>=20
>>   b4 prep --show-info | grep base-commit
>
> You don't need to pipe this to grep, this will work, too:
>
>     b4 prep --show-info base-commit
>
> In fact, if you are looking for a convenient alias, adding this to you=
r=20
> ~/.gitconfig will let you run "git b4r":
>
>     [alias]
>         b4r =3D "!git rebase -i $(b4 prep --show-info base-commit)"

Thanks, Mark and Konstantin, that worked out well.
You guys saved my day :-)

>
> -K

--=20
- Jiaxun
