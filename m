Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2584C3F9C6
	for <tools@linux.kernel.org>; Thu,  1 Feb 2024 21:48:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706824098; cv=none; b=MXRIedp60SKGI3tUBEgammyqrvIxgxp0ClpTngv5/x7y0yPBIRyyBxf4RHj3XqxJRCgzlkn2ot1jQIAetzBSIgkmlzbfJ8M9NGmxzUTH9ExzDpjEu1AOn9gQcBpz71f/d8r+E65g3ftArDwk4L+VfyrkxXkrACjHHRqDiE61VTU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706824098; c=relaxed/simple;
	bh=KGGzWKjFUZE7f6aBep+x/LEJFhqIK1wrGwhjuhtk5fA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lRovxdS1ACj2UWA9uyM0F90Xfora2v9it7G75684dcwq181qQ6vubbCXtesqsK3b93wNj36x2SdOpJePUbvRvvwlBOqI8J+tnPwxF/P2nP9zZDyu8QEG4RUDWIWDK+HI9a72HsiEYAl8BlI8Wccc5sS2+PiY/fuTdb3DHr5Oj6I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=tA3DNd6a; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="tA3DNd6a"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7AA65C433F1;
	Thu,  1 Feb 2024 21:48:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1706824097;
	bh=KGGzWKjFUZE7f6aBep+x/LEJFhqIK1wrGwhjuhtk5fA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=tA3DNd6aRnuta8Ai+zBSN6Cjbv4b/Q8YQxbGLFc2pXWgvWs9AkrUCJDS7QbF62rE0
	 XXv+vSUuHFyaNrRzG03A8vGBKJ54TSNrJgtEY/aFjMeR9m1LqZYokO0RpzD+fTmN/x
	 fCKkCkS5pyFMsnvFeMoeIBAOvSQ6o9ClAutrY1qI=
Date: Thu, 1 Feb 2024 16:48:14 -0500
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: Frank Li <Frank.Li@nxp.com>
Cc: tools@linux.kernel.org
Subject: Re: [PATCH 1/1] add --notes at git-show command to include notes in
 patches
Message-ID: <20240201-graceful-terrestrial-rhino-83c61f@lemur>
References: <20240131223054.371692-1-Frank.Li@nxp.com>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240131223054.371692-1-Frank.Li@nxp.com>

On Wed, Jan 31, 2024 at 05:30:54PM -0500, Frank Li wrote:
> I using notes to record patche's change log. b4 send will discard this. Add
> --notes options when create patches.

The biggest problem with using notes is that they are not currently preserved
by git-filter-repo:

https://github.com/newren/git-filter-repo/issues/22

Yes, there are some (hacky) workarounds to make this work, but even with them,
I am not comfortable with putting any information into notes that can just
suddenly be gone.

For now, I will keep this in the list of improvements, but I won't take this
patch until git-filter-repo does the right thing natively.

-K
