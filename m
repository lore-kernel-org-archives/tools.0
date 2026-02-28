Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 598D030B51A
	for <tools@linux.kernel.org>; Sat, 28 Feb 2026 15:47:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772293646; cv=none; b=t4V7UgZJX3xP28rmqTyQrHGgC5glugEH5V3QbLiyBDy/dVU5aTNPKHGQRLtE3ziCxgnHZMu9o5UmCFtweGWIAc0o5HAfQtkN27NRvP9R5zrEfmqY8YqLOwwYFEOWTreUadThs3FrY9BCZarNKKmpEZo7TMPxQOAm2VthmWiTBiE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772293646; c=relaxed/simple;
	bh=WbMiPOFLsULz1yJh7Nk/7Iv7TfPf0CGqkrJMHaDlsZ0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=W96s7klc4Az0sVIIPtOGoQUCpCMs6wQ2ri+zyMtOkKTWVKhL0uTJ+pg1n3ioKKCfncNmdxn1QRJ8fEWgN/sG25CeFyeJF0pB4P8H2bx01SgH3Vl2Bmacff29koAS4G2zHNXACLEbksYc+3O8OMr+cFitpjpVIHXEoQobo+egf0g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SJxcJDrK; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SJxcJDrK"
Received: by smtp.kernel.org (Postfix)
	id 0ADBDC19424; Sat, 28 Feb 2026 15:47:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C01C3C116D0;
	Sat, 28 Feb 2026 15:47:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772293645;
	bh=WbMiPOFLsULz1yJh7Nk/7Iv7TfPf0CGqkrJMHaDlsZ0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=SJxcJDrKzHJvfshFG2tCifgwOWjTiN5pKAgYdJ8GmcxkXyCCW6QdW51k8MscS3LSs
	 lSqRF+P5vP5pUN21xoaXqvBEMdCt5unGGjxfytU3WWZRqZJAJVLHCK1bn0ewl2cdf1
	 9ZM6IDL54105spmRHA/6kBx5QwW+jiOVNQLan/a1WqiAh9j67y2ks3GGrYIZ7nWFow
	 SBmHYDCdhlRk3yZs8xUTqFC38CXhEx9GafuR/YuLOzRqUSDM+vBKtAXfW2RSZj4ntM
	 HEzczAhdTGaQ51qpzO8bWrZIAfKNQR+0NynQ3btuTdsjoSG7JT6E18WRhD8rytkJNN
	 ebzplsknEOHdQ==
Date: Sat, 28 Feb 2026 10:47:21 -0500
From: Konstantin Ryabitsev <mricon@kernel.org>
To: Mark Brown <broonie@kernel.org>
Cc: users@kernel.org, tools@kernel.org
Subject: Re: b4 review available in master
Message-ID: <20260228-bouncy-truthful-muskox-bcb0bc@lemur>
References: <20260227-imported-aromatic-guppy-ad3dca@lemur>
 <aaMF3GQvC26DsqQf@sirena.co.uk>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <aaMF3GQvC26DsqQf@sirena.co.uk>

On Sat, Feb 28, 2026 at 03:12:28PM +0000, Mark Brown wrote:
> > The only new dependency introduced is python-textual. I say this with a bit of
> > tongue-in-cheek, because textual pulls in a ton of other dependencies, but
> > it's usually already installed on many modern distros anyway.
> 
> On Debian stable:
> 
>     class ReviewApp(App[None]):
>     ...<1351 lines>...
>             self.push_screen(HelpScreen(_review_help_lines(has_agent=has_agent, has_check=has_check)))
>   File "/home/broonie/git/b4/src/b4/review_tui/_review_app.py", line 138, in ReviewApp
>     _GRP_REVIEW = Binding.Group('Review')
>                   ^^^^^^^^^^^^^
> AttributeError: type object 'Binding' has no attribute 'Group'
> 
> where python3-textual is 2.1.2-1.

You're right, looks like the stuff I put in to make the status bar look nicer
pulls in textual >= 6.0, released in Aug 2025. I pushed the fix that sets the
requirement properly, but I'll also check if I can make it work with what's in
debian.

-- 
KR
