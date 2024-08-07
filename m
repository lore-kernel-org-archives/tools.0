Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E52E2A1BF
	for <tools@linux.kernel.org>; Wed,  7 Aug 2024 14:23:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723040615; cv=none; b=AClopx65J3oHpVSuVu6chKqFu0D82Kw+bV3qlbVmNlu4+J6UPEQmvxUHsraQ6o/h8lEzFBsh543+IBAV2vh9GjiL/pcOlJ1BzWkVvaPPe758CxjQ7dOtZzPgmPMDNetHzcaOOXX8fmUATm3I7aQfiTLvMIb+a//jHKQqG2zDPTQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723040615; c=relaxed/simple;
	bh=bAzP5+iq8Juk1k3aogG/UiCrLOW7y+v4in07aOZcBcc=;
	h=MIME-Version:Content-Type:From:To:Message-ID:In-Reply-To:
	 References:Subject:Date; b=UsKqPXbVttLPdFlxjQxCqWEgDcM7V0s1Anx96fEwMD/JW+0IUp/V+38ej/ymS2J/tHhj06xSTzsxKD9AFoVtYW2k3RJ0p7ZUSfECFvl7TR6XN42TXSgDQ7Xe4TW578MFlTNy9aFVC7Drn0YV/DYD5LiZ3Pfkv6FmrV8kHdMpfcQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jimfo0Ea; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jimfo0Ea"
Received: by smtp.kernel.org (Postfix)
	id 362B6C4AF0B; Wed,  7 Aug 2024 14:23:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 133D8C32781;
	Wed,  7 Aug 2024 14:23:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1723040615;
	bh=bAzP5+iq8Juk1k3aogG/UiCrLOW7y+v4in07aOZcBcc=;
	h=From:To:In-Reply-To:References:Subject:Date:From;
	b=jimfo0Eakcxi1z8kqY15P3VLH8yqDJW0f/D6xEDybEsb5OhocGyme8HJOuEGGjt6/
	 7Ql0fwzAlBN1QYl0O2DtypYqJWl8V+kW+3+joQnPRNTpLMU+s/hMGBvx96b6zyo6UX
	 IrNZK58TS7OxjZxuve9W24TF9H0QjhS14sT772QFVnMaTQd2m9i6L/6wuLjER7BVBl
	 3lxwNqLHxd9+ZpGoBhlRImP1tPJN+zw0xrrZrHM2Weyd6m9gnNcATzXhXsrwJu+uhT
	 +ZEnHvWiifapIkN/wNFmaMAsevK03BGAHcONOyftCf59g8Jk+hz+eCel9RrtQpacqT
	 vaP6XKZ4p5DHg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id F06F4381093C;
	Wed,  7 Aug 2024 14:23:34 +0000 (UTC)
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
From: "Kernel.org Bugbot" <bugbot@kernel.org>
To: tools@kernel.org, khilman@baylibre.com
Message-ID: <20240807-b219138-9e83941abd29@bugzilla.kernel.org>
In-Reply-To: <7hh6by34mx.fsf@baylibre.com>
References: <7hh6by34mx.fsf@baylibre.com>
Subject: Re: b4: message-id from deps added to cc list?
X-Bugzilla-Product: Tools
X-Bugzilla-Component: Infra
X-Mailer: bugspray 0.1-dev
Date: Wed,  7 Aug 2024 14:23:34 +0000 (UTC)

Hello:

This conversation is now tracked by Kernel.org Bugzilla:
https://bugzilla.kernel.org/show_bug.cgi?id=219138

There is no need to do anything else, just keep talking.
-- 
Deet-doot-dot, I am a bot.
Kernel.org Bugzilla (bugspray 0.1-dev)

