Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82D11200110
	for <tools@linux.kernel.org>; Wed, 15 Oct 2025 15:14:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.50.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760541299; cv=none; b=R5R/dJVKi4mNdU/ej6xa415GF9GpzTM/OcTa52u5XMTlujnHf+1XvAngo14s0HVdj8gJdAbtVAGDBS1m7iy7EL95QJeI5Upw8Be4f2405cYoQMvmGuhMJiCymdflMneNU8xFTr+qWb9BsURscfbaMVURw2GIatrtaKTN4/+cLns=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760541299; c=relaxed/simple;
	bh=jaKpiu5zTY+uFfNBXQRroDrERJEwptfXk/vZjVQhgnY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MmLmCCnsPTGKw6puvO/CCFfpcl3CnGc0NiB5Hb/PVVe23p1jSJODCEaBRkssa/DdgpAZJKqFsBi1tH/yTasHrX8bTRANhz/VGjKuUdUzNbv9dAxv1JIA8QaSm2x2suzX0RT1ELcbfoJ/5IspFSWYsq4cGezALid6tCybqDQMRFQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=ONHo1mI7; arc=none smtp.client-ip=90.155.50.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="ONHo1mI7"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=WS4i2yf4GjKWdz5d4SB+7CBAP4cmI37lhcAJgCF0NqY=; b=ONHo1mI7okv2xm/dOG4ZRi0QQn
	zHLMNsVyWXlCbJAA0tsyZo8z+dVGDmE15fUZdHlb/e6iXTMqzzavxlST9wFXIOkqvxr28KFh/nYS9
	hotWdVZa4V46GArR8HzLdBBNX7FQM8Rw1DDTx/2cT0rvudv6Zb4hR7zjowaThIDX48mVLA3hEfyUh
	T/eXz6wpI8Bn6TtYEiytad/HXGlYPSPacSAb7N34TeQthZtc01C5+/xtco/oX9/HfyiHhNbVeHKuy
	MWzcnfwTFBh41MKYwGhnkLYJ6QRKSGjxlbAirJnSuqZkCXKuCklWoyiR5NDXt3/5ZrprS4U7mimCu
	z6WdOCPg==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by casper.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v93DD-00000000gG8-49ig;
	Wed, 15 Oct 2025 15:14:49 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id 7C1BF30023C; Wed, 15 Oct 2025 17:14:47 +0200 (CEST)
Date: Wed, 15 Oct 2025 17:14:47 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: James Bottomley <James.Bottomley@hansenpartnership.com>
Cc: Mark Brown <broonie@kernel.org>,
	Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	Linus Torvalds <torvalds@linuxfoundation.org>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Konstantin Ryabitsev <konstantin@linuxfoundation.org>,
	users@kernel.org, tools@linux.kernel.org
Subject: Re: In defense of Link (was Re: [b4] initial "b4 dig" to supplant
 Link: trailers)
Message-ID: <20251015151447.GD3168635@noisy.programming.kicks-ass.net>
References: <CABgObfY5agTRsB-bCqCYbA0erFn5cVbujtTNBiCti8g_68nCWg@mail.gmail.com>
 <20251013081536-mutt-send-email-mst@kernel.org>
 <CAHk-=whSShtPG1_+02Cc4yDuEJxVqX=G8tAx0gW7UjA7cuBp-w@mail.gmail.com>
 <CAMuHMdWxMhM1J3zHC8OkN_fd8XsJPFA6jM_3JFU=ySKhnX6ESw@mail.gmail.com>
 <CANiq72ka1y0YXysRQtuqnzc0i5FSbrGjKwprrXQpozwDOV3khA@mail.gmail.com>
 <aadb0515-4024-40c0-8024-fcdd029a3029@sirena.org.uk>
 <2991ae006906913c10715a9673ac53a4ea557728.camel@HansenPartnership.com>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2991ae006906913c10715a9673ac53a4ea557728.camel@HansenPartnership.com>

On Wed, Oct 15, 2025 at 09:50:48AM -0400, James Bottomley wrote:

> Absolutely.  But part of the problem is people who Cc different parts
> of their patch set to different people don't want to use the --cc
> global of git-send-email,

I so wish people would stop doing that. There is nothing more annoying
than getting a partial series.
