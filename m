Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 717F41EE7A0
	for <tools@linux.kernel.org>; Tue, 10 Dec 2024 22:16:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733868999; cv=none; b=sLxHwdrfQtW8g1kXIJvrkKEWG55iEUDKhyhMZ6pmHPgYE0NHwZKp/Fptc7ORXcdV68RGUAIpkxO+XBbM8iFJ2iYnSSmrJHue4xnW26Fmh1wXB1Hebcxd/Lo5OO3xkX/4WujnuP+H41FjjZbFh1Utq5HveHJKLesGOAgOO6wJia8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733868999; c=relaxed/simple;
	bh=/c/OwWtvjIDxkAj+QVyp2WZbcfIz/FFsrfni4p+StLg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NNPDnPw9lEyvHOLNQq3nloSoi/IRzHdeJ5LWZAeHBOfje2taSrLEH/FcYBAdVNZF9/5c/Af8nVbC3E0tI+ZgvnaT/5iMgP1K4xtPnMCz5ZbbSev40RY9H0UgB3WhT2RCUkUIBWULEekEcSindN6BtcXH51Pql3WgP3ttWil3Xho=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=VCIBqHyi; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="VCIBqHyi"
Received: by smtp.kernel.org (Postfix)
	id 1FF00C4CEE7; Tue, 10 Dec 2024 22:16:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D7DCCC4CEE1;
	Tue, 10 Dec 2024 22:16:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1733868999;
	bh=/c/OwWtvjIDxkAj+QVyp2WZbcfIz/FFsrfni4p+StLg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=VCIBqHyiU3MleSVac/AhVGNqWC7Y/EaOpLNF5whQZv2t7djQiq7vPRrTC2sFmc3ji
	 CgKtjuwf/zWtt02cQ8tp9ImLKMi0LaMTWM9S3H/mHg/x/Ba8gjHvgReetGiA1rd+zu
	 53pAepySCiJdiHpGUNgIi1wJN1+B8/PHK74Dgr+s=
Date: Tue, 10 Dec 2024 17:16:37 -0500
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: Jeff Layton <jlayton@kernel.org>
Cc: tools@kernel.org
Subject: Re: small b4 feature request
Message-ID: <vkmfuwodnsmnrjwhypewv2a43fu3erjsokr357srj2a2edn54a@xtzh62xmrn4p>
References: <9244489135d7366f15ea687ff068ab1b20913fc5.camel@kernel.org>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <9244489135d7366f15ea687ff068ab1b20913fc5.camel@kernel.org>

On Mon, Dec 09, 2024 at 05:13:31PM -0500, Jeff Layton wrote:
> First, let me say that I love b4. It's great for managing a patch
> series over time.

Great to hear, thanks!

> I often carry around the b4 commit at the base of my patch pile and end
> up having to rebase on top of it. It would be great to have a way to
> specify the b4 tracking commit symbolically to git so I could do this
> without having to lookup the commit ID of the b4 head:
> 
>     $ git rebase -i B4_HEAD

I'm having a hard time wrapping my head around this (pun not intended). Is the
commit in question the tip of the b4 branch, or the base commit?

In either case there is already a way to obtain this information with b4,
e.g.:

    b4 prep --show-info base-commit
    b4 prep --show-info end-commit
    b4 prep --show-info series-range

So, e.g. if you want to rebase one prep-managed branch on top of another, you
could do [1]:

    git rebase -i $(b4 prep --show-info b4/some-branch:end-commit)

Does this do what you need, or am I misunderstanding the situation?

[1]: apparently, show-info for a non-current branch was broken in master and
0.14.y, so you'll need the latest master or stable-0.14.y.

-K
