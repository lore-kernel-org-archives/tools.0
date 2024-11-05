Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00C801D88DC
	for <tools@linux.kernel.org>; Tue,  5 Nov 2024 23:30:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730849422; cv=none; b=Ukzszapz7wLUF1T2iHRh03E7sTi1ZU+XQfndwghRq4dNOHiuBG5auCLxPO/YFLXDH31lVQwsyyKsa7YEo27UcFNdB5Hd7SamjhpcAw8dWwL7myHLePdHBH0IwAX4OJXct9U/b2k38xm1w2cT8F2zGRjWcepF4Pb3wJBY9Txfftk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730849422; c=relaxed/simple;
	bh=upC1Uy9QsFnpwpVvGAKhh34lCpKrpaN5pGSohfRYttQ=;
	h=MIME-Version:Content-Type:From:To:Message-ID:In-Reply-To:
	 References:Subject:Date; b=lbtTY3YIMc9hpQaYlaBcyyvxOn6Ol7pD1v4pLp5yDnnyG/cOvCxvzSSNEO/HQhpcZsRsoIgkYVZsnOUhTXDtPsUmc1hV38OZsE/EehTUTK1oADjugzQJvdzd9MYIaJrLcAsZzSE/dHDa6nB//cPSskokK47x5zA+DmxW2prdQ4M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fr9/qrNS; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fr9/qrNS"
Received: by smtp.kernel.org (Postfix)
	id A667BC4CED1; Tue,  5 Nov 2024 23:30:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8929EC4CECF;
	Tue,  5 Nov 2024 23:30:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730849421;
	bh=upC1Uy9QsFnpwpVvGAKhh34lCpKrpaN5pGSohfRYttQ=;
	h=From:To:In-Reply-To:References:Subject:Date:From;
	b=fr9/qrNSwPnqvXxzqOAzx7IV1GvrCsPJ/N5Tv7WBFedCPjCl44gmp/AsKT4e+o9xW
	 XyNTEhlj2+V2VB/XoTJi6gN/2ia/Aq5sNtJ340J+2lCaUXy8C6SdSI4riEAD3++9h9
	 AxHX8EeRecqSukThx573R8Zk0wOy5TcRaaI9BZfCLpa26ADjlykU50u/SKshjqDiuQ
	 gjxv1aBvgwH7zEkd4dygILZWE2vpeSPedy9x/mSBlTJVdyTRIPMt6Jp0F8b2zJsoyl
	 YBsmoEhunB3CCTKq0mCVSygorme8zOZSXj2t1x+jYCCxTgBZ8GIVVLpkOeJ48jZ5HC
	 JLESc/L/sDu4g==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 757A93809A80;
	Tue,  5 Nov 2024 23:30:31 +0000 (UTC)
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
From: Bugspray Bot <bugbot@kernel.org>
To: tools@linux.kernel.org, ribalda@google.com, tools@kernel.org
Message-ID: <20241105-b219471-dba471a2102c@bugzilla.kernel.org>
In-Reply-To: <CANiDSCthqbGqv88O-cyPA4rioMuXU6jOZZvkUcaGGw5KH6KOaQ@mail.gmail.com>
References: <CANiDSCthqbGqv88O-cyPA4rioMuXU6jOZZvkUcaGGw5KH6KOaQ@mail.gmail.com>
Subject: Re: Bug? in b4 shazam when reading from local mailbox
X-Bugzilla-Product: Tools
X-Bugzilla-Component: Infra
X-Mailer: bugspray 0.1-dev
Date: Tue,  5 Nov 2024 23:30:31 +0000 (UTC)

Hello:

This conversation is now tracked by Kernel.org Bugzilla:
https://bugzilla.kernel.org/show_bug.cgi?id=219471

There is no need to do anything else, just keep talking.
-- 
Deet-doot-dot, I am a bot.
Kernel.org Bugzilla (bugspray 0.1-dev)

