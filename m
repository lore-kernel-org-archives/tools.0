Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7FCA1494CC
	for <tools@linux.kernel.org>; Fri, 31 Oct 2025 14:00:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761919236; cv=none; b=hAqoYIveXp9jCbeK6Yo+4tENckin5z4FudTZT4TuG62u1ykgnciNhnXLFtqpCKxoFY5YLJrfRs2tk4a0+iFaeJT0mLDhvMvMaBNGclvHOthekvyM5n1zRmErbzXjkYvM2iAlSIclzkhsWUI/S7BEGTwh0cin1jqRiFgnf8gUxBc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761919236; c=relaxed/simple;
	bh=swEQuZeV9bvbyU7pu6o4h1V4UxV9nFePCGU4/mws6O4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PgZTeC7Td7jkj5rfcryEVEre3sBNE4bL3H8krWsCAOS916yDxGKGnxd+iqRQtPN3JbN8pEU6pnrqd/PRhHyWzoee+Z9MKmO2dFYceHP2pM+z6ahHMx+8hYswSXumnVSyP2eGz8wBRcM9R0rJFP1+UamiRJNQfIOBwbzIyIMvpIo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=NZYIt1SS; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="NZYIt1SS"
Received: by smtp.kernel.org (Postfix)
	id A401FC4CEFB; Fri, 31 Oct 2025 14:00:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 58208C4CEE7;
	Fri, 31 Oct 2025 14:00:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1761919236;
	bh=swEQuZeV9bvbyU7pu6o4h1V4UxV9nFePCGU4/mws6O4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=NZYIt1SS8oJceQAq4nlguoj6iH9oY28BM8F6NIxmrY4K0GXy7757N4FwXtZtbJnux
	 YmyA4wRXCTCHc0gyu8KF0YeQTNmwK0J1710XleigkVUnxLr6wCdOOwjM8g9GB9BugJ
	 wYN+blyme91MNwm6yUlCSg6zq+bV9LK+vj/08noE=
Date: Fri, 31 Oct 2025 10:00:31 -0400
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: Marc Herbert <marc.herbert@linux.intel.com>
Cc: tools@kernel.org
Subject: Re: Unreleased, multi-lines git_filter_repo fix required to run b4
 tests?
Message-ID: <20251031-flashy-bouncy-macaw-2d5afa@lemur>
References: <m2zf97ybma.fsf@C02X38VBJHD2mac.jf.intel.com>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <m2zf97ybma.fsf@C02X38VBJHD2mac.jf.intel.com>

On Thu, Oct 30, 2025 at 08:49:01PM -0700, Marc Herbert wrote:
> So what really baffles me is: how come no one else noticed this before?

They have -- it's a recurring problem for packagers. I've been prodding
git-filter-repo to release a fixed version -- if more people tell them about
it, maybe this will actually happen?

This bug doesn't really affect real usage of b4, because this only manifests
itself when someone sets the cover letter strategy to use git branch
descriptions (which is what tests do).

-K
