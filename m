Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABFDF3B388C
	for <tools@linux.kernel.org>; Tue, 21 Jul 2026 20:34:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784666049; cv=none; b=JK4TjS+/QXHZciBqD1k5iTSzQmGhkh+spXs4MoL7W1XTIWZtZ+SkeEC565Ms1SO0/ziWHVueAJ7iDKSEqwWmnB0BUS0WqGL4Mc5iexIYv4G/Ys8MznS//ctOPuJsX2F6iiY8R9EA46OOnGndBK/aqzL46/OrWeHIBMMMs5zJCqU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784666049; c=relaxed/simple;
	bh=hwB/iU1lOB7uhz3kt+Lfqnkp29wv0yByg/+80SXdouo=;
	h=From:To:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=TBFMYb65h01xjj+oHVIYoZNBv2JBltEtQ/9LNoNykC/62rytILykcJ+/mOidJ7vHwbEXtcAQOeX5phCx6uUD24iebakQNdoYSs4bUDHity9/wc8U+hZ2zSMPQiFpYKc6eSrpK91u5J9vU6tAj2GeS8twxr7KXJR4Gnk1RLi8Jj0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=vVNd5dVR; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="vVNd5dVR"
Received: by smtp.kernel.org (Postfix)
	id ADB501F00A3D; Tue, 21 Jul 2026 20:34:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 69FF11F00A3A;
	Tue, 21 Jul 2026 20:34:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1784666046;
	bh=Ga9CglEUDz4jxQF6/c9XJjfqCgECdrj5C8uEQ9uEoBE=;
	h=From:To:In-Reply-To:References:Subject:Date;
	b=vVNd5dVR/JkisVcfzRddZRRQC1gCO+o3DBPqRclOgcropw4+OrYFcmov8NaPOfLHQ
	 XDMSAowhbW7sgjUMSRHUawJYqYHbE3FyLVfxAz1WP38yxd7UQzCBuk/yXiGMdUe6ua
	 /2l2r12zcEd9RkFUBNOASYU01aIIzLGBrtCx8XOg=
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: "Kernel.org Tools" <tools@kernel.org>, 
 =?utf-8?q?Cl=C3=A9ment_Le_Goffic?= <clegoffic@baylibre.com>
In-Reply-To: <20260710-b4-config-pre-flight-checks-v1-1-ab16cf14a00c@baylibre.com>
References: <20260710-b4-config-pre-flight-checks-v1-1-ab16cf14a00c@baylibre.com>
Subject: Re: [PATCH b4] config: accept prep-pre-flight-checks from
 .b4-config
Message-Id: <178466604254.2052859.815718073075479039.b4-ty@b4>
Date: Tue, 21 Jul 2026 20:34:02 +0000
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=336;
 i=konstantin@linuxfoundation.org; h=from:subject:message-id;
 bh=LN1XEaaXRc0G9c2Qsz04aVK6cz51N+++7jB6PuvDOv8=;
 b=owGbwMvMwCW27YjM47CUmTmMp9WSGLLir+89/6mEx+BH5frC5E9ZLZk+6Ywi/FkP/zSphap/d
 nlrUn65o5SFQYyLQVZMkaVsX+ymoMKHHnLpPaYwc1iZQIYwcHEKwEQ0njAynFEpOh2/5crMzfHv
 F82+ILerd+GDnHdneKMOR8wy4N/9KpPhf9I3l5WV7rH2bbPCkpus1eJtV6nMUWq4GnXSdXfUXa5
 kTgA=
X-Developer-Key: i=konstantin@linuxfoundation.org; a=openpgp;
 fpr=DE0E66E32F1FDD0902666B96E63EDCA9329DD07E


On Fri, 10 Jul 2026 17:14:06 +0200, Clément Le Goffic wrote:
> config: accept prep-pre-flight-checks from .b4-config

Applied, thanks!

[1/1] config: accept prep-pre-flight-checks from .b4-config
      commit: 26f1fa88389fb4e7d3a3d97980e0bc64c24ebb3c

Best regards,
-- 
Konstantin Ryabitsev <konstantin@linuxfoundation.org>

