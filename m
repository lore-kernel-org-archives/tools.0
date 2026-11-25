Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795644830;
	b=LEO8CIUSp/Cdzyj+pmqRPnVbsFD9il2nKZk9/drbwS+Utv9M5SKB8o7ed/RoN57LT14B
	 KQonzcEITRA5VpJTQSf0ePAgjohPY7UVCZL6h80aLcXDbPUBMT/HrObpO8Rtzp2A6PY6e
	 /Nlb7buXNYlJjswiAcRznCvQB/oOCd1VIbXQFxVw2DAHauWRLa9C2zTraWnHnX1t8DdhB
	 bIFBN8pXxaEYTI9hXXvA77vrbMQI3YxYbfccggTJrFaavcz/RNb/SVb1XUR8w6Et9+req
	 RGU7AbaJnkgIzctj2JH+xUOqNR36lFBIA9Z4EpnABBv3ueo8B1YIpneD+/C62d0utbg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795644830;
	h=Received:Delivered-To:Received:DKIM-Signature:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Subject:From:To:Cc:In-Reply-To:
	 References:Date:Message-Id:X-Mailer:X-Developer-Signature:
	 X-Developer-Key;
	bh=KRUdfmZiQ/WUoWgiKkLmxCV6HDug7rHxFx4U5LQvVGQ=;
	b=WrNPQZbLEvMuglko3O9t4gKn9DCMMbj8FsCpPl6vchk+iCFohOvwc583pBbIAM0rUqV4
	 q5mPgnxpsk7hFo5LEuNByCuTdRYZDChovx+LU2i3TsGZTNZ7YD3vkh9zsXbGJMrvFNuGW
	 nxlQZXzI9SxWNiGSt9w82RQieEQhmBTZzZKM0TOkEm6f6xIcu28Um+ZZV6nQPv9vO3CWR
	 KTQTNp7VDi3vkjIYuXJ04WfeqYpp1nVNMV9/2ompbed3nVcv86+lthel/bVkbrk88iaL8
	 2CRgixFAztKOh1P+q+BCfFEKMfDVtDB1o5wQBKEFCiurTULY51YZrJ8ZZ926soyJL9g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=TJgzMEJE;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F32FB606A31E
	for <tools@linux.kernel.org>; Wed, 25 Nov 2026 22:13:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=TJgzMEJE
Received: by smtp.kernel.org (Postfix)
	id 9503E1F000C4; Wed, 25 Nov 2026 22:13:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 01A2E1F000C6;
	Wed, 25 Nov 2026 22:13:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1795644829;
	bh=KRUdfmZiQ/WUoWgiKkLmxCV6HDug7rHxFx4U5LQvVGQ=;
	h=Subject:From:To:Cc:In-Reply-To:References:Date;
	b=TJgzMEJEWbHdJagxcvFD0DiimJmbLyebWJwT7XqjFYCLLxPoxuqGltZVgHeh9GFex
	 A6XW6g9FM6G22ey6ma6P5ubZ17grZizIL3+hT5veqwWRo6me4fMYWCEpXpOA+6zRe5
	 1lcQA/6wJ5iD0OGfX/rZCyZF1i5kmbRd2yjioKo0=
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
Subject: Re: [PATCH b4 0/2] review: fix agent review so that it works
 properly with git worktrees
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: Brian Masney <masneyb@kernel.org>
Cc: "Kernel.org Tools" <tools@kernel.org>, 
 Konstantin Ryabitsev <konstantin@linuxfoundation.org>, 
 Jerome Brunet <jbrunet@baylibre.com>, Maxime Ripard <mripard@kernel.org>
In-Reply-To: <20261102-b4-review-tui-git-worktree-v1-0-35a925d92023@kernel.org>
References: <20261102-b4-review-tui-git-worktree-v1-0-35a925d92023@kernel.org>
Date: Wed, 25 Nov 2026 22:13:43 +0000
Message-Id: <179564482307.1145923.17544451581461448728.b4-review@b4>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=273;
 i=konstantin@linuxfoundation.org; h=from:subject:message-id;
 bh=Y1D5D8uJy/scf27g4Lj0T4zX52G/HI+/SkajEo1oOi0=;
 b=owGbwMvMwCW27YjM47CUmTmMp9WSGLLZY6fbC8v9Vbhs2GYmVefm6RdbOfn04oIFdhvCm/t6N
 1kfidrbUcrCIMbFICumyFK2L3ZTUOFDD7n0HlOYOaxMIEMYuDgFYCLqzxkZVv3uXDppkfDKuXH3
 ajZmHZ3gXCm58bIWf/nrv2KGi3mEjzH8lb3EfP3Czfg9cYWyxtk/W3pmJuS13TaaKMCjU9ozIdO
 MGQA=
X-Developer-Key: i=konstantin@linuxfoundation.org; a=openpgp;
 fpr=DE0E66E32F1FDD0902666B96E63EDCA9329DD07E

> Here's a minor cleanup that fixes it so that the agent review works
> properly with git worktrees.

Yes, this was overdue for a while, so thank you for sending this in.
I've applied it with minor tweaks.

-- 
Konstantin Ryabitsev <konstantin@linuxfoundation.org>
