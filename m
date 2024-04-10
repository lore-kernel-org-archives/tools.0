Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4451353372
	for <tools@linux.kernel.org>; Wed, 10 Apr 2024 19:17:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712776676; cv=none; b=mTRBXtau61n5JgdjPaGTRwSdSblzuVW20Zo718cdSqHTmXTF2TuDcvag9/zFyhd2KGgvxNoNhORBmg8ySYxfjagnvErRvctqytNS7kcbktoMAP9PfT5ISzwYkDp5GvC6RW0CjpWQ6UvOY7bX6Rk9/52Q7k7CQOOzBT3WUl8wKBk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712776676; c=relaxed/simple;
	bh=EzWA5dhFifaQQc55AV9uTf4CcMn3kmu51CZMCBsBYMo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fZBfYaEYSC3ml8zmsn/0oNeBRLgsnB9A72I/yRhHtwYRSpouPR7ZiKLXEVBze9bi2y9v++oAQql/O4XtNPjebvUfw8uFsPzBzy/oT2ilu/61NtndgggC5rV+CwwvbVfbNRilNpkGqpcSe+07WYuIh3kpW3cuRZCgXjB/tL1GoHA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=sKT0nU33; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="sKT0nU33"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C1017C433C7;
	Wed, 10 Apr 2024 19:17:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1712776675;
	bh=EzWA5dhFifaQQc55AV9uTf4CcMn3kmu51CZMCBsBYMo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=sKT0nU337I46ry9cAXT5bPCNCJxFCtwwh3hVqFnnVpCmsV48+HvOqW7CP9oZbBsit
	 BO6Ysj+8JEmgW317td8XarCLu5WRBkGggTC8J6H2zVpzknJ9zhxWxIlzIeD6PUy6m2
	 RBfnDQq8fiscc0Y1FYvxdK+jCJpyyv947Q563E/Y=
Date: Wed, 10 Apr 2024 15:17:54 -0400
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: Mark Brown <broonie@kernel.org>
Cc: tools@linux.kernel.org
Subject: Re: b4 needs-editing check vs single patch serieses
Message-ID: <20240410-modest-mini-cuckoo-b6e05a@lemur>
References: <c9a9347a-b795-4824-8edb-9fba31cdfc5d@sirena.org.uk>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <c9a9347a-b795-4824-8edb-9fba31cdfc5d@sirena.org.uk>

On Mon, Apr 08, 2024 at 07:51:36PM +0100, Mark Brown wrote:
> The needs-editing flag in b4 prep --show-info was intended to support
> scripting which wraps b4, allowing it to see if b4 would refuse to send.
> However as implemented the check does not take account of the logic b4
> has which doesn't require a cover letter for a single patch series, it
> will just report if EDITME is present in the cover.  Wrappers could do
> their own version of the single patch check but it would be good if this
> were done in b4.

bugbot assign to me

-K
