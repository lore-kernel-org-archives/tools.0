Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EC3272627
	for <tools@linux.kernel.org>; Wed, 25 Feb 2026 14:28:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772029681; cv=none; b=HcrifEzmv4yxQmgpUBaiobe/nFpWUj3zzUekqeV0Nj3Ct58Mzdv+AuuFyBeQ+MBgWxXvsdPzDWMk//BHR5vRmxDLcXI44kL8UNVx79TOwLxnyXr9W7HS1FmM7ZnQ5aNXAspN+XMH+K+/GXEpryYEu6DY1vFpAoq+Ec7qHCFGgkk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772029681; c=relaxed/simple;
	bh=/Nix0mSZjXB7sMjxss3wb7h+o2zNPLNKguMLusBkBBo=;
	h=MIME-Version:Content-Type:Subject:From:To:Cc:In-Reply-To:
	 References:Date:Message-Id; b=hcFfeymk5vb8Qaoxo60FBdjjmfs5pa3kkRkFlVej6IV0MeoQqA5T0Hx7EwHJrR1rqwaR4P/6bH9Jz20Gez79dUKChcNy3rd/21uJkMAyDRiyBGiuH0MiDLDXuSHR0rg5dDPx6OIX5E5PxGXCGccbnyvPo+KKn476OVGsbybAO08=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=SDE6r1Z/; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="SDE6r1Z/"
Received: by smtp.kernel.org (Postfix)
	id 00EBDC19421; Wed, 25 Feb 2026 14:28:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8EF20C116D0;
	Wed, 25 Feb 2026 14:28:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1772029680;
	bh=/Nix0mSZjXB7sMjxss3wb7h+o2zNPLNKguMLusBkBBo=;
	h=Subject:From:To:Cc:In-Reply-To:References:Date:From;
	b=SDE6r1Z/Do+6upS4VTIq9Dgvfii7rqrsSVJpC1bX3MeTmMLbiiRbmodO8HQ22NvAt
	 7B2cL9NRsbGR70sdJ/Ja5k9fD2qMZaYM73AR1SyF0EhKdAFpwmJj87Z26aH0wzG1Tt
	 WIMRNG9tvbir7xdx2c8puVy2f7Ag+NMjWB9+p0YU=
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH b4 v3] ez: allow cleaning multiple branches at once
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: Antonin Godard <antonin.godard@bootlin.com>
Cc: "Kernel.org Tools" <tools@kernel.org>, 
 Konstantin Ryabitsev <konstantin@linuxfoundation.org>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
In-Reply-To: <20260225-multiple-prep-cleanup-v3-1-db77b14dfdd1@bootlin.com>
References: <20260225-multiple-prep-cleanup-v3-1-db77b14dfdd1@bootlin.com>
Date: Wed, 25 Feb 2026 09:27:57 -0500
Message-Id: <177202967796.9138.1869608270063220594@lemur>
X-Mailer: b4 0.15-dev-97aec

On Wed, 25 Feb 2026 13:59:48 +0100, Antonin Godard <antonin.godard@bootlin.com> wrote:
> Allow "b4 prep --cleanup" to cleanup multiple branches in one go. If an
> error occurs (branch not known/empty branch/currently checked out), just
> return to continue cleaning up branches. Give the user multiple options:
> "y" to cleanup, "n" to skip, "q" to abort the cleanup, "s" to show
> the branch log with diffs, and "?" to print help about these options.
> 
> Passing nothing to --cleanup still shows the available branches to
> cleanup.

I have a few tiny notes, but I hope we can get them addressed. :)

> -    mybranch = param
> -    if not b4.git_branch_exists(None, mybranch):
> -        logger.critical('Not a known branch: %s', mybranch)
> -        sys.exit(1)
> -    is_prep_branch(mustbe=True, usebranch=mybranch)
> -    base_commit, start_commit, end_commit = get_series_range(usebranch=mybranch)
> +    if not is_prep_branch(usebranch=branch):
> +        logger.error(f'ERROR: {branch} is not a prep-managed branch')

This is a nitpick, but in general it's preferred to use %-formatting for 
logger calls, because this skips unnecessary interpolation when not 
needed. So, in this case it should be:

  logger.error('ERROR: %s is not a prep-managed branch', branch)

> @@ -2575,7 +2569,37 @@ def cleanup(param: str) -> None:
>              tags.append((tagname, base_commit, tag_commit, revision, cover))
>      logger.info('---')
>      try:
> -        input('Press Enter to confirm or Ctrl-C to abort')
> +        resp = None
> +        while resp is None:
> +            resp = input('Proceed? [y/s/q/N/?] ')
> +            if resp == "?":
> +                logger.info(textwrap.dedent(
> +                    """
> +                    Possible answers:
> +                    y: cleanup the branch
> +                    s: show branch log
> +                    q or Ctrl-C: abort cleanup
> +                    n (default): do not cleanup this branch
> +                    ?: show this help message
> +                    """))
> +                resp = None
> +            elif resp in ("show", "s"):
> +                ecode, out = b4.git_run_command(None, ["log",
> +                                                       "--patch",
> +                                                       "--color=always",
> +                                                       f"{start_commit}~..{end_commit}"])
> +                if ecode > 0:
> +                    logger.critical('ERROR: unable to show git log between'
> +                                    f'{start_commit} and {end_commit}')

There are two small notes here. First, there's no space between two strings, so
on concatenation this will produce "...between<sha>" with no space before the
SHA. Second, this should also be using %-interpolation, so the line should just
really be:

    logger.critical('ERROR: unable to show git log between %s and %s',
                    start_commit, end_commit)

Thanks!

-- 
KR

