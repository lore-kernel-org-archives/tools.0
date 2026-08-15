Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC7132773D8
	for <tools@linux.kernel.org>; Sat, 15 Aug 2026 07:37:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=100.103.45.18
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786779480; cv=pass; b=XvZEoH0MGb/uVbllO0qL6oqjOf4AYoKmwuHedXdA45EOOc8SZFESbVO9lY7xGBvcaznCwSqxTqpxXBFf301/UlwtB++SxoDVN07HsRbSdMc7l6/anx1WDZmWXHeCu8mBrFh4lTEKhewIGZwmcUxAYE9xY3p/6x1a0AVag2FYsNc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786779480; c=relaxed/simple;
	bh=MKvnEVbKlLbN2O33+o1X3LsSXtUZN/YGIfivNWY1Fcw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Cv1/bsODjiltegmf1tkQBDjD759ATPgF/H6CRXop24QENzC3pHLW7Ttw/DMiUx5NJAivqHPwbYEci+pHZdldjBcTHuA2PyxPZVZgT0hzRsBjTpvxGo5GMZEUdjIrE7c4w7gOvPuPDBP+vT3mIQ/vhvN9lOHPTLo32IJC88qaCqc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=wyuan.org header.i=@wyuan.org header.b=YmTZGj9j; arc=pass smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wyuan.org header.i=@wyuan.org header.b="YmTZGj9j"
Received: by smtp.kernel.org (Postfix)
	id C16AA1F00A3A; Sat, 15 Aug 2026 07:37:58 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=95.215.58.45
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1786779478;
	b=IOVNTYjtIGNq281K0I5/vMzjs1d8v03oLVWhgvg7uC9T5LqwdfaCYu28goXkegYdc7Sk
	 7AOhxv1Z/rlA/5/VpIoLBGDIb9ikV1ON94FVDa+YnbJV9l+B0wIiBLjfI/JW6Yilkf0kD
	 uVEERlQZBM0MwKa/o5cMPpChIFaSBXT8fcCHqoW3e8IfBX3o6i9eBXEwuguJu6pQfQnMT
	 Ftx+ShAhVcklJYGIjjSXmjs1jYuRhyDuhBQriFEcdwM46lcWzxB9wlwr9KRXY2ohuv86b
	 mws56062pdDG/d1uQGNje8k1qmRgtZ6h7aUT6vhugQcmX2d2IctqWqte8hQFiSsk2MA==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1786779478;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Migadu-Flow:Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:
	 References:Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=MKvnEVbKlLbN2O33+o1X3LsSXtUZN/YGIfivNWY1Fcw=;
	b=1Z+15ikgHwH91by+hlhii87uDqyyPJ7XO3988fCKuo+0CGOjA7up3FEKhz/pauq3Rv9V
	 qizz9FxeipGJFqlPWY06Y9YLW0efhHJvI1k2JWR2/gMquNNghPu5THUIAUDGtkTo1Kn+F
	 aAWvmBsX35m9vmrXafODN/kKHrIqAT0+uPhX600d8ouXa9HVoNB7Gh67nwCDfODUhLNF/
	 uosxlnUfLepD1xZz0FF/ZwlLUO/on/5fNMuL5N2ytl1FdRdEshC9enWnAqqjpbkhHQVzA
	 R25Z7T4RlZzrAK/RZiNrplxJHe7RBwjsnITtXQIiETgNeCz/m55cF3YZSHlWHwYLO0g==
ARC-Authentication-Results: i=1; smtp.kernel.org; dkim=pass header.d=wyuan.org header.i=@wyuan.org header.a=rsa-sha256 header.s=key1 header.b=YmTZGj9j;
	dmarc=pass header.from=wyuan.org;
	spf=pass smtp.mailfrom=wyuan.org;
	arc=none smtp.remote-ip=95.215.58.45
Received: from mta1.migadu.com (out-45.mta1.migadu.com [95.215.58.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id DB61D1F000E9
	for <tools@kernel.org>; Sat, 15 Aug 2026 07:37:57 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=wyuan.org header.i=@wyuan.org header.a=rsa-sha256 header.s=key1 header.b=YmTZGj9j
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.kernel.org DB61D1F000E9
Authentication-Results: smtp.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wyuan.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=wyuan.org
X-Envelope-To: tools@kernel.org
DKIM-Signature: a=rsa-sha256; bh=MKvnEVbKlLbN2O33+o1X3LsSXtUZN/YGIfivNWY1Fcw=;
 c=simple/simple; d=wyuan.org;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1786779476; v=1; x=1787384276;
 b=YmTZGj9jMiTbUNYm3Y1JqmBQh7QNbURtpnb91Ws23osd0QszbVleYjhw/C1TvTtcPlAArOtG
 bO3Lc0AlgU2WNidSTcrIuQTU3o5D0PlF08qHC5nxwI27y5zPZDc64bUNZrCsZ2jqN0fXGl8vWj+
 HLW0Chp5rit0VQHm/HdujXi2KXoKgeWdXyZsmW7ZbXDfOqm3ziN9mCnEwALPRT+UjudcZZR/OR7
 V3vlBM00FARrflbG4imizMP2UIBIMYk34Bv2N359Qs8vsTOutw4iKl7x7pcwGTNr8X/SlID5asN
 xoZXLTELqzHlKZJ2/O9EOK2Qnd4QZhckMGrfPmSgi4TyA==
X-Envelope-To: tools@kernel.org
Received: from [192.168.0.110] (117.176.242.163)
	by smtp.migadu.com with ESMTPS id edb443cab0bc1e00;
	Sat, 15 Aug 2026 07:37:55 +0000
X-Migadu-Flow: FLOW_OUT
Message-ID: <3607cf1c-ea56-4f3e-8250-8bf5bb09ef2e@wyuan.org>
Date: Sat, 15 Aug 2026 15:37:52 +0800
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH b4] send: honor excluded addresses in per-patch Cc summary
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc: tools@kernel.org
References: <36067800fe19dba18dc4874edfae524346b4ed1d.1786777097.git.wy@wyuan.org>
Content-Language: en-US
From: Weijie Yuan <wy@wyuan.org>
In-Reply-To: <36067800fe19dba18dc4874edfae524346b4ed1d.1786777097.git.wy@wyuan.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Very very sorry for the noise, my msmtp and email server got stuck
and without my knowledge, the email was sent repeatedly several
times.

Sorry for the disgusting noise.
