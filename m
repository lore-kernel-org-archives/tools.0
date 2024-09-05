Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B2B33D6D
	for <tools@linux.kernel.org>; Thu,  5 Sep 2024 20:10:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725567017; cv=none; b=UxUKqBQkgrFfUy6kGIS2u5HkQ5vjCCa4CD4wJN3ZQwbWIJZHcaZoHd/B0lp7MV0CIWt63hvMhn0+DqhuQEQh14VW0oCyzYwMLmHqMNgWGlj1KAUrgF/lQOYYtB2MGrQIaYmJJLyPaxOYMml9GLT0C/iX2y4907RmxN9iBwyugv4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725567017; c=relaxed/simple;
	bh=VR+rYf4BnFm/bzHs7q5wIHdohWmFeFtY7e9jS3wmEAc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iMTbEPSpbaCTaAXYacjy1ucKf8Bd48sXuYWe6AMs4rlKK42Ll0aZE5tZ3vPWqWB5jhECf4PZ85cbCf4PTRwosKdSr3Qr3YnOIlINQPO1wVxYMGGpC4OGsT8+YmXPsz+neIHbcoU9FheWuXCPq5tY6LC+RRDT21RNd/ohyKrx6GU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=t/4zXRP+; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="t/4zXRP+"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AA3CDC4CEC3;
	Thu,  5 Sep 2024 20:10:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1725567016;
	bh=VR+rYf4BnFm/bzHs7q5wIHdohWmFeFtY7e9jS3wmEAc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=t/4zXRP+jBz6KLfv/4tA/5RSXopeN5DsNQLS84tY8lmEWGnfgBxbWYoTaSHbGWfLp
	 2xcrqHdlZFX7YRZzk2MZ+BhKKJo5/K4Sp4AeoiDF1iZto61oNfORjqbjVyLC6SIUuS
	 zmxJjPjCdLu+BdBsstu59dBLHfZY0U1+xC4gBVfI=
Date: Thu, 5 Sep 2024 16:10:13 -0400
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: Mark Brown <broonie@kernel.org>
Cc: tools@linux.kernel.org
Subject: Re: b4 prep --check for signoffs
Message-ID: <20240905-bouncy-successful-chimpanzee-b1e2ea@lemur>
References: <fc6eba60-6cde-4e8c-a075-61d564c33e26@sirena.org.uk>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <fc6eba60-6cde-4e8c-a075-61d564c33e26@sirena.org.uk>

On Tue, Sep 03, 2024 at 07:47:16PM GMT, Mark Brown wrote:
> Hi,
> 
> It might be helpful for submitters if the checks implemented by b4 prep
> included a check that there's signoffs from at least the author of the
> patch and the person doing the sending.

bugbot assign to me

Is that not something checkpatch already checks?

-K
