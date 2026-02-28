Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 209E21DD9AC
	for <tools@linux.kernel.org>; Sat, 28 Feb 2026 16:45:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772297160; cv=none; b=NRU0f34eRdWLzXbOtzcGWD+6SIQ8P9igfdOpU2oypDeBk+VcnwrRHCKoHaXS6WOPPN7CQZErJ3IoTfyJgM1uTFeWpLNOmHaMzD7bUAHhBWUs7cbNAv5+6kfHeKw3kl1TU90gxC+K9sU5H9h7ddHYNcAyJtrjlLxjNZlpH6nlwT0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772297160; c=relaxed/simple;
	bh=TXn1raqgkQm2E8GhUX3BxbBlLNJPolBK48/p9PIOBa8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TLVcVl5PRtmcAc/NlrGbv8pbdSz3dK6ad96Sp5focIW6BRiz4QivAMvSxbFnfSJv2YXLemFu3DSX7i5D/EdSDzS6jFGJCaMrqr9/joj25JhGrdQK52uuToNrDNyEuRqCP11in9SdrzQV3vrSMbfbODG/8GajCip1ACk9gD9Y6fw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PegoqQq1; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PegoqQq1"
Received: by smtp.kernel.org (Postfix)
	id DDB22C2BC86; Sat, 28 Feb 2026 16:45:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AB019C116D0;
	Sat, 28 Feb 2026 16:45:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772297159;
	bh=TXn1raqgkQm2E8GhUX3BxbBlLNJPolBK48/p9PIOBa8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=PegoqQq1J3mNoYnp07siknc6gs6bWHPywjboCdP4aih3kURli6cdu6Kbp9PbbGAJS
	 XQgognGxEt+w2mGXBVDyZTadrksWmqdw2o4ynI2w70wwmp63e5hNxnlO5zw9rRtXtM
	 /Miu2jJJtcJltrko6EUiHmYbPgCf3wvzgjmwYRK8sPn+qg/EhGroIrd5kyZ9q8b1+x
	 AGraz2JA6+JmAefkUhOBq1W4oRkLui4oiJo93PLEppHfj6zANsMe/BHIegCVvB7DK0
	 0QrNaNDao1FY34xP7NboY+5lTvtAl1gHMAMpFSbAJJskeq1YbcNP4wx+rVbhDCc0al
	 hUhT/VqnNcCUw==
Date: Sat, 28 Feb 2026 11:45:58 -0500
From: Konstantin Ryabitsev <mricon@kernel.org>
To: Conor Dooley <conor@kernel.org>
Cc: users@kernel.org, tools@kernel.org
Subject: Re: b4 review available in master
Message-ID: <20260228-versed-wapiti-of-blizzard-4677aa@lemur>
References: <20260227-imported-aromatic-guppy-ad3dca@lemur>
 <20260228-battered-numerous-35e130c73b93@spud>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260228-battered-numerous-35e130c73b93@spud>

On Sat, Feb 28, 2026 at 04:36:07PM +0000, Conor Dooley wrote:
> Also, I attempted to open patchwork while my b4.pw-project was set to
> "devicetree" and got an error:
> MarkupError: Expected markup style value (found '1/1] dt-bindings: net: can: nxp,sja1000: add reference to fsl,imx-weim-peripherals.yaml').
> There's some massive splat I can send you if this does not reproduce.

Bah, the problem is that textual treats [] as style markup, so there's a bunch
of places where we have to escape that. I expect this will come up routinely
as more places requiring escaping are found.

I put a fix into latest master for this particular one. Thanks!

-- 
KR
