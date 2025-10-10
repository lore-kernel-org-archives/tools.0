Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA410257821
	for <tools@linux.kernel.org>; Fri, 10 Oct 2025 14:37:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760107045; cv=none; b=QlmUjFjiPSNT67sSgmmjv1Kwskld8otc7Mn2JpDiAmdFdoELZhbnbUobDtVRtwYuz8ZpMfYEUzHc/l2FiwatDd20JwsspUl1UPM9yQukag0pheEDHhERrAAf5uxCLBQUnK0V2V+b3sckE1nSa63nqFk/iiwODD8mZR/4MzxAfPg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760107045; c=relaxed/simple;
	bh=MNayEWhflB391M4mCcA07jDg5eukU9iOMtG3P12jT00=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KPPtL6PnjWeZegFfQe0ezbQvOLKX/7oyQ7h37oScGNrmpNdQ4ItGLaXk1qf2TCjY5iEVpc7sj79dIwbvrSXgeDLSsrItE3prfTGN3gxytbZEyZXfmG4ee6Vn9keOXbxiQBVr6JGm+t7iySRrxkMuxiqyDYvWqM5t0W6z/6ShZR4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=tQbl7qXh; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="tQbl7qXh"
Received: by smtp.kernel.org (Postfix)
	id BE68AC4CEF9; Fri, 10 Oct 2025 14:37:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8EB45C4CEF1;
	Fri, 10 Oct 2025 14:37:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1760107045;
	bh=MNayEWhflB391M4mCcA07jDg5eukU9iOMtG3P12jT00=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=tQbl7qXhWMYnr4d8M0XGsLixvnR0GUXTcfXJtjuzWnsD/uPOi5OOqscBZHtmawLyf
	 ZdFcgEw0DoM+hXinhO3D+3m3i0dDosN6TX3ggDjSgIsQslciUq4z7IODCYVbqxGGt5
	 69v+FyYf6XlmAqlDh3i62U8aaljLm8/jWrTkgu+I=
Date: Fri, 10 Oct 2025 10:37:22 -0400
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: Lee Jones <lee@kernel.org>
Cc: tools@kernel.org
Subject: Re: b4: ty: User-flow regression
Message-ID: <20251010-feathered-pastoral-woodpecker-de863d@lemur>
References: <20251009151349.GB2890766@google.com>
 <20251009-remarkable-charming-pogona-fd7a8f@lemur>
 <20251010080324.GC2988639@google.com>
 <20251010-mauve-dolphin-of-apotheosis-a1cbdf@lemur>
 <20251010143452.GH2988639@google.com>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20251010143452.GH2988639@google.com>

On Fri, Oct 10, 2025 at 03:34:52PM +0100, Lee Jones wrote:
> > Next question is -- have you recently stopped adding Link: tags to your
> > commits? :)
> 
> Oooo, yes!  Yes, I have!
> 
> Why would that make a difference?

When patches have been altered by the maintainer, we can no longer match them
by git-patch-id. In the past, when we found a Link: trailer, we could still
match their provenance by message-id, but if that is gone, we can no longer
fall back to that. I am working on making the "ty" mechanism being less
dependent on that -- hopefully the master branch should become more useful to
you again in the near future.

-K
