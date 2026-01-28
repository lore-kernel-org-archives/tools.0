Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FF9026FD97
	for <tools@linux.kernel.org>; Wed, 28 Jan 2026 18:47:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769626063; cv=none; b=t1enqwXChcrbGCi8cdVti3dRpP08XewBOs0NuRe7rGUgFMH+MKGXh5grOc4haYBGrF30xz5hGYFWVkMVJFdjFHUm8w4bNZgMpDzl/gdLM9Lnix/kUX8094gSLWtrfm4CxhKFvbZs47UaFtIT1G/t9X2RKw7tuDqSiG0JS1isLBs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769626063; c=relaxed/simple;
	bh=MawfFKtfZ+Svg8t323/qOnz9pmQMzqXZNUpppxpG+Vg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=aOuAXKOVw6m2QvsAQWbpHgynaEf+5/+FjviHUKICXd916tQ6W2FnCVrfJJG7CNOI9nLbdzuaWehS6Bg7JwcS/pGnvIpY4txpTrTEkWSrezcfWQvVAXxRPk42dBA2CKiv9zKnCNXeQL0jdHa6UQXLJ25TnD9mtFahQp6HHVK0TPM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=debian.org header.i=@debian.org header.b=TUw0FZ/+; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=debian.org header.i=@debian.org header.b="TUw0FZ/+"
Received: by smtp.kernel.org (Postfix)
	id 44070C16AAE; Wed, 28 Jan 2026 18:47:43 +0000 (UTC)
Received: from stravinsky.debian.org (stravinsky.debian.org [82.195.75.108])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 58AF5C4CEF1
	for <tools@kernel.org>; Wed, 28 Jan 2026 18:47:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 58AF5C4CEF1
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=debian.org
Authentication-Results: smtp.kernel.org; spf=none smtp.mailfrom=debian.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=debian.org;
	s=smtpauto.stravinsky; h=X-Debian-User:In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=EvefDOnXYuCndRfG4oGiFDgWk3qWmrInobr7v8omoXw=; b=TUw0FZ/+UNHWaEN+FoLebkHZTL
	Av26RQk/MdKIAtlVTDR/JhTVr9rOzLwipPhdwnWlaYJmu5tVR8HOTXmE08LLWyur6C9yAmGMUQW8N
	fAB5HqZAh8V3tzK6TXiawulzHlNN0yGloKHZLQzAzIZQ2MXeMsYHiu3eAno5nfR5tDa9lLfxSieQR
	nWtEvjuozPZiMFcnrWeW4ZN4v0JADegCqs12503Ku2sunYJjHQ/k3Ed5xKbx7qJr8Ehr4dAdAkdGA
	llFa0oUpjluMW7l2I9hbmQl1Q3IpFWv8ekToSuLy7slzfWfTAo3sAtFsZuWAg7BfiuZY7VqeNqMnF
	VIS4+nDg==;
Received: from authenticated user
	by stravinsky.debian.org with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.94.2)
	(envelope-from <leitao@debian.org>)
	id 1vlAZk-000Mqv-Qn; Wed, 28 Jan 2026 18:47:37 +0000
Date: Wed, 28 Jan 2026 10:47:32 -0800
From: Breno Leitao <leitao@debian.org>
To: Luca Ceresoli <luca.ceresoli@bootlin.com>
Cc: "Kernel.org Tools" <tools@kernel.org>, 
	Konstantin Ryabitsev <konstantin@linuxfoundation.org>, kernel-team@meta.com
Subject: Re: [PATCH b4] send: Add --force-cover-letter to send separate cover
 for single patch patch series
Message-ID: <aXpZpEayZstZYmRh@gmail.com>
References: <20260127-force-cover-letter-v1-1-1ba8d7f9a64f@debian.org>
 <DG0FDQ2I7T4R.Z5XKN00DAQ42@bootlin.com>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <DG0FDQ2I7T4R.Z5XKN00DAQ42@bootlin.com>
X-Debian-User: leitao

On Wed, Jan 28, 2026 at 07:14:37PM +0100, Luca Ceresoli wrote:
> Hello Breno,
> 
> On Tue Jan 27, 2026 at 1:53 PM CET, Breno Leitao wrote:
> > By default, b4 mixes the cover letter content into the patch body
> > (under the --- cut line) when sending a single-patch series. Add
> > --force-cover-letter option to allow sending a separate cover letter
> > message (as 0/1) even for single-patch series.
> >
> > This is useful when developers want to send a long cover letter with
> > extra information about an issue, and a commit. Having the cover-letter
> > "mixed-in" makes it hard to follow.
> >
> > Example:
> >  * https://lore.kernel.org/all/20260127-ipmi-v1-0-ba5cc90f516f@debian.org/
> >
> > Signed-off-by: Breno Leitao <leitao@debian.org>
> 
> Thanks! This is a feature I had requiested some time ago [0] so I'm very
> heppy to see it implemented.
> 
> I just tested it successfully to send a 1-patch series [1].
> 
> Tested-by: Luca Ceresoli <luca.ceresoli@bootlin.com>

Awesome. I was missing it also, and I haven't seen your request.

Thanks for the tested!
--breno
