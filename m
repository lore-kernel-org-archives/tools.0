Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9078B29405
	for <tools@linux.kernel.org>; Wed,  1 Apr 2026 20:48:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775076527; cv=none; b=Y/TM11bu8964bFm3Hqo9qBDvp85lL/YAJo9kEuTwBIPcRvGtt3NWnbWQU2HrLrJsK/D+7hBVB+h43hu0j2cZ3aaqYdQyZmRXaPrh9b0onLhJ0wFpk6VhhgXCCcb6BovbcibLyhwZtqsfPaopJnARl2UZiyM9xg8p+6XRBezJ3+U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775076527; c=relaxed/simple;
	bh=iRiB/tRR6UVxQeKPE8gGnkZc37/Pn8Dl6PugHMYNT5M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kERdNTgpjaNiMmPhaQU7c9gxV5L6gNrWPuojGC3jQPTyswBSurDGCJXKCXABsmZegoHCZdwGM7ghN0AAsjss3Bp3iR2xd1jy3BQ0mgHT2g5fmxa1HrCz6Buii7w/lDmDcy3iA1giqeNc6rttUnWH9qFGmHhjGdV+ajqipohs9nU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=RJIUJ7e0; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="RJIUJ7e0"
Received: by smtp.kernel.org (Postfix)
	id 35D8AC2BCAF; Wed,  1 Apr 2026 20:48:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E734BC4CEF7;
	Wed,  1 Apr 2026 20:48:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1775076527;
	bh=iRiB/tRR6UVxQeKPE8gGnkZc37/Pn8Dl6PugHMYNT5M=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=RJIUJ7e0ktl2lWtHzdNWdJt+ceIxwTK4rW40Wa6BRDq9VUsHQgybhG4c90FZW7CBI
	 88wYIHsAQOWxEvZ9ufkM5ExPkDeeuCDy24Qw5c7aLD6/r2X7pa8m6HJDQ5JkNgTC1P
	 Q6MgzVhC8R6Nnf3ZFVgHehgKJluT9+gGZ9T+Sm1U=
Date: Wed, 1 Apr 2026 16:48:45 -0400
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: Mark Brown <broonie@kernel.org>
Cc: tools@kernel.org
Subject: Re: b4 review crashes updating a series
Message-ID: <20260401-curly-chicken-from-asgard-133cae@lemur>
References: <78dff388-0d4f-43f1-b197-af64617f9df6@sirena.org.uk>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <78dff388-0d4f-43f1-b197-af64617f9df6@sirena.org.uk>

On Tue, Mar 31, 2026 at 04:04:06PM +0100, Mark Brown wrote:
> Hi,
> 
> I'm getting b4 review crashing when I attempt to review this series:
> 
>    https://patch.msgid.link/20260319032112.5251-1-chaitanya.msabnis@gmail.com 

I think I found where it's happening, but please test it out -- the latest
master has the attempted fix.

-K
