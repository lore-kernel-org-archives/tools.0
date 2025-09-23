Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97F2915624D
	for <tools@linux.kernel.org>; Tue, 23 Sep 2025 19:50:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758657059; cv=none; b=RdbWb+jaNAgcHPCTE6kHEfc+s9kEorCq8vnzQY9SSWcLhwafXTMwG3Wuw40YUpNarVVDvgFmMuuijNZQ7XIvx0fMMTcwLn44X92DkuCRJh94pfd5zarF504Ot0iO9pmuupNFs7uKZx/wU967XqcAaCkpI5Weqs/AXS8AUzvEoM8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758657059; c=relaxed/simple;
	bh=7BIW8uDMuCH3nmIW96jlpTPJcvUJWRiKQ3/7bq+E00U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FZrqL8hxn3A8eL3gx9IkMQNBrdt0Zk4LvUVQWYZXXX12Fg4GDC/a4tcFxs7ZzFqhE0cHxZPLULZEbRqqrx/vRprCjXoQHmCGwjCTplEYVuKDKq5RWPH/LPHi6xxM07knSl7LcM0DkIRvCbmqtrioK/PJePFhvErVPst5fA9EvJY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=EIuri2r2; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="EIuri2r2"
Received: by smtp.kernel.org (Postfix)
	id 77575C116B1; Tue, 23 Sep 2025 19:50:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 32E2EC4CEF5;
	Tue, 23 Sep 2025 19:50:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1758657059;
	bh=7BIW8uDMuCH3nmIW96jlpTPJcvUJWRiKQ3/7bq+E00U=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=EIuri2r2+XNEGzAPiSFA10OMKAjBtNsmlnMulsMtm5cl0WYCD/XN6p1Cdl2OJ2uK2
	 uP6PvlSWZ+JGE2iCMMx/Pfuo6mZNGSpClE7jPIoQbnK91jaQYv6n31wCT69AFBl/IG
	 VtkAA0EnClOKkMyp00eeTUL4x7lKRIKumQ6vzKKk=
Date: Tue, 23 Sep 2025 15:50:58 -0400
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: Vincent Mailhol <mailhol@kernel.org>
Cc: tools@kernel.org
Subject: Re: [PATCH v3 00/20] can: netlink: preparation before introduction
 of CAN XL step 3/3
Message-ID: <20250923-impossible-splendid-rabbit-ba01ba@lemur>
References: <20250923-canxl-netlink-prep-v3-0-87a7684333f3@kernel.org>
 <13f98eed-b535-4360-a545-0a11dbc8aa12@kernel.org>
 <20250923-rose-shellfish-of-wealth-c8dee7@lemur>
 <715c6b6d-5672-4ba4-99d1-04fcd1dbb81b@kernel.org>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <715c6b6d-5672-4ba4-99d1-04fcd1dbb81b@kernel.org>

On Wed, Sep 24, 2025 at 02:54:36AM +0900, Vincent Mailhol wrote:
> > No, I think something else went wrong here. You did list
> > prerequisite-change-id, but it's only a 4-patch series. I'm not sure where the
> > other ones came from. Can you push your b4 branch somewhere where I can take a
> > look at it?
> 
> Thanks for jumping in this thread and volunteering to investigate. This is kind!
> 
> I pushed the v3 in my tree under the branch:
> 
>   b4/misterious-prerequisite-patch-id
> 
> https://git.kernel.org/pub/scm/linux/kernel/git/mailhol/linux.git/log/?h=b4/misterious-prerequisite-patch-id
> 
> I did a 'b4 send --reflect' to double-checked that it still has the issue.

Dropping others for now, and just adding the tools list.

What is your net-next/main pointing at right now?

    git rev-parse net-next/main

-K
