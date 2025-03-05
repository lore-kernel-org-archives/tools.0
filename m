Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D107517B50B
	for <tools@linux.kernel.org>; Wed,  5 Mar 2025 20:24:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741206297; cv=none; b=n+VhsFe55109Yl8P64RDo8UmL7/RmirUAloDeOBB9or3UUDXdDLYIfO6mfWnQ4hwLZXvKw78mdQN8eMvTWrYsPj7RwwFxsBAguwj1667WBhwhFm84JhMhvRgjntlpc8m9L9TTBd9OakutqmR5W+Y+WT1dvTUR1e0do8ugi9R2LU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741206297; c=relaxed/simple;
	bh=FdlzH9Ck+oQZ+0l6SUqDtpIGYn5/NSqCQ1yxUOOT5Hk=;
	h=MIME-Version:Content-Type:From:To:Message-ID:In-Reply-To:
	 References:Subject:Date; b=DWVEx3XNTp4mHxSKiANr9bYxIZdVvZzigz2u8T09qPVGdMOai5o8gqMioDHCUVmwsjVA2uYwOfLsw8FZo3rmxWimzS5dN31e9GSpKGQYd/RU1iBgiGXidEtGXH3n/iIfjGloqBS85e+J+nuxN81D0Whz9H3tr9tkBBTt8qZ/tqQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=uzlShbNh; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="uzlShbNh"
Received: by smtp.kernel.org (Postfix)
	id 5D610C4CEE7; Wed,  5 Mar 2025 20:24:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3F29CC4CED1;
	Wed,  5 Mar 2025 20:24:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741206297;
	bh=FdlzH9Ck+oQZ+0l6SUqDtpIGYn5/NSqCQ1yxUOOT5Hk=;
	h=From:To:In-Reply-To:References:Subject:Date:From;
	b=uzlShbNhPT3P3rvCZdxNMqztRQxfeKOFHnPe14rVMvRdqgMGo6WP+escmRkKabwQE
	 7rJXPGAjlYPVVQnIeKmeVSQdM6ezHmPfg9vDjH+JYF81JqiVpjmSe8KlrY1XndVfJy
	 bPrvhrWTbzMcrX+s8ZW9Sbb8Pv2nY6Chlw8PpMB95pbL05q55Dbmvg75jcaa8wWwLj
	 BTh4IYzmvPr/98HcqiME+TlVxi/JXJ90++S5TRxzmadmtD7SCCkyLVcZRYgy+9Odl0
	 KxGPgFm7DiGqnYo0zA2ghmTG6EBjyy1k0i0X5GvliFBarLBGxXkLScZMpbVtD36tvB
	 ymiX6To1gt//Q==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 75121380CEDD;
	Wed,  5 Mar 2025 20:25:31 +0000 (UTC)
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
From: Bugspray Bot <bugbot@kernel.org>
To: andriy.shevchenko@intel.com, tools@kernel.org
Message-ID: <20250305-b219844-187f590d64c8@bugzilla.kernel.org>
In-Reply-To: <Z8cMdUMZQhGtVTWx@smile.fi.intel.com>
References: <Z8cMdUMZQhGtVTWx@smile.fi.intel.com>
Subject: Re: b4 to accept https://patch.msgid.link/
X-Bugzilla-Product: Tools
X-Bugzilla-Component: Infra
X-Mailer: bugspray 0.1-dev
Date: Wed,  5 Mar 2025 20:25:31 +0000 (UTC)

Hello:

This conversation is now tracked by Kernel.org Bugzilla:
https://bugzilla.kernel.org/show_bug.cgi?id=219844

There is no need to do anything else, just keep talking.
-- 
Deet-doot-dot, I am a bot.
Kernel.org Bugzilla (bugspray 0.1-dev)

