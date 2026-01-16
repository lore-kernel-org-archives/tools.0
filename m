Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E71E030BBBF
	for <tools@linux.kernel.org>; Fri, 16 Jan 2026 10:50:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768560626; cv=none; b=usLXTxd3trJzS3DE/Dc/vFqmhvxm9YSqqZRNUeISsh1Za8CwgdFo/KN37A1ESKM4mKFO+ul3Klhu0scL0hu165zEQL/JDe58H8XY4glCZWtzkolTAHzDYEp2my9RlOwr0ei3/3IcxAP4EDJKtu8X6cPd8Olz3nqYHm/mdjFW2QE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768560626; c=relaxed/simple;
	bh=VyaJw7Tqf3QupcdfTwuxmlZI/gYQ/fcBie41bGWL344=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Yfpwb6xqrxJkZ0DbiCD5fCuJvEX76kXnVmHi8EMXgAzGthVNZ4ZpeE1qqJ9eKWq13U9FybkYcw1RWzENlS+rRJ3H/pdbT9R2HDYQg4SpB6Tf5nVOGV8fWqzzPp2NttlGdhrvc8oObMuXbATPHEmv/oomfTk3iWKhbkWZradOJag=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix)
	id DE74AC116C6; Fri, 16 Jan 2026 10:50:26 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.kernel.org (Postfix) with ESMTP id 6962FC19421;
	Fri, 16 Jan 2026 10:50:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 6962FC19421
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=foss.arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 0C1471515;
	Fri, 16 Jan 2026 02:50:18 -0800 (PST)
Received: from bogus (e133711.arm.com [10.1.197.51])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 1F2363F694;
	Fri, 16 Jan 2026 02:50:24 -0800 (PST)
Date: Fri, 16 Jan 2026 10:50:21 +0000
From: Sudeep Holla <sudeep.holla@arm.com>
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc: tools@kernel.org, users@kernel.org, Sudeep Holla <sudeep.holla@arm.com>
Subject: Re: korgalore: small taskbar app ui
Message-ID: <aWoX7T8g3VqQ53rI@bogus>
References: <20260113-valiant-dragon-of-dignity-d98cea@lemur>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260113-valiant-dragon-of-dignity-d98cea@lemur>

On Tue, Jan 13, 2026 at 11:50:58AM -0500, Konstantin Ryabitsev wrote:
> Hi:
> 
> With the help of opus[*], I added a small taskbar miniapp to run background
> korgalore syncs. It needs a lot of testing, so if you're a korgalore user,
> please try it out. It should, in theory, work in most desktop environments but
> I only tested it under gnome.
> 
> Here's what it can do:
> 
>   - System tray indicator with status icons (idle/syncing/error)
>   - Automatic background sync at configurable intervals (default: 5 minutes)
>   - Manual "Sync Now" option from the menu
>   - Gmail re-authentication via browser when tokens expire (no terminal needed)
>   - Edit configuration file directly from the menu with automatic TOML validation
> 
> It's not yet released, so you'll need to get korgalore master and run from
> checkout.
> 
> You can run the taskbar app from terminal as `kgl gui`, or you can install the

I tried it from the terminal and it has be running fine updating my inbox
regularly in the background for more than 1 day now.

> .desktop file in ~/.local/share/applications/ and run it straight from the app
> menu.
> 

I haven't tried this part and I am not sure if I will use that, so sorry
can't test that part.

-- 
Regards,
Sudeep
