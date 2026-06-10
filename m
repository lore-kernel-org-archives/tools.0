Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B42F336885
	for <tools@linux.kernel.org>; Wed, 10 Jun 2026 01:51:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781056265; cv=none; b=KZzRd05Ysfkml1FQYYh4ozQ4daHKecl9OWaGPY9BXINE6sS6y0dG9D2YT394CkGLRUEuQOwU0EmutfAcGfbmS3nPUuyLQIKANJbBVc6LawPgA4ga8imhci60qKskYpojPqjjwTSGzN1OLtWAw9W6/4+r/iexT/8FTeuhlTKm43E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781056265; c=relaxed/simple;
	bh=3gU3NMPo8KEUcr1LPTYp+wwB2bHwt39pYEQ2YRKfgMY=;
	h=From:To:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=hIR1hV+YNLotiMyPaGS0lbjZw5q8BEpHMsfhF07tue/fmh1u5Vs5cRW8MWInd3fFyWg/5PzHJSTOw6m6JsOHOaT86URhvV6BIutaYmxJPMXJ4NtMHahWyeVLOmhQp47v+7vZTKDihKpOfA9kgbmgYxoIJmoEv3YAyEfPhhyiU+o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=j04CjWDO; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="j04CjWDO"
Received: by smtp.kernel.org (Postfix)
	id E676E1F00898; Wed, 10 Jun 2026 01:51:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A0E3B1F00893;
	Wed, 10 Jun 2026 01:51:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1781056262;
	bh=kcfVagyp8Zri2mqFy2+0hzlj9Vc1uCUw01JFQbE40R8=;
	h=From:To:In-Reply-To:References:Subject:Date;
	b=j04CjWDOKlFNZsrvN0/GraLMf7BDphz32lTW6MhITOa3K87U5myNikn7hq98n1VNR
	 2QyKzFggPOoyrVQg2b3AbUydYKquuP2at0XTxv5taP1qPY8ND8KcOyRBfgexgu9dIT
	 Fu+QMUzX4NYYI2zzVT45/3LV9hjSus1kCtZhFVHw=
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: "Kernel.org Tools" <tools@kernel.org>, 
 "Matthieu Baerts (NGI0)" <matttbe@kernel.org>
In-Reply-To: <20260428-sashiko-patchset-api-v1-0-24d4ac34b4ae@kernel.org>
References: <20260428-sashiko-patchset-api-v1-0-24d4ac34b4ae@kernel.org>
Subject: Re: [PATCH b4 0/3] review: avoid downloading logs and fix URLs
Message-Id: <178105625588.169838.7317918514653839888.b4-ty@b4>
Date: Wed, 10 Jun 2026 01:50:55 +0000
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=693;
 i=konstantin@linuxfoundation.org; h=from:subject:message-id;
 bh=NVWdMfiAsdaZAcxsBLxi0FF0SppiCbI1CH8Y0+RYOv4=;
 b=owGbwMvMwCW27YjM47CUmTmMp9WSGLI0DrO63tgiyVXm81Ytnu2C9Dvubw9SD9aq3jXQOXGxR
 KeDd75PRykLgxgXg6yYIkvZvthNQYUPPeTSe0xh5rAygQxh4OIUgIm8TWRkOLXmb2eM1NKjGvua
 gg4kGyxbYWexLqH0v839Ltv2qns6Nxj+KbRN/3VohrHbipTdH9JSGUou9yp6Ty47u+HbnUuJDxO
 NWQE=
X-Developer-Key: i=konstantin@linuxfoundation.org; a=openpgp;
 fpr=DE0E66E32F1FDD0902666B96E63EDCA9329DD07E


On Tue, 28 Apr 2026 11:29:13 +0200, Matthieu Baerts (NGI0) wrote:
> review: avoid downloading logs and fix URLs
> 
> The build-in Sashiko and Patchwork support is nice!
> 
> Here are just some small fixes:
> 
> - Patch 1: avoid downloading the review logs that are not used.
> 
> [...]

Applied, thanks!

[1/3] review: sashiko: switch to patchset endpoint
      commit: 0073094fee274bf2403cae4043d4f269056501e8
[2/3] review: sashiko: fix URLs
      commit: c45bf35c4908b8e133b34597a23f1b0b94be1124
[3/3] review: patchwork: use the target URL
      commit: af6d8bb4e4ba9fafc9b0b3efe1b0e605d939b606

Best regards,
-- 
Konstantin Ryabitsev <konstantin@linuxfoundation.org>

