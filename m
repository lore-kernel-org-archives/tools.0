Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BF4A33993
	for <tools@linux.kernel.org>; Mon, 23 Mar 2026 19:02:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774292535; cv=none; b=t5LiVhkmrvPQGFe9rtlovi2NBvI9vk16cJyzidkAwFOyG+6Ew2g383TeUzf7M9XKuNeVdvBpEKSoqqg1Zyia2SvqWinni71LgvRyYak5fpYpiOPutb6/KbrF5Vjl0mfzZVFf3R43ZyHRKDSXnYSAYFKeg+VL2uFZ+WlOt8kQH10=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774292535; c=relaxed/simple;
	bh=U8tiEFGD8hzWRhiZza8CPTa4tbVmgjRwBsFUEKBk/ys=;
	h=MIME-Version:Content-Type:From:To:Message-ID:In-Reply-To:
	 References:Subject:Date; b=UnkiYmbW00kNCkcC6Dgzh9Xlj0hDc8fO9gyv0rofIMmBm6ycT28+xfiBLzAzGMeZrO3yvZevL+5Dqi04D/PUFi/oiDImuxuv3AqZPWlPtPGhTqm+VeODDV2810MV+EQZHHSxR18X+JZct9SoT3w/1p4VpA7jm3nl5KUkh8z3QFc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=koYiWm1E; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="koYiWm1E"
Received: by smtp.kernel.org (Postfix)
	id 4ECB8C2BC87; Mon, 23 Mar 2026 19:02:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 38EFEC4CEF7;
	Mon, 23 Mar 2026 19:02:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774292535;
	bh=U8tiEFGD8hzWRhiZza8CPTa4tbVmgjRwBsFUEKBk/ys=;
	h=From:To:In-Reply-To:References:Subject:Date:From;
	b=koYiWm1EAP28FsKn3BoS0e5U3ie1Fx972smD9I74hpsjuJTK+oZD5RnEu2BygAseq
	 N47DZWLgN06x3yC4K7E/5u4G0sBZqopnT8zsxLIsCfQEXYta9ABNhJ4qLaOQZURngG
	 vXmHe3NYh4okbPz9axQmATHq0yaCc+byp0hMgWzua0lsJT5wmOjgBVBscrp4jh+dpz
	 igtG50/eqJbDFl0G8f0TSVYVwKDk5zttJZux/XWJNU0tnqeCGNQ5UdwcE9JADvz7eQ
	 Tt2qryc2qbWczd9XAen5ymrsx3aVkMNXsJBkm52Bd2yX4avD8qSHQGRcEKawGJiswS
	 Y3yWvQ6hafWAw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id BCD6E3808200;
	Mon, 23 Mar 2026 19:02:04 +0000 (UTC)
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
From: B4 Bugbot <bugbot+b4@kernel.org>
To: konstantin@linuxfoundation.org, broonie@kernel.org, tools@kernel.org
Message-ID: <20260323-b4958fdf-674df256deee@git.kernel.org>
In-Reply-To: <8637ff61-4eca-42ac-96fb-d530498b3f82@sirena.org.uk>
References: <8637ff61-4eca-42ac-96fb-d530498b3f82@sirena.org.uk>
Subject: Re: Stitching together serieses
X-Git-Bug-Id: 4958fdf4ef6259630525d09cd46f999c7f1fad416aa0c25819516efd8c89d691
X-Mailer: bugspray 0.1-dev
Date: Mon, 23 Mar 2026 19:02:04 +0000 (UTC)

Hello:

This conversation is now tracked by b4 bug tracker.
There is no need to do anything else, just keep talking.

--
Deet-doot-dot, I am a bot.
b4 bug tracker (bugspray 0.1-dev)

