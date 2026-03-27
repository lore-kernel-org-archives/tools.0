Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61E633126C4
	for <tools@linux.kernel.org>; Fri, 27 Mar 2026 19:06:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774638417; cv=none; b=B5yJWn8CN+W227LmsL8bnwy+6RgYS1/fdY1la2ZsqmoiUM34GZUW3rTX2TyKquvnjQMCHW3J+FP/JK79DduqYl7qTIAVsmQ/wvi/xN4JF/seVKfuHtLDzmsHSS+7Ajhcc7xusLMQ2FXWKCPNpXYRU9YGMDt85Qje9H+/5ppqFlM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774638417; c=relaxed/simple;
	bh=0mo8EqXnWYN78TuzO47Otz1Is3MGvTbnSFrirrmV1Rc=;
	h=MIME-Version:Content-Type:Subject:From:In-Reply-To:References:
	 Date:Message-Id:To:Cc; b=BwZucN9pq+D2XDyS4lXUebgCRn8Pp5wuaS2XNEiAO8tXDRFpOPVMMlarslTZnibege53/FmQeite1qG1Iks+CLM8fWcQ+df12/9CUeu19HiJjB54vkBzzC+ZL47v74TLa9JvxOBCGvaukPkFo9aP3hOPE5bO9LrQjA9u7AMehWI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=prXhispo; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="prXhispo"
Received: by smtp.kernel.org (Postfix)
	id 326CCC2BCB0; Fri, 27 Mar 2026 19:06:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BB3C4C19423;
	Fri, 27 Mar 2026 19:06:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1774638417;
	bh=0mo8EqXnWYN78TuzO47Otz1Is3MGvTbnSFrirrmV1Rc=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=prXhispoLbs6AkNoAnnIyCDYCTQbxzLdta/txad1tOaAfW6aISclATpIN9OLEiHPe
	 RLqOu0iTHqiTRd+Z3cVimfCSFTOuxm0NrJ9BxJC4mSqbJgkD4J5OUErSdokBzqTmai
	 p9eEBMpI5x7HEiOUqTs2xx85+KaCntEUPnVLVR1g=
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: `b4 prep` "not a prep-managed branch" error with changed Git
 email
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
In-Reply-To: <CANiq72kPiVvPrk9XjLv4QdBhtiPyGkjONu7BijF2mYdv4BM2Tg@mail.gmail.com>
References: <CANiq72kPiVvPrk9XjLv4QdBhtiPyGkjONu7BijF2mYdv4BM2Tg@mail.gmail.com>
Date: Fri, 27 Mar 2026 15:05:59 -0400
Message-Id: <177463835932.1517696.6524897957124634278.b4-reply@b4>
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: Igor Korotin <igor.korotin.linux@gmail.com>, tools@kernel.org, 
 users@kernel.org
X-Mailer: b4 0.16-dev-6bace
X-Developer-Signature: v=1; a=openpgp-sha256; l=1530;
 i=konstantin@linuxfoundation.org; h=from:subject:message-id;
 bh=0mo8EqXnWYN78TuzO47Otz1Is3MGvTbnSFrirrmV1Rc=;
 b=owGbwMvMwCW27YjM47CUmTmMp9WSGDKPXXWYsFpmz9X9M/6713reuLNw0jXTv5+EfjU/eVa+w
 tFl/eqfsR2lLAxiXAyyYoosZftiNwUVPvSQS+8xhZnDygQyhIGLUwAmcseQ4ReTuh13jnXnl77L
 T9ldbiilJ1WfclZeof5x6tvYt3o3959j+B9bHC+/13dZcG6E5pQczvYjK0P+bmgVDk9dOe1nyld
 mO3YA
X-Developer-Key: i=konstantin@linuxfoundation.org; a=openpgp;
 fpr=DE0E66E32F1FDD0902666B96E63EDCA9329DD07E

On Fri, 27 Mar 2026 16:22:03 +0100, Miguel Ojeda wrote:
> Igor (in Cc) contacted me since he was having a blocking issue with
> `b4 prep` to send a v2 of a patch series. He was consistently getting
> the following error:
> 
>   CRITICAL: This is not a prep-managed branch.
> 
> I don't use the `prep` subcommand myself, but I tried it and couldn't
> reproduce it, so I suggested contacting you with a reproducer, and in
> order to do so, I suggested getting the Git log `--fuller` of the
> branch. Then I noticed he had a different committer than the
> Signed-off-by -- I recalled he was changing his email recently in
> another patch to `MAINTAINERS`.
> 
> And, indeed, if I changed my Git `user.email` I could reproduce the
> issue. In Igor's side, the actual trigger was that for v2 of that
> patch series he was adding an entry to the `.mailmap`, i.e. the
> effective Git user email that appears in `git log` is what counts.
> 
> Is it intended? If so, could perhaps `b4` suggest that may be the
> cause in the error message? (or even check that is indeed the issue)

Yes, it's not intended but it's a known gotcha that I haven't fixed yet.  
It's a side-effect of a guard that I hastily put in place after the time 
when a prep branch got merged into linux-next by accident and broke "b4 
prep" for everyone.

I've added this to the bug tracker now (using the spaking new "b4 bugs"
app) and I'll work to show a better error message and a way to recover 
from this condition.

Thanks,
-- 
KR

