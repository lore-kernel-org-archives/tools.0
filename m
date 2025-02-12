Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0AC2253340
	for <tools@linux.kernel.org>; Wed, 12 Feb 2025 17:00:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739379611; cv=none; b=llYfaQuk9IcDQ7gPLFyivA9FsJAMYOxpyXk6WCQLmfsfv9M7OApabo198IQEUwrYyH+GYROxO2ijp1aRrRxcXUBaxQlbBQN2zWYtIkgJ2fbeAyKl84TLYqB1m6sH6PafukwWRFfJLRiYOaiRIrKeav2f0qA/3jXUg+8DzRgjtnM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739379611; c=relaxed/simple;
	bh=sIPuAalKRn2gxoFFW+ss6h9cIHyfXQ/oAdYaHvMPnHE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=da1hFjCArWLYH05VwZ6iOih0pN1k0pKc1/g036kCJ64UrfO+xSV4mzrtMpjmF784lmwVvvlOu4qykxjeBsMCakchVydX6ATdUzWoDJK4Do9IavKmb51N1BWjkvJcQ+W3/xy+MuSbIxe2ynOAbx3H5K/7LbAg70KK+NqggeGIX2U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=mexaI5V1; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="mexaI5V1"
Received: by smtp.kernel.org (Postfix)
	id 74EC7C4CEE4; Wed, 12 Feb 2025 17:00:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3FEB7C4CEDF;
	Wed, 12 Feb 2025 17:00:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1739379610;
	bh=sIPuAalKRn2gxoFFW+ss6h9cIHyfXQ/oAdYaHvMPnHE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=mexaI5V16bVKEateMvpa5jZWI+1r8gx9zhw6BJ1n0Y3ioK/DacxqabWpLGjdCy6D8
	 ON6CSACZRRs1lMl7TBmM4vsdcRySwysKEPd3rqLvKQ4rfcQCGpLQmQh8f1sgz7QWpQ
	 aLGSII0WlVaegnQoAIdqSzLbg3fg2KFk4axKENSg=
Date: Wed, 12 Feb 2025 12:00:09 -0500
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: Tom Rini <trini@konsulko.com>
Cc: tools@kernel.org
Subject: Re: Problem with "b4 pr" ?
Message-ID: <20250212-nippy-uber-butterfly-a6bae5@meerkat>
References: <20250212165045.GP1233568@bill-the-cat>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250212165045.GP1233568@bill-the-cat>

On Wed, Feb 12, 2025 at 10:50:45AM -0600, Tom Rini wrote:
> Hey,
> 
> With:
> $ b4 --version
> 0.14.2
> 
> When trying to apply this PR to U-Boot:
> https://lore.kernel.org/all/7caf7a0a-c2ed-420c-afc7-620ab11461b5@linaro.org/
> 
> I get this error:
> $ b4 pr 7caf7a0a-c2ed-420c-afc7-620ab11461b5@linaro.org
> Looking at: Please pull u-boot-net-20250212
> ERROR: Could not find pull request info in 7caf7a0a-c2ed-420c-afc7-620ab11461b5@linaro.org
> 
> I'm unsure if this is a parsing error (as I've had "b4 pr" dislike
> git@host:path URIs, but I've told custodians how to setup a url and
> pushurl to avoid that) due to the trailing / on the repository, or an
> oddly phrased error message because the commit in question isn't in
> u-boot-net-20250212 but rather then "for-tom" branch.

Right, we need a better error message here, but the fault is with the data in
the pull request. It's telling you to:

    are available in the Git repository at:

      https://source.denx.de/u-boot/custodians/u-boot-net.git/ u-boot-net-20250212

But that ref/tag doesn't exist in that repository.

    $ git ls-remote https://source.denx.de/u-boot/custodians/u-boot-net.git | grep 2025
    (returns nothing)

So, we'll still error out, but the message should be:

    ERROR: Could not find u-boot-net-20250212 in https://source.denx.de/u-boot/custodians/u-boot-net.git

-K

bugspray tag me

