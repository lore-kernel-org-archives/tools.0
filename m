Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 976724FDE65
	for <tools@linux.kernel.org>; Wed, 16 Sep 2026 14:28:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789568900; cv=none; b=t3gQBR3gX6RMbl08rEdxPiSZMz6gbyezv4pjn1z+ne2e6ItMwlKn7IQEkFKymEOVe0a3e+bctr08YJvI9PkKNbrGx4UWRw7TRyGnfRCGcwu1S+yvevSLNeFb0lGmMTCns3Ii3yPNo7nJNzeKDfBrBuW3TUSIAXPbXyL0anMRpik=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789568900; c=relaxed/simple;
	bh=9pTws3geiYO97pfEQh5BhUjoeybowk3Vayn3wdHV35E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=P+JZYBc4cglRO9+1SWOMLXAiCPaedTn4I0+3t6txBmfT7MGMc8E3BH6rlK+klYDck2Zx3veSqotwYFmfIi+pEqR52j+2Q0SiGibWbWsN1eXTjy3DPWkCtCMXvmAYkqF+GIMpxaI1z+ymTAwl/oFV8tgtF/sWDZKgLN7lLLhN0GM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YYeXGY5L; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YYeXGY5L"
Received: by smtp.kernel.org (Postfix)
	id 3F0641F00893; Wed, 16 Sep 2026 14:28:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C3FE61F000FF;
	Wed, 16 Sep 2026 14:28:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789568899;
	bh=9pTws3geiYO97pfEQh5BhUjoeybowk3Vayn3wdHV35E=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=YYeXGY5L6WM4B9qaC6ZebM6a7Nf/x4Usx8zwUglLLkX/t1iPIXl9tC7XYGJnnhPC5
	 cU47PwYkomKgu4HG0k6SeMcqbtDNTf8GSSBD2WRjjmVJmfMvIUhJKzxJfg4uaz93oJ
	 +agMdITqC3jPIezv5VGV7qM0Z1hdSub8FmaB11QOGjXT8gHzyW/fHMuXZUgag07xGy
	 lQVhCBynqbJcQixLx6W4Xbjmx6SNTr1KXILf/ROX2LPFFOc6QARZ1Dy5fstda28n7X
	 f5HyGSjH2kI20gTdhwOE+39eZ4uIYZnyNUI/M30YtbpTHGTi72G6NBSiMJqjWAQk7o
	 wBd3n95hXauFg==
Date: Wed, 16 Sep 2026 10:28:17 -0400
From: Konstantin Ryabitsev <mricon@kernel.org>
To: Thomas Bracht Laumann Jespersen <laumann@gentoo.org>
Cc: tools@kernel.org
Subject: Re: [b4] Suggestion: make ezgb + git-bug optional dependencies
Message-ID: <20260916-ferret-of-unreal-enrichment-b1ce7e@meerkat>
References: <87v78962r1.fsf@gentoo.org>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <87v78962r1.fsf@gentoo.org>

On Sun, Sep 13, 2026 at 09:15:30AM +0200, Thomas Bracht Laumann Jespersen wrote:
> I'd like to suggest that ezgb and git-bug become optional dependencies,
> essentially like textual is an optional dependency today. The reason is
> that by default "b4 bugs" prints:

This makes sense. I've added it to master, but I don't really want to backport
it to 0.16 to minimize the churn in the stable branch.

-K
