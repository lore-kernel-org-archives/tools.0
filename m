Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEC551D9351
	for <tools@linux.kernel.org>; Wed,  4 Sep 2024 12:39:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725453544; cv=none; b=NzN3DUJ/8hnmgYMn+wN1VAMMV7+bnT3wx0tY8YGTQi0x7y8e1zoCNCKwDlLruDbnryOLsxP7edufssqzjsPPW04V8+WS6tU4vvt8kkHADB5SQ7A3IOXS/zpnklu7323wmrvLeo4c5ljymtvRZ1VXGRgTb8EZQfDSp49RsK8VfXw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725453544; c=relaxed/simple;
	bh=VjQ6NDgWf1SocOaGRupOXMhxhJCkT9KGOms2qf/Os58=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dJ3a8jUzYu+G/c4A406Li4yDTCSEsUAZZD+S6lyCPV94U3nyNEh3Y/6ad4rvWx5AJMQufSN96fNJ9OEAQktUi9xZnhOneTfrTHAif+R7wX6mRwr+jOki/IFewriUQFZ4BiGTA0OLP+7qnf29neNsNrO1ab2iN56/uXznu1uz3/c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=Hk/zeSYR; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="Hk/zeSYR"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 63660C4CEC6;
	Wed,  4 Sep 2024 12:39:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1725453543;
	bh=VjQ6NDgWf1SocOaGRupOXMhxhJCkT9KGOms2qf/Os58=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Hk/zeSYRIYg7GjLXHmtmWjGeP+gQTbTCPlGsVMxsaEuaKryeopBaFD19B9AxEPICx
	 QccmNbxTLbo7cgOsYS9TmAM3lufu+8UpKm85auZl0MF6+aRguSuL9zpDExsTyQA1r0
	 v/Aj3fKu5vt1lm+lDjBZjV/zpZ4lgNWug5XPq0SE=
Date: Wed, 4 Sep 2024 08:38:58 -0400
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: Mark Brown <broonie@kernel.org>
Cc: tools <tools@linux.kernel.org>
Subject: Re: b4 send falls over sending a series
Message-ID: <20240904-zealous-rich-ibis-61ad0d@meerkat>
References: <9ae3668b-666f-47d9-9d25-be0fc57b6335@sirena.org.uk>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <9ae3668b-666f-47d9-9d25-be0fc57b6335@sirena.org.uk>

On Tue, Sep 03, 2024 at 11:42:21PM GMT, Mark Brown wrote:
> Hi,
> 
> When attempting to b4 send from the branch:
> 
>    https://git.kernel.org/pub/scm/linux/kernel/git/broonie/misc.git documentation-b4-advert 
> 
> with current git b4 the patch is sent but I get the output below and the
> repository is left with the base commit checked out as a detached HEAD:
> 
> Sent 1 messages
> Error tagging the revision: Could not cherry-pick the cover-less range

To describe what is supposed to happen here:

1. we create a detached head with the parent commit of your series at the tip
2. we cherry-pick all commits of your series and apply them at that tip;
   basically, the goal is to create the branch without the cover letter
3. we record the tip commit and switch back to your working branch
4. we tag the tip commit of that detached branch and use the cover letter
   contents as the tag message

The operation failed in your case when we tried to run this:

    git checkout 85a5e5b261c5b1fb14235b3172a257eae8d1b159~1
    git cherry-pick 85a5e5b261c5b1fb14235b3172a257eae8d1b159..f03b085c680cce51be033f56d9702050180ef835

Naturally, I cannot make it crash when doing this, so I have no idea what went
wrong. I'll work to add more debug statements there and making b4 fail better
when this happens. We should also really do this in a temporary worktree
instead of the current branch.

-K
