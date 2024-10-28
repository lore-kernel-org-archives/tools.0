Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AA101D79A6
	for <tools@linux.kernel.org>; Mon, 28 Oct 2024 17:45:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730137525; cv=none; b=e3hPjio8+dP87V4hYwVgC9o4DrTsYCMMmBN0jHiKoghbodG24MP4eRik7QONycnG01EWsZrrrREnLCDPmEdCDQ/rGP6jK81roVt4YYdN22HzvBswYCi/Mj0Kh9t8MX05dhSisPAwnHzr6ICPg7TUSYS76ZG7DzKHXligp5y+a3Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730137525; c=relaxed/simple;
	bh=e+AJ+ZhbkMpfoDJqhrsld/TSmRmZLKHXI8cmTvb+QH0=;
	h=MIME-Version:Content-Type:From:To:Message-ID:In-Reply-To:
	 References:Subject:Date; b=UzNOHoHqHli5ajUBSs7dhv2WZQx2uXRTzPMAxqc9NGw7ZZPC06gMe0F0HVeGj38TTmWXi98MfaeXytvQbonkUAFr8wDG2UwZFlRdzIi2tGS8s9wXFBt1YeH+kDBwAOYT7SLt74HaCQIqpA1ka+1a4/Kij6YBPug8SsYa4dfnuL4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jA7PCP7D; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jA7PCP7D"
Received: by smtp.kernel.org (Postfix)
	id 4ACFBC4CEE7; Mon, 28 Oct 2024 17:45:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2E2C4C4CEC7;
	Mon, 28 Oct 2024 17:45:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730137525;
	bh=e+AJ+ZhbkMpfoDJqhrsld/TSmRmZLKHXI8cmTvb+QH0=;
	h=From:To:In-Reply-To:References:Subject:Date:From;
	b=jA7PCP7De+sB5Pdx9KCHxEcFJUiiTepDM5RQ/4FKXZ8Iqw/lnnwj2SMf6dtL3cJvZ
	 toUsbxx1GtHMMV+hkTk1I1FaEWoLxFWkW/J3POlUBFPSHFSgqOqSTlJlMasnRXLrWN
	 atxf/NDZIizPciuRoGk6TxrnuH/lsWnbapg3lwmwHfUL6012X6rqcULnrrijf0nXPh
	 GOTGUi7TSfa8rCtw/8d7lxnqzD3lvvRgeFlTpcnHwVB35HtIoAtxasTCMQcHru6kli
	 i0ZDfg/1a4jcyd3vESWXll6xBDATX8zKSFEn+6nkyCsBJMn9+/7hxXSjKbwz++O4bD
	 wk/QVfzLUQtLg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id B473B380AC1C;
	Mon, 28 Oct 2024 17:45:33 +0000 (UTC)
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
From: Bugspray Bot <bugbot@kernel.org>
To: tamird@gmail.com, tools@kernel.org
Message-ID: <20241028-b219437-da47ef6f7c18@bugzilla.kernel.org>
In-Reply-To: <CAJ-ks9nbCtD3OEy=AoHGOr_C6Ai8TknQVHzKCsS5bthm2hw2eQ@mail.gmail.com>
References: <CAJ-ks9nbCtD3OEy=AoHGOr_C6Ai8TknQVHzKCsS5bthm2hw2eQ@mail.gmail.com>
Subject: Re: : `send --resend` appends SSH signature block
X-Bugzilla-Product: Tools
X-Bugzilla-Component: Infra
X-Mailer: bugspray 0.1-dev
Date: Mon, 28 Oct 2024 17:45:33 +0000 (UTC)

Hello:

This conversation is now tracked by Kernel.org Bugzilla:
https://bugzilla.kernel.org/show_bug.cgi?id=219437

There is no need to do anything else, just keep talking.
-- 
Deet-doot-dot, I am a bot.
Kernel.org Bugzilla (bugspray 0.1-dev)

