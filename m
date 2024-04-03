Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A303E156257
	for <tools@linux.kernel.org>; Wed,  3 Apr 2024 21:02:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712178128; cv=none; b=tuNxZjQ7IvyIIs6khm1yvpwWv+rddH1fvybwOcYBiSMkHAmP4wo3w1zfo7MZEDYHM+bsJ1Yt/EgGg01iKhIsFY8CxBs9WuFe/KcLOkDwXbT9ytHuQZ+HpXgDglP2UPknjQlQw1RRErOweIAZbiSnIQgiRj3fItpUAoekAejdLQY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712178128; c=relaxed/simple;
	bh=oC57JrLy8lYFRjVNsU8c/HnUCTRZSVjmhh+9MDJE2wY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hZX0eDtmkGGLQIMxEyE6Pcjr9wntXmg/w4JtwCtWE8GCCjZPYo2QcsoS8er0NVkTHcb3Yx1MuPijN64RG7W4V9tLUq+3YuvLB9vbCUtzUqNe/2KEhFp3Mlf85SXypRJOCQiqD81eM8kOS4HQy+u1SiG9Ne7rVFs5NrWnR7q+P20=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=g7lRtTYd; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="g7lRtTYd"
Received: by smtp.kernel.org (Postfix)
	id 81014C43394; Wed,  3 Apr 2024 21:02:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4A003C43390;
	Wed,  3 Apr 2024 21:02:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1712178128;
	bh=oC57JrLy8lYFRjVNsU8c/HnUCTRZSVjmhh+9MDJE2wY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=g7lRtTYdIiSm2TEvdulENaL3AQ+PST03JPj1taq6IVqrGIyECvynmjn/E9+WEYgIq
	 n7mbq/bmhAyMK29yt7NB3sfplCB+5y7YrGogejH4tpYBsAouLTgvOVK8qG7QtBq0HD
	 bXlVBBLOBFkbpwyK8xfWdO7yA0Zw6UUdyZzbIvRk=
Date: Wed, 3 Apr 2024 17:02:07 -0400
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: Vitaly Chikunov <vt@altlinux.org>
Cc: tools@kernel.org
Subject: Re: grokmirror from kernel.googlesource.com
Message-ID: <20240403-real-acrid-bug-df6dba@lemur>
References: <20240330142439.7qjcbbhnqxf2ta3h@altlinux.org>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240330142439.7qjcbbhnqxf2ta3h@altlinux.org>

On Sat, Mar 30, 2024 at 05:24:39PM +0300, Vitaly Chikunov wrote:
> Is it OK to mirror git.kernel.org from it's mirror
> kernel.googlesource.com using grokmirror?

I don't recommend it because kernel.googlesource.com doesn't publish its own
manifest, so you are always going to be in a race between our manifest and
their mirror.

> (Recently we getting 502 Bad Gateway from git fetch from git.kernel.org
> directly.)

Well, at least grokmirror should recover from such conditions. It doesn't
happen very frequently, but every now and again a CI farm will try to use
git.kernel.org directly and that tends to cause problems.

-K
