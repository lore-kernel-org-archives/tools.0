Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F25163EAC74
	for <tools@linux.kernel.org>; Thu, 23 Apr 2026 13:27:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776950821; cv=none; b=RjTTdaIwRHBjgQ+02oyoE0ZzFk5x82ktbBXPAzb85ylR87N0Lub/7hcmHTx77HPDD8LtrNpqINkDoHxQZWtnhV7JQRspl93ILfKRCvT7g2OKQ19HunLRsFc6Rt9X89k31juYoNmJr/JW28r1rShFscTC3SBFiUbbKbsNnztMW10=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776950821; c=relaxed/simple;
	bh=ixbkHe7l664TSEi5nwgFofU/CmqEShvwfuNOaPZgCOs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iEGojiP0LW0ut5l35mq2zCOO+i78eS63aRB6ysPkQGSokoLGOYHhpCG6QtOiONjoCP+ZYrE/X1qgifxd8UnZXXiYCFFhFMg65MdnuomxDQOg4psm3zciJXj/vMSWnllykTmJK4wyal+cP2bgpW/zdoPhgJMniDvFVz6ytvc0hRc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=IltTfyMv; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="IltTfyMv"
Received: by smtp.kernel.org (Postfix)
	id A221AC2BCB5; Thu, 23 Apr 2026 13:27:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6FE53C2BCAF;
	Thu, 23 Apr 2026 13:27:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1776950820;
	bh=ixbkHe7l664TSEi5nwgFofU/CmqEShvwfuNOaPZgCOs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=IltTfyMvwkqhRMrom0X27/PVzSkipE2nn3zqgY2VwDvhf9bzrhJM0wDniUNGJCENJ
	 y6Ywhwcwi0Ot2g9k43q+9DKQFnPADHDu3n4zki8lfGTH8qE9vdsTNRJlYWCCCEqZOv
	 qycdCnsjUNm81Ksx74gTXJPHUX3kbOAHuQpOSeZI=
Date: Thu, 23 Apr 2026 09:26:59 -0400
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: Mark Brown <broonie@kernel.org>
Cc: tools@kernel.org
Subject: Re: b4 backtrace on startup
Message-ID: <20260423-victorious-hare-of-serenity-65fe5b@lemur>
References: <7da1f1d1-25a3-4f8b-b56c-7f67c334c0af@sirena.org.uk>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <7da1f1d1-25a3-4f8b-b56c-7f67c334c0af@sirena.org.uk>

On Thu, Apr 23, 2026 at 12:32:03PM +0100, Mark Brown wrote:
> Hi Konstantin,
> 
> After upgrading to latest b4 git I get:

Bitten by python-3.14's lazy evaluation! I have a commit in place and I'll add
a script that actually runs tests across every supported major python version
to avoid this in the future.

Thanks,
-- 
KR
