Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE9DA2BE7B6
	for <tools@linux.kernel.org>; Tue, 24 Mar 2026 14:23:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774362208; cv=none; b=fumdTgYN/FU3aV9Su3Ci0XdUk7YU4A4bAxGKyfqX5HQjrcd1g5u/U5o/GCCQJQDYNsJ+Xm07HUUdfD3y+uHuYJX8JTk5hMEviYuOs4jcJz1w+A3iCvmNEoMbwME6JbyjqwO7MB4ZTudI8Cbd/guZpal/wGU3PAn1/Es8A8zrbDI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774362208; c=relaxed/simple;
	bh=2/Bar0HHRM+yeRWVBgIF63L7ObgAF7wnadBlPJiBgEE=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=mndSpIPBHliDeckUKhnhCR/JNCjczxkKsFxf7MaZynRyMQJjKzZ3Lfdfm7wt46UsXMHBN1MzU8o9blpm/GAUHVig0ODpFhYmWNz4LtDVeh/8rKCCzIQxLQMweKQw5p55alKZ86yvvynyj74HktitmQLxo/ODQxDJk3QkXPRk4N0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bptJ8zn9; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bptJ8zn9"
Received: by smtp.kernel.org (Postfix)
	id 6B00BC2BCB2; Tue, 24 Mar 2026 14:23:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 49622C19424;
	Tue, 24 Mar 2026 14:23:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774362208;
	bh=2/Bar0HHRM+yeRWVBgIF63L7ObgAF7wnadBlPJiBgEE=;
	h=Date:From:To:Subject:From;
	b=bptJ8zn9QblZ82KT3tUUI7UZCB7EMv+OR2JZ76UCriBFNfdESI4zH504Ae7Mye50m
	 0bAD84/bWhk4JiRfDFaZ7w96ntfeofZsgdK3B2roIEp0xmA3Ll3gvDUoiKUblMLFIK
	 ZeAyjdGMdKQ/y9/QQm1Bpv67mYA0wg+7mITVWIT+Nlgm2sjYz6jYcKX8qd4RQbdR6F
	 NiJwXMOUmqT/Rh5hrBZVqs5S9D0WT2Ap1KgbdFHl/7PWR7kSmqCkmTsUHnu+cCUTZG
	 CY2pD2GFPCCE9u6hr5Apn/QqPIfCWIzRlytHy77mZcDp9LtudD3+/jnopyyfKYB6Hd
	 h9BtdhJjKA1UA==
Date: Tue, 24 Mar 2026 10:23:27 -0400
From: Konstantin Ryabitsev <mricon@kernel.org>
To: tools@kernel.org
Subject: b4 v0.15.1 released
Message-ID: <20260324-stimulating-hypersonic-caracara-78d6e5@lemur>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

Hi, all:

B4 v0.15.1 is now available with a few bug fixes. Upgrade using your
usual mechanism:

    pipx upgrade b4

Bug fixes:

- review: fix patch list not scrollable with mouse on large series
- review: fix CI results list not scrolling to follow keyboard cursor
- Fix test suite failing when run from release tarball (no .git dir)
- docs: fix incorrect b4 dig examples in release notes

Thanks to Jiri Slaby for the test suite report and to Chris Samuel for
the review TUI scrolling reports.

Best regards,
-- 
KR
