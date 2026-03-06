Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86B011339A4
	for <tools@linux.kernel.org>; Fri,  6 Mar 2026 19:45:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772826353; cv=none; b=f31ulxXmyGHoRZuc6YCysfQwpia9b9roE4EwtudMRwuVjn9m12CrD4xvGQ8HgDKNNOM25iFxxCJxXVdT1k7ozDuzbbQ0BaTfhcuaXyqkF6roPWZMG0MlSE0M5V0Wxn954Ka1QTWUxeYbKuopZVdQ2cEmzTsVlxsUsI+qQARYyDk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772826353; c=relaxed/simple;
	bh=KH2PESJRR7+DwIjysEXHjfgB3waaRJHTpavADEfN0U0=;
	h=MIME-Version:Content-Type:From:To:Message-ID:In-Reply-To:
	 References:Subject:Date; b=eKtaC+e9a8ZUpCKiQ28taRTVDIKexPLAbgar3NZasBE5VdBTSj/RwxNd2TzADYujLwDbo42bhpbyUFzvIoUdP728eAh2U4U4wJjOW6uCWtzcGuzU46gL3eNlTNS28YjqJ+7GSQk2oKBeDe2cvNco5BYTg8drJmCUscuIBla3aQ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=AP0yAxQh; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="AP0yAxQh"
Received: by smtp.kernel.org (Postfix)
	id 74B81C2BC86; Fri,  6 Mar 2026 19:45:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5A672C4CEF7;
	Fri,  6 Mar 2026 19:45:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772826353;
	bh=KH2PESJRR7+DwIjysEXHjfgB3waaRJHTpavADEfN0U0=;
	h=From:To:In-Reply-To:References:Subject:Date:From;
	b=AP0yAxQhN1a6bjOxCLoU7VsRflKmLeLeT4/SVVJdwuDDMB7S1e4rVLryHI38gX8ou
	 fQGzkVdJcvgcCLVOoe1tO3d8hcWgmWzbWMpokn5x3v9ePcU98eHTN9aI44HRIEUiWR
	 NVM45lTWpe9LoC9bJHlaLK4leF5T/GHJtmHXniXqkshw2oAO8u07mTe8ztcPfIG68P
	 CTKJkRAh3S36q1QT0tmqklR+X8LXU/T5hoZQV3/rPz54BWmD0KDrnaJYVAc4umEcN+
	 FzRVnVq4qseLMXPQszPdMplBjOh+OFv+GAf0zNPhXXmbUICYm0mVbV9CCE/FG6sOjm
	 S8tIQRFZiZaHg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id BCCEB3808200;
	Fri,  6 Mar 2026 19:45:53 +0000 (UTC)
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
From: B4 Bugbot <bugbot+b4@kernel.org>
To: miguel.ojeda.sandonis@gmail.com, tools@kernel.org, 
 konstantin@linuxfoundation.org
Message-ID: <20260306-b9453f65c3-652300b26533@git.kernel.org>
In-Reply-To: <CANiq72nLuYfoVnWGjmEmUJDKSpFJq9wUXfTND1e3cjwhe0KFFQ@mail.gmail.com>
References: <CANiq72nLuYfoVnWGjmEmUJDKSpFJq9wUXfTND1e3cjwhe0KFFQ@mail.gmail.com>
Subject: Re: `b4` drops added trailers with peculiar patch
X-Git-Bug-Id: 9453f6585824edbe1eb5a14fb2fc9f9ec2bbba7f6610a110b001176a17815709
X-Mailer: bugspray 0.1-dev
Date: Fri,  6 Mar 2026 19:45:53 +0000 (UTC)

Konstantin Ryabitsev writes in commit 6cf7adf5876a65bc019fc91aa5add0d4fd409790:

Allow trailing whitespace in patch separator line

When a patch message contains "--- " (with trailing space) instead
of a clean "---", get_body_parts() failed to split the message
correctly. This caused any follow-up trailers (Reviewed-by, Link,
Signed-off-by, etc.) to be placed after the separator, where git-am
silently discards them.

Change the regex from "^---\n" to "^---\s*\n" so trailing whitespace
on the separator line is tolerated. The rebuild_message() method
always writes a clean "---\n", so the whitespace is cleaned up
automatically.

Reported-by: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Closes: https://msgid.link/CANiq72nLuYfoVnWGjmEmUJDKSpFJq9wUXfTND1e3cjwhe0KFFQ@mail.gmail.com # 9453f65
Signed-off-by: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Assisted-by: claude-opus-4-6

--
Deet-doot-dot, I am a bot.
b4 bug tracker (bugspray 0.1-dev)

