Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 509F61A8419
	for <tools@linux.kernel.org>; Thu, 22 May 2025 07:46:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747899965; cv=none; b=sVbJOtBKv0FAlFrLLetad5wLRheqNRJYd8qEhk/CTCPhjPrXD1jbKl22FV2IGE2XkfN8lAJHp3M428nXd+cCAdcWodRCs8xkwatI+DY6C3QC0ZmstfLBcDbEoRfhR2FpTrgZR2lh7uMeIU2X0RkY/iF9pYcYyLw/PlZVLKiAr3w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747899965; c=relaxed/simple;
	bh=II6/oBbRIsuDf8MkgzeTDBlCy/zli+jHTq6wLW6cmuQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JvQ+jYdt5BLy2kL4HikhInvVRVm5paYq+CA9tGa0zI8MvFj0k5W+WtHv/B1o7eqQNtsY1ttFiENHu88qHiomTvu//UHlmEp9oT1p+uyJI8/R/aJkIkuAGGZ0iEov1HklMi7JMpEg88XfPRqqPRjWynGvbdkFbH3DqaXcSzaSCEI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nEViwYmB; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nEViwYmB"
Received: by smtp.kernel.org (Postfix)
	id D0CEFC4CEED; Thu, 22 May 2025 07:46:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 180C4C4CEE4;
	Thu, 22 May 2025 07:46:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747899964;
	bh=II6/oBbRIsuDf8MkgzeTDBlCy/zli+jHTq6wLW6cmuQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=nEViwYmB11w7uPnsgC9waQ440OVakF16d/T8Jc0OFor6i7OC+8/3TV2h1Ix3RUszt
	 VUY8hscTVjbcp8RLNOG3GSTWVri2WwBuH56l4IbPB5VrPEJwUo0u2hgJBVsa5OyxbE
	 uc5ocNLzqdqc1JtaW4/oc+gcCVne8QdUHyPQft9KmXvKqODHNEfP0gzuZNB+e3meBC
	 xOzez9IVfSc8ySLyQtK+cstVwS3iYvUbQaAuO+/1UxVk9mymu+93wW/lynmRJOJwfM
	 omOs6ZN/Q9IFP3jjkY25xt5X5ZHz55AaFIIh5gNYsjqk6EFWFn91jWtuBPKk24cKzk
	 ljToS8I05lGEg==
Date: Thu, 22 May 2025 08:46:01 +0100
From: Lee Jones <lee@kernel.org>
To: konstantin@linuxfoundation.org
Cc: tools@kernel.org
Subject: Re: [PATCH v3 1/1] ty: Allow users to specify whether thank-yous are
 sent to themselves
Message-ID: <20250522074601.GD8794@google.com>
References: <20250509090324.2731374-1-lee@kernel.org>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250509090324.2731374-1-lee@kernel.org>

[INTENTIONAL TOP POST]

Is this still on your list or shall I submit a [RESEND]?

> The motivation behind this change was that thank-yous weren't showing up
> in maintainer's inboxes.  This is a problem because some of us the
> presence of these mails to indicate that particular sets or individual
> patches have been applied or not.
> 
> Provide command line option '--me-too' to override the default
> behaviour.  If this is not specified, there are no functional changes.
> 
> Closes: https://bugzilla.kernel.org/show_bug.cgi?id=217672
> Signed-off-by: Lee Jones <lee@kernel.org>
> ---
>  src/b4/command.py |  2 ++
>  src/b4/ty.py      | 19 ++++++++++---------
>  2 files changed, 12 insertions(+), 9 deletions(-)
> 
> diff --git a/src/b4/command.py b/src/b4/command.py
> index 476fc13565a1..f41b6ed86c74 100644
> --- a/src/b4/command.py
> +++ b/src/b4/command.py
> @@ -266,6 +266,8 @@ def setup_parser() -> argparse.ArgumentParser:
>                         help='Print out emails instead of sending them')
>      sp_ty.add_argument('--pw-set-state', default=None,
>                         help='Set this patchwork state instead of default (use with -a, -t or -d)')
> +    sp_ty.add_argument('--me-too', action='store_true', dest='metoo', default=False,
> +                       help='Send a copy of the thanks mail to yourself - ensures a copy lands in your inbox')
>      sp_ty.set_defaults(func=cmd_ty)
>  
>      # b4 diff
> diff --git a/src/b4/ty.py b/src/b4/ty.py
> index 021588ff9e55..0805914044f4 100644
> --- a/src/b4/ty.py
> +++ b/src/b4/ty.py
> @@ -78,14 +78,15 @@ def git_get_commit_message(gitdir: Optional[str], rev: str) -> Tuple[int, Union[
>      return b4.git_run_command(gitdir, args)
>  
>  
> -def make_reply(reply_template: str, jsondata: dict, gitdir: Optional[str]) -> email.message.EmailMessage:
> +def make_reply(reply_template: str, jsondata: dict, gitdir: Optional[str], cmdargs: argparse.Namespace) -> email.message.EmailMessage:
>      msg = email.message.EmailMessage()
>      msg['From'] = '%s <%s>' % (jsondata['myname'], jsondata['myemail'])
>      excludes = b4.get_excluded_addrs()
>      newto = b4.cleanup_email_addrs([(jsondata['fromname'], jsondata['fromemail'])], excludes, gitdir)
>  
>      # Exclude ourselves and original sender from allto or allcc
> -    excludes.add(jsondata['myemail'])
> +    if not cmdargs.metoo:
> +        excludes.add(jsondata['myemail'])
>      excludes.add(jsondata['fromemail'])
>      allto = b4.cleanup_email_addrs(utils.getaddresses([jsondata['to']]), excludes, gitdir)
>      allcc = b4.cleanup_email_addrs(utils.getaddresses([jsondata['cc']]), excludes, gitdir)
> @@ -270,7 +271,7 @@ def set_branch_details(gitdir: Optional[str], branch: str, jsondata: dict, confi
>      return jsondata, config
>  
>  
> -def generate_pr_thanks(gitdir: Optional[str], jsondata: dict, branch: str) -> email.message.EmailMessage:
> +def generate_pr_thanks(gitdir: Optional[str], jsondata: dict, branch: str, cmdargs: argparse.Namespace) -> email.message.EmailMessage:
>      config = b4.get_main_config()
>      jsondata, config = set_branch_details(gitdir, branch, jsondata, config)
>      thanks_template = DEFAULT_PR_TEMPLATE
> @@ -295,11 +296,11 @@ def generate_pr_thanks(gitdir: Optional[str], jsondata: dict, branch: str) -> em
>      if not cidmask:
>          cidmask = 'merge commit: %s'
>      jsondata['summary'] = cidmask % jsondata['merge_commit_id']
> -    msg = make_reply(thanks_template, jsondata, gitdir)
> +    msg = make_reply(thanks_template, jsondata, gitdir, cmdargs)
>      return msg
>  
>  
> -def generate_am_thanks(gitdir: Optional[str], jsondata: dict, branch: str, since: str) -> email.message.EmailMessage:
> +def generate_am_thanks(gitdir: Optional[str], jsondata: dict, branch: str, cmdargs: argparse.Namespace) -> email.message.EmailMessage:
>      config = b4.get_main_config()
>      jsondata, config = set_branch_details(gitdir, branch, jsondata, config)
>      thanks_template = DEFAULT_AM_TEMPLATE
> @@ -312,7 +313,7 @@ def generate_am_thanks(gitdir: Optional[str], jsondata: dict, branch: str, since
>                              config['thanks-am-template'])
>              sys.exit(2)
>      if 'commits' not in jsondata:
> -        commits = auto_locate_series(gitdir, jsondata, branch, since)
> +        commits = auto_locate_series(gitdir, jsondata, branch, cmdargs.since)
>      else:
>          commits = jsondata['commits']
>  
> @@ -343,7 +344,7 @@ def generate_am_thanks(gitdir: Optional[str], jsondata: dict, branch: str, since
>                          nomatch, len(commits), jsondata['subject'])
>          logger.critical('           Please review the resulting message')
>  
> -    msg = make_reply(thanks_template, jsondata, gitdir)
> +    msg = make_reply(thanks_template, jsondata, gitdir, cmdargs)
>      return msg
>  
>  
> @@ -425,10 +426,10 @@ def send_messages(listing: List[Dict], branch: str, cmdargs: argparse.Namespace)
>          jsondata['signature'] = signature
>          if 'pr_commit_id' in jsondata:
>              # This is a pull request
> -            msg = generate_pr_thanks(gitdir, jsondata, branch)
> +            msg = generate_pr_thanks(gitdir, jsondata, branch, cmdargs)
>          else:
>              # This is a patch series
> -            msg = generate_am_thanks(gitdir, jsondata, branch, cmdargs.since)
> +            msg = generate_am_thanks(gitdir, jsondata, branch, cmdargs)
>  
>          if msg is None:
>              continue
> -- 
> 2.49.0.1045.g170613ef41-goog
> 

-- 
Lee Jones [李琼斯]
