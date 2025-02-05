Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C083211A11
	for <tools@linux.kernel.org>; Wed,  5 Feb 2025 20:53:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738788789; cv=none; b=UL7nhIjk/jM3UqICTAQ0zup0Q26CWpTNxTcV+2pEgko7ZmTlC8xhtmYKN9uQQ92yaLXekDi1Oc1G3j0wCy5un59hbirKnNgW2ZhY5E1Aky6U1Z4wZxk2cdKxackaeZFEXCoVb8XRmELIrDpZMji6KRODAA1jibCNtQ8DDgw5h94=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738788789; c=relaxed/simple;
	bh=WdZ34abMGYoDVHsTgN7a0XR1w/JyZwPBHaV+wQIVKlY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jMeqtoxHzpPOlxTGVb6LUOevbu/bGPSWp/Gzcp+xvWFkG7qndVIJNDP+kjCYKnfoBSCcD0dDnGllnXs5+77cEtBAczJLD46KvD9UUkd+lsM3c7FVIWX/QV1zGUDmtH+vS9KQcTY4WfFPs++5CRMzmrRitgH4va8nHkTr3A/MM9I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=yUJYacfT; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="yUJYacfT"
Received: by smtp.kernel.org (Postfix)
	id 92F8AC4CEE2; Wed,  5 Feb 2025 20:53:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 643E9C4CED1;
	Wed,  5 Feb 2025 20:53:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1738788788;
	bh=WdZ34abMGYoDVHsTgN7a0XR1w/JyZwPBHaV+wQIVKlY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=yUJYacfTK2l8xMxewPPLk7lBY2A15pvA7kTvh/4ZJK7DAXUb5B9hYdJ15aWbHaY3Y
	 hzR5M4lJHcmwNhQ6867KhqphrekY66CmOsJbaQkCyn0s50hYQj9bCTMAImdHgtW1VE
	 0aSvlPgY00ScfOOO8UtIfbcPnmSur06DzPEQrLBU=
Date: Wed, 5 Feb 2025 15:53:03 -0500
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: Matthieu Baerts <matttbe@kernel.org>
Cc: "Kernel.org Tools" <tools@kernel.org>
Subject: Re: [PATCH b4 v2] send: generate patches with --no-mailmap
Message-ID: <20250205-shrewd-wolverine-of-examination-dea5c0@lemur>
References: <20240923-send-mailmap-v2-1-e2c62f1de79b@kernel.org>
 <20250122-dinosaur-of-perfect-conversion-7dfabc@lemur>
 <bb76736a-05ee-4c67-a8bc-626d81838089@kernel.org>
 <20250123-macho-sidewinder-of-acceptance-8dea0f@meerkat>
 <e6c6f928-bae7-4509-9410-42e4bf7d9252@kernel.org>
 <20250205-polar-spiffy-baboon-09cd5d@lemur>
 <8f145a14-d876-4a81-9c1e-cdc61dab2ef0@kernel.org>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <8f145a14-d876-4a81-9c1e-cdc61dab2ef0@kernel.org>

On Wed, Feb 05, 2025 at 05:29:45PM +0100, Matthieu Baerts wrote:
> >> So doing this in cmd_send():
> >>
> >>  -    mailmap_replace = b4.get_git_bool(sconfig.get('mailmap', 'false'))
> >>  +    mailmap_replace = b4.get_git_bool(sconfig.get('mailmap', 'true'))
> >>
> >> WDYT?
> > 
> > I'll just roll back that part and simplify things back down to just pass
> > --no-mailmap to the git-show command.
> 
> Thank you, looks good to me!

The changes are in place in the latest master. Please follow up if there's
more work that is required.

Thank you,
-K
