Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80F3C3A758F
	for <tools@linux.kernel.org>; Tue, 24 Mar 2026 18:42:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774377775; cv=none; b=TnJANa3c5BxV6gfIVpkuc6ebGvcaUqs1w/fKk0YycG3EBD+ICnTcqcRagox/eckFlU9JLDx+dEPU6UZ4+WagPZ/VcI0MS1pMEDMNxgb1epqjpGWt2O8Ef5Io/G0Gg002gWpeoc+zlC+j6CwkiCzrX68vXBQ6GEk6OmEpkuMeX+Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774377775; c=relaxed/simple;
	bh=8QnXTDtM55YipnJzN451pg/x0ozY9oTXE/mUvGpyc2c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qI5NK/n1zfmBt9WU/ihdUP88wZkZ1a+g9tlEuNdU1NyEPt4p42MWwI0Gvu0tMULI2N1D7MnP6Dy23+iwpd2V2/3R7fQuH6Ce3RKbY4MzvVfd3LnMmP5ENRMm6on9mQIo4r4/bvyPEdBEP1bdyFrvpiTENsOYpI6dBIe25bpsaCU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=i9/A1acE; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="i9/A1acE"
Received: by smtp.kernel.org (Postfix)
	id 40B05C2BCB1; Tue, 24 Mar 2026 18:42:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 05420C19424;
	Tue, 24 Mar 2026 18:42:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1774377775;
	bh=8QnXTDtM55YipnJzN451pg/x0ozY9oTXE/mUvGpyc2c=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=i9/A1acECdZQ5zHQwtHURSMOCEbgrprIHuvFL1ekhyrZw4jEdC4tN4bgMTHhvbkdX
	 yeILV6/klUYEaNFWDi4YTz2iJAzIJpB9vbqfC7eXoLKPYSuhPRqK1XwH9NnVTtVkUz
	 7+cPfgnWx9ngw+eFpr0f2zE7wlTkJFP/YdwBaViM=
Date: Tue, 24 Mar 2026 14:42:54 -0400
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: Chris Samuel <chris@csamuel.org>
Cc: tools@kernel.org
Subject: Re: b4 review experience
Message-ID: <20260324-skinny-daft-nautilus-167b65@meerkat>
References: <2c1ab8a2-8a86-48a7-9a53-ef3a00ab4bd2@csamuel.org>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <2c1ab8a2-8a86-48a7-9a53-ef3a00ab4bd2@csamuel.org>

On Sat, Mar 21, 2026 at 10:11:32PM -0400, Chris Samuel wrote:
> First of all thanks so much for this work, it looks really nice!  I'll also
> preface this by saying I'm not a kernel person, I'm not even really a
> programmer, just a sysadmin who likes to track what's going on in certain
> parts of the kernel.

Thank you for taking time to send your comments!

> One thing I've noticed is that if the patch set is large then I can't scroll
> the list of patches on the left hand side of the review view with the mouse,
> though I can use the arrow keys to go through the patches.
> 
> A similar issue that if I run the CI (to get checkpatch and Sashiko input) I
> can scroll the list with the mouse, but I can't select any of the patches
> with the mouse. I can move through the list with the arrow keys but when I
> get to the bottom of the screen it doesn't scroll. I can scroll with the
> mouse to see where it's got to, but as soon as I press an arrow key it
> resets to the start of the list.

These both should be now addressed in 0.15.1. Thanks!

> The only other thing I'll mention is that with the checkpatch output it'd be
> handy (for the complaints about lines in the commit message) if it showed
> the context like it does when you run it at the command line.

This is a bit harder to implement without the UI becoming unwieldy, but I'll
take a look -- it's now in plan.otl for 0.16.

Best regards,
-K
