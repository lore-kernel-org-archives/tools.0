Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 064A033468C
	for <tools@linux.kernel.org>; Mon,  5 Jan 2026 16:25:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767630357; cv=none; b=FRM1+Yl7m3Sj7++tnlG5TFBt6v3orz9ve+6bYn5OSIkxdHG+lpvtqnWlkhC5jH4bg/1i9ZfFn/84TwdlhvdfKTkM+vKi2QleL5EuD9tOX4g7Q1Px++040KiHJ6ShWl9c3Xku/B1zhDCq5nho6Bn4L9EM0LaT/Uhq2e50GXNqBj4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767630357; c=relaxed/simple;
	bh=cVIfxLZe2jWaDlAb8Izze/Ki/kHd2kapP9A6X/3ZQNA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WxGMarZ/f0aNJmcQYIIYUJNsBa8YAqn88L4ePfPOQQc3JwYacOm8iY5YiuyZZspKQqIH3Yi2zq8B85Ptou1E9zZJjttYRzJHxBsLmXpAj8BOtyzjWwPDTPcHOvM+x3F9b/7BLhvh+xLQy7Dp+VEEM7GP+qR+y0WiV/kS1y8QsZQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=juKwT5U8; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="juKwT5U8"
Received: by smtp.kernel.org (Postfix)
	id B0EA5C19425; Mon,  5 Jan 2026 16:25:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 750FDC116D0;
	Mon,  5 Jan 2026 16:25:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1767630356;
	bh=cVIfxLZe2jWaDlAb8Izze/Ki/kHd2kapP9A6X/3ZQNA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=juKwT5U8hiaBi/iWjd4HiavNXdZNZYb1NjbaTWg/z9R7KSY5AE5wabWNs0CxwbM4o
	 l2HcoNMvo5EQSrM3soNIRifLXhzku2DZapTC0FzTsdDSDyNJHJijHVk8EcFhIw5DZz
	 9s5/WOv/d0bNL6aoESf3FaXYC87ZSqz8pY3d+6xo=
Date: Mon, 5 Jan 2026 11:25:51 -0500
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: Mike Pagano <mpagano@gentoo.org>
Cc: tools@kernel.org
Subject: Re: patatt - tests source request
Message-ID: <20260105-curious-russet-goshawk-d97fd8@lemur>
References: <f0fb89e1-a37b-4871-bf0d-23f84ef450ff@gentoo.org>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <f0fb89e1-a37b-4871-bf0d-23f84ef450ff@gentoo.org>

On Mon, Jan 05, 2026 at 09:53:59AM -0500, Mike Pagano wrote:
> Hello,
> 
> Would it be possible to include the entire "tests" directory in the release
> tarballs [1]?

Could you please clarify your request? The official release tarballs are built
directly from the git tag, so they should already include everything.

-K
