Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D36E754F83
	for <tools@linux.kernel.org>; Wed, 14 Feb 2024 14:14:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707920041; cv=none; b=YGXNa0levv6mJayqFW5aTfnOHwzO/HXqESmae5nKCxeKm29bu2OtLwoU1goDaFaNbrZ/j1yebCLi5YCTlOCUGPJKAR8I6e/gMRSdWU/fyoLm+AX21V9FodYpHw9LLBNIhY5sXH5zKg9akdFX0ycAvrflyPRUHnueI6fwF1R4H2o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707920041; c=relaxed/simple;
	bh=qPFEZjr2YbEAcE5iHa7wd/P0mra1VWctWAuMDU0e90o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LnLpKZtO+STjlDIQDNNybjVQfMSpqkkRfsMU36eAqaCHJZe6GGKC6BF9cZoPF0DC37EVvlcSaE+Z2ASVpe2d7m3MABdKJcE7tf209E14U0pUGKz+KWAgObMb+gKo/ZJPxkUf82GTGXuh/NCIuyuVzUC1ioN1WtOywoeuGoYjCR4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=wVTPCvo4; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="wVTPCvo4"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2BFEAC433C7;
	Wed, 14 Feb 2024 14:14:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1707920041;
	bh=qPFEZjr2YbEAcE5iHa7wd/P0mra1VWctWAuMDU0e90o=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=wVTPCvo4DGEPVKM2NwMmNH8Fa34g2C+/QJdvf034XeIVoMIdbznblUs2yqXmZxC98
	 NpOYXFfJRZEjtZ6DFfZhbGXtpTBkSzEhfVY0XVTQ1dQ2JVJ3K+Vwn0+yC+w2DB8dBR
	 /rJCE+uMPtRCc74aSpJHVIpfX0MCaEhy8kfJlB+g=
Date: Wed, 14 Feb 2024 09:13:56 -0500
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: Paul Moore <paul@paul-moore.com>
Cc: tools@linux.kernel.org
Subject: Re: Problems with patatt and stacked-git's patchset cover letter
Message-ID: <20240214-tall-xanthic-chicken-1eb62f@lemur>
References: <CAHC9VhRCTKD7qwm7u9EvudWkY9nw+CSS1HCOdr5c8OWBU1LCEg@mail.gmail.com>
 <20231222-secret-thoughtful-zebu-fedba6@lemur>
 <CAHC9VhRTQPAfTutfXQt3yk9267EHdDpSGqE-=GnEAyspSvQ-Zw@mail.gmail.com>
 <20240108-urban-nice-hyrax-a0ee5f@lemur>
 <CAHC9VhRMksB7Avdcy4u8uYtFGR_i1-C7jNDm+wv2X=yykB2NVA@mail.gmail.com>
 <CAHC9VhQTVZtY-9VfMunERWnEZ7ReDkYRm07QGsmEYwyU3DC7JQ@mail.gmail.com>
 <CAHC9VhSXHKWHSBiLQjD73emXSrLG8J7DCYLqEuBhVcgZezZOfg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CAHC9VhSXHKWHSBiLQjD73emXSrLG8J7DCYLqEuBhVcgZezZOfg@mail.gmail.com>

On Tue, Feb 13, 2024 at 12:38:11PM -0500, Paul Moore wrote:
> > Here is the stacked-git GH issue that I created for this:
> >
> > * https://github.com/stacked-git/stgit/issues/414
> 
> For those of you who are interested, but not following the GH issue,
> this appears to be an odd interaction between git's send-email command
> and the recommended patatt sendemail-validate hook.

I don't think that's a correct assessment. Something in the stgit's or git's
stack is generating invalid headers and patatt's integration is merely making
it obvious (as opposed to quietly fixing it the way git-send-email does).

> As the stgit
> maintainer pointed out, git's sendemail-validate hook template treats
> a patchset's cover letter differently from the patches.
> 
> It looks like some time of check should be done in the patatt example
> hook to ensure cover letters are handled correctly.

I think the real solution is to fix the bug that's generating invalid headers,
not to work around it in patatt. If it's not a bug that's introduced by stgit,
then we should take this up with git proper, which I might do anyway.

-K
