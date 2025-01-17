Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CF559443
	for <tools@linux.kernel.org>; Fri, 17 Jan 2025 15:20:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737127218; cv=none; b=i1eyL7g8f5hFZU06g/43B7j/Bvz9zxFGT1uM0ZbWZSJrzcPDOA7sQ8VPgfuakDfqgDXNYpZS76Z2K6LqH1nYMK0SULuUQ3DCcgdmAswsuWNzVAevBRncUkPevxSQ9pJCVG/NJMSJHZWGap7BzXExv/4neSAAK734Tg9CdFCR0os=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737127218; c=relaxed/simple;
	bh=/AsdmUTjTciKz+AmqASrZhApJ4tIukiGQaQsmmAcFC4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UDynEqX9v3cLXYe9U44Y35HTCHiPp8J4eaIUty0HtQ+qBBnpYewzAHxiL3ZONlHzKOSwjRK8UVC14KuVLE/JZsQVMxzIi6Fd6DfF5eQDRh3qZKdJ6lk7gS3ZsKTQeXU/SChhO13liVckG9wrgsqC1/H6xWFJJP91B9JQp0g2l3E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=QunkUpTY; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="QunkUpTY"
Received: by smtp.kernel.org (Postfix)
	id 18EB9C4CEE2; Fri, 17 Jan 2025 15:20:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D54D0C4CEDD;
	Fri, 17 Jan 2025 15:20:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1737127218;
	bh=/AsdmUTjTciKz+AmqASrZhApJ4tIukiGQaQsmmAcFC4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=QunkUpTYXV6EXEI1BHi+TmwXX2cFNreQG3icAbkQ+NGt1movjD+QAl+2eOqg7ka48
	 sOYJ2aSPkfvblUOfzNy5UnH2tvgpSJi0aUtKv5Mkle5dBa7/i0t45wo3pBQkR8J+Vr
	 oAiNPWA7oOMa4qzU1thr8RA3ZtaC4cssLdWNOVZ0=
Date: Fri, 17 Jan 2025 10:20:13 -0500
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: Quentin Schulz <quentin.schulz@cherry.de>
Cc: "Kernel.org Tools" <tools@kernel.org>
Subject: Re: [b4] prep-pre-flight-checks doesn't seem to work
Message-ID: <20250117-ambrosial-interesting-trogon-a67628@lemur>
References: <a8bc0958-6c46-4622-96ef-b1e55c15f30f@cherry.de>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <a8bc0958-6c46-4622-96ef-b1e55c15f30f@cherry.de>

On Fri, Jan 17, 2025 at 12:35:16PM +0100, Quentin Schulz wrote:
> Hi all,
> 
> I believe prep-pre-flight-checks doesn't work.
> 
> I've added
> 
> [b4]
>   prep-pre-flight-checks = disable-all
> 
> in my local git repo .b4-config, but b4 send still complains.

Right, we only pay attention to a small subset of configuration options
coming from .b4-config and prep-pre-flight-checks isn't one of them, because
it's not something that should be configured project-wide.

What problems are you seeing that makes you want to disable pre-flight checks
for everyone?

-K
