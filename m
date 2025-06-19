Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 414AB21CC64
	for <tools@linux.kernel.org>; Thu, 19 Jun 2025 09:39:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750325948; cv=none; b=gSHzEOSp6E6xMUJTPPd05+N9CeJqfIKC2p3fminuU1jlG1LSfgJkS52K7c9spSjQyl+eurItU/NOo7Yg0mpCZoj1Q0bbi0zx2vsvX5sCGo18HcIJLHTblzZ99vcEJO1JZwt/slOr5+Nxa5lVE/JqIR66aVVoVfZYc1U1aIMgPg4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750325948; c=relaxed/simple;
	bh=WZm07on14sGEuV7WGPJysOgu7456cpeKeA8VM73FMVs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=N6HjwSSphZXHr7tvpQXGANM6AGcizujNPnDlUTpgNg61ZQkLCvPGa9U/YQi2Rte8BbyT+b9trvqNVpJeg3LFp9Ij09Ni9PWlrFYa93++Vcpt9+UwvfDJ1MLmY32XoXtjjWrbzqJkCQKgItQcNFp/xcBmXTK9bgsrMH0tAIXgdrw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=I/CYqsz+; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="I/CYqsz+"
Received: by smtp.kernel.org (Postfix)
	id E62A0C4CEED; Thu, 19 Jun 2025 09:39:07 +0000 (UTC)
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net [217.70.183.197])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id B1FD8C4CEEA
	for <tools@kernel.org>; Thu, 19 Jun 2025 09:39:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org B1FD8C4CEEA
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id DAC1343310;
	Thu, 19 Jun 2025 09:38:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1750325938;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=AxT/9d5DdksDJ4ujLis+NeM3oSRwAQVeKOB2JYs4fdo=;
	b=I/CYqsz+Ewwlg+zD8RwCz46Nf0VmdEijXc9P5ncqJZYMVSkLGYbCX1tdkOZVIM8xeWzU3R
	zv0DHpVtciC8Qa3oY6B1Zb0DZuHUlzPS0FY/pMHLUoCce7tsasQSdlhrikA9omSaKtrkqi
	4fzdgL3lDHAW3stjmBbaJJEzMifE3AKjftJpehx9ojRfcK7yHu06dF/UBjfMs8QShJENzv
	tXVZKsgFIO/RKOf7EUn/IAcsFxnmGbyPjJYOv4SMeumRpm6mEW9GJlfnP91ILD3WCU5kPw
	yGkKLD423P1+8tD40gVPovpZiIbk977uujOXBNlBWLZI9dmTl4weJ8VxzuMSig==
Date: Thu, 19 Jun 2025 11:38:55 +0200
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
To: tools@kernel.org
Cc: Alexis =?UTF-8?B?TG90aG9yw6k=?= <alexis.lothore@bootlin.com>
Subject: b4: feature request: send cover as separate e-mail even for a
 single patch
Message-ID: <20250619113855.6a271fa6@booty>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.49; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddvgdehudekucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpeffhffvvefukfhoofggtgfgsehtjeertdertddvnecuhfhrohhmpefnuhgtrgcuvegvrhgvshholhhiuceolhhutggrrdgtvghrvghsohhlihessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepvdeiffeihedvuddujedvkeelteevveehveehheeiteffffelgfduteegveeggfeknecuffhomhgrihhnpehkvghrnhgvlhdrohhrghdpsghoohhtlhhinhdrtghomhenucfkphepvdgrtddvmeeijedtmedvtddvtdemvggrtddumegsvgegudemleehvgejmeefgeefmeeludefvgenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvrgdtvdemieejtdemvddtvddtmegvrgdtudemsggvgedumeelhegvjeemfeegfeemledufegvpdhhvghlohepsghoohhthidpmhgrihhlfhhrohhmpehluhgtrgdrtggvrhgvshholhhisegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopedvpdhrtghpthhtohepthhoohhlsheskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheprghlvgigihhsrdhlohhthhhorhgvsegsohhothhlihhnrdgtohhm
X-GND-Sasl: luca.ceresoli@bootlin.com

Hello,

first and foremost: b4 is awesome, thank you!

A fixed behaviour of b4 is that when a series to be sent has only one
patch the cover letter is sent in the [PATCH 1/1] mail itself, under
the '---' separator, instead of a separate [PATCH 0/1] mail.

While I'm happy with this policy for simple self-standing patches that
do not need a cover, I find it annoying for other cases, such as:

 * a new iteration of a multi-patch series [0] where all patches except
   one have been applied (or dropped), so the series has become a
   one-patch: keeping the cover letter separate would make it
   consistent with the previous iterations

 * a single patch [1] that is not obvious, so a cover letter is used to
   provide the context, high-level view of a larger topic, etc

[0] https://lore.kernel.org/all/20250528-drm-bridge-convert-to-alloc-api-v4-1-f04e698c9a77@bootlin.com/
[1] https://lore.kernel.org/all/20250618-btf_skip_structs_on_stack-v1-1-e70be639cc53@bootlin.com/

I think both policies should be allowed, under user control. The user
interface to control it should include some of the following, in order
of necessity:

 * a command line flag for 'b4 send' to manually control which policy is
   desired each time a series is sent
 * a per-series parameter, saved within the JSON parameters in the
   cover letter commit, so the policy is consistent across iterations
 * a configuration parameter to set the default policy in lack of the
   two above

I tried some hacks in the b4 code to draft this feature but I just ended
up in breaking other things, so I reached out here for more informed
opinions.

Thanks for considering this addition to b4.

Best regards,
Luca

-- 
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
