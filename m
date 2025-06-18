Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7EC9D2E7186
	for <tools@linux.kernel.org>; Wed, 18 Jun 2025 13:54:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750254842; cv=none; b=hKrQrL/z7BowtwCGgJm2RnHQBd0qh1ydl7jWkinNlyejzBi0krtNPNR38zXLLLPWyq7VDNZGjytTdF0m75bzDkdzAxYESfz0/f9xswGjWeLTtiQLaburUNTLUIqP/Qxtz99wI9dICis8sAgfeQUn3zlBnYhXWk0Tmmx00K5h2L0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750254842; c=relaxed/simple;
	bh=7zqQZgi3YsHwYRA8zYnDp8Pi5+w4QE0E1YfTC4nXDsc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=H4ZOQJHCpcr5xnk2l+OuZRob4o7AhDwpdakOAu08wRoqbNGd7Ovi4WzLj6hg60LlESZVng0ie7JzPlUrFXWsXJ0GSBmBl+ZwjEHQfyzjTnuGVdT+ONz8FHCPr/huWcRvABAQ0Bv/LhwvIp+QRp4rqAogGS8/RbkM8HKSMMDN3CI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=O0PYEFe+; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="O0PYEFe+"
Received: by smtp.kernel.org (Postfix)
	id 2EBACC4CEF0; Wed, 18 Jun 2025 13:54:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EA331C4CEE7;
	Wed, 18 Jun 2025 13:54:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1750254842;
	bh=7zqQZgi3YsHwYRA8zYnDp8Pi5+w4QE0E1YfTC4nXDsc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=O0PYEFe+GO5F6hb3FwmViFoYJSvE5lmI8+RV6CQXCudZlGxO1bdPTDF5O0kqN6R03
	 wFi2T529CC3pvQ5K2ULFCQV8slBaI1jCOr4Yyx2Y3zzZ42LNfyntAAOcZuggDuoxIA
	 YA7jfQwkkZBmnaviXEW6GMppqNwspFE4S7ekrVas=
Date: Wed, 18 Jun 2025 09:54:00 -0400
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: Dave Marquardt <davemarq@linux.ibm.com>
Cc: "Kernel.org Tools" <tools@kernel.org>
Subject: Re: [PATCH b4] Create temporary directory in current working
 directory
Message-ID: <20250618-bipedal-saluki-of-expression-04cde5@lemur>
References: <20250613-fix-magit-edit-v1-1-7c85ecc6333a@linux.ibm.com>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250613-fix-magit-edit-v1-1-7c85ecc6333a@linux.ibm.com>

On Fri, Jun 13, 2025 at 02:04:05PM -0500, Dave Marquardt wrote:
> 
> 
> ---
> In edit_with_editor, create temporary directory in current working
> directory. This avoids issues with Emacs and Magit, which insists
> COMMIT_EDITMSG must be in the repo's directory tree.

I'm curious how you ended up with the --- at the start of this. Seems like a
bug that needs fixing.

> diff --git a/src/b4/__init__.py b/src/b4/__init__.py
> index 0a7daec..79d695a 100644
> --- a/src/b4/__init__.py
> +++ b/src/b4/__init__.py
> @@ -4423,7 +4423,7 @@ def edit_in_editor(bdata: bytes, filehint: str = 'COMMIT_EDITMSG') -> bytes:
>      editor = corecfg.get('editor')
>      logger.debug('editor=%s', editor)
>      # Use filehint name in hopes that editors autoload necessary highlight rules
> -    with tempfile.TemporaryDirectory(prefix='b4-editor') as temp_dir:
> +    with tempfile.TemporaryDirectory(prefix='b4-editor', dir=Path.cwd()) as temp_dir:
>          temp_fpath = os.path.join(temp_dir, filehint)
>          with open(temp_fpath, 'xb') as edit_file:
>              edit_file.write(bdata)

I think we can do better than that. We can call call git_get_toplevel() and,
if that is not None, specify dir as toplevel/.git/b4, otherwise default to dir
as being None to let it use whatever Python thinks should be the default. Can
you test if using .git/b4/COMMIT_EDITMSG will do the right thing for you?

We shouldn't use cwd(), because this can litter your git tree with junk. I
know Python is supposed to always clean it up, but this can still have bad
consequences if you run the editor in b4, forget that it's open in another
terminal window, and then try to do some git operations.

-K
