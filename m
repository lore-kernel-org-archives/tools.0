Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A594D39E6CD
	for <tools@linux.kernel.org>; Tue, 24 Feb 2026 19:28:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771961289; cv=none; b=g3ZHtoOICKei9tAp+/EnNRhxxrJOeoWRgrYNdsZmV+3NwUTn9z6XsAvyxIwPILuOPeAjZI5lXDLYRPFuI6Q1o5WC1NY9UtRqaeuJx1Og+K0RrE6NKWFI4lW7ANGo5I9RZ8Z5Wtc9wKDjOAPd3+qgCiWE2rUzt/zNS4o9XHW1kMc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771961289; c=relaxed/simple;
	bh=gIJFar1lNks9Q6ylzqGRVj3TdCdtH+1BNZS9Viki3sM=;
	h=MIME-Version:Content-Type:Subject:From:To:Cc:In-Reply-To:
	 References:Date:Message-Id; b=uEPDgDiwbfOIB1sOgWd321N2Mh9/5QBwJcGlWZfuxvEblWS39pmxBU4BRrmUfcUjYAWfptIPyPvyummI5wXUwfqqBTCFznIQdr1wy1zr163OWmWSm7i2qUOnjaF2yRGdy3VdhBxMcvXq08wHDVbc0KrARMzVvRIM4d405hSPblQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=K5TR44c5; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="K5TR44c5"
Received: by smtp.kernel.org (Postfix)
	id 5C340C19423; Tue, 24 Feb 2026 19:28:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D3388C116D0;
	Tue, 24 Feb 2026 19:28:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1771961289;
	bh=gIJFar1lNks9Q6ylzqGRVj3TdCdtH+1BNZS9Viki3sM=;
	h=Subject:From:To:Cc:In-Reply-To:References:Date:From;
	b=K5TR44c5x1iX4I/7e0uscKY4mbl7wAdBp0OFH5t0EjftB5OI4cRAjwGUhCIi07jaj
	 IkbpFAqb+Wv30D5E31nPkO7ErP4ekrAlisNqmLm2X3D4rHJsI7F/j1XykAYkIawaEF
	 OxmVxtelofhj3vdi7jNCWRw0Ujnh4OmM1VRGKfjw=
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH RESEND v2] Make edit_in_editor use temporary file in
 Git repository
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: Dave Marquardt <davemarq@linux.ibm.com>
Cc: "Kernel.org Tools" <tools@kernel.org>, 
 Konstantin Ryabitsev <konstantin@linuxfoundation.org>
In-Reply-To: <20251118-edit-with-tmp-file-in-repo-v2-1-0b633b471ddb@linux.ibm.com>
References: <20251118-edit-with-tmp-file-in-repo-v2-1-0b633b471ddb@linux.ibm.com>
Date: Tue, 24 Feb 2026 14:28:06 -0500
Message-Id: <177196128601.4027376.7838697675997419538@lemur>
X-Mailer: b4 0.15-dev-2caa3

On Tue, 18 Nov 2025 15:34:25 -0600, Dave Marquardt <davemarq@linux.ibm.com> wrote:
> diff --git a/src/b4/__init__.py b/src/b4/__init__.py
> index 7689550..cc7623a 100644
> --- a/src/b4/__init__.py
> +++ b/src/b4/__init__.py
> @@ -4575,8 +4575,16 @@ def edit_in_editor(bdata: bytes, filehint: str = 'COMMIT_EDITMSG') -> bytes:
>      corecfg = get_config_from_git(r'core\..*', {'editor': os.environ.get('EDITOR', 'vi')})
>      editor = corecfg.get('editor')
>      logger.debug('editor=%s', editor)
> +
> +    topdir = git_get_toplevel()
> +    if topdir is not None:
> +        p = Path(topdir)
> +        p = p / '.git' / 'b4'

Hardcoding `.git` will break when b4 is run inside a git worktree,
where `.git` is a file rather than a directory.  This will cause
`p.mkdir()` below to raise NotADirectoryError.

The existing code in mbox.py:395 already solves this correctly:

    gitargs = ['rev-parse', '--git-dir']
    ecode, out = b4.git_run_command(topdir, gitargs, logstderr=True)

Consider using `git rev-parse --git-dir` to obtain the actual git
directory and then creating a `b4/` subdirectory under it.

Regards,

-- 
KR

