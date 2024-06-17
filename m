Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD7E053A9
	for <tools@linux.kernel.org>; Mon, 17 Jun 2024 16:17:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718641032; cv=none; b=tLdoXL+1sLlxUWIhdFWCqM+JqTp6SlapRXqYoTUGePsbHgcDTV8GhLwY/nq/XlzemZ83xMEz4wYk5lgbixtKNUampm6kMfezITQxBIE/69M92UD2hCW+bt8edFcCx6v2vDMXBn33DUrI+xydelfeiAYzCxDxMeGoH2lT4l0iX0s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718641032; c=relaxed/simple;
	bh=CDeI51/ruj5cgthHPFDsb5U4NCw8z7ksmWkpAzar6MU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mCPAN0h5jXYHj8W3uu2kwzs/bD6HDnjMKq699bFjHYb0F84FMp5cOIlhbyEd0cqyU2TIq/YtDnCtf0qed6cQI81Mi1vWEE589O3WTIPkR6QW3yEzDl7xdAMg/c1bWfeY0zudq+M2iLPsaW/83c1y11wkV6MpvFDqtjD34sIl3Mc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=u4MiTHzS; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="u4MiTHzS"
Received: by smtp.kernel.org (Postfix)
	id 649A4C4AF1C; Mon, 17 Jun 2024 16:17:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2FC80C2BD10;
	Mon, 17 Jun 2024 16:17:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718641032;
	bh=CDeI51/ruj5cgthHPFDsb5U4NCw8z7ksmWkpAzar6MU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=u4MiTHzSKkTAHU4BHmmqWcAQjk4O207qaia4qOf55Ehtc08IE9c9jMRp+e8+AasGt
	 fkjcuj98tLYdeLE1/2RQVUMHevgIpC4m+tEIQbsurx2WM8vU959guqNQgQNdmIan5y
	 D2xNMJGTT4/N8Bwb/anC4inkOIhpR3jI018PDZEq0IjkE02hdmBIJCPjCQBnsAkhnT
	 lmI8Im6cAcRb/Yx+71vKk3VWETWygMkWbSVewycEdUFiOucKwmWdvJF3v9OME5wtNW
	 g3WPZBLVjd3xkfymDQyU3eyBYyK+lYMnjSxETYW3o4zoNd9pOrjyMoKpSG1G8keAHq
	 xtzwIumLuIeOA==
Date: Mon, 17 Jun 2024 12:17:11 -0400
From: Konstantin Ryabitsev <mricon@kernel.org>
To: Alejandro Colomar <alx@kernel.org>
Cc: tools@kernel.org
Subject: Re: SIGN output impossibly large
Message-ID: <20240617-secret-charcoal-cougar-dcd01a@meerkat>
References: <5yz5chpzv4qhpfpitzvgjfw2o5ctgvedzbsxzohbvl5oxvzqzc@xwzpoipfj73h>
 <20240617-calm-bald-dinosaur-ce8efe@lemur>
 <atk5mrwjkl44ffqvwwg54gzjl7mgst3pkejercb22vjmpoqwre@irmwsq54uuar>
 <6jv5lshvmvoaejoqvv5lbevitgjzpoplkx6eaxuyxsa75wq6am@leuzkhjf4izl>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <6jv5lshvmvoaejoqvv5lbevitgjzpoplkx6eaxuyxsa75wq6am@leuzkhjf4izl>

On Mon, Jun 17, 2024 at 06:00:36PM GMT, Alejandro Colomar wrote:
> > >     kup put man-pages-6.9.1.tar{.asc,} /pub/linux/docs/man-pages/man-pages-6.9.1.tar.gz

I think your shell is resolving your shorthand in the wrong order, or your
local files are swapped, because what we're receiving on our end is the
reverse order:

kup-server(alx)[15972]: Cmd: DATA 833 %
kup-server(alx)[15972]: Cmd: SIGN 12390400 %

> > Same result:

-K
