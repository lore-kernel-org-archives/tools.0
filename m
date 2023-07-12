Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6B401F95D
	for <tools@linux.kernel.org>; Wed, 12 Jul 2023 18:58:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6F7B0C433C8;
	Wed, 12 Jul 2023 18:58:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1689188316;
	bh=aJiw3LbIRKSSx8s9iJDeXbsS4uGKgjbbrLDFvgtUGcY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=HckbuKVy5HBp+RH25MSbpGM9NyaxvP64rId6vCA04PRjrF21nzH+An9oHIr2yOmEH
	 rPlPEdqYtzRowPcP/zPQVNCNdBdG2jCKC7EOTi8dX9Xg3QIwIgio9lOLvinAS9VlOC
	 Hs/LK7/iFi8MYeFvWRXd2EHdtfSF+yWA/4YoxLzbJjS25OGw7M8znh5xHnd7KCJKIS
	 Fik7a3GkPLYU01tIg37H4nHP/C/8Vzg0rnriE2A1Wuxh7Yde9PJDzG3afvsRCl+V+b
	 e3cxd7fptS1SMQUUJIi6mGr7KTxEIzfle7ngZAtxlRCQZJ+wnNswDxuvpQxUCMf+fD
	 P9ZwYCVBsMzEw==
Date: Wed, 12 Jul 2023 20:58:32 +0200
From: Christian Brauner <brauner@kernel.org>
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc: tools@linux.kernel.org
Subject: Re: Picking up changed commit subjects when generating thank you
 messages & patch list generation
Message-ID: <20230712-nahegehen-stabil-41cfd48e565c@brauner>
References: <20230711-berechenbar-bordstein-b22e1f7f9835@brauner>
 <20230712-mulch-french-2788cd@meerkat>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20230712-mulch-french-2788cd@meerkat>

On Wed, Jul 12, 2023 at 02:33:18PM -0400, Konstantin Ryabitsev wrote:
> On Tue, Jul 11, 2023 at 12:05:44PM +0200, Christian Brauner wrote:
> > Hey everyone,
> > 
> > As always, very happy about b4!
> > 
> > I have two features requests:
> 
> bugbot on
> 
> > (1) Automatically picking up changed commit subject lines
> >     When applying series via shazam or am commit message subjects
> >     sometimes need to be tweaked afterwards. But while b4 ty picks up
> >     commit hash changes caused by e.g., git commit --amend it doesn't
> >     pick up the changed subject.
> >     
> >     For example, the patch originally sent with commit subject "aaa" got
> >     applied. Afterwards it was amended to "bbb". But b4 ty would still
> >     generate:
> >     
> >     [1/1] aaa
> >           https://git.kernel.org/vfs/vfs/c/7b2edd278691
> >     
> >     in the thank you letter.
> 
> I can see arguments both for and against it. Since we are responding to the
> original submission, it makes sense to me to use the original patch subjects.
> However, I will consider how to best approach this situation.
> 
> > (2) Let b4 support generating a patch list for a specified range of commits
> >     Sometimes there are scenarios where it would be helpful to let b4
> >     generate a list of applied commits for a range of commits (even if
> >     not under direct control of b4):
> > 
> >     [01/92] subsystem1: long
> >             https://git.kernel.org/vfs/vfs/c/ead310563ad2
> >     [02/92] subsystem2: long
> >     .
> >     .
> >     .
> >     [92/92] subsystem92: list
> >             https://git.kernel.org/vfs/vfs/c/f42faf14b838
> > 
> >     that can then be copy-pasted into a ty message.
> > 
> >     b4 has all the nice info and gitconfig options such as:
> >     thanks-am-template, thanks-treename, thanks-commit-url-mask that
> >     would make this just ultra useful.
> 
> So, you just want a "summary of all commits" from an arbitrary range, using
> the template? Do we leave To/Cc fields blank, or populate them with all the
> addresses that we could match either via b4 tracking or via commit trailers?

Could this be config option?
