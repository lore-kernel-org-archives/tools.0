Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CAA7153BE3
	for <tools@linux.kernel.org>; Tue, 23 Jul 2024 14:53:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721746392; cv=none; b=RnPb+51TKRBJJ1Kwois+rUjDouUn/ifazb9cwgnQtYBZWA6/ZskC/Wiw5dHU7m3LMSA4OY9JNGDkatYTixCEOcbsF2OP4T3k+nhsjnPGitiYcuLa2GIYMkcz8sbHlsuj1KuJxi8bskG6YFAne4fOZCkDbXt59bllDi5wbADMhaY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721746392; c=relaxed/simple;
	bh=iyaoYUJ8uAJO0wg5jDJpwoV2TjWEJyPc/yi5OmA9vsQ=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Y24E2ojm4dHl83PkwVk9dlAfYnZCk+qXHmcakMOIOIUXJwz4pfB994A5Or/94J1uYCQQnnchx3WEXQrTRjzUdoHx4kzv1DmD+MwLdr36gkdnWyW1bHJxU5u28LOZ1zd+deHNeZtPZcUfiqMFAu1no1r8jNtMeE6xGuCc+cJKaWE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=AlGpeDXV; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="AlGpeDXV"
Received: by smtp.kernel.org (Postfix)
	id 1A30FC4AF0E; Tue, 23 Jul 2024 14:53:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D56EBC4AF09;
	Tue, 23 Jul 2024 14:53:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1721746392;
	bh=iyaoYUJ8uAJO0wg5jDJpwoV2TjWEJyPc/yi5OmA9vsQ=;
	h=Date:From:To:Subject:From;
	b=AlGpeDXVzbEKRRVXMaL3kHVyAvgHaOKOSyRQ7bwBUc7lxNLA8VfL06XwmfOdKOMFp
	 kl0Q/GEqoSpe+GWO3bu+kcvBGzH1P4UZ/LAExS1UOgTGMRtHrUf29TXYh/KcuQQ9Mi
	 PXygyKgPazHi4mBR3tnutvHV3zzgfzD7Ib2kZ2j0=
Date: Tue, 23 Jul 2024 10:53:08 -0400
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: tools@kernel.org, users@kernel.org
Subject: b4 0.14.1 available
Message-ID: <20240723-clever-dodo-of-finesse-04ba5a@lemur>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

Hello:

This is a minor bump release with a few fixes and minor feature improvements.
The shortlog:

	Joel Granados (1):
		  Forward the smtpserveroption to the local command

	Junio C Hamano (1):
		  Support "valueless truth" in configuration parsing

	Konstantin Ryabitsev (7):
		  Exclude tests from dist files
		  bump-version: fix path to the manpages
		  shazam: force mboxrd mode for git-am
		  Improve tests exclusion from the built packages
		  When looking for the cover commit, restrict to current committer
		  Up version to 0.14.1 and prepare release
		  Fix version

My thanks to the following people who helped with this release, in reverse-log
order:

- Joel Granados
- Konrad Dybcio
- Junio C Hamano
- Niklas Cassel
- Maxime Ripard

-K
