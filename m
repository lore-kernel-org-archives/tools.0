Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FDA716ABC0
	for <tools@linux.kernel.org>; Fri, 26 Apr 2024 18:04:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714154690; cv=none; b=K2flzJuSgPRvOv/LkoEtUxMHTaPIJ1S/7SQmJvnoEdKSFO4PpIHXpDs5aaDzSltkNmb5e3LO2X2Gg1/xp2EcSjILJkQ/thKkQpCImNlz7x3iggRL2mwYUh8MP6JFFITK8VhNkcFsBFg7P2RX+0n5W8u+2CL54ZpxdKKoKFGW5mA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714154690; c=relaxed/simple;
	bh=kRNNCF6n3zbgxJDxGNjZG7kEIGyhc9xtwYBypPzETE8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ADkar0S+TnF/N3j3GtXkjKAdNLA6NlLxPxQzCqgB8/ZAgwhsvTQqqUPnU4rg+HtNo9nYsL3OBMqgSs5zuDZ+N5tVFEC65CfiYAV44xBHnz3+Fg7/N0Z5E+QK1bIUcj4oX6TFNk2Pz65+wddHwOJjNlcF/eDbWPRjSl/FS1CRINc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=pLJwwqHz; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="pLJwwqHz"
Received: by smtp.kernel.org (Postfix)
	id 62887C2BD10; Fri, 26 Apr 2024 18:04:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2B8C5C113CD;
	Fri, 26 Apr 2024 18:04:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1714154690;
	bh=kRNNCF6n3zbgxJDxGNjZG7kEIGyhc9xtwYBypPzETE8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=pLJwwqHz9sNQNQr4nAsM3KtxfMb1MW606HOSoWIpqWcL5aEVD2PxuSn3WZKPu3uaU
	 179TIoTFqjfC5xvcy0VkRNb6WbqqoqvQK0Yq9Rt6ra+0uuAuTJQgI1MMkM1FFHtA4S
	 60EIGyOKtgXiqrh9NxwYJP5WTs4kF97ClJXXXHzE=
Date: Fri, 26 Apr 2024 14:04:49 -0400
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: Luca Ceresoli <luca.ceresoli@bootlin.com>
Cc: tools@kernel.org
Subject: Re: b4: use new trailers in 'b4 send --resend'
Message-ID: <20240426-tremendous-rhino-of-assurance-ad5e99@lemur>
References: <20240426140157.349783d6@booty>
 <20240426-jasper-sloth-from-neptune-82a6f7@lemur>
 <20240426184425.23b606bf@booty>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240426184425.23b606bf@booty>

On Fri, Apr 26, 2024 at 06:44:25PM GMT, Luca Ceresoli wrote:
> > It's not really necessary to resend a series just for trailer 
> > changes anyway. The maintainer will most likely use b4 to retrieve 
> > it anyway, and that will pull in any new trailers.
> 
> I cannot recall exactly when it did happen and provide a link right now,
> but I clearly remember having been asked by some maintainer to do
> exactly this, instead of pinging.
> 
> The rationale is that sending a new version just to add review tags was
> considered bad because one can expect the patches or commit description
> to have changed somewhat, which it hasn't.

Yes, to be clear -- I wasn't suggesting that you send a new revision 
just to add trailers either. We're both aligned here.

> OTOH resending without new trailers can lead to applying a patch
> without those tags (not recognizing reviewers time), or even worse to
> discard a patch because it does not show the needed tags.

I expect this is one of those "every subsystem does things slightly 
differently" situation. If the maintainer uses b4, this entire step is 
unnecessary, because any missing trailers will be applied anyway when 
they run "b4 am". If they don't use b4 -- or if they use a very old 
version of b4 which didn't match by patch-id to collect trailers sent to 
other identical submissions -- then they would have a reason to 
complain.

I may have to run a poll among maintainers to see which is the behaviour 
they want to see:

- resend should be identical to what was sent the first time
- resend should include any additional trailers received since the 
  initial send-out

-K
