Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4106A2EBB90
	for <tools@linux.kernel.org>; Sat, 28 Feb 2026 17:05:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772298359; cv=none; b=kXcns4NHrh3epKWHMjMdwG1k9ii2jX1b3Bwb4P1VRSodkF0Q0zwMUPeGllLcEtABRpWvI1BXxpybfqPZcGVNpz9VWt4Q5n0qTCRMBqmIa0+CVT2Ncnj1A7gaDQ0pjsYOq6LARmzsj2X4TSSfr0EvPvJVrZxvob/YuYHsCk9kz/A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772298359; c=relaxed/simple;
	bh=Lv22XzDpH8Wr2ZCdxrL0UU+E0CQNZuUzob5msE8WOh8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=W8wRbFxZbp8CJonaiswUn+8abVIwcMs0HC+OIWUiBJ4q5OZBxSVJ0KnTB4PXW8QZtyUgPaqXcoQu+6b8uNJdKRg7Om0jxZYLdRf4F7LR4khW3QhP0TlPxbNSh6RreY9K1gKBVHTbJ/DON7GTscehNLHJf/FbxQnUmIuE+5HriNw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HGSqqiBi; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HGSqqiBi"
Received: by smtp.kernel.org (Postfix)
	id 13A16C19423; Sat, 28 Feb 2026 17:05:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D1B43C116D0;
	Sat, 28 Feb 2026 17:05:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772298359;
	bh=Lv22XzDpH8Wr2ZCdxrL0UU+E0CQNZuUzob5msE8WOh8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=HGSqqiBiVXS3p6fkEFr4xw2eYva1018YLwHhbxqrzRQYprlqcjn4ymTrSV18L/iYe
	 9I3eA+3mYsOc8PLzNgTc46iuIx6Di8I+OpgsZKwdDN7sONYbGMM73099e/GmcBU0/C
	 0c32beBY4t3ojinjS5Tc8nbfe1womhzC+wCFYG5RvMBbxgY0LxOmt3EdDpdC5JxteU
	 IUZl3qWOg433dcMWuitl+HTeLn4jNuLKuB7ONARossni3ZjkW2jYF7eL+m5sB3408b
	 C+HOmKqJXOCL9OB9hDBKpRK4s0LRXwTvQebiTcWCkidmOdmf4K0HXpUbnvoukNwnPn
	 lX8DBaQ493jwA==
Date: Sat, 28 Feb 2026 12:05:57 -0500
From: Konstantin Ryabitsev <mricon@kernel.org>
To: Conor Dooley <conor@kernel.org>
Cc: users@kernel.org, tools@kernel.org
Subject: Re: b4 review available in master
Message-ID: <20260228-ruby-hawk-of-valor-41f0b0@lemur>
References: <20260227-imported-aromatic-guppy-ad3dca@lemur>
 <20260228-battered-numerous-35e130c73b93@spud>
 <20260228-versed-wapiti-of-blizzard-4677aa@lemur>
 <20260228-crested-swimwear-a57a3060b860@spud>
 <20260228-unbiased-mature-beaver-680aba@lemur>
 <20260228-pasty-clerical-b87a92aead3c@spud>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260228-pasty-clerical-b87a92aead3c@spud>

On Sat, Feb 28, 2026 at 05:00:10PM +0000, Conor Dooley wrote:
> Am I just cursed? This is on 9ca5b4f review: escape remaining user strings passed to markup-enabled widgets

Did you remember to completely exit the running app and restart it? I swear,
this should be fixed.

-- 
KR
