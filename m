Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11872362098
	for <tools@linux.kernel.org>; Wed,  3 Sep 2025 18:56:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756925810; cv=none; b=R0sybJ9mSXSLO8oBybsTLNLrHi3Ml48vwM8bnabs74xlv3JgQFHnffJ9gfS8xnCU5S//E26Pkk+Um6nzWnO65q8PTQ0xCyq1OUewd+AqHX/+Gvizat7RtbNhwX1OUO+XkEzKJaGXVGKDUdk8l0ymqTKSD7jseFi8IsYPSxuUFZE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756925810; c=relaxed/simple;
	bh=deyYxMIszxBKNI2SlY+BbIQcs2tR0bNSicZQyBUt8sc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=C6NB4dIljOqmOZwg6pepqiZ/yReIPH6EroZWuld6MG3ok3dJ80bSXiLNWWMHbQ00KRFPhWvmZknUtrgiSdmGFAfzgnCfgx1k+EFSy+OLojCxkOcsKBnq3oi7inEw8wtyo3iTIZhgLa62o9m7lWxF8i7SNcuDW3TR6cGiBRLM30A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=ay+FDq1Y; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="ay+FDq1Y"
Received: by smtp.kernel.org (Postfix)
	id 9BAB6C4AF0B; Wed,  3 Sep 2025 18:56:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6347CC4CEE7;
	Wed,  3 Sep 2025 18:56:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1756925809;
	bh=deyYxMIszxBKNI2SlY+BbIQcs2tR0bNSicZQyBUt8sc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ay+FDq1YmSBVOpNaWG338udYDC8Svpu8a78KjztUbLiVaDNpXYs9aToz1IDC2WxCZ
	 nqOYsjtZj5Xmgkbj/FjaoX/KbMUMFKaiRERdFKx/CIhR9KiTZkaQbS/pqTut5zM44y
	 e/kTb6daweLKlakXtGVUgJl03NjollaLadT82dJE=
Date: Wed, 3 Sep 2025 14:56:48 -0400
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: Nathan Chancellor <nathan@kernel.org>
Cc: tools@kernel.org, Vlastimil Babka <vbabka@suse.cz>
Subject: Re: git-filter-repo "Already Ran" message when performing certain b4
 actions
Message-ID: <20250903-nimble-puma-of-acumen-daa2ae@lemur>
References: <20250827213329.GA38537@ax162>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250827213329.GA38537@ax162>

On Wed, Aug 27, 2025 at 02:33:29PM -0700, Nathan Chancellor wrote:
> Hi,
> 
> Vlastimil reported on IRC that the following message pops up when
> invoking an action that uses git-filter-repo, such as
> 'b4 prep --edit-cover':
> 
>   Invoking git-filter-repo to update the cover letter.
>   The previous run is older than a day (.git/filter-repo/already_ran already exists).
>   See "Already Ran" section in the manual for more information.
>   Treat this run as a continuation of filtering in the previous run (Y/N)?
> 
> This appears to come from a change in git-filter-repo 2.47:
> 
> https://github.com/newren/git-filter-repo/commit/8a243ae8adb02223f74fcc082c84c76d66853040
> 
> Maybe b4 can remove that file at the end of the action so that users are
> not prompted about this?

Thank you for the report. This is what we will do now after each run, in both
master and stable-0.14.y.

We're overdue for a 0.14.3 -- I'll see if I can release that soon.

-K
