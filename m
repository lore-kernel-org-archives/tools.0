Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E8EF13D53C
	for <tools@linux.kernel.org>; Fri,  2 Jan 2026 20:48:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767386901; cv=none; b=X3TsQ7rRDcLmFiMLHwtHnenf6t5OJbwnxszciMETHti9enyUrbEK3cTZ5Pd3wl1j2K0EQak8iVAQ8FSaZBsKCL9xPvSLGS26sLvwDltu8aYQ2RhbM+sUwDU2/L427xIltQYveM/bshRO7CK7rHapSxbKdYHiWNHM0SfrvEKrhM4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767386901; c=relaxed/simple;
	bh=FdY715uMj+kwECzK/Nw9MHh/NFhfYiwh2FTrmeEwBrE=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=RYdMwxTEW6vjH8MoomGaVNFBUUZlBayu7xhKTpiSyz6YDw+Wx3jU5vzRF7C3BGHqgtZcPjEruGdNHv7KpbSWTlLSGUZz8ABN5LjC20OgKMY0Pf610rxDAFnxgBP48ZED/+VV2m2sYnQigfTdeViH8/u/kQ57flLdpVRKQ+VH1XI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=bWteLYmc; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="bWteLYmc"
Received: by smtp.kernel.org (Postfix)
	id 74BE7C16AAE; Fri,  2 Jan 2026 20:48:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 31309C116B1;
	Fri,  2 Jan 2026 20:48:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1767386901;
	bh=FdY715uMj+kwECzK/Nw9MHh/NFhfYiwh2FTrmeEwBrE=;
	h=Date:From:To:Subject:From;
	b=bWteLYmcV/34yedSAx+FKeWBGtcpVPzmoxFddYXUCOpsUmvyd+NAsVHTxfaYqov7Q
	 mir/Kz/m64jUBw8CJ1cEhyQxD+LVAgX/Wb4/iF8XYdCJoy7A5/A2dL9qYa49q4kX9y
	 qJLU36R254H1bw4wc9YR3KysdcG/bWZjnBM7OZf8=
Date: Fri, 2 Jan 2026 15:48:19 -0500
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: tools@kernel.org
Subject: patatt v0.7.0 now available
Message-ID: <20260102-turtle-of-beautiful-prowess-b96ead@lemur>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

Hi, all:

Happy new year!

For yak-shaving reasons, I needed to add a way to add keys to patatt keyrings
that wouldn't leak people's email addresses for harvesting. The main goal is
to automatically publish people's keys that are submitted via the b4 web
submission endpoint without necessarily leaking them.

Keys submitted to the b4 endpoint will be published as a keyring with
obfuscated entries like:

    by-hash/XX/YYYY...

The exact details are on the following page:

    https://patatt.docs.kernel.org/en/latest/maintainer-guide.html#privacy-preserving-by-hash-lookup

Full changes are available here:

    https://git.kernel.org/pub/scm/utils/patatt/patatt.git/plain/CHANGELOG.rst

You shouldn't need to update patatt separately if you're using it -- there are
no new end-user visible features, and the updated library will be pulled in
with the updated b4 version in the future anyway.

Thanks to the following people who helped with this release:

- Paul Moore
- Tamir Duberstein

-K
