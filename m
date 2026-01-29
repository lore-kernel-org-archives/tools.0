Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D59CD2EBDD0
	for <tools@linux.kernel.org>; Thu, 29 Jan 2026 14:41:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769697671; cv=none; b=m7N6k/fcJ0BNxVLsvtEAM2pLWLuDi2Pd9TPA9Dd74XSfFH0jP9hXktfPdC5lYW1xMXEjPJ0/AYYpU1S7PIhB9/K0JyjMR6CmFGTCxaAUXcCDp8vGF1C+wxi0VeoQizV8weaK0P3yqZvu1dR21qVK5lX0y1p5VE70w76mGiQasS8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769697671; c=relaxed/simple;
	bh=Aqbn5jc+SO4eaV6xrSIQPAks7Sd6eyLXh3h8bT6XEso=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uhMaZhSlW9hRv1ypXrvMxBQE9ETWKqDAQ7Ng76hFibn0tBTySBEAnRjLR/qmTB48hnm5PmQQsvSJdEGEwE67c8tKeLO8fnNff6+MDKjx/6ITIgGIoj2zp0Wt3wxh5/j44PCdY8yPFJllleMc7ZdiIW1WmxH41RkZBSkihUL9v5g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=xm0aHo91; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="xm0aHo91"
Received: by smtp.kernel.org (Postfix)
	id 782F9C19422; Thu, 29 Jan 2026 14:41:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4291BC4CEF7;
	Thu, 29 Jan 2026 14:41:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1769697671;
	bh=Aqbn5jc+SO4eaV6xrSIQPAks7Sd6eyLXh3h8bT6XEso=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=xm0aHo912pNyC7lqKuvNSJqkHj0CtTWvEvm1E1Vpc9be6RFTL1rV22bs+g/yBEGVt
	 xi/ABDIWLwxXyYY/cNPcl6bMiAvsptCncEyN8WXwHR9mECpJ9X5S1Pzc9cFRBFDB00
	 B51RAfL+O08VsFZfppcNqfDfDQ1cvBhglxw042D0=
Date: Thu, 29 Jan 2026 09:41:10 -0500
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: Dirk Behme <dirk.behme@de.bosch.com>
Cc: tools@kernel.org
Subject: Re: korgalore: Mail directory keeps empty?
Message-ID: <20260129-crystal-dingo-of-serenity-659f4b@lemur>
References: <5fd95298-afc1-4789-8b15-2b24e8886edd@de.bosch.com>
 <20260128-wild-honest-cougar-c002de@lemur>
 <29c56255-2e88-4bf5-abf6-c02aa8f953da@de.bosch.com>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <29c56255-2e88-4bf5-abf6-c02aa8f953da@de.bosch.com>

On Thu, Jan 29, 2026 at 10:22:48AM +0100, Dirk Behme wrote:
> I switched to 0.5.1, deleted the .local/share/korgalore from yesterday and
> with this started from scratch. There are no obvious errors any more! But
> even though there are new mails (commits) the second pull reports
> 
> ~$ kgl -v DEBUG pull rfl // 2nd pull
> ...
> debug: No new commits for delivery: rfl
> debug: No deliveries with new commits for target: local
> ...
> debug: No tracking manifest found, starting fresh
> Pull complete with no updates.
> 
> and the existing maildir Mail/rfl/ keeps empty.

I see where this is happening:

- first pull clones the repository but doesn't initialize any state
- second pull initializes the state per delivery
- third pull starts actually delivering new messages

The good news is that it will work on the third pull, but we need to have it
start working after the first pull, not the second pull.

You don't need to change anything -- it should work for you now, but I will
see how we can make it work after one step, not two.

Thanks for the report,
-K
