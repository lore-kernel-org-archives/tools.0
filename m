Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 151931E9917
	for <tools@linux.kernel.org>; Fri,  2 May 2025 19:55:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746215751; cv=none; b=Wmimeq7qmXTtyFASfG1M8TuBUeFKaL+U6V9YvPIDArHQ9ND/3UeLI0sqqhR+bLvXh2j5X4kkhenaaa0oXLa7LpaNaLE4877r7uUdieHqbJUYKRRV9vgHxKzTcmHuEJMb8fmtRVqHXhAldHeRWuFKHokEXh6yfE9l8vsmi+tsuqU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746215751; c=relaxed/simple;
	bh=ckae0oaQieNSpCFqm0YyyTo+t8lHBcoj1SCY5qRDrtU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QW2440AfBeG5F7FO4Y0RVc+NM7yuxzHujlSsZxW6a+8ov8dNmhiuGY/jJi4/rjKp6/BWzEqT3tJhbvAkRVvOOiaaAQabQmWE8Gbz70ymTy2VyyHGG6DnCM3ehHYGAnLWcHpoahcglAPgaJzyJpHA82XCEwJUUgclbTG1kzyee7w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=vj+/oMD0; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="vj+/oMD0"
Received: by smtp.kernel.org (Postfix)
	id A81DAC4CEE9; Fri,  2 May 2025 19:55:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6EE52C4CEE4;
	Fri,  2 May 2025 19:55:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1746215750;
	bh=ckae0oaQieNSpCFqm0YyyTo+t8lHBcoj1SCY5qRDrtU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=vj+/oMD0j0ENHRl/TLrHOnb0kno3E3aceBY7laTITunRTNayYb23b5iXep4bEvYei
	 hBBUUFjvinHTOm4EwcrpMYTLaS2xEBZpPj2iWB/k3oZkUwRuFrDODOPg4SOYMcUYUU
	 5fnP7V9Ogql0XJzhGWIJ7C3CuPDfHnqrxM/AWOVs=
Date: Fri, 2 May 2025 15:55:46 -0400
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: Chen-Yu Tsai <wens@csie.org>
Cc: Andre Przywara <andre.przywara@arm.com>, 
	"open list:ARM/Allwinner sunXi SoC support" <linux-sunxi@lists.linux.dev>, tools@kernel.org
Subject: Re: b4 thank-you letter shows incorrect repo URL
Message-ID: <20250502-small-caped-oxpecker-92f9bb@lemur>
References: <20250430095325.477311-1-andre.przywara@arm.com>
 <174610166405.2974716.1586244113913047340.b4-ty@csie.org>
 <20250501132211.0310ae49@donnerap.manchester.arm.com>
 <CAGb2v66UnWo4zL6giQYC+Kmo5SSkNAH1_nODM=r6jyQPoi-JNA@mail.gmail.com>
 <20250501-wakeful-kiwi-of-poetry-59d4bb@lemur>
 <CAGb2v64g2KJVCpMGapCZUx_f4ny20Q4rGVk4JHnf3D09Q8PKgA@mail.gmail.com>
 <CAGb2v66RkWixx4NB+a5L9_V=bs3wOSWqaSv9QeWb9-aYy2YxaQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CAGb2v66RkWixx4NB+a5L9_V=bs3wOSWqaSv9QeWb9-aYy2YxaQ@mail.gmail.com>

On Thu, May 01, 2025 at 11:49:38PM +0800, Chen-Yu Tsai wrote:
> > > This is coming from your custom template, not from b4 itself. By default, b4
> > > just says "Applied to ${branch}".
> >
> > My template is: "Applied to ${branch} in ${treename}, thanks!"
> >
> > My .git/config is as follows:
> >
> > [remote "sunxi"]
> >         url = git@github.com:linux-sunxi/linux-sunxi.git
> >         tagopt = --no-tags
> >         fetch = +refs/heads/*:refs/remotes/sunxi-github/*
> > [remote "sunxi-korg"]
> >         url = https://git.kernel.org/pub/scm/linux/kernel/git/sunxi/linux.git
> >         pushURL = git@gitolite.kernel.org:pub/scm/linux/kernel/git/sunxi/linux
> >         fetch = +refs/heads/*:refs/remotes/sunxi-korg/*
> >         tagopt = --no-tags
> >         b4-commit-url-mask = https://git.kernel.org/sunxi/linux/c/%.12s
> >
> > Also, the branch I applied it to is named "sunxi/clk-fixes-for-6.15",
> > both locally and in the kernel.org repo, not "clk-fixes-for-6.15" as
> > shown in the original thank-you email.
> >
> > I think there is a parsing error somewhere. Maybe b4 isn't dealing with
> > nested branch names correctly and somehow thinks the "sunxi/" part is
> > actually the remote name.
> >
> > If I rename the "sunxi" remote to "sunxi-github", `b4 ty` now generates:
> >
> >     Applied to sunxi/clk-fixes-for-6.15 in local tree, thanks!
> >
> > Again this seems to point to accidentally treating part of the branch name
> > as the remote name.
> 
> Also, I found a thank-you letter that is correct that is from Jan. 2025:
> 
>     https://lore.kernel.org/linux-sunxi/173617837421.3282465.589306007023383641.b4-ty@csie.org/
> 
> The next one that I found was incorrect. This one is from Feb. 2025:
> 
>     https://lore.kernel.org/linux-sunxi/173909140135.1184685.5784910677727356231.b4-ty@csie.org/
> 
> Though it could be I upgraded something on my workstation some time
> in between.

Yes, I think there's a substring/partial match that causes this.

I'll take a look.

bugspray tag me

-K
