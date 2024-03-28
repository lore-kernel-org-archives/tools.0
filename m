Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 344A53D387
	for <tools@linux.kernel.org>; Thu, 28 Mar 2024 14:19:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711635589; cv=none; b=TbjCCRul1vDA2LwU/JMBNBBvqd61resed7MQQuO3qqbl1IwVOBIXaHWtt1ql459Z9GijHBkRy6P658qtesLLRFZJrQ/Daz+QGYuhauD9XFD7bCWzgFyaID0z2FfHvBUeGL2Gi+rbgIJmJE8jGb7COfpo9rN/AZlaK1NxEPxYiIc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711635589; c=relaxed/simple;
	bh=PUBOLzMWTmIU24Nwqg2A3ZgE2DQYDYpk2d5E8E5C5Wk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nmEpGdvn2+CjkSaALIbESUwtrQQ9HIwfASpGFAHvY/pQhxiMoVM42jf6K5YIhXhBY4rctgpYeBVW0CLwzsabwsoxUF5caejSawrHyVQLnSc2IXCBk/7+tz8kgEvPYjh3aRXQbGPmFWQhXrqnGw6PcnzV/YBAJv9g08iCQvhWLGY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=egR15guN; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="egR15guN"
Received: by smtp.kernel.org (Postfix)
	id BF548C433C7; Thu, 28 Mar 2024 14:19:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8730EC43390;
	Thu, 28 Mar 2024 14:19:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1711635588;
	bh=PUBOLzMWTmIU24Nwqg2A3ZgE2DQYDYpk2d5E8E5C5Wk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=egR15guNhbSBPMMOmXik2pnwYn1NOOTVL2p4SfvHj3kVY32yRf7+dRzWRcG2q9YRG
	 HLbs8ELssi1EWCCOsNFv1MGlnPRY4RO9XatgDk2+dVRJBVdHxLnfTGw2HLFeu3AJQt
	 WuxlTEDUy88VqzTysX9jCooCfpJtNEJs46QXL/WY=
Date: Thu, 28 Mar 2024 10:19:45 -0400
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: Louis Chauvet <louis.chauvet@bootlin.com>
Cc: "Kernel.org Tools" <tools@kernel.org>, miquel.raynal@bootlin.com, 
	thomas.petazzoni@bootlin.com
Subject: Re: [PATCH b4] ez: Prevent overwriting an unrelated cover letter
Message-ID: <20240328-premium-mouflon-of-tolerance-bdcdb5@lemur>
References: <20240328-avoid-overwritting-cover-letter-v1-1-161d30ee533c@bootlin.com>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240328-avoid-overwritting-cover-letter-v1-1-161d30ee533c@bootlin.com>

On Thu, Mar 28, 2024 at 10:25:43AM +0100, Louis Chauvet wrote:
> When editing a cover-letter, b4 expectedly selects as base the
> cover-letter of the currently checked-out Git branch. When
> saving/closing the editor, b4 also saves the changes as the
> new cover-letter for the currently checked-out Git branch.
> 
> While simplistic and apparently totally fine, it does not play well
> when working on multiple branches. Said otherwise, the following
> sequence of events will write the wrong file, possibly smashing a
> valuable cover-letter:

Makes sense, good catch!

>  def edit_cover() -> None:
> +    # To avoid losing the cover letter, ensure that we are still on the same branch as when the cover-letter was originally opened.
> +    read_branch = b4.git_get_current_branch()
>      cover, tracking = load_cover()
>      bcover = cover.encode()
>      new_bcover = b4.edit_in_editor(bcover, filehint='COMMIT_EDITMSG')

I suggest we implement this check in b4.edit_in_editor(), so it applies to all
situations, not just for cover editing:

- get and remember the current branch name
- open file in editor
- re-check the current branch name
- save the contents as temporary file
- complain via logger.critical
- throw RuntimeError

Does that make sense?

> @@ -768,8 +772,15 @@ def edit_cover() -> None:
>      if not len(new_cover):
>          logger.info('New cover letter blank, leaving current one unchanged.')
>          return
> -
> -    store_cover(new_cover, tracking)
> +    write_branch = b4.git_get_current_branch()
> +    if write_branch != read_branch:
> +        with NamedTemporaryFile(mode="w", prefix=f"cover-{read_branch}".replace("/", "-"), delete=False) as save_file:
> +            save_file.write(new_cover)
> +            logger.critical(f'The cover letter was read on the branch {read_branch} but the current branch is now {write_branch}.')
> +            logger.critical(f'To avoid overwriting an unrelated cover letter, the operation is canceled and your new '
> +                            f'cover letter stored at {save_file.name}')

Best practice is to use %s expansion for logger calls, because this way the
substitution doesn't even happen if we're in a logging level above the one
specified.

Thanks!

-K
