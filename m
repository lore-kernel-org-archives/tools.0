Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A07C2F5A3B
	for <tools@linux.kernel.org>; Wed, 22 Oct 2025 19:55:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761162939; cv=none; b=p1OlQ1waGWe3dNp0rzhVhGOeImAQCFC+8EENOaBorH05T9kSPQqmQwz8YLj2a8PzrjdGMRfrAE4TjHjiL23EhaYsn4rNmUHeJDMbjuMakZmblmQq4NnRzs9aoONGcYUuM45v0b+EdvlmT3/7Q5JzpI/rrL+corD58D5gX4cuYL4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761162939; c=relaxed/simple;
	bh=zwMcIS2mAhJPxLzV5seCyJdoOoZeWo+vXPa91L/9hZA=;
	h=MIME-Version:Content-Type:From:To:Message-ID:In-Reply-To:
	 References:Subject:Date; b=GFtIybYm2Gh42APRCrv08LaVO6ieiHyfXxUWY1BLhvIK1lm+unJbM+16x9Xy13ghHM9AWDB5dX4EywwdJN/NPGfkF9Jxg4U/Iyo3G9dYeX6idydwqFOsv+o6SIKcmPvQpLEnZP9EdMWCKF9PxgWNa1Ny/000DhjGbVXz39ko/a8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QROE7dcX; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QROE7dcX"
Received: by smtp.kernel.org (Postfix)
	id 53080C4CEE7; Wed, 22 Oct 2025 19:55:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3CF32C4CEF7;
	Wed, 22 Oct 2025 19:55:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761162939;
	bh=zwMcIS2mAhJPxLzV5seCyJdoOoZeWo+vXPa91L/9hZA=;
	h=From:To:In-Reply-To:References:Subject:Date:From;
	b=QROE7dcXJADG9S+SUFsibgHYTG7+CMHNFWQp4wtCmY1sIwbStxqUBuXqE/G1IeHWQ
	 vtk6Ht5LWFguNv0oCrdFOo/V4KqRgApfhyow91uxJnSmpMqDZUb3DbtNmtexK4PF+y
	 7fHBCyaMrmkSaj9d/CEVmndyRVpfF/gCu2mnMbvBq6qIja+W57vhyoxm6PhEC5iqRZ
	 aOXSS0rwM3PBmidmQcGxLsuiTa+xeg5WaS5X+V6BbH8Og4dFipSOWRfFLoAJuWTO4d
	 hEgig4Acf8zz+jYQpjpzBQNmEldGMdZmXIirZamgeNLPSOpmmPjIJOe3UwpddUr6ST
	 ySSjig8FCY9ow==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 380863A78ACC;
	Wed, 22 Oct 2025 19:55:21 +0000 (UTC)
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
From: Bugspray Bot <bugbot@kernel.org>
To: tools@kernel.org, konstantin@linuxfoundation.org, users@kernel.org, 
 geert@linux-m68k.org
Message-ID: <20251022-b220661c2-de130d3d7a44@bugzilla.kernel.org>
In-Reply-To: <CAMuHMdX40JoouK0yjm_-ggj5dQ9MtE2vrYhUOQ9dDpCN-0+tXg@mail.gmail.com>
References: <CAMuHMdX40JoouK0yjm_-ggj5dQ9MtE2vrYhUOQ9dDpCN-0+tXg@mail.gmail.com>
Subject: Re: b4 am no longer prints file name
X-Bugzilla-Product: Tools
X-Bugzilla-Component: Infra
X-Mailer: bugspray 0.1-dev
Date: Wed, 22 Oct 2025 19:55:21 +0000 (UTC)

Konstantin Ryabitsev writes in commit bd7332f9094cb0c113c228f996991f2a42e641dd:

mbox: restore printing out of filename to git am

Looks like due to either inattention or bad auto-indenting, the part
that printed out the name to git am ended up buried inside the if
statement that is almost never called.

Reported-by: Geert Uytterhoeven <geert@linux-m68k.org>
Closes: https://bugzilla.kernel.org/show_bug.cgi?id=220661
Signed-off-by: Konstantin Ryabitsev <konstantin@linuxfoundation.org>

(via https://git.kernel.org/pub/scm/utils/b4/b4.git/commit/?id=bd7332f9094c)
-- 
Deet-doot-dot, I am a bot.
Kernel.org Bugzilla (bugspray 0.1-dev)

