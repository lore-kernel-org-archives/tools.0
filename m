Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C15702DC79B
	for <tools@linux.kernel.org>; Thu, 21 May 2026 01:30:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779327039; cv=none; b=fkVga6Zo9+EujTFPMhpn8qdqkJnEcrocRwpaXqj5xYxIF2pBf5/pr+Q2m2jG7ZqgbahEecSOmOSzu51gGBBQxoFxkygaWPtuQLrckSzfcejHq/+VE5AlJpMyuSWmPWxZe9al9fc2fly03MJM6swYsBCUHLwjC0Qn03UOHWfpRZU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779327039; c=relaxed/simple;
	bh=Rg20lD+b3pdANcwW6yKpm6irmdCgw7MYuTW3WdQ2x+s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fWuMGrMcBEEtPoDqqR7j4lt9C8eeGphOjAoMDPYoq6O9UNDFX2TIQTp1PBT/R4XNXEEkAy9L78r0OKk9o+IA5If3f79FaOVw/MbPiyc51HQgD6DGVXvGr3Y6DEuX+Vx4xfJg4naNmucrhSKuPSoGq/lEjj3wNX0Oa/ERsFc8oMQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=F17PKbJI; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="F17PKbJI"
Received: by smtp.kernel.org (Postfix)
	id 39A581F00A3B; Thu, 21 May 2026 01:30:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C276B1F000E9;
	Thu, 21 May 2026 01:30:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779327027;
	bh=dsZyApNSI072Xa8ESmKQ+327rbeNAsLL3uAcqG8Gr4A=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=F17PKbJIldlQpHbGNG4l3HV9W3L8wDctb2k3tjnUPowp9Xcb+145HZBpehbYxQCgl
	 zsqVU6Sxm5ctrsv+ypsJGXIU658hOigcsNSisFlqa0QgvoIGMKCMGiqPnd5pKVufE7
	 BSvAElHuJTga17dxvRZlbKgMcYOcF7c+vgo7c1fLy9EL/0TC7hHAoNqUR//uQp2sXK
	 MZ388Tbn0vKxFFjRkR1QSOQ19Itd6wlbdSRba2FoH/uPm1l4i/tv/Sy/tobT6gL5Gw
	 Ts549iS06UC/lZOVBLhN9QHq+Z/no1i10WrjQoTZ8bn7fj1tdknBg9IFT4rnR+eRa3
	 RxMgnAb7JFKiA==
Date: Wed, 20 May 2026 21:30:26 -0400
From: Konstantin Ryabitsev <mricon@kernel.org>
To: Borislav Petkov <bp@alien8.de>
Cc: tools@kernel.org
Subject: Re: kgl and git shallow issue
Message-ID: <20260520-greedy-dalmatian-of-protection-4e28ed@meerkat>
References: <20260520203544.GAag4bILhFL9wSQpxY@fat_crate.local>
 <20260520-invaluable-careful-cockatrice-e6ed3d@meerkat>
 <20260520-ancient-thundering-bobcat-2f086c@meerkat>
 <20260521011540.GBag5cvFqefROohMlm@fat_crate.local>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260521011540.GBag5cvFqefROohMlm@fat_crate.local>

On Wed, May 20, 2026 at 06:15:40PM -0700, Borislav Petkov wrote:
> On Wed, May 20, 2026 at 05:47:33PM -0400, Konstantin Ryabitsev wrote:
> > Actually, I just pushed a commit that should fix this. Funny, this is exactly
> 
> Pushed where?

D'oh. Try now.

-K
