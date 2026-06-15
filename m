Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A46519F11B
	for <tools@linux.kernel.org>; Mon, 15 Jun 2026 18:19:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781547549; cv=none; b=oh5Sq3mgibytDlOzMK0+EeN5ti1hvIEzKZvcBTtYC8i95ue97TLBCTo4lQc/zaf90gzw/IPuuirTBErLFAp1T0a1fq/7dAKSSEFtTPf70yaf0HF3yGcXEhbOi50Vfnf3+rxF2WclzRBn93XK1hiMG+hoGdy+L/BVOnuN8KUDHiE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781547549; c=relaxed/simple;
	bh=jFCwf1loap+rrdQHSjEtaEjTLij/zZtg3uM8mZJTVAM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=E97Vh2phPJ96FSfN6WZjqgcE5B+aOEXG1o8fOVNl80+QdSobgDAsu3AgOw3CT5n3T9iU67U8rDCM9NbNN1gR0sJEc5DPMmZfPWMZJXrn2wtX+REuOMTq3/gJGur2pKnzNUsYTlfnmCEMi6CmpR15TCrceKZRAxZi5cfFsqnL0+c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=UX3BLogY; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="UX3BLogY"
Received: by smtp.kernel.org (Postfix)
	id 42A421F00A3A; Mon, 15 Jun 2026 18:19:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DA0711F000E9;
	Mon, 15 Jun 2026 18:19:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1781547548;
	bh=iIcfUWRkWumIw8vieEE4iOMTM8D0bvQUGUAYuUhIUeA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=UX3BLogYE3tI4KthBF8OQstpynF3viHSeIW+LIG+tCGndEuL+JgwhTN4wFiMDnO/j
	 loxZ511s9JwyBdMQWLy2xaEUy9dqh93fvUXZ1mn+xF91o7xUsfJhHraN7kYyJSLb4M
	 6/JncBlFAaWVK/T+gleNMjmNNiAAY2vTBbWS+f5g=
Date: Mon, 15 Jun 2026 14:19:06 -0400
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: =?utf-8?Q?C=C3=A1ssio?= Gabriel <cassiogabrielcontato@gmail.com>
Cc: "Kernel.org Tools" <tools@kernel.org>
Subject: Re: [PATCH b4 v2] ez: avoid duplicate signatures on resend
Message-ID: <20260615-beaver-of-unknown-revolution-ec6da5@meerkat>
References: <20260613-resend-signature-fix-v2-1-ddd560f810bc@gmail.com>
 <20260614-unbiased-favorite-marmoset-194aff@lemur>
 <e3b32690-651a-4224-87f3-ba78757ccac2@gmail.com>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <e3b32690-651a-4224-87f3-ba78757ccac2@gmail.com>

On Sun, Jun 14, 2026 at 03:21:14PM -0300, Cássio Gabriel wrote:
> > I've never seen this happen, so I'd like to understand what may have caused
> > this.
> 
> This happens when I send a single patch using
> my custom 'b4.prep-cover-template':
> 
>        	${cover}
> 	---
> 	${shortlog}
> 
> 	${diffstat}
> 	---
> 	base-commit: ${base_commit}
> 	${prerequisites}

This did unearth a bug in how we were looking for basement info. Your custom
cover template no longer includes "change-id", which is what we were looking
for to identify the "---" separated sections.

I am putting a fix in to use more than just "change-id" but I'm curious -- did
you omit it on purpose, or is it just an oversight?

Regards,
-K
