Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E701B3C7E11
	for <tools@linux.kernel.org>; Wed, 11 Mar 2026 15:29:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773242989; cv=none; b=pOzXF81n9g/2sopuiAPPgYZU3lZo1wnBMS49HrYIaEcwp/1kybu7oRHy2DavFoKVd4jB8za+yESmf1tRDYSxecptu9vgt3iu4tu7uWVJLYYWsufAb8zA3rX71OuBGoLFoPvGgdBCfJe3tbAq5zX+5cw75kZBykThAqimF4HCmXw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773242989; c=relaxed/simple;
	bh=fM0hipmgect1yZk1JAC8SCluwH+IFjUGn1J/qPFutf0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZTudg5rz5p8mJhpi7JTQs4iNq3X3hLhsktIddZuEuk850AeNsszihTUNzfLGi+6+0pwrHVuLixFopiOuE/qejhCGhx0KmIpqgen++o1dvjWO8Mo5Fr1oPqZPunQLhMUqcsCgF+HCl9hYSn/4N4uucvuvqiqB7mstRB9AVU2F0y8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=uhuznhvz; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="uhuznhvz"
Received: by smtp.kernel.org (Postfix)
	id 8E2FCC19425; Wed, 11 Mar 2026 15:29:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 57EFDC4CEF7;
	Wed, 11 Mar 2026 15:29:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1773242988;
	bh=fM0hipmgect1yZk1JAC8SCluwH+IFjUGn1J/qPFutf0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=uhuznhvz7Ukc8+yVxXny4wqv3SsqOXqz63l/QvM1yzhF5rjOE/dHsF4HtIo1vWUNN
	 3x4lWGNle3oRVSrwQjo19MmrH8R0JQ2knt0Cq6Jifa7DESaHp8J2uOb1Bi0iu8d9bC
	 0aygd5YXar+5QE6p1L2iU9Ny4w4MalehqwtPJvFI=
Date: Wed, 11 Mar 2026 11:29:47 -0400
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: Vlastimil Babka <vbabka@suse.com>
Cc: Brigham Campbell <me@brighamcampbell.com>, tools@kernel.org
Subject: Re: [PATCH] Fix typo in maintainer docs
Message-ID: <20260311-elegant-unselfish-silkworm-7c37e1@lemur>
References: <20260311074014.289088-1-me@brighamcampbell.com>
 <20260311-invaluable-attentive-gopher-dd0a55@lemur>
 <c084fc4d-2990-4564-9080-1b7de4a38fc9@suse.com>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <c084fc4d-2990-4564-9080-1b7de4a38fc9@suse.com>

On Wed, Mar 11, 2026 at 04:27:09PM +0100, Vlastimil Babka wrote:
> >>  Enrolling a repository
> >>  ~~~~~~~~~~~~~~~~~~~~~~
> >> -Before you can track series, you need to enrol the repository::
> >> +Before you can track series, you need to enroll the repository::
> 
>     ^ clever!
> 
> >>  
> >>      b4 review enroll [path] [-i identifier]

I bet you find all easter eggs in games as well. ;)


-- 
KR
