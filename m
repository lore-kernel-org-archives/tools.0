Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E026234D4D6
	for <tools@linux.kernel.org>; Thu,  5 Mar 2026 23:40:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772754040; cv=none; b=Km3ey2rXsJ7e8Ih6q6c1aaue5HjIoaSkLLFQoUH3Q+7LM9R94uymDcyKsrMzBwcsOymtOQ6ZyHR9DSu7xrc1dQEqMsn3jlfDXjwdd4a1LinfujbzTGjuEEkUGo2kfse0wGR2HpckTIpLwFbBijdbZ2BHJHTwkt7pjnM0lTOSOfo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772754040; c=relaxed/simple;
	bh=U8tiEFGD8hzWRhiZza8CPTa4tbVmgjRwBsFUEKBk/ys=;
	h=MIME-Version:Content-Type:From:To:Message-ID:In-Reply-To:
	 References:Subject:Date; b=ZlqxJu8HoHyK8fVoWyI/c5d4XIxKxGBn5MQ6fi4arGajDWcyI6GuXkabySrGyhF+2ZDXC0u4JM1r9bF+Jbw0ZutX6QjgNP887M7l+razA3/GGcTqTKTNDJL3Q5kO1459+tlI5rdxBx/qrsKrkr+UoA62P/PcdoQwFZf3ywwT1QA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Gfa7zgnj; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Gfa7zgnj"
Received: by smtp.kernel.org (Postfix)
	id A4E23C2BC9E; Thu,  5 Mar 2026 23:40:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8D56AC116C6;
	Thu,  5 Mar 2026 23:40:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772754040;
	bh=U8tiEFGD8hzWRhiZza8CPTa4tbVmgjRwBsFUEKBk/ys=;
	h=From:To:In-Reply-To:References:Subject:Date:From;
	b=Gfa7zgnjZ4cmHB6ZwOrcMdXyylyoE95y9QnOnSic/HS3kTQOXsozpSDnwkvwDdpou
	 rkoZsio+hFppX+gknjRfyEtI65TnHoEf1GFiLrbSpOQteWcMdw4IPS1I1zCNzEHGzO
	 ioQW2rsE4j9b9S6uKAmOihrcTKRfQIYWc6I/fXb1BIXp9Z375unqJBj4fjzaxVZU5l
	 Ppo1sOqoXEaDwB4ABmNrqOHh4pW1OCWkoooAuuEcWHH/A6KgAUPBNHRtQ2xoOVignA
	 Gdjhf/bN91FcjI3P3+IfI3b/rCDA64nOFdrEtKeywCKVsQLIvwmH2zh8q3aS/f7bA2
	 dLyUTdyU2zkUw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 7FD1F3808200;
	Thu,  5 Mar 2026 23:40:41 +0000 (UTC)
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
From: B4 Bugbot <bugbot+b4@kernel.org>
To: tools@kernel.org, konstantin@linuxfoundation.org, bugbot+b4@kernel.org, 
 broonie@kernel.org
Message-ID: <20260305-b0eaec40940b268751f7e69161014d648e8242693df2e65b8ccc00a6e991eaf92-bc264a0a2715@git.kernel.org>
In-Reply-To: <aa4a44c9-7fee-4dd3-aafe-dca46c7038d0@sirena.org.uk>
References: <aa4a44c9-7fee-4dd3-aafe-dca46c7038d0@sirena.org.uk>
Subject: Re: b4 dig not finding commits due to alternate sender emails
X-Git-Bug-Id: 0eaec40940b268751f7e69161014d648e8242693df2e65b8ccc00a6e991eaf92
X-Mailer: bugspray 0.1-dev
Date: Thu,  5 Mar 2026 23:40:41 +0000 (UTC)

Hello:

This conversation is now tracked by b4 bug tracker.
There is no need to do anything else, just keep talking.

--
Deet-doot-dot, I am a bot.
b4 bug tracker (bugspray 0.1-dev)

