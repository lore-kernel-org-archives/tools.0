Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DDCF32C94B
	for <tools@linux.kernel.org>; Tue, 24 Feb 2026 19:53:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771962828; cv=none; b=YbUJyGXfj/ml5izPNmIMMZpqQbZEjAiTZP96bKfMe+cptwX9CD3R4R5Y5bPejujZQOxnhmdUiYlBPtiJRWXSFsG4fpb6KiIsNCo4apTYY4KT252mp5m4VpwwMO0AVrXaYQUQBxEFfx5XSpaJBDIoK7YKAHLMgSiC4pg/bkL1XHU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771962828; c=relaxed/simple;
	bh=/HZ4r7RAzlc+b6WDtJwmsR97O4ZqlAy0OzcoM8qCgN8=;
	h=From:To:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=LaeOXGq3ppxJz1ENy/HXizCAx433YitmfgEDM4Q41xh7DKoITd+0LU9FXS/k6xWakKbvoiTvQ/zzZ/jetq+zbATRf07fiF1NnKwaEbq51Pp1ZenzcQudFy4sbD1+ljiHsbiSKQyYgf1Y/SVNRX4P/UFsLYDRB31OD7oP6H3p1DU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=DOFTY2Ey; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="DOFTY2Ey"
Received: by smtp.kernel.org (Postfix)
	id 0B481C19422; Tue, 24 Feb 2026 19:53:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B8477C116D0;
	Tue, 24 Feb 2026 19:53:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1771962827;
	bh=/HZ4r7RAzlc+b6WDtJwmsR97O4ZqlAy0OzcoM8qCgN8=;
	h=From:To:In-Reply-To:References:Subject:Date:From;
	b=DOFTY2EysUN35N/dGbulNpqx7CKTxWmnPUQJ+l74zvmHjjnpDyuBISGMGIBy+X/zA
	 dT960q8hPy8oyzC4BtO1ovDyCcQTkDUquxzz4qCzoxbmJg4iLDVNjqCMgXW1HJl7B/
	 mwAtl0JutHG8DkBUGGrzXntenogYuaSUAEnOfkj8=
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: tools@kernel.org, 
 =?utf-8?q?David_Nystr=C3=B6m?= <david.nystrom@est.tech>
In-Reply-To: <20251031090840.3071473-1-david.nystrom@est.tech>
References: <20251031090840.3071473-1-david.nystrom@est.tech>
Subject: Re: [PATCH] b4: Fix offline mbox --check case
Message-Id: <177196282132.4034005.8832384272269415022.b4-ty@linuxfoundation.org>
Date: Tue, 24 Feb 2026 14:53:41 -0500
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.15-dev


On Fri, 31 Oct 2025 10:08:40 +0100, David Nyström wrote:
> b4: Fix offline mbox --check case

Applied, thanks!

[1/1] b4: Fix offline mbox --check case
      commit: c5b9ed8d8209ca478459bbcc08d2beb07f1b2997

Best regards,
-- 
KR


