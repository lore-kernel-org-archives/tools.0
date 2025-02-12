Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A400021506D
	for <tools@linux.kernel.org>; Wed, 12 Feb 2025 17:05:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739379904; cv=none; b=UMU9jMZSh5kDixZbhJJFjAk4e9uaTiPpy3S/2syI/QHEDm9ZJkSLDclBiS6vh+2J+2nz+jgve5+5A+85u7+mX7d15kXN7i6br/lMRDd8w+EJWL0FPWNKwMj8VyCQelCgemOLrnvdOOjV3JwdDMg8XNbGaRG08EPwuIPyo7FvV5s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739379904; c=relaxed/simple;
	bh=Mt5SU4maV6jmT3NYNL0rev1ZuPY+tb7yQ8EnlKkW25o=;
	h=MIME-Version:Content-Type:From:To:Message-ID:In-Reply-To:
	 References:Subject:Date; b=hYZjNi/lEFMqZLjjRvbbIDxbVBcde6SIIqZSlMgf99FhAuwyTX1irgHyN8xz3kTZMstr5OIiursita+hMIjTusSzuU/StIVQFPbZiwxi8XxWNPKKXbd1Wpn8lrTzVHqcqZPlxN03JkuuH2kT9R0IxyhHGBmAN68V6HDBzBSQXCU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FtVdg82Y; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FtVdg82Y"
Received: by smtp.kernel.org (Postfix)
	id 3BEABC4CEE4; Wed, 12 Feb 2025 17:05:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 25119C4CEDF;
	Wed, 12 Feb 2025 17:05:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739379904;
	bh=Mt5SU4maV6jmT3NYNL0rev1ZuPY+tb7yQ8EnlKkW25o=;
	h=From:To:In-Reply-To:References:Subject:Date:From;
	b=FtVdg82YIB+KjBXb2W53hnXS3TGeE2fzcBqBpFujnth3MgAeiVrquDTk3GY+a5Slp
	 9wPNfp3J2jOuZ8sRnP4opdxflW0Epq5d8y8JS6aWHUEF0p5H0rIK1Jt16WNjmPOj6m
	 VTwbmlHr0vMop2p5amCN/l6jb2yf6XtYKCZeJ3bB/q5iAIOPUV5G1IKGcHNrBxMLos
	 zFw6oUY624zA5xlWQhbS8dYJB8m0un7PsvsPlM1RcfMKe6+vMviFwdF7+Fe8OiCvP1
	 qQAySmR6uwrgZc3RbKbLXqmImLJ87fGNWGnrO4xwkWmYAPy4ExKasK/OAmliB+n94d
	 p8Hx3mxqetwAw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 3CA61380CED8;
	Wed, 12 Feb 2025 17:05:34 +0000 (UTC)
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
From: Bugspray Bot <bugbot@kernel.org>
To: tools@kernel.org, trini@konsulko.com
Message-ID: <20250212-b219778-cc1116fef056@bugzilla.kernel.org>
In-Reply-To: <20250212165045.GP1233568@bill-the-cat>
References: <20250212165045.GP1233568@bill-the-cat>
Subject: Re: Problem with "b4 pr" ?
X-Bugzilla-Product: Tools
X-Bugzilla-Component: Infra
X-Mailer: bugspray 0.1-dev
Date: Wed, 12 Feb 2025 17:05:34 +0000 (UTC)

Hello:

This conversation is now tracked by Kernel.org Bugzilla:
https://bugzilla.kernel.org/show_bug.cgi?id=219778

There is no need to do anything else, just keep talking.
-- 
Deet-doot-dot, I am a bot.
Kernel.org Bugzilla (bugspray 0.1-dev)

