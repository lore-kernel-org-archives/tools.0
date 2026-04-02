Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A4F142AA6
	for <tools@linux.kernel.org>; Thu,  2 Apr 2026 19:46:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775159204; cv=none; b=V+tZnVf3+CsXnxSpzS132SVC/pHIchcCfFa0z8i3CNukLPs6GOkhbjh/LWaRhBQqretxozeXm82d365dVVDMZ0rioH0dpNanrK8M6/rq790Ar0fcMaqQGtOPeWB7W3n9wT5/HzyJGQL8xuL2zSDXkH70tmbgxW7AmqYyP/S/Uvw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775159204; c=relaxed/simple;
	bh=1xkCTGkDXin7N5uMgSxfnNddosdnIRkv5S5jZrG3i9Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AjCNC4EAW5+42sDuBVlcyA7paiWTcjfnHSjR7cvzXSdKdjDS5RIboWLDfrLmjIqx4N0CDpUOdtrkO8xbO/orCO8RuQi5XtQchiNcAWF9VnaXChsUAvXAA0g7C1o7yfDF5odKMXBQduw97UK6BLOtvprpfWx+DX/NjiyHZ65SDXY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=RpTWtKGj; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="RpTWtKGj"
Received: by smtp.kernel.org (Postfix)
	id ED76FC2BCAF; Thu,  2 Apr 2026 19:46:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B8F85C116C6;
	Thu,  2 Apr 2026 19:46:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1775159203;
	bh=1xkCTGkDXin7N5uMgSxfnNddosdnIRkv5S5jZrG3i9Y=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=RpTWtKGjxeyZQpig6TfepifedoSnprxVtZDUgSC8mUwTuhjo+Gaa7R6dGezpfOqoP
	 KV601e2HJEWFkf0s0ziIo1tMUBR2r5iJaPdXEoQ+6kjzvLRS98AB1BwbBk8Y/nrdFv
	 QNmOk4GGhOB0K7wF12sTifPtcZizWcoMxV+lsZkA=
Date: Thu, 2 Apr 2026 15:46:42 -0400
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: Tamir Duberstein <tamird@kernel.org>
Cc: "Kernel.org Tools" <tools@kernel.org>
Subject: Re: b4 type checking
Message-ID: <20260402-messy-acoustic-wren-63e0b4@lemur>
References: <CAJ-ks9nyNcqk0LPdCsir1i8=2FQZEEVRx6fTW6FWsCpiNDbJvA@mail.gmail.com>
 <20260402-didactic-excellent-scorpion-8f5189@lemur>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260402-didactic-excellent-scorpion-8f5189@lemur>

On Thu, Apr 02, 2026 at 03:28:55PM -0400, Konstantin Ryabitsev wrote:
> On Thu, Apr 02, 2026 at 01:15:51PM -0400, Tamir Duberstein wrote:
> > I sent some typing improvements back in June 2025 and I see you've
> > been steadily pushing things forward since then. However, when I try
> > to run `uv tool run mypy .` on b4 I get just over 350 errors. Is there
> > an invocation that's expected to be green?
> 
> For the most part, "mypy --strict src/b4" gets only a few errors. The ones
> you're seeing are mostly tests, I think. I see that uv reports more -- I'll
> take a look at them.
> 

There were just 3 that I found. The report is green now:

$ uv tool run mypy --strict --python-executable "$(which python3)" src/b4/
Success: no issues found in 28 source files

There are a few more in src/tests, but I don't care about them as much.

Regards,
-- 
KR
