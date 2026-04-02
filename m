Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CF6D34A795
	for <tools@linux.kernel.org>; Thu,  2 Apr 2026 19:28:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775158137; cv=none; b=pXhvpEWmBMG0+lx/u2m6NYyZL5l8BZOw0XS0FWwwKALpwrudEci1uds0Io7Y8trDgszhUNAXWDqSAexRSAlBcRaFk7sD9iT4iYlhedgtKQ7O2/U3+tx0Myjt0onPiVvxdAj0smMuSrnhE5lipdgFy72SOLELg8l845YToQgI/rE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775158137; c=relaxed/simple;
	bh=/VnaGqgp3OXbqUsOhbqc6c3r/T04wHVbv3V5PTOfZq0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZZrTQ6QUaRnD+QZeVz5zFr3bNde5zUHagj/LLQwv3YZGRgFb5bc+Ius+hy5r4tMzmj2nZu2BeCewzoQU383X5l730BG23HonTa/ZFcKIque3vDnzTGaPpEqHzDF4pZhIEKGH3lgRf8Bbjxi+zHOMYegxV2jFPw3p+RqyFjyikCY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=mpj113ni; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="mpj113ni"
Received: by smtp.kernel.org (Postfix)
	id D497BC19424; Thu,  2 Apr 2026 19:28:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A299CC116C6;
	Thu,  2 Apr 2026 19:28:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1775158136;
	bh=/VnaGqgp3OXbqUsOhbqc6c3r/T04wHVbv3V5PTOfZq0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=mpj113nimMBCQs8FOnWdSzK9roc1wh7Ts7JfJX0ZbkR12NQfQsWPvpOu7bBLdBH6E
	 rGuiWAm6GV1pqwaPDP6GyNVhcfu3BZIAJ5PkT2PvbfyTStJMoRKJtWTAT6nme6dKOm
	 XXZa6mDjc9pWYD0SbX3yzorK8vCyw52e+OoqAldI=
Date: Thu, 2 Apr 2026 15:28:55 -0400
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: Tamir Duberstein <tamird@kernel.org>
Cc: "Kernel.org Tools" <tools@kernel.org>
Subject: Re: b4 type checking
Message-ID: <20260402-didactic-excellent-scorpion-8f5189@lemur>
References: <CAJ-ks9nyNcqk0LPdCsir1i8=2FQZEEVRx6fTW6FWsCpiNDbJvA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CAJ-ks9nyNcqk0LPdCsir1i8=2FQZEEVRx6fTW6FWsCpiNDbJvA@mail.gmail.com>

On Thu, Apr 02, 2026 at 01:15:51PM -0400, Tamir Duberstein wrote:
> I sent some typing improvements back in June 2025 and I see you've
> been steadily pushing things forward since then. However, when I try
> to run `uv tool run mypy .` on b4 I get just over 350 errors. Is there
> an invocation that's expected to be green?

For the most part, "mypy --strict src/b4" gets only a few errors. The ones
you're seeing are mostly tests, I think. I see that uv reports more -- I'll
take a look at them.

Thanks,
-- 
KR
