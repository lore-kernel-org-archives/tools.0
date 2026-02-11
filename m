Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD633332911
	for <tools@linux.kernel.org>; Wed, 11 Feb 2026 16:10:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770826206; cv=none; b=VWslKbJqxOl2uzWtgbbJ/H8eo8196NpgSFwnQTwGJFFgV9SmVMM4EeczsF/kwvUVQo+z2URX7LbMs+otk1kbiXHu4SdbsBwzRpxJqBJdYtdu9NIRNXMsTdWM3zrUlu2Ac4A27clhDCnRyqkmJOoH7ZUkAzFz3MsWjB4+KVHDVN4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770826206; c=relaxed/simple;
	bh=uM3vfdbGcgHa4PW/W0SkXRELxkT92NLub2IpvBXS7PU=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=fyE61Fc+obwINpCOssW9EU5e28zJKeNn5Ah36xQNeWKgtNRtwEZAlegHo5jcaGyeDHAXX0dY73Y2Q0hIgCVl8XRjrkb0XJOvYBYe1PCFfsUBoO9WlXGiqX2sxoTk5C5HJwMIdGhNIeqS/SF7XerwOULgi7nYnoKoextKTc6rS+c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JS0z9zqt; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JS0z9zqt"
Received: by smtp.kernel.org (Postfix)
	id 87D09C19424; Wed, 11 Feb 2026 16:10:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 52FA0C4CEF7;
	Wed, 11 Feb 2026 16:10:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770826206;
	bh=uM3vfdbGcgHa4PW/W0SkXRELxkT92NLub2IpvBXS7PU=;
	h=Date:From:To:Subject:From;
	b=JS0z9zqtAOyL/f1H/yt+rOqoMgWWXL0X3Hp3QLxpkuFm6cTtw4KRGUFDFewvFkFd1
	 GrksbYCRrcztcjpsz95PMETi7mfzOUABH4/jvU1rtk5UGWSx0t9+OI12O8aA1/Il0L
	 X/L556ljFOF1slPXIjj31ctDdIcZeD+lRJfRRoZk+KnYru0s8n7Bj9+Sj0n6zUvCJR
	 F3mPtsKkvjTrVvjtnxi4dZDATk1Tz38Y+/m5EyAgR2N1rQ/KgjWDJd83YaloBhj23c
	 Pyw7A51y7reG2Gl5wDwDK50E3jNmca5bRnQAE2Nvy03ARn6gpAjNP0+M1L76vXy2c6
	 h/HEYfZh9gXGg==
Date: Wed, 11 Feb 2026 11:10:05 -0500
From: Konstantin Ryabitsev <mricon@kernel.org>
To: users@kernel.org, tools@kernel.org
Subject: korgalore v0.5.2 now available
Message-ID: <20260211-courageous-ringtail-of-judgment-ae8c68@lemur>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

Hi, all:

Korgalore v0.5.2 is now available with several bug fixes.

Bug fixes
---------
- Fix non-lore feed URLs creating invalid directory paths. Feed URLs from
  non-lore sources (e.g., https://someothersite.com/foo) were used as-is for
  directory names, creating invalid paths under the data directory.
- Fix crash in legacy migration when the git directory has no epoch repos.
  An interrupted clone could leave an empty git/ directory, causing the
  migration to fail instead of falling through to normal initialisation.
- Initialise delivery state after first feed clone. Previously, the first
  kgl pull after adding a new feed wasted one full cycle because delivery
  state was not set up until the next run.
- Fix crash in kgl pull after kgl track add. Tracked thread deliveries used
  a 3-tuple but the pull and retry code expected a 4-tuple.
- Fix shallow clone failure for dormant lists. Lists with no recent messages
  (e.g., lch) caused git clone --shallow-since=1.week.ago to fail because
  git cannot establish a shallow boundary when no commits fall in the time
  window. The clone now falls back to --depth=1.
- Cache is_empty_repo() result per epoch to avoid redundant git subprocesses.

Full changelog and documentation:

    https://korgalore.docs.kernel.org/

Source repository:

    https://git.kernel.org/pub/scm/utils/korgalore/korgalore.git

Install/upgrade via pipx:

    pipx upgrade korgalore

Thanks to the following people for reports addressed in this release:

- Dirk Behme
- Krzysztof Kozlowski

-- 
KR
