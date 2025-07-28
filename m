Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2DDC26E175
	for <tools@linux.kernel.org>; Mon, 28 Jul 2025 14:15:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753712106; cv=none; b=Grv2/P7Q2jDr3fflAGBNYjgaJmAlaYQsVfZqFdSBKphtFgqypXtWykkpTPWRRSIJhGvzs7iIv1gTgmul4pgQoVeXxQ5SUY/479cGV48UzdC5jF1aQ9f5CLP6Yj8SLXtFuBlJO8CboaoWehnDpXlm/nRvVcO4FtJ3e1lfNzuhRJ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753712106; c=relaxed/simple;
	bh=VmIUd4X8ZnZ/gdwXio1PsQfCMAi0k5z9RJkuDQrK3eA=;
	h=MIME-Version:Content-Type:From:To:Message-ID:In-Reply-To:
	 References:Subject:Date; b=eT3ShJ6JnErAIoi4hubkmIfV7XkgubKBFfzq5Hx9RJnjDcV72ahvfi6JHC2H0uzs4HMFgKB3Oqpsfo7LiU6gBcrBZmHhqxr2xyIW+agtZnhS3XDYuYnvzqCKK+mfAnsR9ZptjGqCKA7G43bdw6O/yt9xs0xKf/tacHu/CMPXLI4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VLLasUMc; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VLLasUMc"
Received: by smtp.kernel.org (Postfix)
	id 5B77FC4CEF7; Mon, 28 Jul 2025 14:15:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 45EA7C4CEE7;
	Mon, 28 Jul 2025 14:15:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1753712106;
	bh=VmIUd4X8ZnZ/gdwXio1PsQfCMAi0k5z9RJkuDQrK3eA=;
	h=From:To:In-Reply-To:References:Subject:Date:From;
	b=VLLasUMclq3D9FFxNXPlGdr+mgLoYrYLo8uDUxdwGKXP4ZY5ji6ccuOuEOZklghKc
	 gpPKPDGNib0u5lJJHH+V54/KBN3bFP5uYJCVvjUYivCvL0ZQTPOIGdniPex2+0CLOI
	 XGMry4+Nbg+z7Ya6I2wMmuexgYbAU0nLYYR3VzZ2GUqC4r9jjbDZW0XXh7VmkAxVS3
	 khKl/l9rq3Cu8AD69r/hrD/APKp4x7hZRdBYRGy6BXrYH2VG3fSMXU3xWaU5LWhhHS
	 RXB4IFN2CNqIIBUunV15JJbDgZegt0j5G6v2/lP+Evg8ctwpgazcZTYbfODUsOTQyc
	 2gifi4ornskXw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id E885D383BF5F;
	Mon, 28 Jul 2025 14:15:23 +0000 (UTC)
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
From: Bugspray Bot <bugbot@kernel.org>
To: manos.pitsidianakis@linaro.org, tools@kernel.org
Message-ID: <20250728-b220380-b43c410aaca8@bugzilla.kernel.org>
In-Reply-To: <CAAjaMXYtY62_KeEbshWA4vjhtUzNgTO0wffcZXNy95EqvL+Ovg@mail.gmail.com>
References: <CAAjaMXYtY62_KeEbshWA4vjhtUzNgTO0wffcZXNy95EqvL+Ovg@mail.gmail.com>
Subject: Re: b4 bug: "Error tagging the revision" in project with git
 submodules
X-Bugzilla-Product: Tools
X-Bugzilla-Component: Infra
X-Mailer: bugspray 0.1-dev
Date: Mon, 28 Jul 2025 14:15:23 +0000 (UTC)

Hello:

This conversation is now tracked by Kernel.org Bugzilla:
https://bugzilla.kernel.org/show_bug.cgi?id=220380

There is no need to do anything else, just keep talking.
-- 
Deet-doot-dot, I am a bot.
Kernel.org Bugzilla (bugspray 0.1-dev)

