Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BB08165F1A
	for <tools@linux.kernel.org>; Wed, 10 Jun 2026 18:17:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781115445; cv=none; b=at7bQFXNhMuS2Xw2U6T1igOgWh40jvuvJGuufDxy8ZLDcAv+pJqZ5eWURfUkNwQZJnfuEs6bldSzZjQZ3DI1o9K3805iGdGLbqt+c2HYKWsXFUFGb65/FyyZi2a3BuF8B0iGGHyQhR+Rj9CGqT4nP4RZd4G73fma868TPRQOWdY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781115445; c=relaxed/simple;
	bh=Gfv/kblQT2QKe9vxp8kvAr9p+KDPCJmykWdeKy55i2Y=;
	h=From:To:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=Vs3DhAcG65bLxLvPgIeZU1rhGPRN0E9h/9UMkNs2F+sdFZkRGXwpiSCr/dUgRVkANZZ9tTlYrpXpKJT9HvqrrVF96ajutCebukFFs/DuL0wLzBus55tGZ2bSKuOQrB8AbOwuOhXEZ8mz+EOpU1BM6rdQkjFB2yfM9MP7wPQBYQM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=NlqXByGd; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="NlqXByGd"
Received: by smtp.kernel.org (Postfix)
	id 2B79E1F00898; Wed, 10 Jun 2026 18:17:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CBBD01F00893;
	Wed, 10 Jun 2026 18:17:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1781115444;
	bh=uVFFv3FTOhuy3EP8U/bakJLkZgUm0IW9y9xkzAoPO5M=;
	h=From:To:In-Reply-To:References:Subject:Date;
	b=NlqXByGd7FWzzwD804Q9kWjZ6Nn4RMLTzsARwRVIXN9SzpthzY1JCMcIfWOCX3cBj
	 D9a38VKQz2JahPPfdEYoZ3WHNsoxG3RWK274/ft227MVRORAn9mHYGL8Z9P/MsZZka
	 zsRoASUMGMKNnQwtCK8Rau4WqNjxXaDDdJjFVfQU=
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: "Kernel.org Tools" <tools@kernel.org>, 
 Catalin Iacob <iacobcatalin@gmail.com>
In-Reply-To: <20260608-thread-track-msgid-in-only-url-v2-1-29d929e3542b@gmail.com>
References: <20260608-thread-track-msgid-in-only-url-v2-1-29d929e3542b@gmail.com>
Subject: Re: [PATCH kgl v2] Fix thread tracking not delivering new messages
 after a few days
Message-Id: <178111543930.241224.1587984357650490983.b4-ty@b4>
Date: Wed, 10 Jun 2026 18:17:19 +0000
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=353;
 i=konstantin@linuxfoundation.org; h=from:subject:message-id;
 bh=KaHA81BP08UrcNdWLoWArFzZsvx0CnZ7F2Djc0u60rY=;
 b=owGbwMvMwCW27YjM47CUmTmMp9WSGLI0Vxl3pMYrLJv7puPHsagJsrutfxVaTzUqTpD4H7+Io
 /i12AfLjlIWBjEuBlkxRZayfbGbggofesil95jCzGFlAhnCwMUpABMJ6WP4n16+yWnSrX3z4t8X
 hZ6227BBLGyz6q7T29OXhJ9exMIT2cLIcPeV5BwTlbRJsv/5xXmuXiveOnWrvmtU7/MXKTP/Tsr
 n5AUA
X-Developer-Key: i=konstantin@linuxfoundation.org; a=openpgp;
 fpr=DE0E66E32F1FDD0902666B96E63EDCA9329DD07E


On Mon, 08 Jun 2026 18:08:36 +0300, Catalin Iacob wrote:
> Fix thread tracking not delivering new messages after a few days

Applied, thanks!

[1/1] Fix thread tracking not delivering new messages after a few days
      commit: e1de2e29d9a5ba1a893d4a2271d0bdd746ba1ccd

Best regards,
-- 
Konstantin Ryabitsev <konstantin@linuxfoundation.org>

