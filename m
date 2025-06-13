Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65877233714
	for <tools@linux.kernel.org>; Fri, 13 Jun 2025 18:44:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749840292; cv=none; b=lV5l0U83P9/+qGjhut7i8uiLjr9VkpoOmjCoO43rjbYxEn+1ytxCKGrRSSMwTXFzQXBm/QXxUp1Bw7Iuh/ZBuvWRwm7h7wxBk+bNUY5BHtPIrXwmFJb6nuhhG4uMklhADrX5x0EkGF/6x5OITs//3UNt+V5HIAWAhanR+pER+OQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749840292; c=relaxed/simple;
	bh=NmHpYGt+NodsKiLiEDlkcUTEzibjuj4CJ2rcVhj2jZE=;
	h=MIME-Version:Content-Type:From:To:Message-ID:In-Reply-To:
	 References:Subject:Date; b=Ootw60RDJWfnpEMPh0zr5zrllMlGPcPxH0nctIQZFuV7aow6cepWmY5iejXrR6ie/9iqD53OgrE4OTwO07UgthyBfF5dAqX+Y+38rTAFplqlRsCUelWZL+EGYHGI12+9wlm9Z2T98fp62ditiZGwtnbkMmYHNa3NPhvTR0gmWOI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NLUE5nQg; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NLUE5nQg"
Received: by smtp.kernel.org (Postfix)
	id 0A1A0C4CEF0; Fri, 13 Jun 2025 18:44:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E7076C4CEE3;
	Fri, 13 Jun 2025 18:44:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749840291;
	bh=NmHpYGt+NodsKiLiEDlkcUTEzibjuj4CJ2rcVhj2jZE=;
	h=From:To:In-Reply-To:References:Subject:Date:From;
	b=NLUE5nQgM68XmvNAmqxLqNbDX/6t/HbMe1sUsFQNaJ16UDXWLFjJ5wYiz2dwwDJoj
	 8uqYmmVe9Fr486EzZszfQCchvHKRvorAlOvu39Be/nG9yCJPAmcjSHO8YZh/XWEvM8
	 ga5wkVv942tCjpyitATu4zpEs23cimuqxqpTRSv1zjdkNN0ZBNrV+UqeTJdPdNF3RW
	 GrCq0Mh3Z9ItW5/STZiXJUSvDphsLFQXzXs83e1ZEI10nhGn0EJiV223ugJKN/xKJx
	 N3HFbCLJ79sdR5vXMWd6QjVwgSmYA4D/Qmzfo4/DAC0L7nArsEURpVftkhUrZSVsGv
	 bdJVDZoaPR3MQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id B43B8380AAD0;
	Fri, 13 Jun 2025 18:45:22 +0000 (UTC)
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
From: Bugspray Bot <bugbot@kernel.org>
To: users@linux.kernel.org, tools@kernel.org, tools@linux.kernel.org, 
 lee@kernel.org, konstantin@linuxfoundation.org
Message-ID: <20250613-b217672c4-4dd790b9d40b@bugzilla.kernel.org>
In-Reply-To: <CABVG=qdHsB5pa8rOKCV9s2WtXKZ-Qh1+8q=1VNcorM37P4r1EQ@mail.gmail.com>
References: <CABVG=qdHsB5pa8rOKCV9s2WtXKZ-Qh1+8q=1VNcorM37P4r1EQ@mail.gmail.com>
Subject: Re: b4: ty: Feature request - configuration option to send to
 'myemail'
X-Bugzilla-Product: Tools
X-Bugzilla-Component: Infra
X-Mailer: bugspray 0.1-dev
Date: Fri, 13 Jun 2025 18:45:22 +0000 (UTC)

Lee Jones writes in commit fade5953b9dca02aac518d786b09aa0142d64a0a:

ty: Allow users to specify whether thank-yous are sent to themselves

The motivation behind this change was that thank-yous weren't showing up
in maintainer's inboxes.  This is a problem because some of us the
presence of these mails to indicate that particular sets or individual
patches have been applied or not.

Provide command line option '--me-too' to override the default
behaviour.  If this is not specified, there are no functional changes.

Closes: https://bugzilla.kernel.org/show_bug.cgi?id=217672
Signed-off-by: Lee Jones <lee@kernel.org>
Link: https://patch.msgid.link/20250613133209.892846-1-lee@kernel.org
Signed-off-by: Konstantin Ryabitsev <konstantin@linuxfoundation.org>

(via https://git.kernel.org/pub/scm/utils/b4/b4.git/commit/?id=fade5953b9dc)
-- 
Deet-doot-dot, I am a bot.
Kernel.org Bugzilla (bugspray 0.1-dev)

