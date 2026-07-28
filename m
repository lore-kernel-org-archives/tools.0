Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D752435ABE
	for <tools@linux.kernel.org>; Tue, 28 Jul 2026 18:25:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785263111; cv=none; b=n/uUJTCoG9DVfpCPRMJ7u1y74qWpJb0Q1U/qTuzeM1zW5xww4vhiLeA1bzv/KoWow3PYs01gjyoMA/tSta/+sqc90RBr3BcWdJyNl2sxWhS56m874q7glGT7pt1VczroBPZbYfvu0O21UKW+JbzuFLNBRt4FM8dB1cXom7+JTXU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785263111; c=relaxed/simple;
	bh=X4hk6lbLsPS/vISstuhyEBdORoI8KBzZI58vMBk3tYA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Eg31XXaqviPUKzLRlEsXqOLKuFPzo6HrDXEUAzvURpQJpWxxjOs17/MvC3DDHj2ZMDnktCyuwT9oMpO5U0pzdtX3s8A2Nwc3iS88Cn3AuAzIxt5lzl1VFC0UZBndzgT16w8+C0z+UriZqFBaOEgFCUSdgxayptN7pr7e7ldqZ8s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=DSg0JqYv; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="DSg0JqYv"
Received: by smtp.kernel.org (Postfix)
	id 1B0CE1F00A3D; Tue, 28 Jul 2026 18:25:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 931D01F000E9;
	Tue, 28 Jul 2026 18:25:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1785263110;
	bh=w6b2Nwt+NVN5ekAqOgx6zHFnFBA9a4or2l0IID7pO6U=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=DSg0JqYvK80QqdD05yd+f7J1puyK4Uj1zLgMcCoKRwmaEr4/pVZbgRUle2LuHoVzv
	 eOfFYUBVwOwmvtvVmZcW0bqpWU8nGjiVSxyQ+jJAraWeaFt2aD4k5QtE0W4Nx/ddfF
	 PP8juDzydw751bKiYRC3Iz6vnL89Yo/2WK1oTYco=
Date: Tue, 28 Jul 2026 14:25:07 -0400
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: Mark Brown <broonie@kernel.org>
Cc: tools@kernel.org
Subject: Re: b4 review surfacing updated serieses
Message-ID: <20260728-precise-speedy-fossa-cfb4ba@meerkat>
References: <b356bccf-8e14-41da-8369-53eb442d0f30@sirena.org.uk>
 <20260727-innocent-zippy-sambar-51cfe4@meerkat>
 <2eccbfad-af34-4f0d-81b8-2f38735a9780@sirena.org.uk>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <2eccbfad-af34-4f0d-81b8-2f38735a9780@sirena.org.uk>

On Tue, Jul 28, 2026 at 07:10:25PM +0100, Mark Brown wrote:
> > I've reworked the upgrade flow on a branch (feature/has-newer-first-class)
> > to cover both the waiting-upgrade awkwardness and the stuck-partial case.
> > Please give it a whirl -- it should be safe to try/back out as it doesn't
> > change the db schema. I don't have nearly as many series being reviewed as you
> > do, so I can't fully test it beyond what's in the test framework.
> 
> I've merged it in and have been using it today, it's much easier to work
> with and I didn't notice any issues.  The up arrow is particularly
> useful.

Great. Thanks for the feedback, I'll merge it in.

-K
