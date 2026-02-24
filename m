Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 375622DB791
	for <tools@linux.kernel.org>; Tue, 24 Feb 2026 19:05:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771959906; cv=none; b=E/Z7Qsyjri2G02HQtHaRU1xg8FonjzX6b70gt32m0DTETq+WdKLZPDobaYQDiZFOY1ok+PHXaUm4ZPyKIgNPVt277RUSfExmRscUp97j8b5syeftAVqO8ijD2oiCLUaUnSYpC5OHZ255hurXh1FfMqD603iJSc/04addadS+Xj0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771959906; c=relaxed/simple;
	bh=WXp20W5sjASQYwmrv0ezMdim/WgogkRaGN2G3ybkdxw=;
	h=MIME-Version:Content-Type:Subject:From:To:Cc:In-Reply-To:
	 References:Date:Message-Id; b=KZRZgHkT/rNsU+C0V150kFGS92ycRnwgP5XftDqIi231TrjNbMBG20pEnvMsGT8YRpZSHjEpfVOSJzJDv9fpBR41zpsih0QKsTq+f5HFKkyOL63vYq6rsFY1SEaTNwImUd0ECpEw+s6vTFLp7tbpGxEAzdy3MjxAhCdDG5WnO10=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=GwU2OtLz; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="GwU2OtLz"
Received: by smtp.kernel.org (Postfix)
	id BCBFAC19425; Tue, 24 Feb 2026 19:05:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 44025C19422;
	Tue, 24 Feb 2026 19:05:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1771959905;
	bh=WXp20W5sjASQYwmrv0ezMdim/WgogkRaGN2G3ybkdxw=;
	h=Subject:From:To:Cc:In-Reply-To:References:Date:From;
	b=GwU2OtLzc5aYlNnZ6OeSpETqK0URboh27nT4Jwyr0OSx6AX3Lv0eyOfASkeLAuQON
	 e8DorJFELfEsIuEabMmiEK5EXeLvC+7fqZPlSi2188K/D86W8BMWOmnp/AI25tLrsT
	 Ivv8403g02+B6LdWbsmdrmTjMNnrQ3MbagQMOTvQ=
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH b4 v2] ez: allow cleaning multiple branches at once
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: Antonin Godard <antonin.godard@bootlin.com>
Cc: "Kernel.org Tools" <tools@kernel.org>, 
 Konstantin Ryabitsev <konstantin@linuxfoundation.org>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
In-Reply-To: <20260203-multiple-prep-cleanup-v2-1-50d8ccefe25c@bootlin.com>
References: <20260203-multiple-prep-cleanup-v2-1-50d8ccefe25c@bootlin.com>
Date: Tue, 24 Feb 2026 14:04:59 -0500
Message-Id: <177195989990.4022197.15018082372301746649@lemur>
X-Mailer: b4 0.15-dev-2de16

On Tue, 03 Feb 2026 10:54:01 +0100, Antonin Godard <antonin.godard@bootlin.com> wrote:
> Allow "b4 prep --cleanup" to cleanup multiple branches in one go. If an
> error occurs (branch not known/empty branch/currently checked out), just
> return to continue cleaning up branches. Give the user multiple options:
> "y" to cleanup, "n" to skip, "q" to abort the cleanup, "s" to show
> the branch log with diffs, and "?" to print help about these options.
> 
> Passing nothing to --cleanup still shows the available branches to
> cleanup.

Thanks for sending this in! I'm not against the feature, but there are 
several places where I think this can be improved.

> diff --git a/src/b4/ez.py b/src/b4/ez.py
> index 298e382..7af8e14 100644
> --- a/src/b4/ez.py
> +++ b/src/b4/ez.py
> @@ -26,6 +26,7 @@ import io
>  import tarfile
>  import hashlib
>  import urllib.parse
> +import subprocess

This import is only needed for the single subprocess.run() call in the
"s" handler. Consider using b4.git_run_command() instead, which would
eliminate the need for this import entirely.

> @@ -2518,47 +2519,40 @@ def get_prep_managed_branches(gitdir: Optional[str] = None) -> List[str]:
>      return mybranches
>  
>  
> -def cleanup(param: str) -> None:
> -    if param == '_show':
> -        # Show all b4-tracked branches
> -        mybranches = get_prep_managed_branches(None)
> -        if not len(mybranches):
> -            logger.info('No b4-tracked branches found')
> -            sys.exit(0)
> +def _cleanup_branch(branch: str) -> None:
>  
> -        logger.info('Please specify branch:')
> -        for branch in mybranches:
> -            logger.info(' %s', branch)
> +    if not b4.git_branch_exists(None, branch):
> +        logger.error('ERROR: Not a known branch: %s', branch)
>          return
>  
> -    mybranch = param
> -    if not b4.git_branch_exists(None, mybranch):
> -        logger.critical('Not a known branch: %s', mybranch)
> -        sys.exit(1)
> -    is_prep_branch(mustbe=True, usebranch=mybranch)
> -    base_commit, start_commit, end_commit = get_series_range(usebranch=mybranch)
> +    if not is_prep_branch(usebranch=branch):

is_prep_branch() without mustbe=True returns False silently. The user
gets no indication of why this branch was skipped. Consider adding an
error message here, e.g.:
    if not is_prep_branch(usebranch=branch):
        logger.error('ERROR: %s is not a prep-managed branch', branch)
        return

> @@ -2573,7 +2567,32 @@ def cleanup(param: str) -> None:
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
> +                start_commit = get_info(branch)["start-commit"]
> +                end_commit = get_info(branch)["end-commit"]

start_commit and end_commit are already computed at the top of this
function via get_series_range(). Re-fetching them from get_info() is
wasteful (get_info computes recipients, prereqs, preflight checks, etc.)
and also shadows the outer local variables. If the user presses "s" then
"y", the archiving code below will use these reassigned values.

Just use the already-available locals directly, e.g.:
    b4.git_run_command(None, ['log', '-p',
                              f'{start_commit}~..{end_commit}'])

> +                subprocess.run(["git", "--paginate", "log", "-p",
> +                                f"{start_commit}~..{end_commit}"])

Same as above, this should be using git_run_command().

> @@ -2636,6 +2655,23 @@ def cleanup(param: str) -> None:
>      logger.info('Wrote: %s', tarpath)
>  
>  
> +def cleanup(branches: list[str]) -> None:

Small nitpick: the lowercase list[str] type annotation requires Python 3.9+.
The rest of this file uses List from typing (already imported). Use List[str]
for consistency.

Cheers,

-- 
KR

