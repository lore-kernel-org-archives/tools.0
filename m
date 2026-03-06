Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5577620C461
	for <tools@linux.kernel.org>; Fri,  6 Mar 2026 00:39:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772757597; cv=none; b=gia1SaFe5rMs/COAZKFqOwqFlW4qyv/Lk/yFumM5fANztMJztZHZVrdVEUwKQidvKZUhXHNXKqNi+4tEBNjzWh9X2ngARnXpVIYIfrhPjHoKg993QywL9/D2PAouktD3xDPJcGcdWsYMYN1JHxO+++AeNHRKT9wlJaU4UA0PJ/I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772757597; c=relaxed/simple;
	bh=oM4Ls3NTFgiqt/KMZKt/joWcVRVYAq32VljHzOR7CZA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pek35Qt4vsuTINtHgs2FF29c6pnptW1polOURh9fCKsXoVQEXDvb0AigeDwCqjCmSy3xg91KfyuU5qzJefY7nW8QRyPE3NdcJ2dtPMKVOGEtR63VHJWkfLvDor9NUe0Fm1vlf+zYrM9ONUhzyX37lCV1qLE2Vs1TcJVgQ3xHOQo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fvl52aSc; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fvl52aSc"
Received: by smtp.kernel.org (Postfix)
	id 04E0DC19423; Fri,  6 Mar 2026 00:39:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C3E4CC2BC87;
	Fri,  6 Mar 2026 00:39:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772757596;
	bh=oM4Ls3NTFgiqt/KMZKt/joWcVRVYAq32VljHzOR7CZA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=fvl52aScGN0AwdRQrpq6ZdOwUz4BPDUrXyC4Lnzf8HNPdNpyppBh2gilXC0k2AmUv
	 tTeonsBKR3T1yYfztEQEQYDjmD+esseY9zPG5ybGmR836NdRt7zu2B5voaIP2RcQyb
	 Sy6oa+nItzNte9BogCdLgYJ8aal+Www1fEbGO6s1IfG/dzUQHWwIqIoickJCNClSpr
	 oLJCzLQAVo3rqaXOcd6eSSiX0HfIGW9ZVqhPu7x3ErYEQiYzq6wIxrtxuY7mxuy72n
	 ICPI/pG2SR3cEgJGf39U12Tz9t4waMM6ZT4uFcSsnqg87gcjB0VilBuZl9kKeI1f1T
	 Hy7zopRJ961+g==
Date: Thu, 5 Mar 2026 19:39:55 -0500
From: Konstantin Ryabitsev <mricon@kernel.org>
To: Luca Ceresoli <luca.ceresoli@bootlin.com>
Cc: tools@kernel.org, louis.chauvet@bootlin.org, 
	thomas.petazzoni@bootlin.org
Subject: Re: [BUG?] b4 shazam applies unrelated patches due to dfblob
 collision (b4 0.14.3)
Message-ID: <20260305-jackdaw-of-famous-excellence-d1fb9e@lemur>
References: <DFUF52RW81LD.28YE20HG4P0L1@bootlin.com>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <DFUF52RW81LD.28YE20HG4P0L1@bootlin.com>

On Wed, Jan 21, 2026 at 05:47:19PM +0100, Luca Ceresoli wrote:
> I have a problem (bug?) to report I'm afraid.
> 
> While trying to apply a 1-patch series, b4 shazam applied the correct
> patch, but:
> 
>  - in the output, it listed 22 paches being applied, and none was the
>    intended one
>  - at the end the branch contained 8 new patches, the first one being the
>    intended one
>  - it did not pick up the R-by line for the intended patch

Thanks for the report, adding it to tracking.

bugspray tag b4/shazam

-K
