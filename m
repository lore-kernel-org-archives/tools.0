Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF6C447887F
	for <tools@linux.kernel.org>; Wed, 15 Jul 2026 15:07:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784128056; cv=none; b=menKQ4gET/ugxRa5yJ+DrXZdgYvxicJlSWC6vNufjUriRUT7MTeshE3VtkfV/tlt3puVQJf3xxeRNVybID1ZN+5k567I7Zh2HbMpHPWiLjQumm2cJmRunJMQADXXjRSKpgzlXQR96bB9plC1/3CfUvPtQQcVf+2xs7a9Kdf6tks=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784128056; c=relaxed/simple;
	bh=2i5o+q6HyqNP/6RrzgjjMC2D6Wlf9Cq9s4Gbl31qAwM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fsMuZ6SRJDbQeFhzFy10idCkOoRUn6V9sCm8dziOHv3S2z2p7Fh7AiYdrE1gZ12QvnyrDYwKfvQR2RI89jdz7wjh/KjAjn9CBDe8VtQ+k26UqDS9v6AItlytp8CJi6Mgua/h3JJP7BChyf3RS9rLiaqt39dSqt84jHKpcXgSTdA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dpDOoBb7; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dpDOoBb7"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D7ADD1F00A3A;
	Wed, 15 Jul 2026 15:07:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784128055;
	bh=2i5o+q6HyqNP/6RrzgjjMC2D6Wlf9Cq9s4Gbl31qAwM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=dpDOoBb7v7SCRCaBWOiUoNAwaZ58m0PMYmB9rONzoTD66VWOwb4aWDEulMtAdwZyv
	 xhra72T40J0xGTIS5VbHSJO4mHCPSISJRwEl0tL+fKpTaoR3Xaal4N+SrG0MhEYXJ4
	 fNAcnxvx7s4W9lVZqbW3qP5GNBlw8QMe0NGY7fqt08aYq60km95gdYhSN9k/ERAiHP
	 lhbBKyPSYWMSDbfv/cIG4mZZrkLhCyBfGQgtitMsu+bcsYuIxvepa8BSu57FytiySh
	 mh1udPPagNpPiA5h19xG+CneHwmyvtZtYqtZkYEFiuZQhuM1hnAgv280f36YBLTn6g
	 3AHRc9eyIDW8A==
Date: Wed, 15 Jul 2026 16:07:23 +0100
From: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
To: Mark Brown <broonie@kernel.org>
Cc: tools@linux.kernel.org
Subject: Re: b4 review feature request - search :)
Message-ID: <aleiDiV0GMGOXiak@lucifer>
References: <aleXuTEXAJ7if1wt@lucifer>
 <9b39b9ff-e737-4868-a84f-66243cdb6bfd@sirena.org.uk>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <9b39b9ff-e737-4868-a84f-66243cdb6bfd@sirena.org.uk>

On Wed, Jul 15, 2026 at 03:30:22PM +0100, Mark Brown wrote:
> On Wed, Jul 15, 2026 at 03:24:58PM +0100, Lorenzo Stoakes (ARM) wrote:
>
> > So maybe default-bind '/' to that and it moves the highlighted entry to one that
> > contains the searched phrase in submitter or series subject line, or something
> > simple like that.
>
> There's 'l' (limit, like mutt) which does a lot of that.

Ohhh nice :) I wondered what that was but didn't try it.

OK this is a nop then, just tried it and it works well!

Cheers, Lorenzo
