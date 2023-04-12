Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFD4C3C02
	for <tools@linux.kernel.org>; Wed, 12 Apr 2023 19:26:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 609F4C4339B;
	Wed, 12 Apr 2023 19:26:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1681327586;
	bh=NHzGJIWjAOYqu/lTTngKW9DJqCp5tr9c2G5gi5UjjZ4=;
	h=From:To:In-Reply-To:References:Subject:Date:From;
	b=E1F7YA4u2KW3xaMR8bsml/nVyoM98pbsRtw6UU9TRmwEYPKRgodgPQJaswZSb1ruJ
	 RSUyvCYSCjlMilEs2fLY8Q/fU9aszmJvolCPHfZEZtm9OHN5tuw9H5NNlmrE8euRwG
	 YqXCIpcgARVKg56M75KknNpwt7M33lmJw5a3GhPuNGv+fZgTlmo7zyABEauFr+bfoF
	 YME0wxjbiDkVWVk1763ciBtFxTRXw/FE86M7DOvxwbMCQ0FavW6s4X3hG73aAj9LAw
	 rYz0wwH4SmrJXUnRUtOZ46G5MurHzitwvB2huXqrm01MQLv11UOrHE0jaoXlgq23ID
	 sA3ON0CiOgwQg==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 4823EE52446;
	Wed, 12 Apr 2023 19:26:26 +0000 (UTC)
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
From: "Kernel.org Bugbot" <bugbot@kernel.org>
To: ndesaulniers@google.com, icon@mricon.com, mjg59@srcf.ucam.org, 
 tools@linux.kernel.org
Message-ID: <20230412-b217332-4bbbfd0f3313@bugzilla.kernel.org>
In-Reply-To: <CAKwvOdn6_J+9BppRbXEtDc8CW-qqoat7VJ521oWnqXCXHb_d6A@mail.gmail.com>
References: <CAKwvOdn6_J+9BppRbXEtDc8CW-qqoat7VJ521oWnqXCXHb_d6A@mail.gmail.com>
Subject: Re: executable sendemail.smtpserver and b4 --reflect
X-Bugzilla-Product: Tools
X-Bugzilla-Component: Infra
X-Mailer: peebz 0.1
Date: Wed, 12 Apr 2023 19:26:26 +0000 (UTC)

Hello:

This conversation is now tracked by Kernel.org Bugzilla:
https://bugzilla.kernel.org/show_bug.cgi?id=217332

There is no need to do anything else, just keep talking.
-- 
Deet-doot-dot, I am a bot.
Kernel.org Bugzilla (peebz 0.1)

