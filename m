Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5404F3C343B
	for <tools@linux.kernel.org>; Thu,  2 Jul 2026 08:44:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782981895; cv=none; b=OAXTw6MNHojQOs/6Py26DYxxSABXmkHRkVHhdNQtYMsjq1R4Xpz3Z59xFpcmt57N/THHfmOVSxX1xw3AltLT1SgSUsyUzptP331ZdkbrTRkuOG1X0T/ZM+ZolgbDZmo0xGFvHGVLph9Mb5vUg29YxGnNF/Ho9RCRp4TcuoQhW/Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782981895; c=relaxed/simple;
	bh=m+rgzSKCUBjirac3q8vvJ4IyFoUkwBtJF2DLYnIYdDQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JM2BSh/gqKAxjQ0dbXy4mBGH3EtLhZR2QCnRvlan+Saw2wpXLGoMW0CAgLsKIFIaPd5F/pRZYf7m0liu5p0/vgcnqDBLOSPXdGx8VMt0RhfvP2C5efrD0AOUxHHFe2Hva2hh+8R/l0VRbjRTsJwxDHD9e3A1IuNx714XweUnP7w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=O8U9XUG1; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="O8U9XUG1"
Received: by smtp.kernel.org (Postfix)
	id 0397B1F00A3A; Thu,  2 Jul 2026 08:44:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 024061F000E9;
	Thu,  2 Jul 2026 08:44:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782981893;
	bh=5xscQGpr+1u+2f+S0IC2G6zuG98QR2v0q4Iq5/0lIZA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=O8U9XUG11GkqD6pz1m5p56mMc2j2Ml+ZP+xx55TG34GX8dvvCgcaexLNQofwtG3E2
	 wmtzoNeXQd9Zi/JLk0i1VQSYiKp0c2n/4SPr4/5sqt5Su9C6tRdhv7ntBhCTttYNe1
	 og6M92XSns/hKM8XgEfHzSSTAx49E8U0m2DCjAMqAl0XGGLPvTEuFf//g4Bs2/IuMV
	 aT5RPL5ccQ8SPV/UuaEZMU9z6rMM90YRhYKb5V44O1RAfEFVfzTZl/7rKe5kd7Rlr3
	 LaiZy+7QpQfU9mH5dYyw0FSkJXIKVLIGaqasH0bMRO6ikXwyYv7fzhPGOYsiAGm8b9
	 1iiKFCad7/VlQ==
Date: Thu, 2 Jul 2026 10:44:50 +0200
From: Christian Brauner <brauner@kernel.org>
To: Matthieu Baerts <matttbe@kernel.org>
Cc: "Kernel.org Tools" <tools@kernel.org>, 
	Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Subject: Re: b4 review tui + lore/lei/korgalore
Message-ID: <20260702-anprangern-kilowatt-autor-0ffec2df3f2e@brauner>
References: <20260630-einhundert-bauamt-atemlos-5b92514a1443@brauner>
 <b750a3c6-5b9c-4470-a120-c9852c85b271@kernel.org>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <b750a3c6-5b9c-4470-a120-c9852c85b271@kernel.org>

On Tue, Jun 30, 2026 at 04:51:31PM +0200, Matthieu Baerts wrote:
> Hi Christian,
> 
> On 30/06/2026 16:12, Christian Brauner wrote:
> > One thing that I'm missing is a companion to the patchwork app
> > integration for mailing lists. Here's what I mean. I want to be able to
> > browse a mailing list the same way I'm browsing the patchwork app ('p')
> > in b4 review tui, then mark them as "tracked" etc (ideally it would
> > de-duplicate by message-id or something between the patchwork app and
> > the mailing list.
> 
> Would it help to integrate 'b4 review' support in the app you are
> currently using to browse a mailing list instead?
> 
> Maybe your email client could call "b4 review track <MSG_ID>" when
> pressing "t"?

I want the First-Class experience that I've gotten used to from
Konstantin and his projects. ;)
