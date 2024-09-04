Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D9DC3211
	for <tools@linux.kernel.org>; Wed,  4 Sep 2024 03:35:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725420906; cv=none; b=Qz0fdrIFRuTctVOjx6lCiOkCsULhw8DlTGAZzyng7ruHMkVZnj5cQT7cjyScS/59MuOQUgH5aQfUNdqIDVjchxHO5lZgEpygmqpiCedAfBbIKyEOGxAihfg7R13b+VVFc/6c3M7MZOqPObhRmVDjHmKGMI0DzuDAWTHfVWOwNMY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725420906; c=relaxed/simple;
	bh=Ki7nY28N7TRJzoYv7MpYme9B2ByfUIXCFBklzwnXy6w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=s9SBpVDDLQri+1uynwowpW85GSeJRaBpGiJyUS3ZQyMIRExX/2UHniMtUkgce5wavKQfhhWIiqaw+dlkbCFG7wpm7YkdpjEq3QRmIh7awNaDyj3C31FctrvvN/UMXXJyernPANqO4SgQnx7NBvDGD9JSRwNhd8HUPwev5ZOmIvA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=hGH2DA+e; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="hGH2DA+e"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 64E24C4CEC2;
	Wed,  4 Sep 2024 03:35:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1725420905;
	bh=Ki7nY28N7TRJzoYv7MpYme9B2ByfUIXCFBklzwnXy6w=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=hGH2DA+eZg2xYr6CqMPi+v2/Cqr6//WjSJfmbaLf1G5HP0fhYTjSa/sQZSdgnbQ5P
	 eNwnOljHglxHjvaBO39QNNKFndwgA08YCwJBz8dEidzrWs/PkopSU/aJeQQ/FqCa8o
	 0KRaBMNPMeRlJhke8ZPjqoQ2qoGIglUZZ1pjAGuA=
Date: Tue, 3 Sep 2024 23:35:04 -0400
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: Mark Brown <broonie@kernel.org>
Cc: tools <tools@linux.kernel.org>
Subject: Re: b4 send falls over sending a series
Message-ID: <20240903-caped-graceful-ammonite-b0ed4f@lemur>
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
> Recording series message-id in cover letter tracking
> The current repository is not tracking a branch. To use b4, please checkout a branch.
> Maybe a rebase is running?
> Traceback (most recent call last):
>   File "/home/broonie/git/b4/src/b4/command.py", line 435, in <module>
>     cmd()
>   File "/home/broonie/git/b4/src/b4/command.py", line 417, in cmd
>     cmdargs.func(cmdargs)
>   File "/home/broonie/git/b4/src/b4/command.py", line 93, in cmd_send
>     b4.ez.cmd_send(cmdargs)
>   File "/home/broonie/git/b4/src/b4/ez.py", line 2132, in cmd_send
>     reroll(mybranch, tag_msg, cl_msgid)
>   File "/home/broonie/git/b4/src/b4/ez.py", line 2217, in reroll
>     cover, tracking = load_cover(strip_comments=False)
>                       ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
>   File "/home/broonie/git/b4/src/b4/ez.py", line 599, in load_cover
>     cover_commit = find_cover_commit(usebranch=usebranch)
>                    ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
>   File "/home/broonie/git/b4/src/b4/ez.py", line 742, in find_cover_commit
>     raise RuntimeError("Not currently on a branch, please checkout a b4-tracked

bugbot assign to me

-K
