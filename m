Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794855152;
	b=30rfzgD1sJo8sqo4TZUjl13Ha1KI66m34KxFRPbwOyh35ENNuIg4Hci/GCZAn6jHAeKi
	 azziKQPHGWwSghUvaIdKV8K31JT72y2HByhjytEhwyLzP0ykm61KjEcxutiLuDeQi4BRz
	 NaISAmBPWVBI0QZGwK1bUS6sjXqjA5J/+a4t5ufB+3kPipxjrNCrSE515ZWb1ZpvrAx0F
	 iogJDXYJBMpQO64yyH/k/gBBXVtMODRItQr0CudVTQF2vIfXKGYmZ2wbGJTKWLH20doGN
	 3fmH7BraavCGpw/wGmuZW+H19mPlmmvKaN2VQWhrwu5eDsJtF27nekAR1yXQRuzpNDg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794855152;
	h=Received:Delivered-To:Received:DKIM-Signature:From:To:Cc:In-Reply-To:
	 References:Subject:Message-Id:Date:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-Mailer:X-Developer-Signature:
	 X-Developer-Key;
	bh=JL+Ohzf/gQUPpE15fvyw2Rem+N+AMD++hajv7VKlM4s=;
	b=okI+KWRwYGPqp+ssqGeCTuL61Obzgtbu0NAzdKjn0ltPvuDVTbRsvcfA7qwlWBdwUfOt
	 53acJYNL1DUrVI504lX+5dLIiYPckLlVd3MPtX6GSgSZe97BTU0kgK+u/jPIR38EAMvAU
	 DXu3RLDWJROOqrPvhNs98knARZjkanhpRsEQB/knRkigN38w+DbiC6FJwnRKeSWalergs
	 aMTK50bSDCkNm22WyxyPLrDjWaKz3fLXBbKRFF2bg/VWqB2MEdrUoigCZgMFLyKgGJZ2r
	 0Gc7j53Oo/Dk7AGF036XP0hBPRpwu/lOPdcVEDy/NVQbY5W5hY63hj9GM32qqeZIP6Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=BeTf7lTf;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E19F2606A31C
	for <tools@linux.kernel.org>; Mon, 16 Nov 2026 18:52:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=BeTf7lTf
Received: by smtp.kernel.org (Postfix)
	id BC3731F000CF; Mon, 16 Nov 2026 18:52:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C0FEB1F000D3;
	Mon, 16 Nov 2026 18:52:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1794855151;
	bh=JL+Ohzf/gQUPpE15fvyw2Rem+N+AMD++hajv7VKlM4s=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=BeTf7lTf2wjrx1sw0lSNnZ/M64ScMI5L52FL992uYuNQ9pZ7VgmpFn3pLCA7/ZvRS
	 GHpTeAYsy9Vfl99Yf2ASkwWT0PEJ0CuKyVxyZ6P6PhmiGOCeULOAPRfjObGU5t31RQ
	 77KPCYxnbZ9VM9x4pUh3pXPk1fJcs9P/Sg9Ux08w=
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: "Kernel.org Tools" <tools@kernel.org>, 
 Brian Masney <masneyb@kernel.org>
Cc: Jerome Brunet <jbrunet@baylibre.com>
In-Reply-To: <20261014-pw-delegate-v1-0-a393ae92152a@kernel.org>
References: <20261014-pw-delegate-v1-0-a393ae92152a@kernel.org>
Subject: Re: [PATCH b4 0/4] review-tui: add support for setting the
 delegate in patchwork
Message-Id: <179485514467.730919.868224295472863805.b4-ty@b4>
Date: Mon, 16 Nov 2026 18:52:24 +0000
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
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=977;
 i=konstantin@linuxfoundation.org; h=from:subject:message-id;
 bh=Z2KGmM0HTn+DSgD3hlWJiWmJr+Lhh7bJj8ERoJAr8co=;
 b=owGbwMvMwCW27YjM47CUmTmMp9WSGLJ+B7yeYXfeisMyaOs+P+nAS4c4NhbseVJy5ZlXr2zHW
 kM/rQNhHaUsDGJcDLJiiixl+2I3BRU+9JBL7zGFmcPKBDKEgYtTACby0ZaR4a9hnESXxxRJ9nBe
 7c+RXduYtk7f+HuT+/yMghrBt7s2tTL8T/DdtSFs18KFuXs9Zb+n9i7we//j3vcLQQU3jjLOO/D
 6KTMA
X-Developer-Key: i=konstantin@linuxfoundation.org; a=openpgp;
 fpr=DE0E66E32F1FDD0902666B96E63EDCA9329DD07E


On Wed, 14 Oct 2026 20:03:37 -0400, Brian Masney wrote:
> review-tui: add support for setting the delegate in patchwork
> 
> Here's a series that adds support for setting the delegate in patchwork
> via the review-tui.

Applied, thanks!

[1/4] review-tui: show why a Patchwork update failed
      https://git.kernel.org/pub/scm/utils/b4/b4.git/commit/?id=f8dd05f102281fde48dbcc9ec4f919c64ec94817
[2/4] review-tui: let ApplyStateModal update other patch fields
      https://git.kernel.org/pub/scm/utils/b4/b4.git/commit/?id=bfb9b7ffcdafbdc680e22047127bc339a73b77a9
[3/4] review: add pw_fetch_maintainers()
      https://git.kernel.org/pub/scm/utils/b4/b4.git/commit/?id=0ddb22a5d1c70df923414c8c271068c08f0434c0
[4/4] review-tui: change the Patchwork delegate from the pw browser
      https://git.kernel.org/pub/scm/utils/b4/b4.git/commit/?id=12f7caba936e31563c15a6b20d196717e01162e0

Best regards,
-- 
Konstantin Ryabitsev <konstantin@linuxfoundation.org>

