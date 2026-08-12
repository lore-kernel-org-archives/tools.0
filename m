Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5ED9635AC12
	for <tools@linux.kernel.org>; Wed, 12 Aug 2026 15:00:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786546820; cv=none; b=HFo/mkDE4IGIaUxxe4my7JVHcFbjLwb5w9MpyrnoxYpfe56zQuFANtkhVDlejbQrnu1TtrJeA5pAJ6YvlsUmJbxup07hMij3jXV+dJ5MRvUTkoxAoKKXVv3ouUvbaNDw41CtZMKMoN26Hxw6h6k99obDNFelYenpowRx/SmGqCA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786546820; c=relaxed/simple;
	bh=efQr/wxlOC0zPwv+xF9t7gJdlr/bOtglejn81lW8dDI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MovFCnmsdwOeaFcoR6u/SzO9DFxWvlUt+yA/bMFpNyJbVd+UULNRqz+6W+BwqTmHiscJnBB4xPIRt91l3yBuCbW4TUhdzz1VPd3fCYw7PCmzYQ8PoaOZXnhRQnq5IcMuGyc9fZwC0o62aiB4gOTD/THAfzeIYB6yOpDWKwGtHnc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=ra21FcmO; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="ra21FcmO"
Received: by smtp.kernel.org (Postfix)
	id DEFBE1F000E9; Wed, 12 Aug 2026 15:00:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8219C1F00A3D;
	Wed, 12 Aug 2026 15:00:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1786546812;
	bh=BHyHcbZrl4y3UAOF6FklyrJC9TBbFU0Ld8b2n9woisg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=ra21FcmO+lmXOvAh3sgEXM5+TQEYMxJd83Tqxfw91Z/SJvKiqc95gN/ISMM/niZ2d
	 z4QDG+iGedqnVdNnn9g6aftZ4uD46iioS47sWlC+8SAEmkbxxN9PGNN9Ta6lHOC3XE
	 PH/SA4vLYD1MQonydbvYpb7PfzY2GQ7aXULZe+uc=
Date: Wed, 12 Aug 2026 11:00:10 -0400
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: Mark Brown <broonie@kernel.org>
Cc: tools@kernel.org
Subject: Re: b4 review misses a patch
Message-ID: <20260812-omniscient-tan-heron-fc7035@meerkat>
References: <8d7fc80b-e303-4f2c-9890-8408bd5d27ac@sirena.org.uk>
 <20260811-spicy-woodlouse-of-joy-7fa3fc@meerkat>
 <20260811-beluga-of-theoretical-engineering-5ca1a8@meerkat>
 <7b541824-f3f1-46cb-a50d-32bd88068c57@sirena.org.uk>
 <20260811-maize-whippet-of-plenty-9a5b30@meerkat>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260811-maize-whippet-of-plenty-9a5b30@meerkat>

On Tue, Aug 11, 2026 at 07:38:04PM -0400, Konstantin Ryabitsev wrote:
> > Hrm, that doesn't seem to have worked.  I wasn't actually using
> > submodules, I had to run 'git submodule init' to even fetch them, I'm
> > invoking b4 with:
> > 
> >    uv --project ~/git/b4 run --extra tui b4 
> > 
> > but even upgrading all the deps with uv doesn't persuade it to upgrade,
> > I think it needs a liblore release and a pyproject.toml update?
> 
> There are ways to make it work, but I think it's easier if I just release
> 0.8.2 so I don't make future upgrades weird for you.

liblore-0.8.2 is out now and dependencies updated in master -- you should be
able to pull it in.

-K
