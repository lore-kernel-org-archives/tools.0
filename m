Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CB502D0614
	for <tools@linux.kernel.org>; Wed, 17 Jun 2026 15:15:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781709356; cv=none; b=KhjuBg5DD8kN7AnnMAu5TOCmtZZNvwTppvSG9Bczy6rtKslL8NcjrVpNmif3zSrGRZi+0tV6p5Fc7n+JCJdKZvwCamBGjobgFk+6R9UtSUCJ3yTkcAOoF7ucePOTfl2P5qk32wC2sWOGC+1/57qlo+DrROX4/+tPK5p5GdEbE8M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781709356; c=relaxed/simple;
	bh=x6mlvjNWNH+JVm2lDUByPdP79cjwz7lLCVED6po774w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=J9zCR9UK4nPo1iIkZGrrnLRfJLRw+ZX8V4jsQW3nSDxDfzLICBCjBRoLopacWX4xuKeGzwa5d1LgN3n6nURHRlydyuoBRW3JWCSsSL4WK/uAVjNiNerjlkOlKTWnVoy4c+gY7mSxN/LTnX3PMTgAWP1rJXmUlbIeufISmQNk0HA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=SnQCGLuL; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="SnQCGLuL"
Received: by smtp.kernel.org (Postfix)
	id C669F1F000E9; Wed, 17 Jun 2026 15:15:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 368EC1F00A3A;
	Wed, 17 Jun 2026 15:15:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1781709354;
	bh=PRtwX9XZuKeOePBQ1eaXIZKRl+06gjsxGdVK1OpTJto=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=SnQCGLuLG6CoDNtPjBGeifYyw4Q5oqmW4Wje3sAiyfVUKH81TG114bc1QrLiGivRX
	 i6osstjx2OzdrQH8fZuKZEq+j38LZCpiO8ePbHj3Ix+jcdKUkIgDtQ+ydapMv7Qx61
	 EpwcnJkvHen2ne2XtH2K5R3ZYJwJDYy1xnBteMsI=
Date: Wed, 17 Jun 2026 11:15:52 -0400
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: Jani Nikula <jani.nikula@linux.intel.com>
Cc: Ville Syrjala <ville.syrjala@linux.intel.com>, 
	intel-gfx@lists.freedesktop.org, tools@kernel.org, intel-xe@lists.freedesktop.org
Subject: Re: [PATCH 01/14] drm/i915/cdclk: Don't bail if pcode post nofify
 fails
Message-ID: <20260617-horned-orthodox-zebu-625bcb@meerkat>
References: <20260610170652.5320-1-ville.syrjala@linux.intel.com>
 <20260610170652.5320-2-ville.syrjala@linux.intel.com>
 <511da82834da302ac50a326c082c45f6134b2556@intel.com>
 <8c18eca330bd63182319a18f238e78f1c451ede2@intel.com>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <8c18eca330bd63182319a18f238e78f1c451ede2@intel.com>

On Wed, Jun 17, 2026 at 04:29:16PM +0300, Jani Nikula wrote:
> >> We already changed the actual cdclk frequency by the time we do
> >> the pcode post notify. So skipping the subsequent readout is plain
> >> wrong.
> >
> > Fixes: ?
> 
> Turns out posing the question about Fixes: trailer like that leads to b4
> shazam literally adding that trailer. Please clean them up before
> pushing!
> 
> Cc: tools@k.o and Konstantin, FYI

We now recognize this and properly change this to:

| Fixes: ¯\_(ツ)_/¯

(Just kidding... I'll see if I can clean this up to be more discerning of the
actual Fixes: format.)

Thanks,
-K
