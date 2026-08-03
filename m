Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67AC031F98B
	for <tools@linux.kernel.org>; Mon,  3 Aug 2026 15:40:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=100.103.45.18
ARC-Seal:i=3; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785771603; cv=pass; b=WuvEA0xGwddfvCTirxEe3jj3ibbFI7LOejL7mAvr2tWOwuMO7cUZRsv/3EZ2EItoiMwK2u2R2AolcST1V2npaQajpWpdzXdHTaPkXDnFpCm+4bCHcYbX0ERvor+nex3JFvhzngd4+G28TNDna39p39E5G/mZDJp32xjp+Ke0mhw=
ARC-Message-Signature:i=3; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785771603; c=relaxed/simple;
	bh=okAEhpuwBNgHXmCtd9uWnG+1I9A7tq66CDUVkXXblEU=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:Cc:From:To:
	 References:In-Reply-To; b=D3xrD+m3+Jo9UVj7cK1E9ZbWXQiWvbpbWz2KypVTPp3SdzX3vdiJWrxbJ0JOR7Ze7nv2FxjHK25CknSQRUVimPV707wZb1zSwGNjdBruTMeMYSYwM2LQx5CfLBchsNYHSVyqVsStpEIKRD15YIP0M3AsYHFTsVvTSOge5DtvScE=
ARC-Authentication-Results:i=3; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=ritovision.com header.i=rito@ritovision.com header.b=QHDPjxZC; arc=pass smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ritovision.com header.i=rito@ritovision.com header.b="QHDPjxZC"
Received: by smtp.kernel.org (Postfix)
	id 04D251F00A3A; Mon,  3 Aug 2026 15:40:02 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=136.143.188.15
ARC-Seal: i=2; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=pass;
	t=1785771601;
	b=egFv5gaz2LslO+D07lpTBpkvsTYVoCKzP5mfQP39UGrha2HfOjeZ1kqCCk6bCqSdCtfU
	 /TYxI/NO8SIFIPyKjuj1QRfg+b0G42U3kQXIv3IP/8HOi44V3yFcfT62rm25e98873j5/
	 DVRkjKifLaMoUuTOLn4Eie5xiBcF5E98+zFQlytU7nqyNkFdHXnBf/+YaGuirp66xoIxk
	 KExnrOsWVnSJBpkGkveDO9X36tVm4oNOFpXWKWzQUiZgZSGW6sW0F2WdjpBixDfHnOlho
	 qef4rfTeIWKz7elEAKMvWUU8Hmqt3yGWonv1w5OIc4Gq951GW+WGETHYc3iSXmg5lWw==
ARC-Message-Signature: i=2; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1785771601;
	h=DMARC-Filter:DKIM-Signature:Received:Mime-Version:
	 Content-Transfer-Encoding:Content-Type:Date:Message-Id:Subject:Cc:
	 From:To:X-Mailer:References:In-Reply-To:X-ZohoMailClient;
	bh=okAEhpuwBNgHXmCtd9uWnG+1I9A7tq66CDUVkXXblEU=;
	b=KHJBSWyNamF+MJnavQ2fke9G+GMW8L6TspnmH4IWQJ+7EjtqST73IWhRpXcLwJntkOOn
	 f48DkfVZOYcyc2aCaealhj9yPSMvps2VGdn9rpe493iYcZsENe71A9Y0Z1ezj7QYGoKrC
	 SMtrpULLs8pFsbEpm003YtaSq2w9Lh3Bp5ThH+3QeaOUiDeCmDZY2/+aJDpG5kQ38UJwI
	 arJkT50VDaP7+MqQgEJFHRgVzQh+LQgVQsC/cYpr9ORxfRSI5hkG5UFPoIQWpRYkfjpkA
	 T/QqDevMVzvp1G9NJzv4EkRWtKrWLiN9AqhrM/1xLQgYA+Yq4qB5fnKSJIsOk68NZ+A==
ARC-Authentication-Results: i=2; smtp.kernel.org; dkim=pass header.d=ritovision.com header.i=rito@ritovision.com header.a=rsa-sha256 header.s=zmail header.b=QHDPjxZC;
	dmarc=pass header.from=ritovision.com;
	spf=pass smtp.mailfrom=ritovision.com;
	arc=pass header.oldest-pass=0 smtp.remote-ip=136.143.188.15
Received: from sender4-op-o15.zoho.com (sender4-op-o15.zoho.com [136.143.188.15])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 51F2F1F000E9;
	Mon,  3 Aug 2026 15:40:01 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=ritovision.com header.i=rito@ritovision.com header.a=rsa-sha256 header.s=zmail header.b=QHDPjxZC
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.kernel.org 51F2F1F000E9
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=ritovision.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=ritovision.com
ARC-Seal: i=1; a=rsa-sha256; t=1785771599; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=aQV6tLoy3+4AQ12gDIC9ht83am4YGwwYP4FWOxBjzrwtgZKtQH47FMgkPwSoMMUbjxkn7NMU4+BeV1yNHFOHf7UOAFTNCoHjbBrECn7KKT67uBa9vL98V/4K+V7i7dnfbJAlKS53iX28L/QF+kCSb37MzOm61yT9MurXyzvUipg=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1785771599; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=okAEhpuwBNgHXmCtd9uWnG+1I9A7tq66CDUVkXXblEU=; 
	b=hax7ufyrnsvxIfZjjD+pC2CX2TGXgWOlnjGeZ3DXsyetEJrI/lKC22LQmgjYwH1AGxcmehIGmdilUobGk1o80sZVu83VQA+HQ1IQSaEpGbbkBO04Ffoc+a3DPqB3Ed83V5lKc9PHhh2dic7NRIf17i84mOVpPf6wbGWf6qzFB2M=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=ritovision.com;
	spf=pass  smtp.mailfrom=rito@ritovision.com;
	dmarc=pass header.from=<rito@ritovision.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1785771599;
	s=zmail; d=ritovision.com; i=rito@ritovision.com;
	h=Mime-Version:Content-Transfer-Encoding:Content-Type:Date:Date:Message-Id:Message-Id:Subject:Subject:Cc:Cc:From:From:To:To:In-Reply-To:Reply-To;
	bh=okAEhpuwBNgHXmCtd9uWnG+1I9A7tq66CDUVkXXblEU=;
	b=QHDPjxZCi0xxJEi2Wpvg+RfRRKLjwBw5NVT/ZYCwfhrZYW3sppfDAbRL9ayga9gd
	mDF6OpdxAW1FmnZWcqPHIyel8TPDFr89eQhN298skaQ79EeoTF9Dh6RfyUDASlqYIWB
	CinkLakZOnE+35AKSF/XCj83WJKGh6Y5zr22JIfk=
Received: by mx.zohomail.com with SMTPS id 1785771596843496.0018130931162;
	Mon, 3 Aug 2026 08:39:56 -0700 (PDT)
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 03 Aug 2026 11:39:54 -0400
Message-Id: <DKFF75A32GET.6XEQPMNNROK7@ritovision.com>
Subject: Re: [PATCH v1 0/6] Allow site layouts to render properly on mobile
 devices
Cc: <tools@kernel.org>
From: "Rito Rhymes" <rito@ritovision.com>
To: "Konstantin Ryabitsev" <mricon@kernel.org>, "Rito Rhymes"
 <rito@ritovision.com>
X-Mailer: aerc 0.21.0
References: <20260316180036.71949-1-rito@ritovision.com>
 <20260803-inscrutable-graceful-bullfrog-df737b@meerkat>
In-Reply-To: <20260803-inscrutable-graceful-bullfrog-df737b@meerkat>
X-ZohoMailClient: External

I'm glad to see the series in action! And thanks for the follow up fix.

I just sent a follow-on two-patch series adding drawer navigation for
mobile, to round out the mobile experience. The second patch removes the
banner rules that become unreachable once the drawer hides #banner at
that breakpoint, including the nav clearance from your fix.

Rito
