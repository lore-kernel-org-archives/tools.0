Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D72C21B184
	for <tools@linux.kernel.org>; Wed, 18 Jun 2025 20:24:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750278295; cv=none; b=Jkr1cpDlETw4BL7JGzKvcW3VrSjsovzidPj7Ayx/+FbVEaxoxlwwNYfroQJcMzdogO5oBQ2OTWdOBgr5hTRFg+tQ5tWcUKdo7UdswagvSxnm50l9S5ZTgXf/bWvuBrTAQfhbm8DDojd5hVF0Wn28emTSi8PCTGWg8Ha9PqoKBAQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750278295; c=relaxed/simple;
	bh=ciaOfYKd34IU53v3KhNv5r/kNycCDwuZgM++xQVfpc4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PKnJZ4Ou3Al9+IK0H6LThagjytnN9Ctxew0UcuwKCldRd1XSEL4xFEY8ZjmY5vr+kFmWPpZ7/ePUvMfmswsdxgxRzei9FMQLZQJvBlDc7fWQwRO9Vv4bfEg9vG3mzQKJlDuuwCOMM6Dmvq4Zxzar6xrxLQz3oyj5IrtRKtZW+rM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=uz6lLpuZ; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="uz6lLpuZ"
Received: by smtp.kernel.org (Postfix)
	id C3E46C4CEEF; Wed, 18 Jun 2025 20:24:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 88AEBC4CEF0;
	Wed, 18 Jun 2025 20:24:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1750278294;
	bh=ciaOfYKd34IU53v3KhNv5r/kNycCDwuZgM++xQVfpc4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=uz6lLpuZb5fz/EkeAlzd/oMZTYwcssAyToNiHyHCeO41rHbypHD/DWKhoL+dWF6ky
	 aqToG2BMeoWAW00J4G+m9pRD0mRv00cKKcFDJhXnVN+e9o6GAGzXkEvp0+zSTwN3NP
	 cBvYx7QHoa4TlhIGIPxrS1DBe0vSF/CbqCjgHc5o=
Date: Wed, 18 Jun 2025 16:24:53 -0400
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: Dave Marquardt <davemarq@linux.ibm.com>
Cc: "Kernel.org Tools" <tools@kernel.org>
Subject: Re: [PATCH b4 v2] Create temporary directory in git top level if
 available
Message-ID: <20250618-divergent-electric-groundhog-7e67fb@lemur>
References: <20250618-fix-magit-edit-v2-1-5bb1d06788cd@linux.ibm.com>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250618-fix-magit-edit-v2-1-5bb1d06788cd@linux.ibm.com>

On Wed, Jun 18, 2025 at 02:38:04PM -0500, Dave Marquardt wrote:
> 
> 
> ---
> In edit_with_editor, create temporary directory in toplevel/.git/b4 if
> git top level exists. Otherwise let tempfile.TemporaryDirectory use its
> default directory. This avoids issues with Emacs and Magit, which
> insists COMMIT_EDITMSG must be in the repo's directory tree.

Unrelated to this, I'm still curious how we're getting that bogus --- at the
top. Can you send the raw contents of your cover letter commit? I'd like to
fix this.

> Signed-off-by: Dave Marquardt <davemarq@linux.ibm.com>
> ---
> Changes in v2:
> - Updated to use git top level directory for temporary directory
> ---
>  src/b4/__init__.py | 10 +++++++++-
>  1 file changed, 9 insertions(+), 1 deletion(-)
> 
> diff --git a/src/b4/__init__.py b/src/b4/__init__.py
> index 5951418..60fdd47 100644
> --- a/src/b4/__init__.py
> +++ b/src/b4/__init__.py
> @@ -4425,8 +4425,16 @@ def edit_in_editor(bdata: bytes, filehint: str = 'COMMIT_EDITMSG') -> bytes:
>      corecfg = get_config_from_git(r'core\..*', {'editor': os.environ.get('EDITOR', 'vi')})
>      editor = corecfg.get('editor')
>      logger.debug('editor=%s', editor)
> +
> +    topdir = git_get_toplevel()
> +    if topdir is not None:
> +        p = Path(topdir)
> +        p = p / '.git' / 'b4'
> +        p.mkdir(parents=True, exist_ok=True)
> +    else:
> +        p = None
>      # Use filehint name in hopes that editors autoload necessary highlight rules
> -    with tempfile.TemporaryDirectory(prefix='b4-editor') as temp_dir:
> +    with tempfile.TemporaryDirectory(prefix='b4-editor', dir=p) as temp_dir:
>          temp_fpath = os.path.join(temp_dir, filehint)
>          with open(temp_fpath, 'xb') as edit_file:
>              edit_file.write(bdata)

All good otherwise, thanks!

-K
