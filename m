Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF4A717A2EA
	for <tools@linux.kernel.org>; Thu,  9 Apr 2026 19:03:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775761398; cv=none; b=UppBxgKgy5QvCxO/dqvT93ZifTL69SYQODY069QYK3GhZWnCxmmoqZh2it225sHQsZIsm9s/2QTQBPTyVZGJgdER0RpQzyfMcfV/8Iyx7p7Agha34FYYnWtBIJq56pKm87YCHsSYwPjqw8QdyxXCwHdfLAaCEnAFEsBWwxrNFdA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775761398; c=relaxed/simple;
	bh=fkKgR68G8ZppUnyI06sML+UCHFJ3j7eKJQ4016r8niE=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=UZZHqH3DSew3RFjkFSwHJ3Nje4Qp92qva+UzRvgVdbs4DfHQeEWKkwF3vfzql0e9dsmoXfRltp8OkwWCKkxPCDpTwVhk/kgQzuaLFmC6MkEHIwc4Q/UYoLTbp94u4NoaJO/Zf3LcrT4M4uf0bsCsXBQVJrOuymauQwm4Y0/tdDA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UN84Pxmp; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UN84Pxmp"
Received: by smtp.kernel.org (Postfix)
	id 83CD1C4AF09; Thu,  9 Apr 2026 19:03:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 42A10C4CEF7;
	Thu,  9 Apr 2026 19:03:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775761398;
	bh=fkKgR68G8ZppUnyI06sML+UCHFJ3j7eKJQ4016r8niE=;
	h=Date:From:To:Subject:From;
	b=UN84PxmposJWHLuCV4ungQavrt8/ukE+xYjAziKhKTUYhgo1L9X2dyyaIlsJcpkaD
	 XWl7lYb45nb3XQOFjhr01ao2wfemZFdswDx6q1d4pqbhkl8qrYtZO+5w4QhgE/d0QH
	 Fs7kHVJ/XThkxob+DLwTB0/gCw6uQaRqH6VyITzg380myFdiPUnnw00pzldOlnfwgH
	 AzbGyVv4Ivi3e/RS1//ADfsTEaBU1rJ0IOMgY7ahQEZUYf/7KFPm61JeV6Snk97Quu
	 VSde7Xw2ZyFW6U7tmhvWw7FTiBXhnZSgHRxp0ubTooQt61Nn3lGJfI8FloJBKUFJZq
	 ooTo0tg2xn16g==
Date: Thu, 9 Apr 2026 15:03:15 -0400
From: Konstantin Ryabitsev <mricon@kernel.org>
To: users@kernel.org, tools@kernel.org
Subject: b4 v0.15.2 released
Message-ID: <20260409-daffy-maize-bettong-297fde@lemur>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

Hi, all:

B4 v0.15.2 is now available with bug fixes for the review TUI and mbox
parsing. There won't be many more updates to the 0.15 stable branch, because
the master is diverging rapidly and backporting fixes is becoming challenging.

Upgrade using your usual mechanism:

    pipx upgrade b4

New feature (introduced in response to a bugfix):

- review: show visual cue for patches unchanged between revisions --
  when upgrading a series, identical patches now display a dim "≡"
  marker so you can focus your review on patches that actually changed

Bug fixes:

- review: prevent double-sending of reviews carried over from a prior
  revision after a series upgrade
- review: fix crash when stored message-id points to wrong version
  thread after a series upgrade
- review: fix IndexError crash when toggling followups
- review: fix crash when background rescan completes while a modal
  screen is active
- review: fix replies to additional patches being treated as inline
  reviews on the wrong patch
- review: fix range-diff failing to find previous series revision
- review: fix upgrade branches polluting tracking DB with wrong
  change-id
- review: show per-series error details after "Update all" instead of
  only a total error count
- mbox: don't split on "---" in free-form reply messages (fixes body
  content being silently discarded when encountering a "---" marker)

Thanks to Mark Brown and Miroslav Benes for the bug reports.

Best regards,
-- 
KR
