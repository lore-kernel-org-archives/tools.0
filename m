Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AA6F30E83F
	for <tools@linux.kernel.org>; Thu, 25 Jun 2026 18:36:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782412596; cv=none; b=sMxKu3jgbQWqeiqYsLu87xkUsi9vaWyKJ9sHYFpyUYQJR84V4BYLDpTb5HpVYqnWG7Jl1JQ/myVu/fYZNfStPPZ0mXhQj+aQ/fkKW/zs684WxAm2W6lFeGoWSvkNEI132dbc/VaPa9jJ/phv3M5er8Avm1hmZwzP+bmCDO7RjuA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782412596; c=relaxed/simple;
	bh=1t44ZSxYfLBKkPfbCjV2o3Zj9HHE57QOq8+Cch/72F0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=juFSw19DDMB9OGQ8z/k7WdtBosXKQiR5XlU6rSyyCfIBi6Bcl+9AKJ7PnvZKfIX/Jy9E9Nk/4DRc/YNrd7oIQkL+Dc8lNU8KrTORTwlBhBas104d86WYefwShfIZA4AB4brZ8X1fjZ4oUTilZMS0jMFRp1gzwu9M5T83hPn/MQ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=aQCaCboB; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="aQCaCboB"
Received: by smtp.kernel.org (Postfix)
	id E248D1F00A3A; Thu, 25 Jun 2026 18:36:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9B8C11F000E9;
	Thu, 25 Jun 2026 18:36:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1782412594;
	bh=Pp1fgSZ7CAzy7a4ywhjSL8o46R5iYnKOJZ7pc/Qv/fk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=aQCaCboBfOg9O9RFMEhsInyGuza1yoIhBdIiz6ZJeCU8bpCsClDomYVxnr8HYZ5rw
	 6vnVPGlAp6apbdJWI3GR5Wh5rgSOhz43DjxKLswKgmp5qmYmMN7RJqcJBgfT/qTosl
	 orL7i3Gv98ZT7CG0Rz6O9EjisEgrrY0ZPF2fSC3s=
Date: Thu, 25 Jun 2026 14:36:32 -0400
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: Christian Brauner <brauner@kernel.org>
Cc: "Kernel.org Tools" <tools@kernel.org>
Subject: Re: [PATCH RFC 0/2] review-tui: add a "cherry-pick + merge" take
 method
Message-ID: <20260625-liberal-centipede-of-finesse-7cffcd@meerkat>
References: <20260625-20260625-review-tui-take-cherry-pick-merge-v1-0-8ba4809d048a@kernel.org>
 <178241246473.56008.7989203027158709620.b4-review@b4>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <178241246473.56008.7989203027158709620.b4-review@b4>

On Thu, Jun 25, 2026 at 06:34:24PM +0000, Konstantin Ryabitsev wrote:
> > The review TUI's Take dialog can apply a series three ways: merge (a
> > cover-letter merge commit of the whole series), linear (git am onto the
> > target branch), or cherry-pick (pick a subset and git am it). It could
> > not do the combination a maintainer often wants: take a hand-picked
> > subset of a series *and* record it as a cover-letter merge commit -- the
> > equivalent of "b4 shazam -M -P".
> 
> I don't have any specific objections to this series, especially since it
> covers a workflow gap that is useful to you.

Forgot to add -- feel free to submit dropping the RFC and I'll take.

-K
