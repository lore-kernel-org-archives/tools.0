Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795547330;
	b=GKNtnrvLW+5A/pQLM1rNgseQNeLWJe1x5AYn6XEAEDNmteXA/sUqBsN3V5dQgE1S32G7
	 IHb9Mqkg/sioAn72cSFLIOp7FD2aaidkffGHDMKLbc6sYi3nmq7MYbq2C+UcLpI1gGkUb
	 9gBFHrINMAVgUXE672CTiU7IPyk7ZjuSxyBItMZyozcmLwkpQ5sVr5fLyc8tsEPD4OnCd
	 JMUXTxaRTAJJXp88n2nqndwwz4K8qdGeeOpiFZucXE5OYKpZ97pEhkHfqG7JvxsyjBFiF
	 clzDsJcSHal7S7ePhoAinbz5gaH9k68wPlLGwOnf/hdxOyMITkqvJ/U1lxvfWMGQhmQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795547330;
	h=Received:Delivered-To:Received:DKIM-Signature:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Subject:From:To:Cc:In-Reply-To:
	 References:Date:Message-Id:X-Mailer:X-Developer-Signature:
	 X-Developer-Key;
	bh=MuskAVT6NK1g5IpwN0AKjrqnJNRxm2zdR1nknFmCFT8=;
	b=QYzSrDzz5dxrcMw2lHFaVpalWRCilIv8T/yOmwNorrVTuLoz+hg9YhdpKtXFwo8/jUXj
	 kNGhZvCZOasBLqLrLl7ztZVtoy94uqkrfvWvd9dt1SkVeDr1DgWGfByyj/ZVCTjp1o0Vw
	 8PDfuf2FTioRNXfAT25FPP7uPkgVe8qfBQCJmR3h344Cqe3OUn+vLspqPQogYt2fKEJHn
	 cH/RSVThodeE//U4Cv6mPc1RC4eh5TsYOjwe1Y4soAR9h0G0lHHF1O8Jp4Bk9uoodoDDr
	 s0F2q0R3uAjrRqGxNK2oLkZuR6x5qxVc5OHPXBLD2QvdY/Mdn9EjYISI2v4+vdfJ4qQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=nPByFHL8;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 173B4606A330
	for <tools@linux.kernel.org>; Tue, 24 Nov 2026 19:08:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=nPByFHL8
Received: by smtp.kernel.org (Postfix)
	id 806451F000D3; Tue, 24 Nov 2026 19:08:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F413C1F000CA;
	Tue, 24 Nov 2026 19:08:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1795547329;
	bh=MuskAVT6NK1g5IpwN0AKjrqnJNRxm2zdR1nknFmCFT8=;
	h=Subject:From:To:Cc:In-Reply-To:References:Date;
	b=nPByFHL82CPZ2x/7GG/4YN9Bw5RZrD/86X0HiUJTBWFRBVxcOnripGsCIGqGbEuVT
	 NaIXE5JSbueZvPrSWDF4ll5TAhXnCh5UoKw7E1CBbteLcvEKMPtdRWfE7hva9V0ML0
	 0daQmiTKUAgFiy9NoohF1/xbaMpcT4tsrLhtpsyM=
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Post: <mailto:tools@linux.kernel.org>
List-Help: <mailto:tools+help@linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
List-Owner: <mailto:tools+owner@linux.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH] trailers: Skip testing of Documentation
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: tools@kernel.org, Konstantin Ryabitsev <konstantin@linuxfoundation.org>
In-Reply-To: <20261009143620.309848-1-krzysztof.kozlowski@oss.qualcomm.com>
References: <20261009143620.309848-1-krzysztof.kozlowski@oss.qualcomm.com>
Date: Tue, 24 Nov 2026 19:08:46 +0000
Message-Id: <179554732656.2618396.6623531746610980737.b4-review@b4>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1216;
 i=konstantin@linuxfoundation.org; h=from:subject:message-id;
 bh=5/GzlYs2rOiOuymHz3hvNZBCjUGGQ8OsxTlixdq4eiQ=;
 b=owGbwMvMwCW27YjM47CUmTmMp9WSGLJZH+yfanDy9L++CKG/vaoxabsisx93P9+4NbDEcVqWt
 23q4wVTO0pZGMS4GGTFFFnK9sVuCip86CGX3mMKM4eVCWQIAxenAEyk0pGRYYZJQEeHif68Vw+O
 e2kGv0/gnbTjQqBy10RN1vTOlC+91xgZ/t4Pjg9Zltks+ctV7eYU0QmLts+r/hS5vlTcaL7uwYc
 fmAE=
X-Developer-Key: i=konstantin@linuxfoundation.org; a=openpgp;
 fpr=DE0E66E32F1FDD0902666B96E63EDCA9329DD07E

> Documentation patches cannot be tested, at least in Linux kernel
> project, because that part of code is never executed.  Documentation
> can be build-time validated, e.g. Devicetree bindings can be checked
> with 'make dt_bindings_check, but this is not testing how Linux kernel
> understands the testing.  Just like build testing is not testing.
> Otherwise every bot should receive credits.  However people often give
> blanket tags on cover letter without understanding that it does not
> really apply.
> 
> Drop the "Tested-by" trailer for patches which have "Documentation"
> path, to avoid misleading (or fake-crediting) testing annotations.

I've looked at it multiple times and I think, in the end, I'm not going
to take it, because it:

- assumes that Documentation cannot be tested (it can, e.g. with `vale`)
- hardcodes Documentation/ (and making it configurable is too messy)
- leaves other paths untouched where we take trailers sent to the cover letter

I may revisit this idea when I start working on "apply with an agent"
feature where we leave room to specify specific caveats that the agent
should account for.

-- 
Konstantin Ryabitsev <konstantin@linuxfoundation.org>
