Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F3641B5838
	for <tools@linux.kernel.org>; Tue,  2 Jul 2024 16:15:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719936911; cv=none; b=kOxEdlSQMsl7fgmQth7X7oPBlH3w9fZ1jW6P3mJNinl/G2YyXdOFjXnzwRrAJfPboERyDpPMPgMCszZvPb7j08vuufd34pre2YS7hD7bDSMdH9y8w/CHGFgQ67ZXDhxJ3vJCvSaihsxUp2879kHHJkD8QDvqwx9NhdPGFBamWzQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719936911; c=relaxed/simple;
	bh=Ndo8e8VYjQS9kx4iLPfPeGmiOZRy7ewDMzK3LrZrCtU=;
	h=Date:MIME-Version:Content-Type:From:To:Message-ID:In-Reply-To:
	 References:Subject; b=k6qgyTp/04q2/Qu8czG0ZnIlcgOxyaxHG6JwvaxlpdV+VleBd8zBinbPxsscRn3P1KTSeROL3HQQ1XmMhkDTZzpf1n44CH/Ok2TqXjzbMnS79uujUTpH0xqYnykukmwrXURybsQuHrg3Xk9CdrF6NY4LzHJ5e4lB5R68khu7XM0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=M/+bhGln; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="M/+bhGln"
Received: by smtp.kernel.org (Postfix)
	id 59EB4C4AF0E; Tue,  2 Jul 2024 16:15:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 43BBAC4AF07;
	Tue,  2 Jul 2024 16:15:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1719936911;
	bh=Ndo8e8VYjQS9kx4iLPfPeGmiOZRy7ewDMzK3LrZrCtU=;
	h=Date:From:To:In-Reply-To:References:Subject:From;
	b=M/+bhGlnTTTKRrPhL/k1u7m5d/TvNUVN4r2U/pqo03APTxrjSd4b8ieNsXXiWxRJ0
	 sByK053yfLAQ+xxsjwYFfd/fPeCHJUHNahEPLZt6nAxNn2GUfr6xtdzt0y5WrX5mnS
	 Peli89XgeVB0Gq2pSkV/DL0XSCTRDBMiYaTR3TXVEj4u89tYKvuCgwT0peeRhoCuNA
	 96r2LNYqnqesRrmqBkToUS/VIAbfPTgntY5jYrTbLY+SiEGFlS7urQ7bx1pls7YBPp
	 ryp7CE/i4iUiFc6O0VZQqsTb7FAKVlklwygFra/s782LZq1SqWNNWB1HZFe3oSBsS8
	 c1WkYv/3c81Dg==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 28A4CC43331;
	Tue,  2 Jul 2024 16:15:11 +0000 (UTC)
Date: Tue, 02 Jul 2024 16:15:11 +0000
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
From: "Kernel.org Bugbot" <bugbot@kernel.org>
To: tools@linux.kernel.org, quic_jjohnson@quicinc.com, 
 konstantin@linuxfoundation.org, tools@kernel.org
Message-ID: <20240702-b218994c3-89bbe24956f5@bugzilla.kernel.org>
In-Reply-To: <ca8f8cab-e62c-4784-bdf8-9c92b2c0202c@quicinc.com>
References: <ca8f8cab-e62c-4784-bdf8-9c92b2c0202c@quicinc.com>
Subject: Re: b4 prep --cleanup failure with cover-strategy:
 branch-description
X-Bugzilla-Product: Tools
X-Bugzilla-Component: Infra
X-Mailer: peebz 0.1

quic_jjohnson writes via Kernel.org Bugzilla:

There is another behavior which I'm also encountering where the b4 prep --cleanup command returns without any backtrace and without apparently doing anything:

[jjohnson:development 1] git checkout b4/md-kvm
Switched to branch 'b4/md-kvm'
[jjohnson:development 2] b4 prep --show-info
branch: b4/md-kvm
cover-subject: md-kvm
base-branch: linux-master
base-commit: 2bfcfd584ff5ccc8bb7acde19b42570414bf880b
start-commit: 2bfcfd584ff5ccc8bb7acde19b42570414bf880b
end-commit: ef5bf7522b9c61da7f935d74246d19bd7e81c71d
series-range: 2bfcfd584ff5ccc8bb7acde19b42570414bf880b..ef5bf7522b9c61da7f935d74246d19bd7e81c71d
change-id: 20240528-md-kvm-36f20bc4a5b0
revision: 3
cover-strategy: branch-description
needs-editing: True
needs-recipients: False
has-prerequisites: False
needs-auto-to-cc: False
needs-checking: False
needs-checking-deps: False
preflight-checks-failing: True
commit-ef5bf7522b9c: KVM: x86: add missing MODULE_DESCRIPTION() macros
series-v2: 2bfcfd584ff5..8e4a790087e7 20240622-md-kvm-v2-1-29a60f7c48b1@quicinc.com
series-v1: 2bfcfd584ff5..5a3a35097cdd 20240528-md-kvm-v1-1-c1b86f0f5112@quicinc.com
[jjohnson:development 3] git checkout md-linux-next-master
Switched to branch 'md-linux-next-master'
[jjohnson:development 4] b4 prep --cleanup b4/md-kvm
[jjohnson:development 5] git branch|fgrep b4/md-kvm
  b4/md-kvm
[jjohnson:development 6] git checkout b4/md-kvm
Switched to branch 'b4/md-kvm'
[jjohnson:development 7] b4 prep --show-info
branch: b4/md-kvm
cover-subject: md-kvm
base-branch: linux-master
base-commit: 2bfcfd584ff5ccc8bb7acde19b42570414bf880b
start-commit: 2bfcfd584ff5ccc8bb7acde19b42570414bf880b
end-commit: ef5bf7522b9c61da7f935d74246d19bd7e81c71d
series-range: 2bfcfd584ff5ccc8bb7acde19b42570414bf880b..ef5bf7522b9c61da7f935d74246d19bd7e81c71d
change-id: 20240528-md-kvm-36f20bc4a5b0
revision: 3
cover-strategy: branch-description
needs-editing: True
needs-recipients: False
has-prerequisites: False
needs-auto-to-cc: False
needs-checking: False
needs-checking-deps: False
preflight-checks-failing: True
commit-ef5bf7522b9c: KVM: x86: add missing MODULE_DESCRIPTION() macros
series-v2: 2bfcfd584ff5..8e4a790087e7 20240622-md-kvm-v2-1-29a60f7c48b1@quicinc.com
series-v1: 2bfcfd584ff5..5a3a35097cdd 20240528-md-kvm-v1-1-c1b86f0f5112@quicinc.com

View: https://bugzilla.kernel.org/show_bug.cgi?id=218994#c3
You can reply to this message to join the discussion.
-- 
Deet-doot-dot, I am a bot.
Kernel.org Bugzilla (peebz 0.1)

