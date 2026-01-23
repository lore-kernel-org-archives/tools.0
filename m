Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B7B5318B83
	for <tools@linux.kernel.org>; Fri, 23 Jan 2026 11:59:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769169593; cv=none; b=YoyWoZRvki/8U30UoZKkBc/YpmbbL/jCXAEW1wDOLZzb/g49OXMi+4BbQSmG8yc+8DXHl/a4yGymjEXUV/RTicEMrFG5L71JXLcph1EkxKjs3xkTm6SS+rYuTr5Yw+S4+w1nnsCvvRtOo7JM39dHL7Z2CdKpY5kDAi7tl3DGWic=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769169593; c=relaxed/simple;
	bh=evZsRdQQXGB4cFmG+njrMqMx+O+ci0NcK3msy0u3/AM=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=XHbC+UDBgi41DlXcJuvrCqBO5hnFAZvQxYjWR7VBVn6kXGBxXo2dFBuhObBkASjMDzP4tkAcLBMXjlAw3UDqdEwgmrzNJB0iwjMsTiY/5I1CvbF++S65I5k91zLhEEylk6Z+7xlODvMB7+z7N9cH4rCH0IfOEEtcYqgPcmi+gzU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=s05PPdnG; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="s05PPdnG"
Received: by smtp.kernel.org (Postfix)
	id 38044C116D0; Fri, 23 Jan 2026 11:59:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 30C45C4CEF1;
	Fri, 23 Jan 2026 11:59:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769169593;
	bh=evZsRdQQXGB4cFmG+njrMqMx+O+ci0NcK3msy0u3/AM=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=s05PPdnGQdB70uukJ+LkWMiUDZqUqv9pAxW8XfhrZCg6V/EgkgCr6AK5obIMMZpjb
	 TtirKnxVQ8cqHVWvNcet8TAaB5XkGbHWBr/I5ZXfGJwinnfiFHL6bFs5K59lcMeorg
	 3oUVN1pDKWTD5kEmBCDVCSp4FFjVXn4U60tgC+ttlUQIQYZ6aekALpuymg6VpBLCKK
	 MfQ0NUkztSf52RJ/IsNEQUmLxEQf3jQO9grg0jKvh6cegcnb3LLlWf9/v9VjJddpfV
	 RzSBu7zu7q5hAPQD1gy6D3vU84YCWKb6a+D7/pD0xkL+z6m2c+ZfJ9SsAKguCPtsv1
	 xiGdN71z3N6TQ==
Date: Fri, 23 Jan 2026 12:59:49 +0100
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc: users@kernel.org, tools@kernel.org
Subject: Re: korgalore v0.4 now available
Message-ID: <20260123125949.01381d1f@foz.lan>
In-Reply-To: <20260120-proud-energetic-pigeon-72bcec@lemur>
References: <20260120-proud-energetic-pigeon-72bcec@lemur>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.51; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

Hi Konstantin,

On Tue, 20 Jan 2026 10:29:28 -0500
Konstantin Ryabitsev <konstantin@linuxfoundation.org> wrote:

> Hi, all:
> 
> Korgalore v0.4 is now available with IMAP OAuth2 support for Microsoft 365 and
> several GUI improvements.

I started trying it this week to have a copy of my public e-mails
on a separate machine at my office, and indeed it is an interesting
tool. I tested only maildir, as having accounts on oauth2 providers
for kernel stuff is always a lot more complex than it should be.

I used there both lei and non-lei feeds.

One thing that I missed is that "kgl pull" doesn't really pull
e-mails inside the mailbox, even when used with lei to pick the last
week/month of stuff: it just sets it to pick newest e-mails from
now on.

IMO, the default should be to populate maildir with the contents
from the lore git trees, when "kgl pull" is called, as, if one
wants to pick stuff there is because they usually want to look
at the most recent messages - eventually replying to them.
As such, IMHO, the mailbox to be sync altogether with the
already-existing messages from the specified period.

On the exceptional case where one doesn't want that, you could
provide a "--only-new" argument to pull - to skip the mailbox
filling with existing e-mails.

Just my 2 cents.

Regards,
Mauro



> 
> New features
> ------------
> 
> IMAP OAuth2 Authentication for Microsoft 365:
> 
> This release adds support for OAuth2 authentication (XOAUTH2) with Microsoft
> 365 accounts. The app includes a built-in Azure AD application ID for
> zero-configuration setup, though it is going to show up as "unverified"
> (it's too much work!).
> 
> Your corporate IT may block third-party or unverified apps by default, so in
> this case you will need to either get them to approve the korgalore app or
> give you their own client_id. 
> 
> Example configuration:
> 
>     [targets.office365]
>     type = 'imap'
>     auth_type = 'oauth2'
>     server = 'outlook.office365.com'
>     username = 'user@company.com'
> 
> Improvements
> ------------
> - Close network connections after sync runs to avoid keeping idle connections
>   open between periodic syncs (IMAP, HTTP sessions)
> - JMAP target now uses shared requests session for consistent User-Agent
>   header and proper connection cleanup
> - Add GUI optional dependencies to pyproject.toml (pip install korgalore[gui])
> - Support AyatanaAppIndicator3 as fallback for AppIndicator3 (needed on
>   Debian and derivatives)
> - GUI now monitors network availability via Gio.NetworkMonitor and skips
>   sync attempts when network is unavailable (airplane mode, resume from
>   suspend, etc.). Sync is automatically scheduled when network is restored.
> - GUI error messages now display actual error text instead of unhelpful
>   "see logs" messages, since logs are not collected by default
> 
> Full changelog and documentation:
> 
>     https://korgalore.docs.kernel.org/
> 
> Source repository:
> 
>     https://git.kernel.org/pub/scm/utils/korgalore/korgalore.git
> 
> Install via pipx:
> 
>     pipx install korgalore
> 
> -K
> 



Thanks,
Mauro
