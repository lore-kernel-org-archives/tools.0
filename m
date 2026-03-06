Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D47B11F4615;
	Fri,  6 Mar 2026 21:18:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772831904; cv=none; b=Xq/ZU1Qy38Jb+A8IUGMPD4Odb+AZQckNWwhdbTwrPHy2eZ8E6lmtklSgchzmFz06nEyszAzB4ayYRWjthlcIFKm8+bTVz8Ik+yIdTPRwuzmi13jb5Wu6UV7gKdFMLrO/aN0G9ROFfxHOnc3UQw1gbv6SkCNKxC0jqsttpWI8TbY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772831904; c=relaxed/simple;
	bh=U8tiEFGD8hzWRhiZza8CPTa4tbVmgjRwBsFUEKBk/ys=;
	h=MIME-Version:Content-Type:From:To:Message-ID:In-Reply-To:
	 References:Subject:Date; b=cWMWsSqoE5enHZ/07ajN6wiHFGCQSHotggzYHUa+gSihbHPCtdz6Uo/Fvat8tW9f7ttFMW4sBXdjCnLBVqBERaZ0tFsdSqf5/jc8Y+sSCLSRQldsGRseQfHq8dk0wKHD2N6QkHkQaM+aomoQLq+x43F3M/cX7ZwsfKq1UHgm8sg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Ibwbg8IB; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Ibwbg8IB"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A68E4C4CEF7;
	Fri,  6 Mar 2026 21:18:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772831904;
	bh=U8tiEFGD8hzWRhiZza8CPTa4tbVmgjRwBsFUEKBk/ys=;
	h=From:To:In-Reply-To:References:Subject:Date:From;
	b=Ibwbg8IBs8ZDTkn78RxUVSbCvW/35F9GzpTilX59nUqbUvm8qoIjnv2+FzwBQzE/T
	 vY5n0/i0xFpyucuK9uowQEDvznWKM4KfA64XW5HeanHoWTsyFOjwWGJab/wyz8q6gG
	 OkHlS0KuEvO2mMWlKYioudpdEEagI7SsOkMcS86RNmLEU0beIHCg+u3ntl23pA/0VU
	 zv+v8pZlhWMJqQgaZ5KaRKB6D9CemV1TaxpmbIkglV94gp9orqn+JLZxZnprQgGrEL
	 /6AZiKGz5XnGqSDpAh1Y8FocgCBhiujudcOEpPZdUzgmsV6/o8WUOyAWyPHIR3i+Jt
	 QqS6K6JF9SwcA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 05BCD3808200;
	Fri,  6 Mar 2026 21:18:25 +0000 (UTC)
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
From: B4 Bugbot <bugbot+b4@kernel.org>
To: toke@redhat.com, tools@linux.kernel.org, users@linux.kernel.org, 
 konstantin@linuxfoundation.org
Message-ID: <20260306-b73df66c-8cf3b3011c08@git.kernel.org>
In-Reply-To: <87ttdkrylx.fsf@toke.dk>
References: <87ttdkrylx.fsf@toke.dk>
Subject: Re: b4 feature request: run command before rewriting history
X-Git-Bug-Id: 73df66c98d8604ebb266e80cb6226df2a251802d645579214b7128deb548ccf7
X-Mailer: bugspray 0.1-dev
Date: Fri,  6 Mar 2026 21:18:25 +0000 (UTC)

Hello:

This conversation is now tracked by b4 bug tracker.
There is no need to do anything else, just keep talking.

--
Deet-doot-dot, I am a bot.
b4 bug tracker (bugspray 0.1-dev)

