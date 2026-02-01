Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6BFC269B1C
	for <tools@linux.kernel.org>; Sun,  1 Feb 2026 05:37:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769924259; cv=none; b=udtTgDiPEySK8OLOaeYRHCTV8/2Oege1DI0CGQ146ITF2qYch0VDqEF9G0paYTy/rE/o2iSs8UuK/bfWDg1FJ9uIu+OQme4RFluFZVIZsniy1JmEFCAznpwB5Ogfri4jsdfgYUogTKVR1tYFJditbgxdrVZ7FBICsDGfYzdDIOg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769924259; c=relaxed/simple;
	bh=K+FBvX+wgf9uCRhXmqeqzSlbyWMSZpTh98hhESXOOqs=;
	h=MIME-Version:Content-Type:Subject:From:To:Cc:In-Reply-To:
	 References:Date:Message-Id; b=kxpo7wZk5XQZKUW31SEKnLT+DAOniO0QZY+FTeBbrb81rnTbor2PggiGvaXT8IygPdhEptWgwcvaYZV6VDeeHsBULJbBFrf6WNJ+g72/AcIDzIW2D9DR75gSOWSPwVXuFCFd76nvgpoYLnecpRnR3NZEEt0SYzAp7KjtfvH4BDo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=VJweaAvr; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="VJweaAvr"
Received: by smtp.kernel.org (Postfix)
	id 6536FC116C6; Sun,  1 Feb 2026 05:37:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EF168C4CEF7;
	Sun,  1 Feb 2026 05:37:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1769924259;
	bh=K+FBvX+wgf9uCRhXmqeqzSlbyWMSZpTh98hhESXOOqs=;
	h=Subject:From:To:Cc:In-Reply-To:References:Date:From;
	b=VJweaAvrCq9u6hZxuF6l+gYerZIFlcZPrh45Siht9YrK4i/LuPh8c13VJLuTuAVOo
	 jxHrlaYwT+iTafAaMgzUqp1De5jwKMuNw51IaxxXW8s83Ocn3FqPDY5ez1TJnkADg1
	 u3FYQSE9RpMBj8juVPSrWoGHsYFq+j8ZHNOFj0JA=
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH b4 0/2] Add support for oauth2 SMTP authentication
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: "Kernel.org Tools" <tools@kernel.org>
Cc: Konstantin Ryabitsev <konstantin@linuxfoundation.org>, 
 Tomas Melin <tomas.melin@vaisala.com>
In-Reply-To: <20260129-smtp-oauth2-outlook-v1-0-e8c6d1b00c03@vaisala.com>
References: <20260129-smtp-oauth2-outlook-v1-0-e8c6d1b00c03@vaisala.com>
Date: Sun, 01 Feb 2026 00:37:34 -0500
Message-Id: <176992425473.611611.15176471580489636701@lemur>
X-Mailer: b4 0.15-dev

On Thu, 29 Jan 2026 11:10:28 +0200, Tomas Melin <tomas.melin@vaisala.com> wrote:
> Add support for oauth2 authentication with SMTP server, integrating
> with git credential helpers for retrieving tokens. With this approach,
> the same configuration as is needed for git send-email can be used
> to send patches using oauth2 with b4.

Thank you for sending this in! I'm using this series as a guinea pig for 
the "b4 review" functionality, using agent-assisted reviews. I know it's 
not everyone's cup of tea, but there is enough interest in it to at 
least support it.

I'm sending per-patch followups with the problems the agent has 
identified (combed by myself -- I'm not just blindly relying on the 
agent here).

I am also screencasting this whole process, so hopefully this will be 
educational as well. :)

-- 
Konstantin Ryabitsev <konstantin@linuxfoundation.org>
