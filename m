Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E38025A2C9
	for <tools@linux.kernel.org>; Thu,  5 Mar 2026 03:26:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772681215; cv=none; b=ZoEqF46R25zjbE0+MDj+W/iNzIaZZSWdDlEFWH2oGaMd1vzKRjUKNWAVq8/oxCLsurXzg9/pBustAGyUeslqzmt2iVqijopJ3La7PWQG6VRS0DDCaAiP4X8sD8iMAEMvGiLb7Yuwyx/LdfdNfFIxTMfZKREmyhg30SXGhW6j47M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772681215; c=relaxed/simple;
	bh=f4bjqTvFddiEruGDPVlnLE5xrqxK/6VYhZ6B1mRLkxU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EVfQoFYZbA23RNO+BFcMZnCXKVNkR9yhpH5YniU03aBME4JXCYWYxo8p8Yymj9nAInwPO/eu8d+I3RN5KMi3rYcMDami+uDan9+xc7TgVzZ1D5LEi3uCahrNALDr9MZ1QdqzsMxL3NFzNepcINbWnL1joXzXN8kI1oufGOmjQfA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kuVSKe4J; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kuVSKe4J"
Received: by smtp.kernel.org (Postfix)
	id D2F60C2BC9E; Thu,  5 Mar 2026 03:26:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 88A47C4CEF7;
	Thu,  5 Mar 2026 03:26:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772681214;
	bh=f4bjqTvFddiEruGDPVlnLE5xrqxK/6VYhZ6B1mRLkxU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=kuVSKe4JO1ed5LEc3I0D0rYiMD4Zbf4wY4yu01bTx367sdHr39DyQR6aCl2wc1mX6
	 DzYfZmuGwISUnqv+Pm3jGQgZ0r32yuTmbz9OEwkfhafaIvqWAgvK71W2Sk0P4j1WNT
	 sqrD/kiRBhDnEM/vS+yAQhjUDQjx7b9+l439AS/uN/lpT/sT4EM1xDG+9BJJSnOlcC
	 8haVLqGaJv7+mgsTyA8giXZ0jBw/3lZlCEwh1N9To6BtpDj4xIJl4TqF7Lk2h7LfNS
	 ld5dVY/ACfHpAKV3RfOUbKDQMRSaQFeECsYUfZkjp8p0oYPuRUr5KcPewDFbxhv3/1
	 SMXpomQShitHw==
Date: Wed, 4 Mar 2026 22:26:49 -0500
From: Konstantin Ryabitsev <mricon@kernel.org>
To: Conor Dooley <conor@kernel.org>
Cc: users@kernel.org, tools@kernel.org
Subject: Re: b4 review available in master
Message-ID: <20260304-dark-adventurous-skua-f3fd3e@lemur>
References: <20260228-ruby-hawk-of-valor-41f0b0@lemur>
 <20260228-aqueduct-nuzzle-c03be63e03af@spud>
 <20260228-arcane-mamba-of-refinement-6dba82@lemur>
 <20260228-poodle-of-wonderful-justice-acfab2@lemur>
 <20260228-gulf-mountain-5f935fdefaea@spud>
 <20260228-charter-keenness-1256807e458d@spud>
 <20260303-tactful-zippy-oxpecker-fbcadd@lemur>
 <20260304-deviancy-overlaid-e7947f09089c@spud>
 <20260304-keen-clever-cockatoo-a8dab6@lemur>
 <20260304-anaconda-chance-345f697c9ef6@spud>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260304-anaconda-chance-345f697c9ef6@spud>

On Wed, Mar 04, 2026 at 10:55:27PM +0000, Conor Dooley wrote:
> > I know it's a pain to get textual's backtraces because they are not easy to
> > copy-paste, so if you just want to screenshot the bottom of that dump and post
> > a link to it, I'll be able to untangle it from there, usually.
> 
> https://i.nuuls.com/wLaX3.png

Thanks, this should be now fixed in master. Hopefully, not many more spots
with this bug left.

-- 
KR
