Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A51B82BE03C
	for <tools@linux.kernel.org>; Sun,  1 Feb 2026 05:37:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769924260; cv=none; b=BwsbLkuP4hlC1sDPXSuIiOZlfpIZpy4qckX9zD2ht6hV85T32SoYeJvEkmbFWTN9Hprbe90eiH6OS98zfNofsDwbo3Sf/IiPwkrjja2N4Sgmj3HAUAm04IDwcK+RBapZtJwzZ3efUeROHzr4M6FqP7KXc2HqEex6RsRRTkkOqmA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769924260; c=relaxed/simple;
	bh=bn2Z6/5Sy7ixdnFvYOPHtdlOW65mbdqoc2jmXTSIZZI=;
	h=MIME-Version:Content-Type:Subject:From:To:Cc:In-Reply-To:
	 References:Date:Message-Id; b=h+gYcrTelBp/Ob7eN7hAvJtCvayN+vNARGpEKnzXW3UEmJfYF/+AUWyFBQsZwV9Zrwc++7GsbeP/p/7lPptWncnkMY7rVjkyY0nqXBeVBQ+ad/8azztuEZc35pjXtZ2FU7NmCGz6DeXnaPudAd7S8LjTkrIrCZv874NA3JEUgag=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=Cr2Pd579; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="Cr2Pd579"
Received: by smtp.kernel.org (Postfix)
	id 554F7C2BCAF; Sun,  1 Feb 2026 05:37:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0099AC4CEF7;
	Sun,  1 Feb 2026 05:37:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1769924260;
	bh=bn2Z6/5Sy7ixdnFvYOPHtdlOW65mbdqoc2jmXTSIZZI=;
	h=Subject:From:To:Cc:In-Reply-To:References:Date:From;
	b=Cr2Pd579DYW7wOSQbBRQi4E6PFbWuaoxQ3c4YxBYkIU8De13SyEqaIFaaT2Bj7DBs
	 xdt+Gbplonv2D/uYdc4WWaHrNgQUiFBNAPVjzQvwSo4fCq3jerg67Gzmky9MrsQCet
	 dhXlczAej5acN25y4vKOKb1/sFqu3k1d6m1w4MHQ=
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH b4 2/2] b4: add support for oauth2 SMTP authentication
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: "Kernel.org Tools" <tools@kernel.org>
Cc: Konstantin Ryabitsev <konstantin@linuxfoundation.org>, 
 Tomas Melin <tomas.melin@vaisala.com>
In-Reply-To: <20260129-smtp-oauth2-outlook-v1-2-e8c6d1b00c03@vaisala.com>
References: <20260129-smtp-oauth2-outlook-v1-0-e8c6d1b00c03@vaisala.com>
 <20260129-smtp-oauth2-outlook-v1-2-e8c6d1b00c03@vaisala.com>
Date: Sun, 01 Feb 2026 00:37:34 -0500
Message-Id: <176992425475.611611.11253371452032746350@lemur>
X-Mailer: b4 0.15-dev

On Thu, 29 Jan 2026 11:10:30 +0200, Tomas Melin <tomas.melin@vaisala.com> wrote:
> diff --git a/src/b4/__init__.py b/src/b4/__init__.py
> index 3d774f7..0adf5ca 100644
> --- a/src/b4/__init__.py
> +++ b/src/b4/__init__.py
> @@ -2922,6 +2923,16 @@ def git_credential_fill(gitdir: Optional[str], protocol: str, host: str, usernam
>      return None
>  
>  
> +def git_credential_helper(name: str) -> str:
> +    if not name:
> +        raise ValueError("credential helper name cannot be empty")
> +    name = 'credential-' + name
> +    ecode, out = git_run_command(None, args=[name])
> +    if ecode == 0:

Any reason we're not making use of git_credential_fill() here? I'm not sure we
can expect correct return here, because credential helpers expect input on
stdin like:

  protocol=smtp
  host=<server>
  username=<user>

The existing git_credential_fill() function should already handle this
correctly, unless I'm mistaken or you have other reasons not to use it.

> +        return out.strip()
> +    return ''
> +
> +
>  def git_get_command_lines(gitdir: Optional[str], args: List[str]) -> List[str]:
>      ecode, out = git_run_command(gitdir, args)
>      lines = list()
> @@ -4050,6 +4061,15 @@ def get_sendemail_config() -> Dict[str, Optional[Union[str, List[str]]]]:
>      return SENDEMAIL_CONFIG
>  
>  
> +def get_oauth2_token(server: str, smtpuser: str) -> str:
> +    creds = get_config_from_git(rf'credential.*{server}*')
> +    access_token = git_credential_helper(creds.get('helper', ''))

The regex does not look correct here. You probably want to do:

    rf'credential\.{re.escape(server)}\.*'

or something like that.

> +    if not access_token:
> +        raise smtplib.SMTPException(f'Unable to get access token from git credential helper for server {server}')
> +    auth_string = f'user={smtpuser}\x01auth=Bearer {access_token}\x01\x01'
> +    return base64.b64encode(auth_string.encode()).decode()
> +
> +
>  def get_smtp(dryrun: bool = False) -> Tuple[Union[smtplib.SMTP, smtplib.SMTP_SSL, List[str], None], str]:
>      sconfig = get_sendemail_config()
>      # Limited support for smtp settings to begin with, but should cover the vast majority of cases
> @@ -4118,6 +4138,11 @@ def get_smtp(dryrun: bool = False) -> Tuple[Union[smtplib.SMTP, smtplib.SMTP_SSL
>          if smtpauth.lower() == 'none':
>              return smtp, fromaddr
>  
> +        if (sconfig.get('smtpauth').lower() == 'xoauth2'):
> +            logger.debug('Authenticating to SMTP server using oauth2')

Two issues here:

1. sconfig.get('smtpauth') has no default value. If smtpauth is not set
   in the config, this returns None and .lower() raises AttributeError.
   Two lines above, the same key is fetched with a default:
     smtpauth = str(sconfig.get('smtpauth', ''))
   You should use the existing `smtpauth` variable instead of re-fetching.

2. The parentheses around the condition are unnecessary (minor Python style
   issue).

> +            auth_b64 = get_oauth2_token(server, sconfig.get('smtpuser'))
> +            smtp.docmd('AUTH', 'XOAUTH2 ' + auth_b64)
> +
>          auser = str(sconfig.get('smtpuser', ''))
>          apass = str(sconfig.get('smtppass', ''))

This is going to not do the right thing.

After successful XOAUTH2 authentication, there is no return statement.
Execution falls through to the basic auth block below, which will call
smtp.login(auser, apass). This will either fail (no password configured)
or attempt a second, unwanted authentication.

Add `return smtp, fromaddr` after smtp.docmd() to prevent fall-through.

Also: smtp.docmd() returns a (code, message) tuple. The response code
should be checked -- XOAUTH2 authentication can fail (e.g. expired
token), and silently ignoring the response means the caller will not
know authentication failed.

>          if auser and not apass:

-- 
Konstantin Ryabitsev <konstantin@linuxfoundation.org>
