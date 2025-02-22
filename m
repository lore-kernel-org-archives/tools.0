Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62C42179BD
	for <tools@linux.kernel.org>; Sat, 22 Feb 2025 00:13:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740183182; cv=none; b=hWeenHXjQ3tpe0nA6Og6tLm8fdi8F0vInVXVtbURVQByrrhjZVrFKwuLA1d7AxX0jj96sOHoo1kyQ7Riv6rdOkkr8IeSlqy9IFKKR6CBpKO80Wehk/brAAHwdpBNx7oXwAoAuDL1iaKOqzSYRkM7OVM+lwG+TYTQ/rcZ0XE1pDQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740183182; c=relaxed/simple;
	bh=uyVgFQvtTkKgohBsW6C08tNWtKdlcOCmiKAbDSSXSr4=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type; b=q6WVMkBhqsPsFAu06wuJ4h9pLnL2cCCr1tLdlZLf+idqEDxm2KCj/gK5TY3CLhU9pRuGXhxuv8SRC/qe8EfMlBe3OSJE9KGTIjTo7Qs66znK/oizH8d/xB57jjWysbYUzfH8QVc7dzjjrdIxS0uSlg60m8WwExrgKk89SThCqUk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=kloenk.dev header.i=@kloenk.dev header.b=INKzdkN7; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=kloenk.dev header.i=@kloenk.dev header.b="INKzdkN7"
Received: by smtp.kernel.org (Postfix)
	id E07E7C4CEE4; Sat, 22 Feb 2025 00:13:00 +0000 (UTC)
Received: from gimli.kloenk.de (gimli.kloenk.de [49.12.72.200])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 731EEC4CED6
	for <tools@kernel.org>; Sat, 22 Feb 2025 00:12:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 731EEC4CED6
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=kloenk.dev
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=kloenk.dev
From: Fiona Behrens <me@kloenk.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kloenk.dev; s=mail;
	t=1740183167; bh=uyVgFQvtTkKgohBsW6C08tNWtKdlcOCmiKAbDSSXSr4=;
	h=From:To:Subject:Date;
	b=INKzdkN7RME66pTPgd8QvOead8X7K2ccdPQ6nOUFITrWl8vBiKwJd32KEkoQIGj3E
	 g6xznEro/Qs0Wr/LKoSHxez+nBKrq9P+CB31qTEhGNhK0yIRpeLaQSCpYsQdQe9dnf
	 3U6nqk8AkGx7sM9EvUgYDiV2wnrueaAAIzcaU9zA=
To: tools@kernel.org
Subject: b4: wrong base-branch in non commit tracking info
Date: Sat, 22 Feb 2025 01:12:46 +0100
Message-ID: <87eczqygzl.fsf@kloenk.dev>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Hi,

I'm currently trying a bit with adding a git notes based cover letter
strategy. While working on that I found that if the cover letter
strategy is not commit, and the user preps a new series with a fork
point (-f) the current branch that is checked out is tracked as base-branch,
even if current commits do not appear in the fork point.

Didn't yet understand the prep base code sufficent to directly send a
patch.

I'm not yet sure how well a notes based cover letter stragety will work
and want to test it before sending a patch, but the current WIP branch
is in my git[0]

Thanks,
Fiona

[0]: https://cyberchaos.dev/kloenk/b4/-/commits/cover-strategy-notes
