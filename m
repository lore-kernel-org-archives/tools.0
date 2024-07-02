Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A86626AE4
	for <tools@linux.kernel.org>; Tue,  2 Jul 2024 15:55:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719935710; cv=none; b=Qv4b+7kA4IkBC5QwO/p+ByUnacOilhYORL4XrW+cnkOftbs4AI9fexoDFW4MbDeUKZasOi3UlrueouEJmQY+Ae53cW+UyF81bFE0sl4RZ8w9XluToQpVZYITHLzxwJlf/hdQ73rUbFF5cS2LfFfgXEmuw+6cLf7YhytJ7ZB4Er8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719935710; c=relaxed/simple;
	bh=UWmPP1OEFb/AsNkYSK9+n8J18uVwgrEnYbvDm6I6asM=;
	h=Date:MIME-Version:Content-Type:From:To:Message-ID:In-Reply-To:
	 References:Subject; b=dhrm6DOrCPuuk2OFhojFFLBiETmHBQThN+zPEOTi7oGqRX0NtmYvTwNhYYuKWvqBTJ4kEu/4Mvs+STdGNH/kFv9Dyy8j8MEDAip1+ERKOLlUSYm/B2l6lWFawda1Kk4DVXCi/2PzKi9DCKHiMUJ+ogRLHn1arcCws6uteslVR7U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=m0R13wMA; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="m0R13wMA"
Received: by smtp.kernel.org (Postfix)
	id 310D9C4AF07; Tue,  2 Jul 2024 15:55:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 19A99C116B1;
	Tue,  2 Jul 2024 15:55:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1719935710;
	bh=UWmPP1OEFb/AsNkYSK9+n8J18uVwgrEnYbvDm6I6asM=;
	h=Date:From:To:In-Reply-To:References:Subject:From;
	b=m0R13wMA2HIgeX/O/6Q3jvlJQEi6muStxggHseUpOGjblATIB9+9dAxG/9FtjU7uK
	 YB9hZz3dG42nNBRweTmF4ZcI8i2zLAWVWyxlg0f80PxU3SA0EojGk7YiW1W6woU4tU
	 AIY+lnRAGzIHdKiH5GacHDCr5QexxzqOAN9waQfEtjqWG6Z2KxjuY/AsbMl+p4nD/j
	 DicBQuhAhs4LaY3A8VCcUAjdK/y3A5YDiZNsy+Ossxn7JwfKrP3T2tZzQSGmaTefcB
	 WGXWeCSMmP5+Y3VJ4GkoPblPzmyVrEY93v7UUAuFdsHBGKOnHxxqOiKLbtkF6+SakF
	 ufdnFS5T3MT+w==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id F3065C43331;
	Tue,  2 Jul 2024 15:55:09 +0000 (UTC)
Date: Tue, 02 Jul 2024 15:55:10 +0000
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
From: "Kernel.org Bugbot" <bugbot@kernel.org>
To: tools@linux.kernel.org, quic_jjohnson@quicinc.com, tools@kernel.org, 
 konstantin@linuxfoundation.org
Message-ID: <20240702-b218994c2-c31cdf784584@bugzilla.kernel.org>
In-Reply-To: <ca8f8cab-e62c-4784-bdf8-9c92b2c0202c@quicinc.com>
References: <ca8f8cab-e62c-4784-bdf8-9c92b2c0202c@quicinc.com>
Subject: Re: b4 prep --cleanup failure with cover-strategy:
 branch-description
X-Bugzilla-Product: Tools
X-Bugzilla-Component: Infra
X-Mailer: peebz 0.1

quic_jjohnson writes via Kernel.org Bugzilla:

Some additional information about my workflow that may have impacted this issue.
I have one workspace called 'development' where I do most of my work, and it was in this workspace where I was performing tree-wide additions of missing MODULE_DESCRIPTION() macros using my standard x86_64 build configuration.

At one point I realized that I would not find issues with other ARCH settings with this configuration, so I then created a second workspace called 'arm64' which used the 'development' workspace as the remote. And as the name suggests, I originally updated the config in this workspace to build arm64 instead of x86_64, but that is probably not important. But what may be important is that when I encountered arm64 issues, I created b4 branches in the 'arm64' workspace.

Only later did I realize that having tree-wide WIP in two separate workspace was going to complicate my record keeping, so I pushed my WIP from 'arm64' to 'development'.

Today I tried to clean up one of the branches since the commit has landed in linux-next.

In my development workspace I see:
[jjohnson:development 9385] git checkout b4/md-arm64-drivers-edac
Updating files: 100% (10338/10338), done.
Switched to branch 'b4/md-arm64-drivers-edac'
[jjohnson:development 9386] b4 prep --show-info
CRITICAL: This is not a prep-managed branch.

In my arm64 workspace I see:
[jjohnson:arm64 1] git checkout b4/md-arm64-drivers-edac
Switched to branch 'b4/md-arm64-drivers-edac'
Your branch is up to date with 'development/b4/md-arm64-drivers-edac'.
[jjohnson:arm64 2] b4 prep --show-info
branch: b4/md-arm64-drivers-edac
cover-subject: md-arm64-drivers-edac
base-branch: linux-master
base-commit: 83a7eefedc9b56fe7bfeff13b6c7356688ffa670
start-commit: 83a7eefedc9b56fe7bfeff13b6c7356688ffa670
end-commit: c4515adee140419f499b576d3db7f0a1ef797ec3
series-range: 83a7eefedc9b56fe7bfeff13b6c7356688ffa670..c4515adee140419f499b576d3db7f0a1ef797ec3
change-id: 20240613-md-arm64-drivers-edac-2fa423340d75
revision: 3
cover-strategy: branch-description
needs-editing: True
needs-recipients: False
has-prerequisites: False
needs-auto-to-cc: False
needs-checking: False
needs-checking-deps: False
preflight-checks-failing: True
commit-c4515adee140: EDAC: add missing MODULE_DESCRIPTION() macros
series-v2: 83a7eefedc9b..8c38b6b182e5 20240617-md-arm64-drivers-edac-v2-1-6d6c5dd1e5da@quicinc.com
series-v1: 83a7eefedc9b..5127f12ffcdd 20240613-md-arm64-drivers-edac-v1-1-149a4f0f61bb@quicinc.com
[jjohnson:arm64 3] git checkout linux-master
Switched to branch 'linux-master'
Your branch is up to date with 'linus/master'.
[jjohnson:arm64 4] b4 prep --cleanup b4/md-arm64-drivers-edac
Traceback (most recent call last):
  File "/usr2/jjohnson/.local/bin/b4", line 8, in <module>
    sys.exit(cmd())
  File "/usr2/jjohnson/.local/lib/python3.8/site-packages/b4/command.py", line 417, in cmd
    cmdargs.func(cmdargs)
  File "/usr2/jjohnson/.local/lib/python3.8/site-packages/b4/command.py", line 83, in cmd_prep
    b4.ez.cmd_prep(cmdargs)
  File "/usr2/jjohnson/.local/lib/python3.8/site-packages/b4/ez.py", line 2766, in cmd_prep
    return cleanup(cmdargs.cleanup)
  File "/usr2/jjohnson/.local/lib/python3.8/site-packages/b4/ez.py", line 2332, in cleanup
    ts = tracking['series']
KeyError: 'series'

View: https://bugzilla.kernel.org/show_bug.cgi?id=218994#c2
You can reply to this message to join the discussion.
-- 
Deet-doot-dot, I am a bot.
Kernel.org Bugzilla (peebz 0.1)

