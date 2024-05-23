Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3AE9179A3
	for <tools@linux.kernel.org>; Thu, 23 May 2024 16:11:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716480674; cv=none; b=joTdJLF1ycYzaopHjBVBokDEUU6cp7hiKC79qBmxYgEanTVPEa5XRWKsYxQ9g322Q0YWkYbhleWzDR4O+pJ9qzqGOjD7SnVnXmt5dldL2CjKrpu0/jUVZZd84g/JBlZuF2AM+qexCe9O8xQpSKsv8ixLUwucPmZTSea/wWVsAJ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716480674; c=relaxed/simple;
	bh=jj6vNEzGiUDKuiPCqt9qcJCmhEj4m0SeAEN21GwrNZc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZOvJzm3+7wAqe54Uj6+ZfUvTbGaEqZ32A6iNTq5KNQdtlp4G+Fx9llmc5K2ftRnKx/a8LON8GbVJhtFnF54RImOG+65xoYRKr+AqLS2fX562AlScY+iZqyz1VT6pZNv51fUsIj7QEVqvtuCYOVo0+wEMDS/0AIIVA94jAYGmFhk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=x8thA5l9; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="x8thA5l9"
Received: by smtp.kernel.org (Postfix)
	id 95FDAC3277B; Thu, 23 May 2024 16:11:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5F5DBC2BD10;
	Thu, 23 May 2024 16:11:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1716480673;
	bh=jj6vNEzGiUDKuiPCqt9qcJCmhEj4m0SeAEN21GwrNZc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=x8thA5l92GmcHcjqZI0CDTdLnxFxyItq/yTc7FqqOOJux5eLgZjVDn33bhZEMoCwu
	 PobcYyoIBsJZ2bOwZtIkjpGuSRFN0x7ETzP8fkT90gQo8svUErLkxyf9YyddnG+3RJ
	 fNw99K8R8Y0B0iZhpCQspe6apqEidSx/RDLyma0c=
Date: Thu, 23 May 2024 12:11:10 -0400
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: Jonathan Wakely <jwakely@redhat.com>
Cc: tools@kernel.org
Subject: Re: [PATCH] main: Use inbox.sourceware.org for repos hosted there
Message-ID: <20240523-amorphous-rigorous-herring-89f3d1@meerkat>
References: <20240523143752.385810-1-jwakely@redhat.com>
 <20240523-strict-fortunate-buffalo-067b15@lemur>
 <CACb0b4nqKbCVLueEtDXPHSYc5iQNUWN9AQXQQtWcdfu5o-p1ew@mail.gmail.com>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CACb0b4nqKbCVLueEtDXPHSYc5iQNUWN9AQXQQtWcdfu5o-p1ew@mail.gmail.com>

On Thu, May 23, 2024 at 04:56:01PM GMT, Jonathan Wakely wrote:
> > > I don't know if this patch would be acceptable for b4. It's obviously
> > > very specific to sourceware projects, but then the existing default is
> > > very specific to the kernel! :)
> >
> > I understand the reason for this, but I'd much rather this was set in
> > .b4-config, as it would obviously scale much better than hardcoding more
> > and more projects into the source. Especially if origin URLs happen to
> > change in the future.
> >
> > Have you considered submitting a change that includes a .b4-config into
> > the repos?
> 
> I have now, at least for GCC:
> https://inbox.sourceware.org/20240523155116.390918-1-jwakely@redhat.com

Great.

You should also consider including:

    send-series-to = gcc-patches@gcc.gnu.org

This would make it easy to use b4 prep to submit patches to gcc.

-K
