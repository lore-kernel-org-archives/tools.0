Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DAC3359A88
	for <tools@linux.kernel.org>; Fri, 20 Mar 2026 20:05:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774037144; cv=none; b=U1gx4ppa0GbkMxZwBbkuPneNfrwed2lfR2ApZcgRw8idygmPGn2/bMad+F0FAnvWkpY8peINl5oMgBHw/98cGW3RgE/qhYdyv8EKVjZ4FiqsTymsqDqQUQcUy5o1m0gXVcxBompzHkKn72+9gqSD9+UZRG/UE2CSI861jq3aUCo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774037144; c=relaxed/simple;
	bh=mZO/vYurM0xiXGO0Dwask/6PtA5ixQzgx7uLpXFzly4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=J6sqQYJN8VsYsSAzDTL4Bi1rSp/p61s4PUIYgx1kchx9zd0S7fVOy8CT56vjwZFE32qRs1UWooBKIooQbcAh2FO8gUpXXPwV6sP9tQ1lHio6L2hLt7z6bna/6ed0/t677t660F1AjaC3D/xVDKRdUbfmxzJ0oMc+QQhZ/DzIapI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=KQyZHJLY; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="KQyZHJLY"
Received: by smtp.kernel.org (Postfix)
	id 0D93AC19425; Fri, 20 Mar 2026 20:05:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C203CC4CEF7;
	Fri, 20 Mar 2026 20:05:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1774037143;
	bh=mZO/vYurM0xiXGO0Dwask/6PtA5ixQzgx7uLpXFzly4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=KQyZHJLYHoofyK0xznX+w+dFg0tBpTaxIpAkp0DUHVl/DYb8wMQ0yHGmn1bMnhTyp
	 Z5RO+DtYuUgh0mg3x76LlXHE/mg6jxb0/WmDX/sDA0ydx7AlputcFIL05RFBpi6kHR
	 g3YU0iXa0NtTMv4UsSzSbIO7WM3Inh8vlIH1v0So=
Date: Fri, 20 Mar 2026 16:05:42 -0400
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: davemarq@linux.ibm.com
Cc: "Kernel.org Tools" <tools@kernel.org>
Subject: Re: [PATCH b4] prep: Make `b4 prep --edit-cover` remove already_ran
 file under $GIT_DIR
Message-ID: <20260320-ambitious-hoatzin-of-argument-0b1d72@lemur>
References: <20260320-fix-edit-cover-with-workspace-v1-1-6023305b0f93@linux.ibm.com>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260320-fix-edit-cover-with-workspace-v1-1-6023305b0f93@linux.ibm.com>

On Fri, Mar 20, 2026 at 02:57:24PM -0500, Dave Marquardt via B4 Relay wrote:
> From: Dave Marquardt <davemarq@linux.ibm.com>
> 
> 
> 
> ---
> The `b4 prep --edit-cover` code calls git-filter-repo to update the
> cover letter. When using a Git worktree, the user may get a confusing
> message like

(Unrelated to the patch contents.)

I wonder how this happened? Is the content below '---' just the cover letter
and the commit itself is without any message?

>     Invoking git-filter-repo to update the cover letter.
>     The previous run is older than a day (/home/davemarq/linux/linux/.git/worktrees/ibmvfc-fpin-bis/filter-repo/already_ran already exists).
>     See "Already Ran" section in the manual for more information.
>     Treat this run as a continuation of filtering in the previous run (Y/N)? n
> 
> There's code in run_frf() that removes
> <top-level>/.git/filter-repo/already_ran, which may have been left
> behind by git-filter-repo. This doesn't work for Git worktrees, where
> the file is $GIT_DIR/filter-repo/already_ran. GIT_DIR is set to a
> worktree-unique directory under the repository top level directory in
> the worktree case. This update uses $GIT_DIR, which works for both
> repositories and worktrees.
> 
> Signed-off-by: Dave Marquardt <davemarq@linux.ibm.com>
> ---
>  src/b4/__init__.py | 10 ++++++++++
>  src/b4/ez.py       |  8 ++++----
>  2 files changed, 14 insertions(+), 4 deletions(-)
