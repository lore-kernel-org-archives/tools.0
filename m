Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 916951E9B0D
	for <tools@linux.kernel.org>; Mon, 13 Oct 2025 14:40:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760366411; cv=none; b=BKLovw87CQsLgDhXoX6iBaIaCBKZQTqdhi5nFBVpZH7NmQ8K0eiJu7u9M3vjssgRbLjBfad8PtLmwUZjxLW91XRwqvKpFXeJ1Axv8lT7jE4ZIjhiGl+p5S9G9ixYfqo63O8+UlLrC+6Aq8qKwu8+WShWnctc9PTDndNohhUZJi0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760366411; c=relaxed/simple;
	bh=9KsJeR9Vpuvxv4Mn+yizTHxuTZonwS9HQUzbvAN/WUc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=D7YtKHoQ9WpbvvtNkTNgIw0pUHHb5BsPhDkyLRhHeMyvuqIxU8zdjOKQGGFBdYEWYLQKYMRYzgQfim6FCS7mTDz264e3AJ5Zl0CM/VJC0cd9+4fP34poRtMV0oVlTaCHHxIhH2fBowhktbf6hp6k5tei4LRkybXNlx3r5wDUDeQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=Y/PTtmw2; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="Y/PTtmw2"
Received: from pendragon.ideasonboard.com (82-203-166-19.bb.dnainternet.fi [82.203.166.19])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id C60FA557;
	Mon, 13 Oct 2025 16:38:28 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1760366309;
	bh=9KsJeR9Vpuvxv4Mn+yizTHxuTZonwS9HQUzbvAN/WUc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Y/PTtmw232JG1Lzu5RTYsB91dacMyodwlLtPXaS+AZHh37L9QHvUruTMgefOC81cT
	 MW8cQRL++8TcPhISqGuAkPAiujg6zNfYOYw47/tZimAjmxGXtEwD2oyFVBpM9qCawS
	 9FnbP/+ntmjNi3BLIuvay7+GWazAzC+DXZUVkf0k=
Date: Mon, 13 Oct 2025 17:39:59 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Steven Rostedt <rostedt@goodmis.org>
Cc: Willy Tarreau <w@1wt.eu>, Jiri Slaby <jirislaby@kernel.org>,
	Paolo Bonzini <pbonzini@redhat.com>,
	"Vlastimil Babka (SUSE)" <vbabka@kernel.org>,
	Jason Gunthorpe <jgg@ziepe.ca>, Mark Brown <broonie@kernel.org>,
	Konstantin Ryabitsev <konstantin@linuxfoundation.org>,
	users@kernel.org, tools@linux.kernel.org
Subject: Re: [workflows]Re: In defense of Link (was Re: [b4] initial "b4 dig"
 to supplant Link: trailers)
Message-ID: <20251013143959.GA1168@pendragon.ideasonboard.com>
References: <20251011061351.GB23024@1wt.eu>
 <aOoyhUzNDgwiyl5s@finisterre.sirena.org.uk>
 <20251012232725.GC3938986@ziepe.ca>
 <d884ec6d-856c-4dce-b8bf-cb6116c87bcb@kernel.org>
 <CABgObfaL1Pki1QCgO_vb1Ex_1=RgVwzOmD8Z+q_KnPw3jHwBpQ@mail.gmail.com>
 <20251013084211.GH616@1wt.eu>
 <d4f8e576-ee8c-4b74-a260-78289a26ec07@kernel.org>
 <20251013085629.GK616@1wt.eu>
 <20251013112159.GJ29493@pendragon.ideasonboard.com>
 <20251013102628.2f9e0057@gandalf.local.home>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20251013102628.2f9e0057@gandalf.local.home>

On Mon, Oct 13, 2025 at 10:26:28AM -0400, Steven Rostedt wrote:
> On Mon, 13 Oct 2025 14:21:59 +0300 Laurent Pinchart wrote:
> 
> > I may be missing something obvious, but why do we need a trailer for
> > this kind of usage ? We've added links to commit messages for ages,
> > either embedded in the text, or with "footnotes" (i.e. [1]). One of the
> > advantages of standardizing trailers is that they can be parsed by
> > scripts. I see few use cases for automating retrieval of a paper
> > explaining the background. Footnote links would seem better suited for
> > links that support the commit message, as they can then be referenced
> > from a specific place in the commit message. That would free usage of a
> > Link: trailer for other purposes.
> > 
> > [1] This would be a foot note link
> 
> I do something pretty much like this. Like others here, my scripts
> automatically add the submission link to the tag section. But if there's
> ever a conversation outside the patch submission that lead to the patch
> itself, I place the link tag separate from the rest. As to me, the tags
> section is for automation, but everything above it is for humans to read.
> Hence, you'll see commits like this one:
> 
>   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=4d6d0a6263babf7c43faa55de4fa3c6637dec624
> 
> Where it has:
> 
>     [..]
> 
>     Remove the HAVE_FTRACE_MCOUNT config and use DYNAMIC_FTRACE directly where
>     applicable.
>     
>     Link: https://lore.kernel.org/all/20250703154916.48e3ada7@gandalf.local.home/
>     

Using Link: for this will not work well as soon as you need multiple
links. Compare the following (edited with made up information) commit
message with

    Remove the HAVE_FTRACE_MCOUNT config and use DYNAMIC_FTRACE directly where
    applicable. This has shown a 50% improvement in CPU usage.
    
    Link: https://lore.kernel.org/all/20250703154916.48e3ada7@gandalf.local.home/
    Link: https://lore.kernel.org/all/20250703140000.deadbeef@gandalf.local.home/

with

    The HAVE_FTRACE_MCOUNT config was reported as being reduntant ([1]).
    Remove it and use DYNAMIC_FTRACE directly where applicable. This has
    shown a 50% improvement in CPU usage ([2]).
    
    [1] https://lore.kernel.org/all/20250703154916.48e3ada7@gandalf.local.home/
    [2] https://lore.kernel.org/all/20250703140000.deadbeef@gandalf.local.home/

And yes in this specific case maybe more information about the CPU usage
improvement should be included in the commit message itself, but that's
not the point.

>     Cc: Masami Hiramatsu <mhiramat@kernel.org>
>     Cc: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
>     Cc: Mark Rutland <mark.rutland@arm.com>
>     Cc: Linus Torvalds <torvalds@linux-foundation.org>
>     Link: https://lore.kernel.org/20250704104838.27a18690@gandalf.local.home
>     Signed-off-by: Steven Rostedt (Google) <rostedt@goodmis.org>
> 
> The first Link outside the text section was the motivation for the patch,
> and the Link in the tag section is for the patch.
> 
> Now that second Link is also useful, because if any of my patches have
> versions, I always have a link to the previous version in the last version.
> For example:
> 
>   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=71753c6ed2bf2aee5be26c1bc06a94c9e3713ade
> 
> Which has the committing link:
> 
>   https://lore.kernel.org/all/20250729182404.975790139@kernel.org/
> 
> Which has:
> 
>   Changes since v15: https://lore.kernel.org/20250725185739.233988371@kernel.org
> 
> So it allows you to not only find the cover letter of a series, but also
> daisy chains all the links to previous versions so you can see how the
> patch was developed, and all the comments to the older versions.
> 
> Now my workflow incorporates these link tags. When I need to create a new
> version of the patch, I save the old git branch with its version:
> 
>   git branch topic-v1
>   git reset --hard <base-commit>
> 
> Then I download the old version from patchwork, run my scripts to pull it
> in (which adds the links to the emails of those commits). And when I make the
> next version, I record the changes by replacing the:
> 
>   Link: https://lore.kernel.org/...
> 
> With
> 
>   Changes since v1: https://lore.kernel.org/...
> 
> And before sending my emails, I move that text below the '---'.
> 
> And this makes it very easy to incorporate the daisy chain. If I have to
> use any external tooling to search for it, I'm not going to bother, and
> this workflow will just stop happening.

-- 
Regards,

Laurent Pinchart
