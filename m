Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B2F5430CD3
	for <tools@linux.kernel.org>; Tue, 11 Aug 2026 23:29:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786490947; cv=none; b=X+LhNDctMOlCBs3b/gPKbYTGpnHKCNe5VGIg2UZwZbjmbwZZBhiFTCr03J35agXE94yIkG+kX+JTMRoObpBWq0Utl2bBogJqOyWfJYaTMIF1qeQNhBjm6klfyIupA18vYgZ/r+fpRe/nLNoyxpfpAGOOr48TW2uGYY1k0hsJ9ug=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786490947; c=relaxed/simple;
	bh=qLpw+csSjmUfRSXh0btJhhYam/Egc79s88fA9oADXTM=;
	h=From:To:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=Y2CCvLxdLn6SRrh3ImNgGBf8HwlhV8KyDP9R6RbyaXaDhY+mOH7CxOrfVC1GcKVUNZFaYGwEhYwnrBsxYhaSg96uo2iE/huulfWif+ZLHQgq1zG4um3J2NKVhcG9fUHYu6nHnTbPK1ceLccf9rfhrsm4YYB/KdQAq4wqWp/o0Jc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=OIFK2aXx; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="OIFK2aXx"
Received: by smtp.kernel.org (Postfix)
	id F3A8C1F00A3A; Tue, 11 Aug 2026 23:29:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AECC11F000E9;
	Tue, 11 Aug 2026 23:29:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1786490945;
	bh=9D4yHf4SNlBVOZDPBT2rwBtfdo2MvfGqtoHl7hZPkEg=;
	h=From:To:In-Reply-To:References:Subject:Date;
	b=OIFK2aXxyof2BbESrqViQNMOwy3lhr5IKouiGRH/qUywdNTu9V4UKFuWNK3WxbXW5
	 9jFNJUpv36uWNKKhCk3DqyAkCAegE/s+T46gIuoVX2r90mkWv4vtmTuTiUodlqkBnj
	 GYVR3+RjJP+R43bEktUxQVibpRue3xsveHeulhlY=
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: tools@kernel.org, Jason Gunthorpe <jgg@nvidia.com>
In-Reply-To: <0-v1-fa59fc5072f8+1cf9c-argcomplete_jgg@nvidia.com>
References: <0-v1-fa59fc5072f8+1cf9c-argcomplete_jgg@nvidia.com>
Subject: Re: [PATCH b4] Support python argcomplete
Message-Id: <178649089889.9692.12784108932720626823.b4-ty@b4>
Date: Tue, 11 Aug 2026 23:28:18 +0000
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=356;
 i=konstantin@linuxfoundation.org; h=from:subject:message-id;
 bh=LGnzlVxvD8cRj5iYDYnfHUmBrImZw7f1MvZo8naOQdE=;
 b=owGbwMvMwCW27YjM47CUmTmMp9WSGLKqNzhsjMxLkPnEs+KMyflZfQsmry1jm6mguq5WNvnny
 YvFzlUPO0pZGMS4GGTFFFnK9sVuCip86CGX3mMKM4eVCWQIAxenAEzk/wmG/2EPvMrrFoXF3w/x
 6ua4GbKXP+XIgS0/ztmWyC69YqtpeILhf6LQz8zvRxVXVZed9VCJv+Q6ozAjffPsKcfPVwc8eL7
 gMwsA
X-Developer-Key: i=konstantin@linuxfoundation.org; a=openpgp;
 fpr=DE0E66E32F1FDD0902666B96E63EDCA9329DD07E


On Fri, 07 Aug 2026 20:17:32 -0300, Jason Gunthorpe wrote:
> Support python argcomplete

I've applied it, but note that this immediately fails ci.sh. I'll fix it 
up as a follow-up.

[1/1] Support python argcomplete
      commit: f6b44c86c5c7b26f0979fe56ad76c40df11b9ccb

Best regards,
-- 
Konstantin Ryabitsev <konstantin@linuxfoundation.org>

