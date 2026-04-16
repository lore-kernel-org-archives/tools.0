Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA02E39C017
	for <tools@linux.kernel.org>; Thu, 16 Apr 2026 19:26:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776367576; cv=none; b=g8iL3QEp55HLmpLFh132oXGn7KDkmbUIYct1ew/SaZQqGnXb00SNKdlwwWA6yGd7/ay/VZTenZnmbY3u6i/Yqzl8TD6LlLWte5Zvj5EB0HTF8oQDqlf3AhbOn3n4kn2rh3YBiAVYZ6I+ghVRGNZmsFzeakrCEsrp19c7argKyRM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776367576; c=relaxed/simple;
	bh=2EWkSJBJKWxdTa7Nf8BM4kmfStmT7t2ZzLOVsLb0Wkw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WYDKYYVI/fd32+BHprot9s2shHiS+vxDYUJ9prnT4gcCKHLKKq5IoHegh1U+ysY1VqkaFXfkKOxQi2cX8k6avgjxNrS+bkFBE3Twxi58rf7itZOZ2uOtgF1+taKXzf5r0MmuNdCh5S+qMSEw/Ag8ZwoctD69xIzNKAolKVadXeM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=hzU51P1B; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="hzU51P1B"
Received: by smtp.kernel.org (Postfix)
	id 27235C2BCB4; Thu, 16 Apr 2026 19:26:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E9F57C2BCAF;
	Thu, 16 Apr 2026 19:26:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1776367576;
	bh=2EWkSJBJKWxdTa7Nf8BM4kmfStmT7t2ZzLOVsLb0Wkw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=hzU51P1Biw/GmClbKiEEKaX3eUq14M5FOAc3uKAWSat8fPRLkNiVviJdxOtuqUypq
	 kUut1nX+lXl2yx0/ETgC9+774OnJmu+qFHyPvoVeYcxjYP+MoDkiZ8W4W4jT5c1FFC
	 AMrO9VzcSU5em+Vr6gR0CN36/LWPfmAwvHjFWxZ8=
Date: Thu, 16 Apr 2026 15:26:15 -0400
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: Mike Rapoport <rppt@kernel.org>
Cc: Dan Rue <danrue@gmail.com>, tools@kernel.org
Subject: Re: [PATCH] add sashiko URLs
Message-ID: <20260416-amorphous-dalmatian-of-refinement-adbdf4@meerkat>
References: <20260416112156.1059032-1-rppt@kernel.org>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260416112156.1059032-1-rppt@kernel.org>

On Thu, Apr 16, 2026 at 02:21:56PM +0300, Mike Rapoport wrote:
> sashiko is gaining traction and it's easy to add its URLs along with
> lore ones.

OK, but FWIW, lorifier lives here -- it's not one of LF tools.

    https://github.com/danrue/lorifier

-K
