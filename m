Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D8172343A5
	for <tools@linux.kernel.org>; Fri,  7 Feb 2025 07:58:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738915109; cv=none; b=fOJqIWP0yoxz0ScLsxQlsB+xhfCdyoTbYl39hwZ3d2Kv+jgCoyk/ePZoh8E39dAX26T0HsYIf/pRx9tGXGKvviiCyqQUg+qkdi8hJAI2KDFBYwc7dzXqHFOHzDGQdv8dVMd/fkRuhLrpExHiep7XWCWa3dqsqDNK8R9ilFz90Jo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738915109; c=relaxed/simple;
	bh=lVyr1we9q+lwGYgxtMdgxOdeV0U6DCkHBzMqJtxZJp4=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:Cc:From:To:
	 References:In-Reply-To; b=G0G+d4hUxs3Fa4fsBTFSr4J436aaiN10VidqxgJOx9rCUrNOzVIZMvrCSZwCZyi6ThXhtaNAj2QgLej9IP721KTLmf3uK3zL7ZxebgyTGuU8SRg3vxJGkXp7lo6LsPseVT9czBokkg36Ql6Gn+VuLmkwfhjHs/ojahkZpqp9tYw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=H+WshEJt; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="H+WshEJt"
Received: by smtp.kernel.org (Postfix)
	id F2337C4CEE2; Fri,  7 Feb 2025 07:58:28 +0000 (UTC)
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net [217.70.183.194])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id F168EC4CED6
	for <tools@kernel.org>; Fri,  7 Feb 2025 07:58:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org F168EC4CED6
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 2038944180;
	Fri,  7 Feb 2025 07:58:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1738915099;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ULnv9x6Nm/aSdFupTCcWyslzg53taKsIYZHiWmX2+bA=;
	b=H+WshEJt4uvovMS5tHHvOb49nIrB6PDqqCYEVI3qpkSLlkATPJ8/OkxglQMTxmVw9588D4
	VgmSoTOQAuYDG3Pb1Ubn7OmvRtPbmMvXfCVsSGy2Vc4edNsYCzuoLD35xMDuOsS20KTcge
	e2YzkjgEo+fd29eFvWBnZ34fq7gmVmFZB/Jljs2HF+5xQkW9OR8TvnfDHxc2eqS7kUuQ56
	sOPReWhpbAqgelFdwWd/8c2m6FTBOroHsaD7OZkFGlOhPW1PoETvAgtQQiYw5/+KUAgONb
	UQTSgAA4Z6dgqe7gcgOjpF0AgtzfnUijIlnJfdEgJgKJcpIB2pZWVLUTuZUoXQ==
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 07 Feb 2025 08:58:18 +0100
Message-Id: <D7M1YG8MYLWO.K654XKU6IU0L@bootlin.com>
Subject: Re: [PATCH b4 0/2] prep, diff: support overriding range-diff
 creation factor
Cc: "Kernel.org Tools" <tools@kernel.org>, "Thomas Petazzoni"
 <thomas.petazzoni@bootlin.com>
From: "Antonin Godard" <antonin.godard@bootlin.com>
To: "Konstantin Ryabitsev" <konstantin@linuxfoundation.org>
X-Mailer: aerc 0.20.1-0-g2ecb8770224a
References: <20250204-creation-factor-v1-0-9988d594a018@bootlin.com>
 <20250206-dramatic-sparkling-millipede-a33bb0@meerkat>
In-Reply-To: <20250206-dramatic-sparkling-millipede-a33bb0@meerkat>
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvkeejfecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepggfgtgffkffuvefhvffofhgjsehtqhertdertdejnecuhfhrohhmpedftehnthhonhhinhcuifhouggrrhgufdcuoegrnhhtohhnihhnrdhgohgurghrugessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepvdehtdetteehfefgjeelieelvdeiveeludffjeegueefudejueeffeejfeevgedunecuffhomhgrihhnpegsohhothhlihhnrdgtohhmnecukfhppedvrgdtudemtggsudegmeehheeimeejrgdttdemjegthegtmeeirgguvgemjeelgeekmeegtdehleenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvrgdtudemtggsudegmeehheeimeejrgdttdemjegthegtmeeirgguvgemjeelgeekmeegtdehledphhgvlhhopehlohgtrghlhhhoshhtpdhmrghilhhfrhhomheprghnthhonhhinhdrghhouggrrhgusegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopeefpdhrtghpthhtohepkhhonhhsthgrnhhtihhnsehlihhnuhigfhhouhhnuggrthhiohhnrdhorhhgpdhrtghpthhtohepthhoohhlsheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepthhhohhmrghsr
 dhpvghtrgiiiihonhhisegsohhothhlihhnrdgtohhm
X-GND-Sasl: antonin.godard@bootlin.com

Hi Konstantin,

On Thu Feb 6, 2025 at 7:09 PM CET, Konstantin Ryabitsev wrote:
> On Tue, Feb 04, 2025 at 05:44:15PM +0100, Antonin Godard wrote:
>> git range-diff allows to override the creation factor, which is
>> sometimes useful to adjust for seeing different diff outputs. This is
>> not possible with the current code, and is also not configurable from
>> git config.
>>=20
>> Add an option to diff and prep to override the default creation factor
>> value.
>
> Does it make more sense to have a more generic way to provide arguments t=
o
> pass to git-range-diff instead of duplicating options?
>
> E.g. something like:
>
>     b4 diff [...] --range-diff-opts=3D"--creation-factor=3D80 --left-only=
"
>
> We'd have to re-parse them with shlex to make sure they are safe, but it =
seems
> like a better approach, no?

Right, did not think about it, but I like that approach too. It will avoid
having to make b4's options expand too much over time.

For shlex, were you thinking of shlex.quote()? Do you have any example in b=
4
that uses shlex for the same purpose?

I will try to work on that when I have some time, thanks for the suggestion=
!

Antonin

--=20
Antonin Godard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
