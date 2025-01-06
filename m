Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F7361482F5
	for <tools@linux.kernel.org>; Mon,  6 Jan 2025 22:05:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736201107; cv=none; b=o6V1FLRMKHHlTD3JwQsXGGI+G1fzdwM25b8db/Km3m7AYrxImjjxFNzzxeq36/UcmRRLhsMRSZ7QML//molfPNgOUGR9jBnH8X73HigKqeN0FIEwStkwj38DXfvIG+lFbD3052os5A7uB6bIxWdTbqW+uM/l++fAOz1JASRDLlM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736201107; c=relaxed/simple;
	bh=R+aXqEj9Ond3u7x/OTC+BITYVVsz9I8dV1nLuXMH0uo=;
	h=MIME-Version:Content-Type:From:To:Message-ID:In-Reply-To:
	 References:Subject:Date; b=UiJy0YmLWhtuiObNkZ0ORwVBa3Zm4feiwsYTCNFdvEFMwbJV9N8JtnRgE7H2T33O5rpSsRZNDffyoWYiQ62xNIoluCuZM+s+B0oe+ubV8IGGV/drjIaiSSLrWefU4zyFALy0MyRTVQcRNMO92hIiF/fphVYIYs4EPI7N5bhaxlk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mTVCxU1j; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mTVCxU1j"
Received: by smtp.kernel.org (Postfix)
	id 973F8C4CEE0; Mon,  6 Jan 2025 22:05:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 76DE5C4CED2;
	Mon,  6 Jan 2025 22:05:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736201106;
	bh=R+aXqEj9Ond3u7x/OTC+BITYVVsz9I8dV1nLuXMH0uo=;
	h=From:To:In-Reply-To:References:Subject:Date:From;
	b=mTVCxU1jqXYX4pNFKQShznKXMKAKthAXISlYy6XZApdOSk8FRSbFYiU7vM0UGtkWq
	 MCGoVelkJs3kRBYf+8UPSikrCOidsxGPn/+KWuIhYWObSPtNq97KDAiXUfcjij9zYP
	 UuE8CWh2CBYbruSF8z3qsNabK8FZhynKnQJcNiDaYD45fHNTIiSQapsbOji6rNcaAf
	 E/7/JnWdqhlh3iSEmVmAkHKLXkKZiLO9BZt+giSd1+RZDVKqhEtnHCU5trAoTHYMya
	 UOa4xoePWboTiW9IkBueJJpWdwStTAgB1WJp3PNXxT9r4U0Gtgwq4JkuSKrfENehvm
	 w7T0LTvxMK1sg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id B4496380A97E;
	Mon,  6 Jan 2025 22:05:28 +0000 (UTC)
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
From: Bugspray Bot <bugbot@kernel.org>
To: tools@kernel.org, j.neuschaefer@gmx.net
Message-ID: <20250106-b219668-17bce0eeb0bd@bugzilla.kernel.org>
In-Reply-To: <Z3vkoDal1ShoPpqG@probook>
References: <Z3vkoDal1ShoPpqG@probook>
Subject: Re: "b4 send" only handles one instance of
 sendemail.smtpserveroption
X-Bugzilla-Product: Tools
X-Bugzilla-Component: Infra
X-Mailer: bugspray 0.1-dev
Date: Mon,  6 Jan 2025 22:05:28 +0000 (UTC)

Hello:

This conversation is now tracked by Kernel.org Bugzilla:
https://bugzilla.kernel.org/show_bug.cgi?id=219668

There is no need to do anything else, just keep talking.
-- 
Deet-doot-dot, I am a bot.
Kernel.org Bugzilla (bugspray 0.1-dev)

