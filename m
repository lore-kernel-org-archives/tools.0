Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65FE03A873D
	for <tools@linux.kernel.org>; Fri, 13 Mar 2026 15:42:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773416567; cv=none; b=Ixw4R4unhz0qdApuakUnV3tZOP2Cxl05TCdUh6nSmPN7zP1s869xK1Utx7fNnKKnYAV9tb4VJv4Z7mj7uitIjRUmbxVh9ZjXyBET9S6YXDrJH3/WWpL3Vwcoeup/BXCJiNvMNWxYeBLZpWvDUqXDyPA5nrGRFoz1qVcCIOHPGd8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773416567; c=relaxed/simple;
	bh=3rcOF1Nq8RCWrHFqZNILk9nZAMqt5nvT4/X1NetWYo4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ivMbZxJRRDCrzYbl3rc+8tAui86A5qwj2mPYOe2zJcSnTC34MBmlDEyXJ8Lk68tBMhl5CIgSANi4c21taF4tMPqwnt1w+dyjP6tiX4DCbaQco3l5BpXWymw5wS/TZ794oqX6VF8Yvy5FBoIkK0ywqpxkyC9Wj9KzqaR//yoYkvM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=o37QbFvD; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="o37QbFvD"
Received: by smtp.kernel.org (Postfix)
	id 1B545C2BC87; Fri, 13 Mar 2026 15:42:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D9CF9C19421;
	Fri, 13 Mar 2026 15:42:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773416567;
	bh=3rcOF1Nq8RCWrHFqZNILk9nZAMqt5nvT4/X1NetWYo4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=o37QbFvDXo/Qvfcby2qbTPVNvATcS0/m+h/2xkozweZlCVezWJmhKWjJU2mBZRKYI
	 D/QEA8SqpnvDRewM0fp1krEF8SOsWMfjf64IYO8GaDi+QxeGoHNtyDWqkAOSTG6Zov
	 Wh+t9HgwYpNaG0zfmhm7GGpF7NsYOgx4+QzpEDyToTnlNd/IcrxGqDM8s71oY/yqgj
	 f4tmA0/sr59DOTxSAkGM850lpoYzAKo4NnQNdu5+kg+qrKx6353XZO22XnL5/2Qt37
	 9sXhObx3OPY7m+E4/STbcuORvuGk5kTNfJJZgTdaTiZeWdji83+cc2C5p6T+DtwDyf
	 zR0IL141GD/1Q==
Date: Fri, 13 Mar 2026 11:42:45 -0400
From: Konstantin Ryabitsev <mricon@kernel.org>
To: Mark Brown <broonie@kernel.org>
Cc: users@kernel.org, tools@kernel.org
Subject: Re: b4 review available in master
Message-ID: <20260313-puzzling-crazy-cassowary-88124d@lemur>
References: <20260227-imported-aromatic-guppy-ad3dca@lemur>
 <aaMPYVIgmsDpn7Rw@sirena.co.uk>
 <aaNaArEgAe0SgmSh@sirena.co.uk>
 <20260302-juicy-spoonbill-of-jest-6fc659@lemur>
 <e7d999c0-c27f-4d9d-8812-9ff3254ea7cf@sirena.org.uk>
 <20260303-true-glaring-raven-e78bf2@lemur>
 <7bdd4c85-7202-4b80-aae5-67c99fabddf6@sirena.org.uk>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <7bdd4c85-7202-4b80-aae5-67c99fabddf6@sirena.org.uk>

On Thu, Mar 12, 2026 at 05:35:13PM +0000, Mark Brown wrote:
> > Let me know if that's not sufficient. We can also give a way to hide skipped
> > patches so they aren't even in the picture.
> 
> Having used this a bit I think for larger serieses hiding would be very
> useful, and it would be useful to still be able to do a merge even with
> skipped patches (common case is some DTS patches at the end of a series
> which are basically unrelated to the main series).

You can toggle-hide them with "H" in the latest master.

Cheers,
-- 
KR
