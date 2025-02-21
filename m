Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD6472AEF1
	for <tools@linux.kernel.org>; Fri, 21 Feb 2025 08:25:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740126311; cv=none; b=YXBieC26vjTGOkhLbkfv+KZVa+HiB2tyvVF9A3gXDaW/3hetcfnCY4t1OSxgQ8+dc9+XaY38uoqFs1r1bifkz9eYFqjanHMlnxGAikOCaGE0npWmBNIkjuf5gPY/HeQqgKn4qvayne28hGUVV7ioOn+/IDSgqujofxsGvCcrPSQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740126311; c=relaxed/simple;
	bh=JmtDGGKigEre5M4pTsuNsHU385keR3H0z/mrCozmM+0=;
	h=Mime-Version:Content-Type:Date:Message-Id:To:Subject:Cc:From:
	 References:In-Reply-To; b=UtRRtIecgFnvAqv27JW1ljEBJmMYjjKdX6fWYphah6PAOGrxLSh9WV8G/pI+6BPMdSvnO9dHqRD7wAq8nMYwqztjWqKcBdHqew7ATJ08SCbhOqRjyC5tT4sJc4IuEPD6xxxGuDxjaoYNXVHlW4qEjTx6Z33sHU4Gil2qRLFXCr0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=AKS5Q5L1; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="AKS5Q5L1"
Received: by smtp.kernel.org (Postfix)
	id 53741C4CEDD; Fri, 21 Feb 2025 08:25:11 +0000 (UTC)
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net [217.70.183.196])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 4888AC4CED6
	for <tools@kernel.org>; Fri, 21 Feb 2025 08:25:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 4888AC4CED6
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 7F05644443;
	Fri, 21 Feb 2025 08:25:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1740126301;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=JmtDGGKigEre5M4pTsuNsHU385keR3H0z/mrCozmM+0=;
	b=AKS5Q5L1dpZv7pjZVwTXWkOA/3mtbuzeTTE7zf6+dgMn5MryGDREV9nq54NjJ5Gr6BVhjm
	yaJhFSMpImVsf8Ef2n5CjV0iKW+GblrvMoq1EfnBrtJkQON3kf1AdjR91yPkYxh5oYokGq
	5HbpHp2kChV+qJYSnVk91cPL8cvWDkRtcJeIk7BdvRfjbayzEz8M8/mVf03X4CTShlgTBa
	Lc9/7bSAthJDymEkZBpZLoDYw3ExaSlh0Mp5x9n6kY0o2D6JGB6sccAS/iVUyoJY5I4ZhU
	S9RUHMSErE+XTAWWDHudHhmb7xR4m0p7ee3upomeDd7qatEuilPXCTMyKAdcDQ==
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 21 Feb 2025 09:25:01 +0100
Message-Id: <D7XZAIZFFGAP.BGUHTUI8TMK7@bootlin.com>
To: "Antonin Godard" <antonin.godard@bootlin.com>, "Kernel.org Tools"
 <tools@kernel.org>
Subject: Re: [PATCH b4 v2 1/3] diff: add a creation factor argument
Cc: "Konstantin Ryabitsev" <konstantin@linuxfoundation.org>, "Thomas
 Petazzoni" <thomas.petazzoni@bootlin.com>
From: "Antonin Godard" <antonin.godard@bootlin.com>
X-Mailer: aerc 0.20.1-0-g2ecb8770224a
References: <20250220-creation-factor-v2-0-7a0949a3a060@bootlin.com>
 <20250220-creation-factor-v2-1-7a0949a3a060@bootlin.com>
In-Reply-To: <20250220-creation-factor-v2-1-7a0949a3a060@bootlin.com>
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdeileehhecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepggfgtgffkffvufevhffofhgjsehtqhertdertdejnecuhfhrohhmpedftehnthhonhhinhcuifhouggrrhgufdcuoegrnhhtohhnihhnrdhgohgurghrugessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepfeejjeekieejuefftedvffdvteehteekkeekgeettdfffefgvddtfeehueeghfejnecukfhppedvrgdtudemtggsudegmeehheeimeejrgdttdemjegthegtmeeirgguvgemjeelgeekmeegtdehleenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvrgdtudemtggsudegmeehheeimeejrgdttdemjegthegtmeeirgguvgemjeelgeekmeegtdehledphhgvlhhopehlohgtrghlhhhoshhtpdhmrghilhhfrhhomheprghnthhonhhinhdrghhouggrrhgusegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopeegpdhrtghpthhtoheprghnthhonhhinhdrghhouggrrhgusegsohhothhlihhnrdgtohhmpdhrtghpthhtohepthhoohhlsheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepkhhonhhsthgrnhhtihhnsehlihhnuhigfhhouhhnuggrthhiohhnrdhorhhgp
 dhrtghpthhtohepthhhohhmrghsrdhpvghtrgiiiihonhhisegsohhothhlihhnrdgtohhm
X-GND-Sasl: antonin.godard@bootlin.com

On Thu Feb 20, 2025 at 3:24 PM CET, Antonin Godard wrote:
> When using git range-diff it is possible to override the creation factor
> when git considers a large change a total rewrite (and so showing no
> diff at all), or a change so small it shouldn't be considered.
>
> This parameter is only possible to set from command-line, it has no
> global option associated to it within Git's config, so add a
> --creation-factor parameter to b4 to achieve the same behavior.

Gah, sorry, I forgot to update the commit titles/descriptions. I'll update =
that
in the next version.

Antonin
