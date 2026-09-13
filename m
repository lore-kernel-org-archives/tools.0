Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0D6A3B1EF2
	for <tools@linux.kernel.org>; Sun, 13 Sep 2026 07:15:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=100.103.45.18
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789283744; cv=pass; b=a6ShjU76vXiSLQb9WKb6yX0sIXgJr7gdKA6f4EbQdM6Xgxftzqw+d+BX6OsTr0LnE2s1ShsfnPqRQ1tlDpMUI9AP1CF3cGp6n6Oy8s0iaaSuKUlGGuB6XpzThCLQLz9h7NDZa7asvWPaSSX53iuUVrnrtEbxtrgExr+M3tRJEmw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789283744; c=relaxed/simple;
	bh=bvMqEgsdgmjlx3RfeCyeA35sni7wExYfO37I6HciGDQ=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type; b=mdGoviroCIodf3ivDzTLcwWtNNRE22Gyrl95CMPs/DmzwGfLCo0GqW8cBlDXaJNcqk+ViVtHizypxs0P7XWm0LXjZV38vi58TXIfwWV4SvluefHFKIiLsCZYmm8ECPGjgOWIG5t/IRUMO46Ao/qpd7kmboCw33fnqR6hn25bhOM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; arc=pass smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix)
	id 5BDD51F00893; Sun, 13 Sep 2026 07:15:40 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=140.211.166.183
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1789283740;
	b=KsZsCJHFt6os3tU0X3bnkTDSrAFt2UYAknS1EbwwY4dIuQkmDGXF/EsZ9E54qqmmeykY
	 wWIYNc/TiaPOozZhb7zRs8zq66MRme/VxuCoS9IACr6k3a5K8ZOUNIi7TK75Dr98EbSMK
	 TYYNn9eCJpo5uBrznyePd/AaJzATClkw1DFEvGSS7Y+wXpQSwPMeE2NTLW/newysc0Vc3
	 Tt+eNIgGLq+MTgU618Dv6bXyX4rsyfx54yOg9rmpaGwpDl0eBOHF/MUceyH+duObHLI5J
	 fJRlQr48DT6x0U6NOJlQhJcbhCP5q89eVqI/vE+nw7Te5uPxvxks91hoVzeIKRQAKMg==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1789283740;
	h=DMARC-Filter:Received:From:To:Subject:User-Agent:Date:Message-ID:
	 MIME-Version:Content-Type;
	bh=1OiS2c7losYwZ3dPw6XE8CHVaupMz1wZbNucqMdYMnU=;
	b=2ZziHzPi6gRZ9quoCA2Ur7PLInpA9Hse0nky1nXnOZnfV8unP1jfEElaiycAJ/50zvSM
	 TC46+PKjhNPMqtRI9wbxQ4i2P/5h3mXxPYAUd7ZZAkmFKcsQxAGCrET4Hkom/QleN98No
	 MNxiTtnEBZeA4syHOSe7Y56iBF8nnRbJNxbCw2JcepUxOFC/f/jiPPda2f4oQg/p+YpvQ
	 QPtVjaPYBTT/+s4pBNepn99wo+BoVD/G5b5mDjN6SGos4NY84wk/7UyP3gCfw8ukqoGXQ
	 32onllF33oyrcwRCRzK8vP8QNwUdiCz5uOQqPMM4mOhrKr8YRlR4zYS8Hv52qU2nuEA==
ARC-Authentication-Results: i=1; smtp.kernel.org; dmarc=pass header.from=gentoo.org;
	spf=pass smtp.mailfrom=gentoo.org;
	arc=none smtp.remote-ip=140.211.166.183
Received: from smtp.gentoo.org (woodpecker.gentoo.org [140.211.166.183])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 7F5CF1F000FF
	for <tools@kernel.org>; Sun, 13 Sep 2026 07:15:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.kernel.org 7F5CF1F000FF
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gentoo.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gentoo.org
Received: from flax (unknown [IPv6:2a05:f6c5:a6d:0:b835:f607:c82:855b])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: laumann)
	by smtp.gentoo.org (Postfix) with ESMTPSA id 308ED340F28
	for <tools@kernel.org>; Sun, 13 Sep 2026 07:15:36 +0000 (UTC)
From: Thomas Bracht Laumann Jespersen <laumann@gentoo.org>
To: tools@kernel.org
Subject: [b4] Suggestion: make ezgb + git-bug optional dependencies
User-Agent: mu4e 1.14.2; emacs 31.1
Date: Sun, 13 Sep 2026 09:15:30 +0200
Message-ID: <87v78962r1.fsf@gentoo.org>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain


Hello,

I'd like to suggest that ezgb and git-bug become optional dependencies,
essentially like textual is an optional dependency today. The reason is
that by default "b4 bugs" prints:

    The TUI requires the textual library.
    Install it with: pip install b4[tui]

which gives me idea it's built around using the textual
dependency. git-bug also seems like a fairly large dependency for a
feature that doesn't really appear related to patch management in
public-inbox archives, and that it's about a different workflow entirely
(tracking bugs).

I took over packaging of b4 in Gentoo and found one unit test that
failed because it couldn't import ezgb._cli (this was
src/tests/test_packaging.py::test_public_modules_import_without_textual).
To fix this test, I've packaged git-bug and ezgb, and am about to update
the b4-0.16.0 package spec to require ezgb. In the process, I got the
idea that maybe it would make sense to have these dependencies be
optional.

All the best,
-- Thomas
