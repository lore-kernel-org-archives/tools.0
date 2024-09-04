Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42E241CDA1E
	for <tools@linux.kernel.org>; Wed,  4 Sep 2024 12:21:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725452497; cv=none; b=DzJ9XZD3G1HfdeKQR9TJiI3hxqmQEv+OZu4RppJ9F0K5f58IsPnbEnnF6IJDHlBcRcRoykOcyMVXHo9p7/OyGUrKtI1FlMdZD4I7cGceDNyz5UFzDU6kSr+sOAL7brUcGh9DPstTUwi53yjSfCIaeleEBfE5ZDd3FMrEo1MEADs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725452497; c=relaxed/simple;
	bh=5OLhHp29SMdFOVGLyRZGHTfl21iq4PxoyqdqvLKIavU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IwrWUKl/aUF+baPIqI6oPtKqZWd9BhaztIve7A2DwVC8A4fEwlaht/ZUSDCPD9zZIoVnTpbA8oPh4Wm6LCSxmPB2z4saE4YAdOvhZ4YAPilctMjO/hE2r1SdwyKZEIl9ea23NnFejPhOtXVhRPUByQ7NvmlUL7TQhxGXpDXNi+w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=2Isvx43r; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="2Isvx43r"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8DBB0C4CEC8;
	Wed,  4 Sep 2024 12:21:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1725452496;
	bh=5OLhHp29SMdFOVGLyRZGHTfl21iq4PxoyqdqvLKIavU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=2Isvx43rTVDjM/jy2hLUoG5y5OsGp2d6kdEPwgQVaGOyiPlkOw05YjBY7aqQsGXRf
	 uKq3tn2WdaXOPeloC52VyxHPERHvwauBUCagEBfZct72VkqlzG+YUKcQ5vmRmDYXDj
	 59475vdwPS/UGsQc8AEpylhD21uc9nkCbhZdhf3I=
Date: Wed, 4 Sep 2024 08:21:32 -0400
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: Mark Brown <broonie@kernel.org>
Cc: tools <tools@linux.kernel.org>
Subject: Re: b4 send falls over sending a series
Message-ID: <20240904-fat-thundering-cuscus-fedd1b@meerkat>
References: <9ae3668b-666f-47d9-9d25-be0fc57b6335@sirena.org.uk>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <9ae3668b-666f-47d9-9d25-be0fc57b6335@sirena.org.uk>

On Tue, Sep 03, 2024 at 11:42:21PM GMT, Mark Brown wrote:
> Hi,
> 
> When attempting to b4 send from the branch:
> 
>    https://git.kernel.org/pub/scm/linux/kernel/git/broonie/misc.git documentation-b4-advert 
> 
> with current git b4 the patch is sent but I get the output below and the
> repository is left with the base commit checked out as a detached HEAD:
> 
> Sent 1 messages
> Error tagging the revision: Could not cherry-pick the cover-less range

Could you send a "b4 prep --show-info" for that branch?

-K
