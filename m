Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 631863AFD1F
	for <tools@linux.kernel.org>; Mon, 17 Aug 2026 07:14:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=100.103.45.18
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786950858; cv=pass; b=ju30J2R6TVCt9Zrp624WkRrxsBZGqxD47oJpV3WgSXffWguWH5MgMP6udsXHTvFByuFI016+NfixuxPjnt9HxHzMsM+0Wbu3erGgsZ0fe5eg1ku487bxoIH8cjPLVXgHmHO6WiBsBkeqyCgVFc7RUDOjeZlsgATFl86CvbW8zrg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786950858; c=relaxed/simple;
	bh=TLeQcPeb/z2fGwMoZgta00hAjVqbBopndwlz0rf7W2o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=n6p5QEnvi9luM3HXzadXuMcLqSdTr6fB2F7JAAXR7SJ1L37ybsKI1Gkfk2OtP7tUhLKa6CwP6/Wz8MP9bix8AjBpDwJaMtbdLXNxj3C/bhJIOEoVjk6tOg59mk+TRg351tpodGCeNX5FBj+1FshbDZfGtTdiFIgNmaj5fv67yZw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=wyuan.org header.i=@wyuan.org header.b=Kzk/YAJ/; arc=pass smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wyuan.org header.i=@wyuan.org header.b="Kzk/YAJ/"
Received: by smtp.kernel.org (Postfix)
	id 5686E1F00A3A; Mon, 17 Aug 2026 07:14:16 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=95.215.58.252
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1786950856;
	b=0jNljt1shH2+cfKx8wZ+LKfygt4RbIyV3O44p3kMAsoJlSu+CEwrUlmgbmnanJAOykQz
	 hNVyj6ZHIXriQFQ+7x4+zaB6yFc40zByPEwC2C1/kZeZeQCn+JvThn2SKm/a93EpJetyN
	 Dm8gRjGS6GyUWT6nyvhZXa3CdKU9QMZ86e6naf8arkpBR0sknr/E0w4HOqd65j2tueeTV
	 6LlB88bMdLbbcdlDhiixFBu1sjnxofyPd9BZIgzfFvEGVgzKh0mz9/J3B7Is0yAFKxlPi
	 IEyD+2YcWsEsrlwkD3fQnFH40gSk7srPoi/mRmZ5sSm/7k3HWzZlkxyk8JvY/G7kGbg==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1786950856;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Migadu-Flow:Date:From:To:Cc:Subject:Message-ID:References:
	 MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=aKyqnT3fbNfZXMDsUg795cy9WLqJ1PU3olQzrMYzvy0=;
	b=Us2X1Frf3a1j95C1g1ZVp5emRqQRSDRCdM2pP2iLzO0iQtSP5nBKTwTE9ocJXxvJjjo8
	 QZGl3GDSiLWxUux3dGqeZ0MQaGxWOunVLsXi6dUnR1qWEiFcAZXwHerudt9Yz14YTC8L5
	 xmkRn/bsnJE4CYIW8DPvJY5qDT5X0W6gl/nCvkZ7opidsfDj8/4wJ2zE2AmRfCTLh9CSD
	 7ABPGzmnPwLa5FFZr6iTgYctXivqSLEFCRSwv/eTAh+jyY0CLZHVnDhmZJyD2vfWM0mRd
	 54ZAHrlfOfAmq7EtkgV5pclC5xZP6k+iwZVgcpbADHDytY7fDGyhHFDTTYGNwu2QK3w==
ARC-Authentication-Results: i=1; smtp.kernel.org; dkim=pass header.d=wyuan.org header.i=@wyuan.org header.a=rsa-sha256 header.s=key1 header.b="Kzk/YAJ/";
	dmarc=pass header.from=wyuan.org;
	spf=pass smtp.mailfrom=wyuan.org;
	arc=none smtp.remote-ip=95.215.58.252
Received: from mta1.migadu.com (out-252.mta1.migadu.com [95.215.58.252])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id C7EAA1F000E9
	for <tools@kernel.org>; Mon, 17 Aug 2026 07:14:14 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=wyuan.org header.i=@wyuan.org header.a=rsa-sha256 header.s=key1 header.b=Kzk/YAJ/
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.kernel.org C7EAA1F000E9
Authentication-Results: smtp.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wyuan.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=wyuan.org
X-Envelope-To: tools@kernel.org
DKIM-Signature: a=rsa-sha256; bh=TLeQcPeb/z2fGwMoZgta00hAjVqbBopndwlz0rf7W2o=;
 c=simple/simple; d=wyuan.org;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1786950852; v=1; x=1787555652;
 b=Kzk/YAJ/18Mf91UActcv0AIfIWtmCdW5XNl5H6wJCIOo+ZueiTMY7b7+gp/KjtrmCe4VYpNx
 1znh7n79L8NwkikO4ICYsL0HiwcnjBo9kRVUu94VIrl2wqCACbgQxu8jE4ULuVXZEwk57+51MRY
 TrVrNwq4bksajsIIFc6+m0WYRJCRv8qJaxbwtwkaRsj6I4rz8yUbLtVY7SmqIzqGEV2IVv0GlT5
 +UKjdbTrtlUsYSYzx/6BuTQxgRQsOPCadj2y1bRiQw2XeFXiw8A830DPql7gkOLogGVcNPAziNp
 8T5USb9AAgmeEH1iyO8OQUhtST2jyZk4yxl57nTONUK6w==
X-Envelope-To: tools@kernel.org
Received: from localhost (117.176.242.163)
	by smtp.migadu.com with ESMTPS id aa611ce99433dc6a;
	Mon, 17 Aug 2026 07:14:12 +0000
X-Migadu-Flow: FLOW_OUT
Date: Mon, 17 Aug 2026 15:14:07 +0800
From: Weijie Yuan <wy@wyuan.org>
To: Mostafa Saleh <smostafa@google.com>
Cc: tools@kernel.org
Subject: Re: [PATCH b4] b4: Ignore Signed-off-by trailers in follow-up replies
Message-ID: <aoK0v8bbaa5rHjbS@wyuan.org>
References: <20260808164708.1084648-1-smostafa@google.com>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260808164708.1084648-1-smostafa@google.com>

On Sat, Aug 08, 2026 at 04:47:08PM +0000, Mostafa Saleh wrote:
> When someone replies to a patch thread, sometimes they include a
> Signed-off-by trailer (for example, when providing inline diffs or
> snippets in a reply). Currently, b4 am/shazam collect these tags
> from replies and append them to the main patch's trailers.
> 
> I am not aware of any use case when collecting the Signed-off-by
> is needed, so drop it in this case.
> 
> Assisted-by: Gemini:gemini-3.1-pro-preview
> Signed-off-by: Mostafa Saleh <smostafa@google.com>
> 
> ---
> I hit this when using:
> b4 shazam -v1 https://lore.kernel.org/all/20260806150105.4010701-1-smostafa@google.com/
> 
> It collected the tag from Marc's patch in my patch as in:
> https://lore.kernel.org/all/20260808085824.732659-4-smostafa@google.com/
> Which is wrong.

I have a simailar case?

My reply [1] contains a standard template of a commit message for
Chinese translation patches with a sample Signed-off-by in it.

So when using 'b4 am/shazam', the sample Signed-off-by would be added as
one trailer. I was curious and spent some time to figure out where the
Sob exactly come from within that quite large series, since that sample
name/maintainer didn't show up in that conversation at all. ;-)

And I am also not aware of any use case when collecting the Signed-off-by
is needed, though I'm quite new in this community without much
experience.

Thanks,
Weijie

[1] https://lore.kernel.org/linux-doc/amDdPZ4SqBNg1kBa@wyuan.org/
