Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 953C0194A66
	for <tools@linux.kernel.org>; Thu,  6 Feb 2025 18:09:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738865378; cv=none; b=mUvECYS729vamxccCNprjUDOUm0CSRx4sbUD6sG6Z/hDXVkX/3VTy3Y4BLrxtNQy/WKpIJsiDZWSU2+LmAE65Y1DK1NoiN5wq32jHr59JyCZlcIXqIlCOjQWDtGqVYYkWBT/mS8eeDqQjwtxL0iJkiLz0LXcP+K+MTBgzPsIHe4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738865378; c=relaxed/simple;
	bh=9eAczyEpAefNSq3WMPP2PTbR5XMJCGlNertRJC4MKJY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZFatAAtxHk+yh/J4kzSMdFGV+OkSkJxvUDEdQtaF+LMdWyoqSA1xaa7n6vbplY9/Q8G/stlOzXXAS/jAHzfO1xRsKZuN6F75tr909kNi3ygr5K9z3clSJd9N2wUesonnWcf2bpmUZIF9RVBnGRlJWlDWZeT1u5m2xfblFNzyb6w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=NSPZJsnl; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="NSPZJsnl"
Received: by smtp.kernel.org (Postfix)
	id 1C9D3C4CEE2; Thu,  6 Feb 2025 18:09:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CD1D3C4CEDD;
	Thu,  6 Feb 2025 18:09:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1738865378;
	bh=9eAczyEpAefNSq3WMPP2PTbR5XMJCGlNertRJC4MKJY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=NSPZJsnlUiyA+yzeMJTFXMhwjrODEpGYxKPSRx5yn3P9iuaW5AoacQ89guc06a0vd
	 Y9dmOdjCGB95nOONLf92UtIOEFzocLlbfKMx+eV0gkqD8IdWUHn9eXBzeNHUQMzHev
	 VenOIAAn5YHx+uCTpfZosm4hiRwIJvEo/66CDpkM=
Date: Thu, 6 Feb 2025 13:09:34 -0500
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: Antonin Godard <antonin.godard@bootlin.com>
Cc: "Kernel.org Tools" <tools@kernel.org>, 
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Subject: Re: [PATCH b4 0/2] prep, diff: support overriding range-diff
 creation factor
Message-ID: <20250206-dramatic-sparkling-millipede-a33bb0@meerkat>
References: <20250204-creation-factor-v1-0-9988d594a018@bootlin.com>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250204-creation-factor-v1-0-9988d594a018@bootlin.com>

On Tue, Feb 04, 2025 at 05:44:15PM +0100, Antonin Godard wrote:
> git range-diff allows to override the creation factor, which is
> sometimes useful to adjust for seeing different diff outputs. This is
> not possible with the current code, and is also not configurable from
> git config.
> 
> Add an option to diff and prep to override the default creation factor
> value.

Does it make more sense to have a more generic way to provide arguments to
pass to git-range-diff instead of duplicating options?

E.g. something like:

    b4 diff [...] --range-diff-opts="--creation-factor=80 --left-only"

We'd have to re-parse them with shlex to make sure they are safe, but it seems
like a better approach, no?

-K
