Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02712280A5B
	for <tools@linux.kernel.org>; Fri,  9 Jan 2026 15:54:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767974060; cv=none; b=oYrW5xsbM3VYWfyYnc3tI2gWsbD4GAEXea4LWEefmoqA6sA3Z2Yo2dzxKaCG9xZYNx9Vf61kTsw+9KPQJ4ucz1viFEbSBaRnSmpUjhnGZa+dpPA18JIyv/LWdtLyOwYwj5AUxaD6SDeycVKTdQuOLVkwXTqYi/5Mq2N47DSmYdo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767974060; c=relaxed/simple;
	bh=6ldivo2NMJYUANKYw2+We0ema4yl75uuK6+oxpIKYcM=;
	h=Date:From:To:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Rg+BsHsq6DrpC85XbP0wzQ+2rKzL43V98tzYhl/w8Jf8WCDK4vMF9tEFrWdJM6BXEu+lhbBGes/hO6VmL11PyA5ot1e7Chs6ZuNPmm2RAuZKK1LjjCFMCTmorS8k+aMJnhZHe0BmL4zkZvJq1Yw6l9Akku5VptJBG96UBqSU0hE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=0BGjRi+s; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="0BGjRi+s"
Received: by smtp.kernel.org (Postfix)
	id 9A0AFC4CEF7; Fri,  9 Jan 2026 15:54:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6578AC4CEF1;
	Fri,  9 Jan 2026 15:54:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1767974059;
	bh=6ldivo2NMJYUANKYw2+We0ema4yl75uuK6+oxpIKYcM=;
	h=Date:From:To:Subject:References:In-Reply-To:From;
	b=0BGjRi+sQpOrvv0WU6WrZ7D7Iv0GiCtTDyoiSf8kPz1ogpD2piTSd7yqx0XbxTiXF
	 blNfsmZSskPxNpTkdnR+lNIot9uwI1g3siOROWp5Gscnqv5jf9CucovNvxbdddlTWL
	 KTvJW9uahSBAPpE7FHbNUywFoxxYDFt93+UrTMc8=
Date: Fri, 9 Jan 2026 10:54:14 -0500
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: tools@kernel.org, Artur Weber <aweber.kernel@gmail.com>
Subject: Re: [PATCH] Use pre-Python 3.13 Generator type syntax in conftest.py
Message-ID: <20260109-complex-positive-chameleon-fa72eb@lemur>
References: <20260108165200.11313-1-aweber.kernel@gmail.com>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260108165200.11313-1-aweber.kernel@gmail.com>

On Thu, 08 Jan 2026 17:52:00 +0100, Artur Weber wrote:
> Python 3.13 defaults to None for the other fields of the Generator type,
> but the version of Generator in older versions does not support such syntax.
> Explicitly add the missing fields to allow the tests to run on older Python
> versions.
> 
> (An alternative solution would be to use typing-extensions for older
> versions, though that would require adding another dependency.)
> 
> [...]

Applied, thanks!

[1/1] Use pre-Python 3.13 Generator type syntax in conftest.py
      commit: 3b9f6ecec8e17225b66483ffd0aecb8ba1c328f5

Best regards,
-- 
Konstantin Ryabitsev <konstantin@linuxfoundation.org>
