Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 672E227738
	for <tools@linux.kernel.org>; Tue, 24 Jun 2025 14:01:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750773663; cv=none; b=ipebRQR7ss7RNgrccO9NVdoC8IdFBB65WKcH+szxF4jyXWm9fVB+b9QHBOK+tbKKut56tZFIWSYiMHbVDoSwuu+XEu/6QmhNgZ2ic/rz5telurmYxC4HjFVyyc8qafK1esN9k30Oh8FkQCfrdtGyCAxmiT9w5HSRfOWMVK9sSno=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750773663; c=relaxed/simple;
	bh=N1l6yMywOVVBvHIguBgRQra32tL/S372OThWJjJFcyQ=;
	h=From:To:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=id8axTKut/i7urEg/Q0eLKDpqCfSa+RWwd/Huqy7vpuGwWcsKrWmwlQDzakj/wsURX/QKEKZyiTXoT0HPbBWWxlG+n8szWuAxSpKwfHET4XrY5nfahpJ8jSSJjOaDei8DxEVOAOi6VrqKy7NY5bDmxA7Ul4TWs0NDAcPGITpdgw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=xp7EAqiP; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="xp7EAqiP"
Received: by smtp.kernel.org (Postfix)
	id 157D6C4CEF0; Tue, 24 Jun 2025 14:01:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AA966C4CEE3;
	Tue, 24 Jun 2025 14:01:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1750773663;
	bh=N1l6yMywOVVBvHIguBgRQra32tL/S372OThWJjJFcyQ=;
	h=From:To:In-Reply-To:References:Subject:Date:From;
	b=xp7EAqiP0bN7Xh8KCeqyRvKMjE2wpAcyhU3XUtpk8cM5WMD5nac3LETNf/3XoWvqD
	 FOkqeAg4PXM0PJ58mGpuXhY64hENZtuxu1i6C8CEH5N9PnrPb+oT7fiaKesBcr148b
	 cgKtCuAISovfQu1+xYO2mfpQhhEDAqpgRs/WJ77Q=
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: tools@kernel.org, Lucas da Vila <dev@ldv.ar>
In-Reply-To: <20250621160732.1066586-1-dev@ldv.ar>
References: <20250621160732.1066586-1-dev@ldv.ar>
Subject: Re: [PATCH b4] docs: Corrects minimal typo
Message-Id: <175077366258.658294.16971666525760696328.b4-ty@linuxfoundation.org>
Date: Tue, 24 Jun 2025 10:01:02 -0400
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-07fe9


On Sat, 21 Jun 2025 13:07:32 -0300, Lucas da Vila wrote:
> 


Applied, thanks!

[1/1] docs: Corrects minimal typo
      commit: 07fe9d1ae9d43a48587c103e2c1db8ca35b84bcb

Best regards,
-- 
Konstantin Ryabitsev <konstantin@linuxfoundation.org>

