Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91D803B19A9
	for <tools@linux.kernel.org>; Thu, 19 Mar 2026 13:33:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773927216; cv=none; b=bKL0DcZuLHyLJMZS5RrZ89DeSz6koPD0NnH+vMOEdNeI7tRpLCKJk+Hbz22WA0rI6T/uPFR6p3coaUpuni+CDTGLAUhOkPPYYgPgz5+iwnKV9Ps0b8F5LtwYe7+IOOACys3NmUXI8cB5EOAhUPCbtexvMM9YW3JPc6UPM/W8sK8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773927216; c=relaxed/simple;
	bh=U8tiEFGD8hzWRhiZza8CPTa4tbVmgjRwBsFUEKBk/ys=;
	h=MIME-Version:Content-Type:From:To:Message-ID:In-Reply-To:
	 References:Subject:Date; b=DUxk5x/QHpAsYrqBSddZBRqU9WCM26rEZX+ClOv6iHz/paTVItHwgyU1DQR4HoMJHdjss/ikrqUPVmkGpKrXtWVAlSpzRtYUuAtsFWgdS7oJAjyfXtn+0nGvxT9MofuFGuZdUKBz4EoxoFIguKLJ5mjl9vwZfpcTWQvCdh4DQcU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JPhKxj5U; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JPhKxj5U"
Received: by smtp.kernel.org (Postfix)
	id 47675C2BCAF; Thu, 19 Mar 2026 13:33:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 30D7AC2BC9E;
	Thu, 19 Mar 2026 13:33:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773927216;
	bh=U8tiEFGD8hzWRhiZza8CPTa4tbVmgjRwBsFUEKBk/ys=;
	h=From:To:In-Reply-To:References:Subject:Date:From;
	b=JPhKxj5UjqerGVaRuYYufplV9J7X10RTfpnMS1umfQWR8Mhc9NdFNQGpQ7BciXb7s
	 mYCtSHUzQ5lJji/kozhmEVAJHWGQCaz70tyZrv3NGyMWo2I2dFkXYnFxlIMptf+xzd
	 lVm/RfC0Z4UlQdj3ACGalWgiZK8wpNERFyMtKxGICuW/KMORk1wfb2U1DaBekrxM+b
	 1mdG82UopCxfqk4r4bJPu36qI8nnkK4IhnlxNpxSCHai2IL542HhmB7R9bpplyCNyv
	 1/DYdoWrHxy8MZMJP2K1ADiRgBTNxa0qeS0bwS3r1oKu8wtfCQgbq4CXKBrbEBgjhj
	 3+6FDq/sfvUFQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 42B20380693F;
	Thu, 19 Mar 2026 13:33:28 +0000 (UTC)
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
From: B4 Bugbot <bugbot+b4@kernel.org>
To: tools@kernel.org, broonie@kernel.org, mricon@kernel.org
Message-ID: <20260319-bcc07a98-08370e219ae4@git.kernel.org>
In-Reply-To: <64a3ea45-bb7f-4a29-bce9-2dcf44ed7e25@sirena.org.uk>
References: <64a3ea45-bb7f-4a29-bce9-2dcf44ed7e25@sirena.org.uk>
Subject: Re: Problems with b4 review update workflow
X-Git-Bug-Id: cc07a98ad6554be8888f9accb9f2bf19dcda1d94fa75207f88eb4a76c2e596bc
X-Mailer: bugspray 0.1-dev
Date: Thu, 19 Mar 2026 13:33:28 +0000 (UTC)

Hello:

This conversation is now tracked by b4 bug tracker.
There is no need to do anything else, just keep talking.

--
Deet-doot-dot, I am a bot.
b4 bug tracker (bugspray 0.1-dev)

