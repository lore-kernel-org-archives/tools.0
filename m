Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA5B647ACF8
	for <tools@linux.kernel.org>; Tue,  4 Aug 2026 20:04:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=100.103.45.18
ARC-Seal:i=3; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785873887; cv=pass; b=lnKM0kLyXyKoPHMnvMx+vLsCSkN/+2PK5wRLuqE4OiPbs3ewUpYYkNN5GojmRDbq3/xHTkqzJV1RVV38hmC2XJN/SkGohvspiQq0I1M1MmL+AW5mDPMeHyMYGeGaNMlMajDewY4NlYbZZzUgxhq1FcM5UmwgpjyvSClITwECeMk=
ARC-Message-Signature:i=3; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785873887; c=relaxed/simple;
	bh=I36hbjRUgjoRMJy4bq7N2uusVXxiJXsr1Tkvl2zJrX8=;
	h=Mime-Version:Content-Type:Date:Message-Id:To:Subject:Cc:From:
	 References:In-Reply-To; b=fLJ9nrMJwPC6YTtUyov2sRtbUVTcnyBVHnn9MWVVdX0j2Fc7C1zJhsYlAPoGYmM9CPmTGTKi7dhKb+0RlnBzQRbOxyGL90UfgI+usalqxmx2IKYg1U8dlm31oYrs72LMhzQdcXECnlGGGYU5LIbHRwmv4t22yF9euiNL3QbCWao=
ARC-Authentication-Results:i=3; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=ritovision.com header.i=rito@ritovision.com header.b=EvtLMvtA; arc=pass smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ritovision.com header.i=rito@ritovision.com header.b="EvtLMvtA"
Received: by smtp.kernel.org (Postfix)
	id 72ECC1F00A3A; Tue,  4 Aug 2026 20:04:46 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=136.143.188.15
ARC-Seal: i=2; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=pass;
	t=1785873886;
	b=W50pU4ryZH2efXJB2h9QEnBtDaZXRQtoZ/hehWZRgjmMuz5m8JiLQ30LVd5GtKRuZbm5
	 GNpVm2k6RIA9CM3eVe2nUDMoZKpqR9aVJcPXbR6wcpf2BHfjNt5/iHcBRD56DVdjVzDc5
	 lSdxS2NKUWW6/cAADIH6c8FPM9HKMBghQ5L5wVrYQW65aGppS3ZBeY8VNXwbAepiEKFWb
	 S5Lffgmn4z0NZVVEA9LRlTNAb1RIgq1buh0qJ03GE7QM6SE2sLJRsCVfO9Vwr5ZVYEFX5
	 Eg9KiLWeBS3jKhHkXlqlZ5pl0yQjwsPKQiu/JAKJHjJ/pTD22pDWLL4fC67OiAtj9jw==
ARC-Message-Signature: i=2; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1785873886;
	h=DMARC-Filter:DKIM-Signature:Received:Mime-Version:
	 Content-Transfer-Encoding:Content-Type:Date:Message-Id:To:Subject:Cc:
	 From:X-Mailer:References:In-Reply-To:X-ZohoMailClient;
	bh=I36hbjRUgjoRMJy4bq7N2uusVXxiJXsr1Tkvl2zJrX8=;
	b=c/dFO7LpKLSCQdaVqvQpJT6yfH4ptYI7M9U5m30UhVwqm4jyCyz2sosW8EiiRkBXcHpO
	 nNTXMGMztc9ZM8EbmttR7NLMY5wxenX8kQSHDH8wb0AuITvxwQwLxH961a68dZeOSJMAU
	 1Mtakb7egQmmjwpwo5vGB6wDtxgeFomVjjKifd/7Ms87mr+SLoJLg8cRw4xlxoPyiVAeY
	 7c5JTwiCPYajAQprWC5oMvok5/Nu0JPrX4AQyTY3JsFP3lPRnJLYxXxN9ySW2DERG4p6z
	 CpHK6Sp+7Eq+eWKDToRrXhJO1jPuEbm7HrViPSXX28cosqj9jUMAnQx3l8p8ArYeBgA==
ARC-Authentication-Results: i=2; smtp.kernel.org; dkim=pass header.d=ritovision.com header.i=rito@ritovision.com header.a=rsa-sha256 header.s=zmail header.b=EvtLMvtA;
	dmarc=pass header.from=ritovision.com;
	spf=pass smtp.mailfrom=ritovision.com;
	arc=pass header.oldest-pass=0 smtp.remote-ip=136.143.188.15
Received: from sender4-op-o15.zoho.com (sender4-op-o15.zoho.com [136.143.188.15])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 8216E1F000E9;
	Tue,  4 Aug 2026 20:04:45 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=ritovision.com header.i=rito@ritovision.com header.a=rsa-sha256 header.s=zmail header.b=EvtLMvtA
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.kernel.org 8216E1F000E9
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=ritovision.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=ritovision.com
ARC-Seal: i=1; a=rsa-sha256; t=1785873883; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=m4HnEarFbu0kzobvgZQqh/2k2diBywPaY8b9A95krINeRTs82YdVWDsTE/DZQjRh2R5k01vVFbH+I/E3AolR6Sxc8+2amINleD1DHI0o/lkrFvNviMgDRLV/fpdzXU/CeEukRzWocDROITDBpPppTSAIXirCH9YmeLPyN3LTsMo=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1785873883; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=I36hbjRUgjoRMJy4bq7N2uusVXxiJXsr1Tkvl2zJrX8=; 
	b=DvlMX9w2e4QMGSF4woG7vgCz279X9D7UwylJEy3Ykji3PWXTn3tv9HrRSqUAhdMujrPl2NVcHaf/nz0yWCfVS6j7kWyHppDDtx2y35qShMbs/y0k6ImeatdTlOqUIuOm4HTxUEJ2oL+057kksNnfMbDEtrYjpSiHNTkcSuqfO6c=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=ritovision.com;
	spf=pass  smtp.mailfrom=rito@ritovision.com;
	dmarc=pass header.from=<rito@ritovision.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1785873883;
	s=zmail; d=ritovision.com; i=rito@ritovision.com;
	h=Mime-Version:Content-Transfer-Encoding:Content-Type:Date:Date:Message-Id:Message-Id:To:To:Subject:Subject:Cc:Cc:From:From:In-Reply-To:Reply-To;
	bh=I36hbjRUgjoRMJy4bq7N2uusVXxiJXsr1Tkvl2zJrX8=;
	b=EvtLMvtA76qs1r/6oFwmLPYx+UnjzZd1qyY6OaJyBAxQa3bMmrjS3DtBqqJkF4Ic
	EOlcYyV0mz5xfhnBAiFz4U1Z+0kA+OvUvC5DXMlsckYEgpHAOr8iOCRWhOfWHg4AitW
	GwLEo+rb4YniJgYrnt63CH4lG3s47D4lYZ9lo66s=
Received: by mx.zohomail.com with SMTPS id 1785873880987605.6612392199695;
	Tue, 4 Aug 2026 13:04:40 -0700 (PDT)
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 04 Aug 2026 16:04:38 -0400
Message-Id: <DKGFGDRT1ZW3.QG9E5ZRB5LEJ@ritovision.com>
To: "Konstantin Ryabitsev" <mricon@kernel.org>, "Rito Rhymes"
 <rito@ritovision.com>
Subject: Re: [PATCH v1 1/2] add mobile drawer navigation with a compact
 sticky top bar
Cc: <tools@kernel.org>
From: "Rito Rhymes" <rito@ritovision.com>
X-Mailer: aerc 0.21.0
References: <20260803153502.32096-1-rito@ritovision.com>
 <20260803-curly-sly-guan-18e09a@meerkat>
 <DKFH8OBQKN6F.1SOFYEYNCJC5H@ritovision.com>
 <20260804-generous-godlike-muskox-c3df49@meerkat>
In-Reply-To: <20260804-generous-godlike-muskox-c3df49@meerkat>
X-ZohoMailClient: External

> Okay, I actually chased this down to stale cache on Fastly
> so I reapplied it again and it seems to be working well now.

Glad to hear it!

Rito
