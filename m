Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27A8C30F547
	for <tools@linux.kernel.org>; Fri, 10 Apr 2026 13:59:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775829564; cv=none; b=qQ8ZS2Nl/TzH7xuiUNLb83pz/5BnserHuDrwA0Lui9EEq75c3/ycMDmDBACC8BRDf6ZxE/XQhhfybwRrAqtmI2h45bDoGFeP5+6hr9jIWy/EYVzTM8pB+tyjKHuyB/MMXgbDIl58XCV/NQix7UroF70kSNBm3T3DM7TQ7h8vpls=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775829564; c=relaxed/simple;
	bh=ms4O3X84o0RNDK5GjSomZ3kRfIzrpWS/whC9RaZFepo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=b6UL2GvlovoQWq8zhL7MH+SPXO+jUi+ZJrE3nsJh7z8eQcHPqMZg1kB69a4IBseTs1KNEds8eYis1wEOxbej7+m8iOFpa0ZnL5XSjsXWaO81Jlrs4QDAGAqXR60JBx7p2LLa/UouYJuSkdSf54uAt8r5BlZSVlqVIMzaAzFNHxA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=DsOYZsZF; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="DsOYZsZF"
Received: by smtp.kernel.org (Postfix)
	id 0295CC19425; Fri, 10 Apr 2026 13:59:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BCDE2C19421;
	Fri, 10 Apr 2026 13:59:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1775829563;
	bh=ms4O3X84o0RNDK5GjSomZ3kRfIzrpWS/whC9RaZFepo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=DsOYZsZFlLLKDso7S6uXC5jH1Z/aCW6Zoky40qdri8K+vZw7sfzTTdE0ufXU7IHov
	 vkf9ut38955dE0rkt7wX5Ltf4HlF9rBOFJqXwk7Ag7SsWNBZU0MU+65fbxWe2x4rM7
	 Aa5mmgr4pd/Sa91xifc5tD+96xIPzvINvqoOUhP8=
Date: Fri, 10 Apr 2026 09:59:22 -0400
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: Rito Rhymes <rito@ritovision.com>
Cc: tools@kernel.org
Subject: Re: [PATCH v1 0/6] Allow site layouts to render properly on mobile
 devices
Message-ID: <20260410-hulking-juicy-boa-daef75@lemur>
References: <20260316180036.71949-1-rito@ritovision.com>
 <DHP4NMANLLWE.2IAG0KWI6ZY06@ritovision.com>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <DHP4NMANLLWE.2IAG0KWI6ZY06@ritovision.com>

On Thu, Apr 09, 2026 at 10:42:57PM -0400, Rito Rhymes wrote:
> Konstantin,
> 
> Following up on this patch since it has been about three weeks.

Please be patient -- I have to juggle a lot of priorities and the website is
taking a lower priority for the moment.

Thank you for your help.

-K
