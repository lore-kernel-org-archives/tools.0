Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D9551772F
	for <tools@linux.kernel.org>; Wed, 24 Apr 2024 20:18:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713989912; cv=none; b=hyrGjQui5YEfzhwMeG4Q4/ep3blVBBFxfp6Ny203gXdfqs4/x/OxWNmL6K8zV9RSiw235nKasClq3WG2YaXalMBL8b8tCx9cI/+/6ZGZOKkicl3ufZWHuS61vqN+gXYIWo1PKlIg1ftd3SHMub8XHiI7muPkSkUNEo9A/mf/H+4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713989912; c=relaxed/simple;
	bh=oT6Hw2LdMlXTtknWu6cUFLNSCkJmeBZjVClzqs6pVmY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GTfSrNSTfoAQv4+BlNu0Ic4G37xGnm75P0JnFS6QZ9cVyvzH6RngrfbLjjifDND1AlmRPVbCuBoQuC2SuBO2KT/l2pEwpiQgy+1N3+76fpX9BQtEdd0EQb4SqRrVSc5bcwFNhA3JgFdmZ/Gal4jLxks8vuc70DZjk15e1IXClAE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=Hzk2/S7u; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="Hzk2/S7u"
Received: by smtp.kernel.org (Postfix)
	id EA329C2BD11; Wed, 24 Apr 2024 20:18:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A0984C113CD;
	Wed, 24 Apr 2024 20:18:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1713989910;
	bh=oT6Hw2LdMlXTtknWu6cUFLNSCkJmeBZjVClzqs6pVmY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Hzk2/S7urAuSOQnc5jtCe1oCA5oZfCjvlJv8T8C1p0iEJ/bj0PYVhIgNdgpJMArxk
	 xGuE3laQCkBLHxftQbMVO/tPbyRFAICYv7ssAT7nFZL1P5mLBaX0Gw+Da0fOy+citJ
	 GALbDow3n3x0y29brg+ehAAzc5uFIBBNSZGY0org=
Date: Wed, 24 Apr 2024 16:18:29 -0400
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: Liam Hupfer <liam@hpfr.net>
Cc: "Kernel.org Tools" <tools@kernel.org>
Subject: Re: b4 sendemail.sendmailCmd support
Message-ID: <20240424-attractive-spiked-tamarin-005bb6@lemur>
References: <878r16nhm9.fsf@hpfr.net>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <878r16nhm9.fsf@hpfr.net>

On Sun, Apr 21, 2024 at 11:31:10PM -0500, Liam Hupfer wrote:
> Hi Konstantin et al.,
> 
> git-send-email(1) supports `sendmailCmd' as a shell command-focused alternative
> to `smtpServer{,Option}' [since Git 2.33]. Could b4 as well?
> <https://git-send-email.io/#step-2> is a widely referenced tutorial that suggests
> the use of the newer option.

bugbot assign to me

-K
