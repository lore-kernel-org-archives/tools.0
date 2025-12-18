Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF700212F89
	for <tools@linux.kernel.org>; Thu, 18 Dec 2025 02:42:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766025748; cv=none; b=omGplKeNODG3NUYku/Vxef4fUDuqAdttPeK9p1gcBTdndcUA1OgIAMBaHumG9gZfSvNfJ/KxFd2t+Rhlq+iYBKQvcOdQcBd1TnrEz2HF9P6khKPab/ZhflWtXDg3VVN7hlGHdg0tKhwiBgVuzSD/poud1/El37S5dL9BTioL4N4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766025748; c=relaxed/simple;
	bh=fVTOeKuCiCPBo686La66PsZQ8dxS46BmNqzUGtwBGnk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bCjLxIhzPhNHDTWQ+IrZBXlDHbRF1l8f+ZHl4WB2UZDGXCklzsLGRPzxDlwZnrDyLDLa8xWfNdH3Ik3k7PY4tKZ3fUhtLZTnpY6rTCDD+EAUOJNjb41AnnNbbhcz0p7tYLkosy5tSnnAfcJi2dfepl+keSLtTvKEEwanL1ZQ91I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=2RzdSBvB; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="2RzdSBvB"
Received: by smtp.kernel.org (Postfix)
	id 75503C116C6; Thu, 18 Dec 2025 02:42:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 46E96C4CEF5;
	Thu, 18 Dec 2025 02:42:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1766025748;
	bh=fVTOeKuCiCPBo686La66PsZQ8dxS46BmNqzUGtwBGnk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=2RzdSBvBW1tdBXyzCuGkpJ4iTKXp8usUcwAlzZyUZ4D2m1gxuL3AuVz+JwUFFi/he
	 X8N0zEDyWft1mDT64DGrWYRES1WRsrX+7s+p75OvdrSwqzVnp870LJG/8rJAPuI0W2
	 PNem8V1O7oT8U1wq9u0iM7yjfM4ukxYNgzn1nyj8=
Date: Wed, 17 Dec 2025 21:42:27 -0500
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: Linus Walleij <linusw@kernel.org>
Cc: tools@kernel.org, users@kernel.org
Subject: Re: korgalore v0.2 released with JMAP, IMAP, Maildir support
Message-ID: <20251217-nice-fanatic-crocodile-93dad8@lemur>
References: <20251217-attractive-stalwart-seahorse-de4e3e@lemur>
 <CAD++jLmGuPxWLEcUaVMU9jCmEfrzUbgzMrFbd9uX+62avv9jmA@mail.gmail.com>
 <20251217-yellow-cormorant-of-debate-b55a75@lemur>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20251217-yellow-cormorant-of-debate-b55a75@lemur>

On Wed, Dec 17, 2025 at 08:57:08PM -0500, Konstantin Ryabitsev wrote:
> >   File "/home/linus/.local/lib/python3.14/site-packages/korgalore/pi_feed.py",
> > line 386, in feed_lock
> >     lockfh = open(lock_file_path, 'w')
> > FileNotFoundError: [Errno 2] No such file or directory:
> > '/home/linus/.local/share/korgalore/lkml/korgalore.lock'
> 
> Ouch. Yeah, this should fix it for you while I push out a better fix:
> 
>     mkdir -p /home/linus/.local/share/korgalore/lkml
> 
> Thanks for the report!

There is a v0.2.1 release now that fixes this and one other bug.

Thanks!

-K
