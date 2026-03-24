Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0199D389116
	for <tools@linux.kernel.org>; Tue, 24 Mar 2026 18:13:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774375997; cv=none; b=hOhBkreiVXU1GKjwT98zZYjmnQM1gnqnOHWfwg1Xkte0zgV7606seH025PLBGadedrLLJIX7FOxTJK2qR/vKL7pQlp0mtIzRxOkLZHy70q/nCQ2F4gQFFmCfbrkhGqXJk0UuGPww0HfD98Bne43/UW2oqHLsi0/zTCxTTNCZ+tQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774375997; c=relaxed/simple;
	bh=T7mk1FVcuDirRd7AMbiY1XXmc/328SZRIN8iqFDaVvs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MYT5hrCnJxZ00jiqzVOTB3qCRpoINZqWwK4vtFdkowoVxUTGl2MZ0y8ccnfVAO0EF0UQiPU7LpIU4pRs2gPRgei3a0tKqhNnzkaDTwrQAyfb4sSAg0tEpSZ58oJR43dAUGavy2Jv9ldDlS+x/kb2Ll6eK3zOWb+K6bmEz8zLRPg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=D6Z+EX1Z; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="D6Z+EX1Z"
Received: by smtp.kernel.org (Postfix)
	id B6A96C2BC9E; Tue, 24 Mar 2026 18:13:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 83B1FC19424;
	Tue, 24 Mar 2026 18:13:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1774375996;
	bh=T7mk1FVcuDirRd7AMbiY1XXmc/328SZRIN8iqFDaVvs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=D6Z+EX1ZdV+GiGM9Fw7FrURSz55WQGbYlcIHoRnIXH3+7QMyMLks87X5us0QmJ2G2
	 DJ2JD+++tsnAMOaqqcPp4f8Jd9y7aqiR3bZlclVvGyLosNu2FD4n2NscoBUpAusL3z
	 8gDEszh7TrIz8oFBkQdm6SOlL1Dd61DHQi4NAFsw=
Date: Tue, 24 Mar 2026 14:13:15 -0400
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: Arnaldo Carvalho de Melo <arnaldo.melo@gmail.com>
Cc: users@kernel.org, tools@kernel.org
Subject: Re: b4 v0.15.0 released
Message-ID: <20260324-shapeless-poised-turkey-f7b7ec@meerkat>
References: <20260320-portable-jaybird-of-focus-41fd66@lemur>
 <CA+JHD93MSC=GZMscAu8-uMroXYrHzn-w8NgHVSLyjNLJ9Wa=OA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CA+JHD93MSC=GZMscAu8-uMroXYrHzn-w8NgHVSLyjNLJ9Wa=OA@mail.gmail.com>

On Tue, Mar 24, 2026 at 01:03:47PM -0300, Arnaldo Carvalho de Melo wrote:
> Can this be integrated with sashiko? I.e. starting an AI review and waiting
> for it to complete takes time, if 'b4 review' could query sashiko if it had
> reviewed already can save time.

It is, but since sashiko.dev is very new, there are rough edges around the
integration (such as not properly handling reviews that are still pending).

https://b4.docs.kernel.org/en/latest/config.html#term-b4.sashiko-url

-K
