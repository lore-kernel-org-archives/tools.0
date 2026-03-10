Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CAA0F328B56
	for <tools@linux.kernel.org>; Tue, 10 Mar 2026 13:02:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773147741; cv=none; b=tOw5zmz+AHKBo2AVe19UewpXXtagzOv+LYAC1kcY+gKD9lqMxpsbql1kF+zhP7GvpeRjuhAARysLKEUEkg+bDPsfTS7zKSFX79gyvQt5xqGiar3e+6Ty3Gshk43BXmgrioIb/atezrn2OR9eK9PZfTtc1/ANV8T7r+CEriVVsb8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773147741; c=relaxed/simple;
	bh=U8tiEFGD8hzWRhiZza8CPTa4tbVmgjRwBsFUEKBk/ys=;
	h=MIME-Version:Content-Type:From:To:Message-ID:In-Reply-To:
	 References:Subject:Date; b=Q00OMwysoQxKiA5tVS+twT9qGz6HvFWyVGiDRwzu7a+iYDNeP/5UwYEF50Ak4nNDySZkt7imhBBjQWY4054zFWkbalDHtuGl41yp6Dm7MPEHCx0FHQKTF634Ri3LbWcn07vCjPy60EHGjEQfEP7MjME1NiIK9aoG+PHfzoDz3aw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BqYZM1Sa; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BqYZM1Sa"
Received: by smtp.kernel.org (Postfix)
	id BFF3AC2BC9E; Tue, 10 Mar 2026 13:02:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AA1DCC2BC86;
	Tue, 10 Mar 2026 13:02:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773147741;
	bh=U8tiEFGD8hzWRhiZza8CPTa4tbVmgjRwBsFUEKBk/ys=;
	h=From:To:In-Reply-To:References:Subject:Date:From;
	b=BqYZM1SaXTx7BDhZcSxMQ/UsAP7HAN5zRARnd3XSCL3NK3vbHXXM9pyU256R8m6UT
	 sr+8VHvP8lysYT+mwOGAShudLq8CYBNVaA1JA0UsddK5bSGSvu1tSuTNB13oWqwFGL
	 U4sc6hgBs4nYnH2HCIyGMMcEvn3IUHdEQrZzIy72MBScKYbYmrayHUgxDfdO1iGPoY
	 HEZq2Fa0nUACY92PQpBv/2V5dOV6xzebDIwMDsQlMqwXddnBgpqA4maYsGyXeKFoMu
	 G6IYxu2VEdoj5aPrYSs8D0FjkHnXPj7DKDW490BPquhSm4dRb5FV+bSZTZTtnRSlvX
	 NdieVSVLVP0eg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id A5C953808200;
	Tue, 10 Mar 2026 13:02:19 +0000 (UTC)
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
From: B4 Bugbot <bugbot+b4@kernel.org>
To: konstantin@linuxfoundation.org, tools@kernel.org, broonie@kernel.org
Message-ID: <20260310-b38491be-60363ef0625e@git.kernel.org>
In-Reply-To: <092a612b-4fa1-4fa7-a872-b3564fcb3749@sirena.org.uk>
References: <092a612b-4fa1-4fa7-a872-b3564fcb3749@sirena.org.uk>
Subject: Re: b4 review handling when base can't be guessed
X-Git-Bug-Id: 38491be4ab034615182c75f1f9a86389c5126cdbca07726bcf8ad608ed097851
X-Mailer: bugspray 0.1-dev
Date: Tue, 10 Mar 2026 13:02:19 +0000 (UTC)

Hello:

This conversation is now tracked by b4 bug tracker.
There is no need to do anything else, just keep talking.

--
Deet-doot-dot, I am a bot.
b4 bug tracker (bugspray 0.1-dev)

