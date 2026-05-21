Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2AE9F299959
	for <tools@linux.kernel.org>; Thu, 21 May 2026 03:59:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=100.103.45.18
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779335962; cv=pass; b=jOIcvT2Gal+Iv6ngYgGrF/6Y7vHwf9XpZ3FCKgFz6S9TRlxpufPQHQkR2TL+NQoEeTfC/HiyrXASInURdAmZSudPZ0qfw3LAvgsikKT/Mc3pzKVw32bUQ9htuukRXpc45PyyPcSUbMQq3xeX4LccoIEDbR1wPXehibHHJKYKwxQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779335962; c=relaxed/simple;
	bh=yQ4MCzBswsemYM/pMEM9KtP+DI3k7zYjJWB+xtoDNLw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NGc85xw43P3HB8NsAVFmoy3qrgJNTl/kvWjIuS2XekB2bZTASzkS0CeYZYw5KHcvdSs1hPAi28A07mK45z4h0HIWQX2sVTHit5qfMLi9j+G/fRvvbT51uUFi2h/Bfy69U96Wkgtuzb7npLjgzmKViH9nHnfU+uyJYJvPP95yVoA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b=kWnzKmpx; arc=pass smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b="kWnzKmpx"
Received: by smtp.kernel.org (Postfix)
	id DE2231F00A3B; Thu, 21 May 2026 03:59:19 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=65.109.113.108
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1779335959;
	b=p14WJKJBRAWqyjWvvd47gLMyqnY1/GAqVSuUlyMA3S9ytUKYbe4YD5D/e3eGd3LBS8N/
	 DyBNyQSf0MSp14JXNQ/P8EhrAOIWWi7W3pR51APNUKIzUroVVGBzg46eDHIgcqff/hlin
	 CIX+VwP2vc2iTsbf9IdOxrS9cLEr+E1Z3DIUr3j8xNG5M1PchgZN8rpVCiyGBTEWpXZD5
	 keXBg323eG20QByjO/Lwq5qjDCp0KQbA8CJ3u9amekMSHKy5oQE2PCedde4nsNShPEoSC
	 tzAaXQVjr0QeolnMuMY40mlZecuRpNzQufctyAe7m1KPpizouH9H16U63+grp81TQyQ==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1779335959;
	h=DMARC-Filter:Received:X-Virus-Scanned:Received:DKIM-Signature:
	 Received:Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=ZBP+FEiyRyveadpEhy0Y1UoGX2eIj6bz3AYvA/tuXuc=;
	b=gmvo4TGJJFsOxkTBW+v4VsnmINUpRXEl+VcFaOqVwwWgDRlTrO5qFIoT6UWpA4Cd3Erw
	 FE0VBzHpUY1BFwxXp27c/CB7FYjnjlEzbiy9vZZl307D8RHRYhLrArN6a1NA7dqGLwnHI
	 cETqK/R7glfFXKHxHd30oMTeF6UrB5EmKHTrAD9SrFkKRwBHbnEl3IwS2wk2D9RTC5mzX
	 9bhst3QJCnNJn4NhF2K9BWvG5uq0yIejSZVI40gKduQG3+5C91KNOi/dfsB2JMRcSB8QC
	 pivMMp3SQJa5zwgcUqCnmkt+HVwtlckSxdpVjMFRiItqy+8LNsgVZp8jq9r/XuOy4pw==
ARC-Authentication-Results: i=1; smtp.kernel.org; dkim=pass header.d=alien8.de header.i=@alien8.de header.a=rsa-sha256 header.s=alien8 header.b=kWnzKmpx;
	dmarc=pass header.from=alien8.de;
	spf=pass smtp.mailfrom=alien8.de;
	arc=none smtp.remote-ip=65.109.113.108
Received: from mail.alien8.de (mail.alien8.de [65.109.113.108])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 3ACDA1F000E9;
	Thu, 21 May 2026 03:59:18 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
	dkim=pass (4096-bit key, unprotected) header.d=alien8.de header.i=@alien8.de header.a=rsa-sha256 header.s=alien8 header.b=kWnzKmpx
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.kernel.org 3ACDA1F000E9
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=alien8.de
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTP id 2120940E01B5;
	Thu, 21 May 2026 03:59:16 +0000 (UTC)
X-Virus-Scanned: Debian amavisd-new at mail.alien8.de
Authentication-Results: mail.alien8.de (amavisd-new); dkim=pass (4096-bit key)
	header.d=alien8.de
Received: from mail.alien8.de ([127.0.0.1])
	by localhost (mail.alien8.de [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id pL7Ry9OHJmqJ; Thu, 21 May 2026 03:59:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=alien8;
	t=1779335946; bh=ZBP+FEiyRyveadpEhy0Y1UoGX2eIj6bz3AYvA/tuXuc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=kWnzKmpx9XxHnvKXMRePoYOHdOfmclAFCTBucoCT0euFwy5UiciubNl8mWLbU+J0A
	 K3RpzWeKXGCpJlziV0y2LdraQKzkLEwgKZs469rcsHms73ZLql6rO3ycWYRUQ5Y5cj
	 kXs3iKO+02xUqplC5BWvyiEeXnxRqDd8etTefBzvknzzspKV//KapHc3irch8tP/nd
	 loS7RiCagXeZ4nTFikUhKfsOEQibEvJnKJZF8ct8tfvBcG5fzeBfqo3MJ1mAoLc0pG
	 I27Y5i6wQJY3FZo63d21KzlWvKPAI4IIxNZAoXoIKZmoWAgBX7PfbcZuR9ZOM8dzzH
	 rAOxkrBDnqvlwp8llt6exSoOq0pGHqLfUyILRHartTx9QBUo31dSI/JFHMRvEGeUQO
	 Hflu8tERei1hr4PV6Ohpxo0mRcHkf/j6UCrQ9Oi3/RSp6JTteF2QzxS8IYE6i1bpv3
	 bG+DOrsCxpGwy+H0xhpLhwxTM8CqNCOhEuV+6/JXRRpcF4XtDAZ3bIZdKogMX5HOql
	 7V/0lXU95dAO3YNNTxOLVG9McRMRhOwFn0fj34DDrnMlpbG+j9iyU2ThNVzH24yELC
	 Bf8NyukFNGcrfMhJkRpgizO5rO5FjamNWxyUouoDNCObrBPnoXE7p86+Q5qQGCIvjV
	 RVWMtSPMvVosrgVjJKw/u15w=
Received: from stx.tnic (unknown [IPv6:2600:1700:38ca:c00:b8a3:f58e:8829:9ca6])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature ECDSA (P-256) server-digest SHA256)
	(No client certificate requested)
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id 9E23740E0032;
	Thu, 21 May 2026 03:59:03 +0000 (UTC)
Date: Wed, 20 May 2026 20:58:53 -0700
From: Borislav Petkov <bp@alien8.de>
To: Konstantin Ryabitsev <mricon@kernel.org>
Cc: tools@kernel.org
Subject: Re: kgl and git shallow issue
Message-ID: <20260521035853.GDag6C_Td1WFqMjFro@fat_crate.local>
References: <20260520203544.GAag4bILhFL9wSQpxY@fat_crate.local>
 <20260520-invaluable-careful-cockatrice-e6ed3d@meerkat>
 <20260520-ancient-thundering-bobcat-2f086c@meerkat>
 <20260521011540.GBag5cvFqefROohMlm@fat_crate.local>
 <20260520-greedy-dalmatian-of-protection-4e28ed@meerkat>
 <20260521020958.GCag5pdn7ojEIRXMrY@fat_crate.local>
 <20260520-determined-emotional-porpoise-1cf7ae@meerkat>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260520-determined-emotional-porpoise-1cf7ae@meerkat>

On Wed, May 20, 2026 at 10:21:57PM -0400, Konstantin Ryabitsev wrote:
> This is something else entirely unrelated. It looks like the pull succeeded
> (look at those 34277 new messages), but it got 5 failures trying to deliver to
> whatever is your "local" target, after which it gave up.

config file has:

[targets.local]
type = 'maildir'
path = '~/Mail/lkml'

### Deliveries ###

[deliveries.lkml]
feed = 'https://lore.kernel.org/lkml'
target = 'local'
labels = ['LKML']

I.e., nothing special.

> Yes, I'd like to troubleshoot this further, assuming you want each and every
> one of those 34277 new messages. :)

Yeah, I had deleted the maildir directories cur,tmp,new in ~/Mail/lkml as
I was trying to make it refetch everything.

After doing:

mkdir cur tmp new

it works now.

:-)

Reattempting delivery  [####################################]  15/15
Updating feeds  [####################################]  1/1                              
Delivering to local  [###########-------------------------]  4681/14146  00:01:57  lkml

Thx.

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
