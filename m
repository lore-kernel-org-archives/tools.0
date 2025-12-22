Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7A6E320A2E
	for <tools@linux.kernel.org>; Mon, 22 Dec 2025 15:23:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766417018; cv=none; b=aBN6kwbfYp1CwxaHGavY322fVIG5rFtXfTkUEOVxmlTy403lcRqUIg6sPvQIFeXehCg6GQOku/9HSSDZY+Ir/CNOYuL/0+6xBNOZg7uIuJdKDePmIjPkXXo9jnup/Il+DqI3jPA66NeLl2BCR7eLFbRfZmQ7t49e7DH+ERzlBB0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766417018; c=relaxed/simple;
	bh=PDqpd9oOPVTpr7Bmb9UABhOe9Jzj42LAAXIAcVmyQR4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hzU2ItPCnWBXcgLi99kQEKea1dbUi3DgkafR/oSWvARw/y21NmyCyHuCTyBV+i3i+7myB1AaG/GIIlLuGVLG9WQZ5OLsWD6+iI/IKdJ/sm5RAFk5Np1lQg5D6hNrQ28mqKROpx6/ncBHWzfOvf7u0l0+x1cw3XVJpaBBlJASxcQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=Bc/hyQ/s; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="Bc/hyQ/s"
Received: by smtp.kernel.org (Postfix)
	id 82E7BC116D0; Mon, 22 Dec 2025 15:23:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 41EE3C4CEF1;
	Mon, 22 Dec 2025 15:23:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1766417018;
	bh=PDqpd9oOPVTpr7Bmb9UABhOe9Jzj42LAAXIAcVmyQR4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Bc/hyQ/sIkAJgOn3VFm/QDaGsUlj2SZlnQkAdR2FWpSzHSHGUhs+w+A48pkIsJCnN
	 aQLIM4xJhkbYh2W5hfrIkFygvjB/rlOvIhEGbJK0rzkWUmx5ghuhH59v0sKR2qa0MT
	 f+9QEx2s/ViMwjShGD7w19A4pRXAvAOfi/BztdnU=
Date: Mon, 22 Dec 2025 10:23:34 -0500
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: Linus Walleij <linusw@kernel.org>
Cc: Sudeep Holla <sudeep.holla@kernel.org>, tools@kernel.org, 
	users@kernel.org
Subject: Re: korgalore v0.2 released with JMAP, IMAP, Maildir support
Message-ID: <20251222-careful-kangaroo-of-opportunity-5e70fc@lemur>
References: <20251217-attractive-stalwart-seahorse-de4e3e@lemur>
 <CAD++jLmGuPxWLEcUaVMU9jCmEfrzUbgzMrFbd9uX+62avv9jmA@mail.gmail.com>
 <20251217-yellow-cormorant-of-debate-b55a75@lemur>
 <CAPKp9uY-BYKXAoWg8zPLhQjEHs4qqsW+qjYne7Qv1LKwL6BQUA@mail.gmail.com>
 <20251218-dove-of-fantastic-upgrade-c491ea@lemur>
 <CAD++jLk6=56izoMzfs_PVFvX3j9N+J6O1FGxrEg3wE78rOww4g@mail.gmail.com>
 <20251218-merry-azure-chicken-4d3724@lemur>
 <CAD++jLn=QckMx4QD=4fwQVcLYACJCgG0Hw6Bo6Wek4S4Ywn7VA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CAD++jLn=QckMx4QD=4fwQVcLYACJCgG0Hw6Bo6Wek4S4Ywn7VA@mail.gmail.com>

On Mon, Dec 22, 2025 at 03:02:02PM +0100, Linus Walleij wrote:
> I don't know if I'm doing something wrong but all imported
> mails appear as "read" (non-bold).
> 
> In the code there is:
> DEFAULT_LABELS: List[str] = ['INBOX', 'UNREAD']
> 
> so it appears the "UNREAD" labels was intended to be applied,
> but it appears this isn't used?

Do you have any labels defined for your delivery? E.g.:

    [deliveries.lkml]
    feed = 'lkml'
    target = 'work'
    labels = ['Lists/LKML']

By default, this doesn't set UNREAD as a label (because you may not want that
if you're just dumping a copy of a big list somewhere). If you change that to:

    labels = ['Lists/LKML', 'UNREAD']

that should do the trick.

I can document this better if that helps.

-K
