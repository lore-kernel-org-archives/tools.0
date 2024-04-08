Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BE417482
	for <tools@linux.kernel.org>; Mon,  8 Apr 2024 20:31:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712608305; cv=none; b=c1XgkdkV98Va1LZLkeYByVkGdPeplVBTb0b0VZP3nVzysLRdCvrr2MpASYCROl1nXjbAEjd4buOAI/UZAPbH/lFRLTAQRh3jBqfjeypR4b3C+MjjStkoW+AxJMu4tiNjJ7Q/rCHRdBdw6NESlGunWkSh7wT3iJHJZzCjdJrPn6g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712608305; c=relaxed/simple;
	bh=pP+uz2QMCX2x+yGN14c6+tWLrh6g3mJaXRkWoaSxUUw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TyG2dIgTKz3EkEzxFlAgRRosKpcsudubX9N0Pl0sWAJ+PDlghQ/UKHjywx4phFn3KLpAfFNE7249JEErPQM3SCQc44DWMzEQxLo7rBrr+nkzGQNza3A0En8zY2yYc+9+wA4c5pME0pOA/HNv1rgP/dDvkiIh7whL9IJ0fPxXa0k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=XMRVJzHO; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="XMRVJzHO"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E103AC433C7;
	Mon,  8 Apr 2024 20:31:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1712608305;
	bh=pP+uz2QMCX2x+yGN14c6+tWLrh6g3mJaXRkWoaSxUUw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=XMRVJzHOmwqNntFjGjDkwNp1Pbmn7vRleBwN9yKo5tGk+d3YzMpMz3rCWqIhtbrPL
	 nxsHdUQpqRcssEiE7CZoV9BBkOk+opO3KtaCmDny4NQG9B6oSegEf0XtYNBntAQWyI
	 8dr/AkXJbOKOmCMSzBwj+DZofTP08QBp6vF1FSgs=
Date: Mon, 8 Apr 2024 16:31:41 -0400
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: Mark Brown <broonie@kernel.org>
Cc: tools@linux.kernel.org
Subject: Re: Checks for recipients
Message-ID: <20240408-hasty-smiling-adder-83b6ac@lemur>
References: <ZhQ8DoS1GaT0603l@sirena.org.uk>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <ZhQ8DoS1GaT0603l@sirena.org.uk>

On Mon, Apr 08, 2024 at 07:48:46PM +0100, Mark Brown wrote:
> It would be nice for scripting if b4 had a check similar to the
> needs-editing flag in show-info which would allow scripts wrapping it to
> determine if there are any recipients specified for the series.

Yes, I'm working on integrating various checks into a single `b4 prep --check`
command:

- check if series cover needs editing
- check if series needs pre-send checks (checkpatch)
- check if dependencies are valid (current --check-deps)
- check if --auto-to-cc has been run
- etc, etc

It's going to take a few iterations before this works reliably, but we'll get
there.

-K
