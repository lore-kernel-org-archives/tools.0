Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F8B02777E4
	for <tools@linux.kernel.org>; Tue, 18 Nov 2025 20:39:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763498353; cv=none; b=l0auFrRGt4hBBA67gc1lUH/csHbqQxJDDYUMGgGUzGrJGvIAR+PZZWazTzS40jLzGl2JTUGUL5j9jq0FyDeolQ34CBNu4Va/9+Ip0TCG+hT8d///y5JOtREVcwcuWKB11dclJkyNI+hkSctSlo2k3D0v2SVxB+bwcQwbuZ0r4J8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763498353; c=relaxed/simple;
	bh=1D3nUFgWIrzet6OvdoMUzUEfRQbUwkXPI+hTXNCJi8A=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=pl14r2MfUUz9uYKtgS2LTvyibAsoCMsKBlcjNVEaQmgymUVIWHicOanNg0DxrW9xrFlAF5ZNLEK7InuWlDcqeojRkJ4P5mbE0n29yCnlD6fOC9P30V2mYHkjzK57m3JOJx49a3ytG+ubmqynIkVpbsMchAe0qrlKaqQ1sZr5Evc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=YDPSB9Iv; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="YDPSB9Iv"
Received: by smtp.kernel.org (Postfix)
	id 935EBC4AF0D; Tue, 18 Nov 2025 20:39:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2167CC2BCB1;
	Tue, 18 Nov 2025 20:39:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1763498352;
	bh=1D3nUFgWIrzet6OvdoMUzUEfRQbUwkXPI+hTXNCJi8A=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=YDPSB9IvdIVqZ+HF0vpywMjGX7ZoNzNS02J+FBJ1lE4alVobiteMnOuHKsK3P+lPy
	 hNqR0PN/d0/dVZwazqw4iDZhF3xhFWuyxqQDMZ0Tx70P+B8Oh/mvDoDG7XS6suVpyF
	 XGjOUY+dOnAQWMcFoMezTkCgKnOZzxzyNrntW5ME=
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: "Kernel.org Tools" <tools@kernel.org>, 
 Louis Rannou <louis.rannou@non.se.com>
Cc: pascal.eberhard@se.com, antonin.godard@bootlin.com
In-Reply-To: <20251113-sub-v1-0-921bef0da4d2@non.se.com>
References: <20251113-sub-v1-0-921bef0da4d2@non.se.com>
Subject: Re: [PATCH b4 0/2] Add support for presubject
Message-Id: <176349835193.1895132.7018551540326142170.b4-ty@linuxfoundation.org>
Date: Tue, 18 Nov 2025 15:39:11 -0500
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-a3fc8


On Thu, 13 Nov 2025 15:46:12 +0100, Louis Rannou wrote:
> This takes the unmerged work from Antonin Godard <antonin.godard@bootlin.com> and adds
> the send-receive patch to accept presubjects.
> 
> Link: https://lore.kernel.org/tools/20250627-send-presubject-v1-1-f8e11fda1543@bootlin.com/
> 
> 

Applied, thanks!

[1/2] Add support for setting a presubject
      commit: d7232f5db2e4379bd9372b00707a78ec8d36b44a
[2/2] send-receive: support for presubjects
      commit: b45f88a7242ca817bdf4e0417f5967d9fee0c0f9

Best regards,
-- 
Konstantin Ryabitsev <konstantin@linuxfoundation.org>

