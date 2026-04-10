Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD1F53DE44D
	for <tools@linux.kernel.org>; Fri, 10 Apr 2026 15:21:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775834466; cv=none; b=rGWOaj4RMWC1TeJAsX457caAXttultIKUeccNnc+MYklunvQiZIN9RNF6WCQLkVSQngJBzoYc3Y0E9xc04g8FdTCkjTYiHdEpUrXxlVwgQVOY34U+FcsH8M+ll04L62tqshZnMcuxVLtxnxHI+dtXvYBt6R1WXh4JCyEEkakCiU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775834466; c=relaxed/simple;
	bh=Ja/xCaQ8K09MJTUOVdeRJ2eESE6r6n54uFY44tsn6B4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QzN8AoGQNp8s9kXiIRZVPL+PoWhAcbm4qeMtOHKw/gmfKwykjp5I+uPijFCsvvim8SsUITsMIFzRic11zMpJJe0ZeIHnHv5NDsZWLehbW4tUM/YZhbIq2s9qH+VZ1p64aMBEWMFe1Y+gNR9Ij9MYVI+nW5nfuzlkJEhFiu+j3w4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=AnVuiClt; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="AnVuiClt"
Received: by smtp.kernel.org (Postfix)
	id 6F358C2BCAF; Fri, 10 Apr 2026 15:21:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3AC10C2BC87;
	Fri, 10 Apr 2026 15:21:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1775834466;
	bh=Ja/xCaQ8K09MJTUOVdeRJ2eESE6r6n54uFY44tsn6B4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=AnVuiCltwDP7qk08w8NQw4kTjrcc4mecmscmpDfBr4XAeXWW5nsekv726dtKGMt8F
	 ocAhbkg1i7lCfnHKoe24dipuYnDTEzAof2sbezC2mfXwsbZp6OnkXAyCWzTsdge/Yh
	 R3rWdPHUed1SwjhKQrqpaxy1A9ob7efVE+v1TW/o=
Date: Fri, 10 Apr 2026 11:21:05 -0400
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: Tamir Duberstein <tamird@kernel.org>
Cc: "Kernel.org Tools" <tools@kernel.org>
Subject: Re: [PATCH b4 00/12] Enable stricter local checks
Message-ID: <20260410-soft-funny-platypus-e14ad7@lemur>
References: <20260407-ruff-check-v1-0-c9568541ff67@kernel.org>
 <CAJ-ks9n_cg=NNFKYKoJPR1AzzxMRa7CB3i2Vz2SgWbG=ZeoSxg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CAJ-ks9n_cg=NNFKYKoJPR1AzzxMRa7CB3i2Vz2SgWbG=ZeoSxg@mail.gmail.com>

On Fri, Apr 10, 2026 at 11:05:31AM -0400, Tamir Duberstein wrote:
> > The last patch wires the review TUI to run the same local checks through
> > a JSON-emitting series check helper, so reviewers can see ruff, mypy,
> > pyright, ty, and pytest results from b4 itself.
> >
> > Signed-off-by: Tamir Duberstein <tamird@kernel.org>
> 
> Hi Konstantin, any interest in these changes? I see some of b4 has
> been moved to liblore, but I believe that package has the same type
> checking gaps. No worries if you're not interested in these patches,
> but I wanted to demonstrate that mypy (even in strict mode) is still
> quite lax (e.g. it doesn't warn on unreachable code).

No, I do want to see them -- it's just with the latest changes in master the
series no longer applies and it got pushed down in priority. If you want to
target liblore first, that will be an easier target for me to take and then we
can revisit b4 linting changes.

-- 
KR
