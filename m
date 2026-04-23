Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 687DB2DCF62
	for <tools@linux.kernel.org>; Thu, 23 Apr 2026 13:50:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776952238; cv=none; b=rZCF1fLm7m9TNjrdnVtO69Y2oXkaOukPuoXnPvfGksYMmqNvh8XwdlGBydsKWbt1l0FfDCrHwrsQdsRNIur401jTaZ9xGaor4c0w+psuEU0TM51EqMO3IWHL1nUbEa8tWwFaAZsYzvwy+djm0xkYZVF+rNqbLm0yHY6aLaWndi8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776952238; c=relaxed/simple;
	bh=WnqZVHQlzbrvc64C9ujcBkJOaQ//b9IQLqTBYD+iVIg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bwklK1KIu5HZWrAQ5OaB3kw8QEQguiibjPkdyYlDZZ8lCIKd040+zDDSASZCNLG9vpcrZzAgP9h45diQBvsqE/MSZ3ZOIFzTO3qN58TjRyYTvIs72d/o22yc3RvJD2kYFuOmZeJcNRsdj033dhLqCL06v7WOqej2FuCxox3H4QY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=yY03g8Ld; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="yY03g8Ld"
Received: by smtp.kernel.org (Postfix)
	id 486BAC2BCB3; Thu, 23 Apr 2026 13:50:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 14526C2BCAF;
	Thu, 23 Apr 2026 13:50:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1776952238;
	bh=WnqZVHQlzbrvc64C9ujcBkJOaQ//b9IQLqTBYD+iVIg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=yY03g8LdK2wC+tzzLmXV+6BvDj5kRJ11cPo6/L8jaUIeSINosNMKl2ZN6gp8k7WFL
	 UVbDXWCZppzX+LTQhEuOjofx2L3aKjx5GKEZdq9mTjEsaJ6DRPsWy5wN/8JxpWCkhU
	 TibUPx1ej5NgOhtMMrrOoQFf8o1dIG5UV5twAiV8=
Date: Thu, 23 Apr 2026 09:50:37 -0400
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: Mark Brown <broonie@kernel.org>
Cc: tools@kernel.org
Subject: Re: b4 backtrace on startup
Message-ID: <20260423-amphibian-gray-numbat-c7c08b@lemur>
References: <7da1f1d1-25a3-4f8b-b56c-7f67c334c0af@sirena.org.uk>
 <20260423-victorious-hare-of-serenity-65fe5b@lemur>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260423-victorious-hare-of-serenity-65fe5b@lemur>

On Thu, Apr 23, 2026 at 09:26:59AM -0400, Konstantin Ryabitsev wrote:
> > After upgrading to latest b4 git I get:
> 
> Bitten by python-3.14's lazy evaluation! I have a commit in place and I'll add
> a script that actually runs tests across every supported major python version
> to avoid this in the future.

The fixes are now pushed. Thanks!


-- 
KR
