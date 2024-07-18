Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 202DD558BA
	for <tools@linux.kernel.org>; Thu, 18 Jul 2024 15:59:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721318382; cv=none; b=b2NtaHyD1q9c4qQErNTl4u61YFH0cOaHHV+OaR53QgFIcMUsrzezmXY67TQgzg2I2QrNspGAlHEaafjgBR0gBZ9AqnCP4olpn71pTQ1fQk/pIgm0CQ/+yavmvbesndwdwnAKHjch07iQ42z5UXF4FHvgmmgbfsq8Qr/p9qCloGc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721318382; c=relaxed/simple;
	bh=Cs2pwq2GyFKRM2d2coCwYzvnW3K+ga4KXTbrLWVyRKU=;
	h=From:To:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=Bh/1CHV3MHyaKx0kc08ULeqMNeRtQ5rMS8Jg/6Iu6GZj04nAhdwY+mpz/7Ntad9NIzgBqnPT6HaPMJ1h2C0ZILMg4w3t9El0ItveSjr6I1PYUKLZEq/aAstmCM6GrlQjOyczfs+o9y+Ab0Bcodu3n2YixAeIGL7Tl0kGvTMK3AI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=arR4Q4LU; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="arR4Q4LU"
Received: by smtp.kernel.org (Postfix)
	id CE087C4AF09; Thu, 18 Jul 2024 15:59:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 801C6C116B1;
	Thu, 18 Jul 2024 15:59:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1721318381;
	bh=Cs2pwq2GyFKRM2d2coCwYzvnW3K+ga4KXTbrLWVyRKU=;
	h=From:To:In-Reply-To:References:Subject:Date:From;
	b=arR4Q4LUojr9O219FeKtt40Zlnx2J5qHFcYBt6/gPP1gAJ+aloIR5i2m2aY4uqipR
	 DXOpjG681cCevdECqR6hqDLevLuTrle2xhMq3YFPVHAaQVAuNKi51f5Ab9BA33zhE4
	 +e1X38Ue5ERdcXooB17ATGgmoUlyOIQoE5KR46Y0=
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: tools@kernel.org, Junio C Hamano <gitster@pobox.com>
In-Reply-To: <xmqq34o6zrmj.fsf@gitster.g>
References: <xmqq34o6zrmj.fsf@gitster.g>
Subject: Re: [PATCH] Support "valueless truth" in configuration parsing
Message-Id: <172131838138.573106.13051154380521484210.b4-ty@linuxfoundation.org>
Date: Thu, 18 Jul 2024 11:59:41 -0400
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-d71ad


On Thu, 18 Jul 2024 07:44:52 -0700, Junio C Hamano wrote:
> With a configuration item somewhere (like ~/.gitconfig) like this:
> 
>     [sendemail]
>         suppressfrom
> 
> "b4" barfs while parsing the configuration file.
> 
> [...]

Applied, thanks!

[1/1] Support "valueless truth" in configuration parsing
      commit: d04d7f4ec48b083b7d83886b1b7e743111cc16d4

Best regards,
-- 
Konstantin Ryabitsev <konstantin@linuxfoundation.org>

