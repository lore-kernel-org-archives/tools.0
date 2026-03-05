Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4809831F989
	for <tools@linux.kernel.org>; Thu,  5 Mar 2026 23:47:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772754421; cv=none; b=ulFBAOLvIQJBpUpy8/weKEwDDiri9av0hhxZYjCcFpXGx8Bcg9mGCZGGpjr941Q9XIj/yPrBWwLf3THQ/f8CV3Pd7n6GFzm9D5o22OqBKYBL0+KbVY1hH1qTHWDZliKFJ47iQ1s4wRgaCcxGvMwuCW6r0eMlxGgYUgSYHxLZNFw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772754421; c=relaxed/simple;
	bh=U8tiEFGD8hzWRhiZza8CPTa4tbVmgjRwBsFUEKBk/ys=;
	h=MIME-Version:Content-Type:From:To:Message-ID:In-Reply-To:
	 References:Subject:Date; b=Y6oWuYmvkBBbBpOTpxUb/hyt+Hh36MbqX1oBzi3jKeQh+ilK7NdjYG2wPThmjEumkEatfo0EDLlhTzHJ0fnWHK9NvrEPdV2JAyypgSo6jXD1VwSyaBcPrx33muC/DH0Uq/w7K056ANj2xR27PSIQwn96wbC0zmcosvUHjDso3e8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bpgR8Fwo; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bpgR8Fwo"
Received: by smtp.kernel.org (Postfix)
	id E69D7C4AF09; Thu,  5 Mar 2026 23:47:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CCC84C116C6;
	Thu,  5 Mar 2026 23:47:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772754420;
	bh=U8tiEFGD8hzWRhiZza8CPTa4tbVmgjRwBsFUEKBk/ys=;
	h=From:To:In-Reply-To:References:Subject:Date:From;
	b=bpgR8Fwo9ZehVCjCvWsRaUjTyf6GRyY6olMqxArqk+LYomU3RvTskaXyqcpIYxdPw
	 2NtJfM4kX1Bc/SH/DbT8JqegsXSbTKywSfxA97F22xhWStCBXnH+GW6AyxybRZtEtW
	 jTk86wbusMwDOXXnibNCn7CS12CVxb3MLf9//gxlys4rtCY+abvrJwzl6nLwGWEnEF
	 xSj6r9qy3lwlDW+5AhVIilTpn9sA+BWeiEkKQmHuVZNse5L+NcxrBf9LUke1H9Wq57
	 H4FRQ9dk4uK+SqwNitDMTMfqSZXEvtGp6tqGSPP95SoqFxqKsTW3SwGB9+ZOoSICwo
	 oRBmXkW2re6CA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id BCE593808200;
	Thu,  5 Mar 2026 23:47:01 +0000 (UTC)
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
From: B4 Bugbot <bugbot+b4@kernel.org>
To: bugbot+b4@kernel.org, tools@kernel.org, broonie@kernel.org, 
 konstantin@linuxfoundation.org
Message-ID: <20260305-bf5d2561c5b98ee8687c0d85c84a23cbbdeca0fc3bef14dc8e6eec6fa278c6955-2261d4bc1785@git.kernel.org>
In-Reply-To: <aa4a44c9-7fee-4dd3-aafe-dca46c7038d0@sirena.org.uk>
References: <aa4a44c9-7fee-4dd3-aafe-dca46c7038d0@sirena.org.uk>
Subject: Re: b4 dig not finding commits due to alternate sender emails
X-Git-Bug-Id: f5d2561c5b98ee8687c0d85c84a23cbbdeca0fc3bef14dc8e6eec6fa278c6955
X-Mailer: bugspray 0.1-dev
Date: Thu,  5 Mar 2026 23:47:01 +0000 (UTC)

Hello:

This conversation is now tracked by b4 bug tracker.
There is no need to do anything else, just keep talking.

--
Deet-doot-dot, I am a bot.
b4 bug tracker (bugspray 0.1-dev)

