Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CB1037F01A
	for <tools@linux.kernel.org>; Tue,  6 Oct 2026 07:15:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791270938; cv=none; b=KhIzuBOfJ73FbeEZYSNaf1VkJiHrbuUq6GKwz+6YnM2ek8B+g1AYSEtwZyKogHN+KrlnL0yxvfl6W/f15jCTkaTFCTEEQpPmcTes7xuzGMlGKkR11U5FG1po7AZNQltuVNyx1nv5pzIz/U3l39zeZD5Tpb7Z4VnzAlEWe6pXOvg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791270938; c=relaxed/simple;
	bh=IjYeAmzwNNI2dAWWYN+lZTZWVFL3GoKRncvgd6cZcAE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DTZk3+D1BGCgbzPos1hA36Npo8waD+aUJMtu+vDHCm9ai83/oMcQ9okhzuGRALDkex+nllFD4p6GgP8A2fNaR9ayduu9y01ySAxEN5HwZKSRXmDCirryHYDeulTqJ8ky+BKVf4YKkbS2BKZM7/9rbMncwVVsCYtik2PLMVGZVKc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=DMJx8EnE; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="DMJx8EnE"
Received: by smtp.kernel.org (Postfix)
	id A576E1F000FF; Tue,  6 Oct 2026 07:15:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E03751F00898;
	Tue,  6 Oct 2026 07:15:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1791270936;
	bh=1F58xQhwR39jXP21RihRVhZj7y2wpv10pGhR11hTGps=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=DMJx8EnEmt33Mk62N/POnRJ1bUTnFF77kaCoTiada7szyJvf1ezHBn8LvBp9TV+hZ
	 8eBZkaRyWhrbarIIw8+VMxOFVsKldqj5mAi2X1xZLBbCXBMdkWfZPgPQUzowBWYuQV
	 /x5brjjRtEJPJd/zImJ1epnDLu3OeubX8rMNVvxo=
Date: Tue, 6 Oct 2026 03:15:32 -0400
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: =?utf-8?Q?Cl=C3=A9ment?= Le Goffic <clegoffic@baylibre.com>
Cc: "Kernel.org Tools" <tools@kernel.org>
Subject: Re: [PATCH b4 3/3] lore: stop a less pager quitting on output that
 fits one screen
Message-ID: <20261006-watchful-subtle-snake-bebec6@lemur>
References: <20260925-b4-lore-fixes-v1-0-103fd9507e67@baylibre.com>
 <20260925-b4-lore-fixes-v1-3-103fd9507e67@baylibre.com>
 <179119498922.1802901.11622089083955121536.b4-review@b4>
 <01c5b15f-7f4e-4620-be36-bddaa37255d6@baylibre.com>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <01c5b15f-7f4e-4620-be36-bddaa37255d6@baylibre.com>

On Mon, Oct 05, 2026 at 02:37:11PM +0200, Clément Le Goffic wrote:
> > Would this cause problems for people who set their less env to different
> > settings? I'm not sure I'm comfortable blindly appending +F to all
> > possible less invocations.
> 
> We were already removing F from environment variable before this patch and
> to me it wouldn't interfere with people settings:
> 
> From `less --help`:
>   -F  ........  --quit-if-one-screen
>                   Quit if entire file fits on first screen.
> From `man less`:
> The environment variable is parsed before the command line, so command line
> options override the LESS environment variable.  If an option appears in the
> LESS variable, it can be reset to its default value on the command line by
> beginning the command line option with "-+".
> 
> This let me think that we might not need the env path at all in fact...
> I'll rework the whole patch.

I applied the new version, but then backed it out because it broke things for
me. :)

Fedora uses lesspipe.sh, and +F was putting it into "follow" mode that
resulted in a screen full of "~" marks and "Read error" at the bottom.

So, my initial reluctance has been confirmed -- there are too many possible
setups out there for us to try to second-guess what we should be trying to do.
It's best not to try to alter flags on the fly and let the users set up their
GIT_PAGER appropriately instead.

-K
